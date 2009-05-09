#!./perl

BEGIN {
    chdir 't';
    @INC = '../lib';
    require './test.pl';
}
use strict;

use Tie::Array;
use Tie::Hash;

# Predeclare vars used in the tests:
my @empty;
my %empty;
my @sparse; $sparse[2] = 2;

my $deep1 = []; push @$deep1, \$deep1;
my $deep2 = []; push @$deep2, \$deep2;

my @nums = (1..10);
tie my @tied_nums, 'Tie::StdArray';
@tied_nums =  (1..10);

my %hash = (foo => 17, bar => 23);
tie my %tied_hash, 'Tie::StdHash';
%tied_hash = %hash;

{
    package Test::Object::NoOverload;
    sub new { bless { key => 1 } }
}

{
    package Test::Object::CopyOverload;
    sub new { bless { key => 'magic' } }
    use overload '~~' => sub { my %hash = %{ $_[0] }; $_[1] eq $hash{key} };
    use overload '""' => sub { "stringified" };
}

our $ov_obj = Test::Object::CopyOverload->new;
our $obj = Test::Object::NoOverload->new;

my @keyandmore = qw(key and more);
my @fooormore = qw(foo or more);
my %keyandmore = map { $_ => 0 } @keyandmore;
my %fooormore = map { $_ => 0 } @fooormore;

# Load and run the tests
plan "no_plan";

while (<DATA>) {
    next if /^#/ || !/\S/;
    chomp;
    my ($yn, $left, $right, $note) = split /\t+/;

    local $::TODO = $note =~ /TODO/;

    die "Bad test spec: ($yn, $left, $right)" if $yn =~ /[^!@=]/;

    my $tstr = "$left ~~ $right";

    test_again:
    my $res = eval $tstr;

    chomp $@;

    if ( $yn =~ /@/ ) {
	ok( $@ ne '', "$tstr dies" )
	    and print "# \$\@ was: $@\n";
    } else {
	my $test_name = $tstr . ($yn =~ /!/ ? " does not match" : " matches");
	if ( $@ ne '' ) {
	    fail($test_name);
	    print "# \$\@ was: $@\n";
	} else {
	    ok( ($yn =~ /!/ xor $res), $test_name );
	}
    }

    if ( $yn =~ s/=// ) {
	$tstr = "$right ~~ $left";
	goto test_again;
    }
}

sub foo {}
sub bar {42}
sub gorch {42}
sub fatal {die "fatal sub\n"}

# to test constant folding
sub FALSE() { 0 }
sub TRUE() { 1 }
sub NOT_DEF() { undef }

# Prefix character :
#   - expected to match
# ! - expected to not match
# @ - expected to be a compilation failure
# = - expected to match symmetrically (runs test twice)
# Data types to test :
#   undef
#   Object-overloaded
#   Object
#   Coderef
#   Hash
#   Hashref
#   Array
#   Arrayref
#   Tied arrays and hashes
#   Arrays that reference themselves
#   Regex (// and qr//)
#   Range
#   Num
#   Str
# Other syntactic items of interest:
#   Constants
#   Values returned by a sub call
__DATA__
# Any ~~ undef
!	$ov_obj		undef
!	$obj		undef
!	sub {}		undef
!	%hash		undef
!	\%hash		undef
!	{}		undef
!	@nums		undef
!	\@nums		undef
!	[]		undef
!	%tied_hash	undef
!	@tied_nums	undef
!	$deep1		undef
!	/foo/		undef
!	qr/foo/		undef
!	21..30		undef
!	189		undef
!	"foo"		undef
!	""		undef
!	!1		undef
	undef		undef
	(my $u)		undef
	NOT_DEF		undef
	&NOT_DEF	undef

# Any ~~ object overloaded
!	\&fatal		$ov_obj
	'magic'		$ov_obj
!	'not magic'	$ov_obj
!	$obj		$ov_obj
!	undef		$ov_obj

# regular object
@	$obj		$obj
@	$ov_obj		$obj
@	\&fatal		$obj
@	\&FALSE		$obj
@	\&foo		$obj
@	sub { 1 }	$obj
@	sub { 0 }	$obj
@	%keyandmore	$obj
@	{"key" => 1}	$obj
@	@fooormore	$obj
@	["key" => 1]	$obj
@	/key/		$obj
@	qr/key/		$obj
@	"key"		$obj
@	FALSE		$obj

# object (overloaded or not) ~~ Any
	$obj		qr/NoOverload/
	$ov_obj		qr/^stringified$/

# ~~ Coderef
	sub{0}		sub { ref $_[0] eq "CODE" }
	%fooormore	sub { $_[0] =~ /^(foo|or|more)$/ }
!	%fooormore	sub { $_[0] =~ /^(foo|or|less)$/ }
	\%fooormore	sub { $_[0] =~ /^(foo|or|more)$/ }
!	\%fooormore	sub { $_[0] =~ /^(foo|or|less)$/ }
	+{%fooormore}	sub { $_[0] =~ /^(foo|or|more)$/ }
!	+{%fooormore}	sub { $_[0] =~ /^(foo|or|less)$/ }
	@fooormore	sub { $_[0] =~ /^(foo|or|more)$/ }
!	@fooormore	sub { $_[0] =~ /^(foo|or|less)$/ }
	\@fooormore	sub { $_[0] =~ /^(foo|or|more)$/ }
!	\@fooormore	sub { $_[0] =~ /^(foo|or|less)$/ }
	[@fooormore]	sub { $_[0] =~ /^(foo|or|more)$/ }
!	[@fooormore]	sub { $_[0] =~ /^(foo|or|less)$/ }
	%fooormore	sub{@_==1}
	@fooormore	sub{@_==1}
	"foo"		sub { $_[0] =~ /^(foo|or|more)$/ }
!	"more"		sub { $_[0] =~ /^(foo|or|less)$/ }
	/fooormore/	sub{ref $_[0] eq 'Regexp'}
	qr/fooormore/	sub{ref $_[0] eq 'Regexp'}
	1		sub{shift}
!	0		sub{shift}
!	undef		sub{shift}
	undef		sub{not shift}
	NOT_DEF		sub{not shift}
	&NOT_DEF	sub{not shift}
	FALSE		sub{not shift}
	[1]		\&bar
	{a=>1}		\&bar
	qr//		\&bar
!	[1]		\&foo
!	{a=>1}		\&foo
	$obj		sub { ref($_[0]) =~ /NoOverload/ }
	$ov_obj		sub { ref($_[0]) =~ /CopyOverload/ }
# empty stuff matches, because the sub is never called:
	[]		\&foo
	{}		\&foo
	@empty		\&foo
	%empty		\&foo
!	qr//		\&foo
!	undef		\&foo
	undef		\&bar
@	undef		\&fatal
@	1		\&fatal
@	[1]		\&fatal
@	{a=>1}		\&fatal
@	"foo"		\&fatal
@	qr//		\&fatal
# sub is not called on empty hashes / arrays
	[]		\&fatal
	+{}		\&fatal
	@empty		\&fatal
	%empty		\&fatal

# HASH ref against:
#   - another hash ref
	{}		{}
=!	{}		{1 => 2}
	{1 => 2}	{1 => 2}
	{1 => 2}	{1 => 3}
=!	{1 => 2}	{2 => 3}
=	\%main::	{map {$_ => 'x'} keys %main::}

#  - tied hash ref
=	\%hash		\%tied_hash
	\%tied_hash	\%tied_hash
!=	{"a"=>"b"}	\%tied_hash
=	%hash		%tied_hash
	%tied_hash	%tied_hash
!=	{"a"=>"b"}	%tied_hash

#  - an array ref
#  (since this is symmetrical, tests as well hash~~array)
=	[keys %main::]	\%::
=	[qw[STDIN STDOUT]]	\%::
=!	[]		\%::
=!	[""]		{}
=!	[]		{}
=!	@empty		{}
=	[undef]		{"" => 1}
=	[""]		{"" => 1}
=	["foo"]		{ foo => 1 }
=	["foo", "bar"]	{ foo => 1 }
=	["foo", "bar"]	\%hash
=	["foo"]		\%hash
=!	["quux"]	\%hash
=	[qw(foo quux)]	\%hash
=	@fooormore	{ foo => 1, or => 2, more => 3 }
=	@fooormore	%fooormore
=	@fooormore	\%fooormore
=	\@fooormore	%fooormore

#  - a regex
# TODO those should be symmetrical
	qr/^(fo[ox])$/		{foo => 1}
	/^(fo[ox])$/		%fooormore
=!	qr/[13579]$/		+{0..99}
!	qr/a*/			{}
=	qr/a*/			{b=>2}
	qr/B/i			{b=>2}
	/B/i			{b=>2}
!	qr/a+/			{b=>2}
	qr/^à/			{"à"=>2}

#  - a scalar
	"foo"		+{foo => 1, bar => 2}
	"foo"		%fooormore
!	"baz"		+{foo => 1, bar => 2}
!	"boz"		%fooormore
!	1		+{foo => 1, bar => 2}
!	1		%fooormore
	1		{ 1 => 3 }
	1.0		{ 1 => 3 }
!	"1.0"		{ 1 => 3 }
!	"1.0"		{ 1.0 => 3 }
	"1.0"		{ "1.0" => 3 }
	"à"		{ "à" => "À" }

#  - undef
!	undef		{ hop => 'zouu' }
!	undef		%hash
!	undef		+{"" => "empty key"}
!	undef		{}

# ARRAY ref against:
#  - another array ref
	[]			[]
=!	[]			[1]
!	[["foo"], ["bar"]]	[qr/o/, qr/a/]
	[["foo"], ["bar"]]	[qr/ARRAY/, qr/ARRAY/]
	["foo", "bar"]		[qr/o/, qr/a/]
!	[qr/o/, qr/a/]		["foo", "bar"]
	["foo", "bar"]		[["foo"], ["bar"]]
!	["foo", "bar"]		[qr/o/, "foo"]
	["foo", undef, "bar"]	[qr/o/, undef, "bar"]
	["foo", undef, "bar"]	[qr/o/, "",    "bar"]
!	["foo", "", "bar"]	[qr/o/, undef, "bar"]
	$deep1			$deep1
	@$deep1			@$deep1
!	$deep1			$deep2

=	\@nums			\@tied_nums
=	@nums			\@tied_nums
=	\@nums			@tied_nums
=	@nums			@tied_nums

#  - an object
!	$obj		@fooormore
	$obj		[sub{ref shift}]

#  - works with lists instead of arrays
	"foo"			qw(foo bar)	TODO
	"foo"			('foo','bar')	TODO

#  - a regex
	qr/x/		[qw(foo bar baz quux)]
!	qr/y/		[qw(foo bar baz quux)]
	/x/		[qw(foo bar baz quux)]
!	/y/		[qw(foo bar baz quux)]
	/FOO/i		@fooormore
!	/bar/		@fooormore

# - a number
	2		[qw(1.00 2.00)]
	2		[qw(foo 2)]
	2.0_0e+0	[qw(foo 2)]
!	2		[qw(1foo bar2)]

# - a string
!	"2"		[qw(1foo 2bar)]
	"2bar"		[qw(1foo 2bar)]

# - undef
	undef		[1, 2, undef, 4]
!	undef		[1, 2, [undef], 4]
!	undef		@fooormore
	undef		@sparse

# - nested arrays and ~~ distributivity
	11		[[11]]
!	11		[[12]]
	"foo"		[{foo => "bar"}]
!	"bar"		[{foo => "bar"}]

# Number against number
	2		2
	20		2_0
!	2		3
	0		FALSE
	3-2		TRUE
	undef		0

# Number against string
=	2		"2"
=	2		"2.0"
!	2		"2bananas"
!=	2_3		"2_3"
	FALSE		"0"

# Regex against string
	"x"		qr/x/
!	"x"		qr/y/

# Regex against number
	12345		qr/3/
!	12345		qr/7/

# TODO ranges

# array/hash against string
	@fooormore	"".\@fooormore
!	@keyandmore	"".\@fooormore
	%fooormore	"".\%fooormore
!	%keyandmore	"".\%fooormore

# Test the implicit referencing
	7		@nums
	@nums		\@nums
!	@nums		\\@nums
	@nums		[1..10]
!	@nums		[0..9]

	"foo"		%hash
	/bar/		%hash
	[qw(bar)]	%hash
!	[qw(a b c)]	%hash
	%hash		%hash
	%hash		+{%hash}
	%hash		\%hash
	%hash		%tied_hash
	%tied_hash	%tied_hash
	%hash		{ foo => 5, bar => 10 }
!	%hash		{ foo => 5, bar => 10, quux => 15 }

	@nums		{  1, '',  2, '' }
	@nums		{  1, '', 12, '' }
!	@nums		{ 11, '', 12, '' }
