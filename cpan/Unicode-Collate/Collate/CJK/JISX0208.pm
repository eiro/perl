package Unicode::Collate::CJK::JISX0208;

use 5.006;
use strict;
use warnings;

our $VERSION = '1.18';

my %u2p;
my $wt = 0x8000;

while (<DATA>) {
    last if /^__END__/;
    my @c = split;
    for my $c (@c) {
	next if !$c;
	$u2p{hex($c)} = $wt;
	$wt++;
    }
}

sub weightJISX0208 {
    my $u = shift;
    return exists $u2p{$u} ? $u2p{$u} : undef;
}

1;
__DATA__
4E9C 5516 5A03 963F 54C0 611B 6328 59F6 9022 8475
831C 7A50 60AA 63E1 6E25 65ED 8466 82A6 9BF5 6893
5727 65A1 6271 5B9B 59D0 867B 98F4 7D62 7DBE 9B8E
6216 7C9F 88B7 5B89 5EB5 6309 6697 6848 95C7 978D
674F 4EE5 4F0A 4F4D 4F9D 5049 56F2 5937 59D4 5A01
5C09 60DF 610F 6170 6613 6905 70BA 754F 7570 79FB
7DAD 7DEF 80C3 840E 8863 8B02 9055 907A 533B 4E95
4EA5 57DF 80B2 90C1 78EF 4E00 58F1 6EA2 9038 7A32
8328 828B 9C2F 5141 5370 54BD 54E1 56E0 59FB 5F15
98F2 6DEB 80E4 852D 9662 9670 96A0 97FB 540B 53F3
5B87 70CF 7FBD 8FC2 96E8 536F 9D5C 7ABA 4E11 7893
81FC 6E26 5618 5504 6B1D 851A 9C3B 59E5 53A9 6D66
74DC 958F 5642 4E91 904B 96F2 834F 990C 53E1 55B6
5B30 5F71 6620 66F3 6804 6C38 6CF3 6D29 745B 76C8
7A4E 9834 82F1 885B 8A60 92ED 6DB2 75AB 76CA 99C5
60A6 8B01 8D8A 95B2 698E 53AD 5186 5712 5830 5944
5BB4 5EF6 6028 63A9 63F4 6CBF 6F14 708E 7114 7159
71D5 733F 7E01 8276 82D1 8597 9060 925B 9D1B 5869
65BC 6C5A 7525 51F9 592E 5965 5F80 5FDC 62BC 65FA
6A2A 6B27 6BB4 738B 7FC1 8956 9D2C 9D0E 9EC4 5CA1
6C96 837B 5104 5C4B 61B6 81C6 6876 7261 4E59 4FFA
5378 6069 6E29 7A4F 97F3 4E0B 5316 4EEE 4F55 4F3D
4FA1 4F73 52A0 53EF 5609 590F 5AC1 5BB6 5BE1 79D1
6687 679C 67B6 6B4C 6CB3 706B 73C2 798D 79BE 7A3C
7B87 82B1 82DB 8304 8377 83EF 83D3 8766 8AB2 5629
8CA8 8FE6 904E 971E 868A 4FC4 5CE8 6211 7259 753B
81E5 82BD 86FE 8CC0 96C5 9913 99D5 4ECB 4F1A 89E3
56DE 584A 58CA 5EFB 5FEB 602A 6094 6062 61D0 6212
62D0 6539 9B41 6666 68B0 6D77 7070 754C 7686 7D75
82A5 87F9 958B 968E 8C9D 51F1 52BE 5916 54B3 5BB3
5D16 6168 6982 6DAF 788D 84CB 8857 8A72 93A7 9AB8
6D6C 99A8 86D9 57A3 67FF 86CE 920E 5283 5687 5404
5ED3 62E1 64B9 683C 6838 6BBB 7372 78BA 7A6B 899A
89D2 8D6B 8F03 90ED 95A3 9694 9769 5B66 5CB3 697D
984D 984E 639B 7B20 6A2B 6A7F 68B6 9C0D 6F5F 5272
559D 6070 62EC 6D3B 6E07 6ED1 845B 8910 8F44 4E14
9C39 53F6 691B 6A3A 9784 682A 515C 7AC3 84B2 91DC
938C 565B 9D28 6822 8305 8431 7CA5 5208 82C5 74E6
4E7E 4F83 51A0 5BD2 520A 52D8 52E7 5DFB 559A 582A
59E6 5B8C 5B98 5BDB 5E72 5E79 60A3 611F 6163 61BE
63DB 6562 67D1 6853 68FA 6B3E 6B53 6C57 6F22 6F97
6F45 74B0 7518 76E3 770B 7AFF 7BA1 7C21 7DE9 7F36
7FF0 809D 8266 839E 89B3 8ACC 8CAB 9084 9451 9593
9591 95A2 9665 97D3 9928 8218 4E38 542B 5CB8 5DCC
73A9 764C 773C 5CA9 7FEB 8D0B 96C1 9811 9854 9858
4F01 4F0E 5371 559C 5668 57FA 5947 5B09 5BC4 5C90
5E0C 5E7E 5FCC 63EE 673A 65D7 65E2 671F 68CB 68C4
6A5F 5E30 6BC5 6C17 6C7D 757F 7948 5B63 7A00 7D00
5FBD 898F 8A18 8CB4 8D77 8ECC 8F1D 98E2 9A0E 9B3C
4E80 507D 5100 5993 5B9C 622F 6280 64EC 6B3A 72A0
7591 7947 7FA9 87FB 8ABC 8B70 63AC 83CA 97A0 5409
5403 55AB 6854 6A58 8A70 7827 6775 9ECD 5374 5BA2
811A 8650 9006 4E18 4E45 4EC7 4F11 53CA 5438 5BAE
5F13 6025 6551 673D 6C42 6C72 6CE3 7078 7403 7A76
7AAE 7B08 7D1A 7CFE 7D66 65E7 725B 53BB 5C45 5DE8
62D2 62E0 6319 6E20 865A 8A31 8DDD 92F8 6F01 79A6
9B5A 4EA8 4EAB 4EAC 4F9B 4FA0 50D1 5147 7AF6 5171
51F6 5354 5321 537F 53EB 55AC 5883 5CE1 5F37 5F4A
602F 6050 606D 631F 6559 6A4B 6CC1 72C2 72ED 77EF
80F8 8105 8208 854E 90F7 93E1 97FF 9957 9A5A 4EF0
51DD 5C2D 6681 696D 5C40 66F2 6975 7389 6850 7C81
50C5 52E4 5747 5DFE 9326 65A4 6B23 6B3D 7434 7981
79BD 7B4B 7DCA 82B9 83CC 887F 895F 8B39 8FD1 91D1
541F 9280 4E5D 5036 53E5 533A 72D7 7396 77E9 82E6
8EAF 99C6 99C8 99D2 5177 611A 865E 55B0 7A7A 5076
5BD3 9047 9685 4E32 6ADB 91E7 5C51 5C48 6398 7A9F
6C93 9774 8F61 7AAA 718A 9688 7C82 6817 7E70 6851
936C 52F2 541B 85AB 8A13 7FA4 8ECD 90E1 5366 8888
7941 4FC2 50BE 5211 5144 5553 572D 73EA 578B 5951
5F62 5F84 6075 6176 6167 61A9 63B2 643A 656C 666F
6842 6E13 7566 7A3D 7CFB 7D4C 7D99 7E4B 7F6B 830E
834A 86CD 8A08 8A63 8B66 8EFD 981A 9D8F 82B8 8FCE
9BE8 5287 621F 6483 6FC0 9699 6841 5091 6B20 6C7A
6F54 7A74 7D50 8840 8A23 6708 4EF6 5039 5026 5065
517C 5238 5263 55A7 570F 5805 5ACC 5EFA 61B2 61F8
62F3 6372 691C 6A29 727D 72AC 732E 7814 786F 7D79
770C 80A9 898B 8B19 8CE2 8ED2 9063 9375 967A 9855
9A13 9E78 5143 539F 53B3 5E7B 5F26 6E1B 6E90 7384
73FE 7D43 8237 8A00 8AFA 9650 4E4E 500B 53E4 547C
56FA 59D1 5B64 5DF1 5EAB 5F27 6238 6545 67AF 6E56
72D0 7CCA 88B4 80A1 80E1 83F0 864E 8A87 8DE8 9237
96C7 9867 9F13 4E94 4E92 4F0D 5348 5449 543E 5A2F
5F8C 5FA1 609F 68A7 6A8E 745A 7881 8A9E 8AA4 8B77
9190 4E5E 9BC9 4EA4 4F7C 4FAF 5019 5016 5149 516C
529F 52B9 52FE 539A 53E3 5411 540E 5589 5751 57A2
597D 5B54 5B5D 5B8F 5DE5 5DE7 5DF7 5E78 5E83 5E9A
5EB7 5F18 6052 614C 6297 62D8 63A7 653B 6602 6643
66F4 676D 6821 6897 69CB 6C5F 6D2A 6D69 6E2F 6E9D
7532 7687 786C 7A3F 7CE0 7D05 7D18 7D5E 7DB1 8015
8003 80AF 80B1 8154 818F 822A 8352 884C 8861 8B1B
8CA2 8CFC 90CA 9175 9271 783F 92FC 95A4 964D 9805
9999 9AD8 9D3B 525B 52AB 53F7 5408 58D5 62F7 6FE0
8C6A 8F5F 9EB9 514B 523B 544A 56FD 7A40 9177 9D60
9ED2 7344 6F09 8170 7511 5FFD 60DA 9AA8 72DB 8FBC
6B64 9803 4ECA 56F0 5764 58BE 5A5A 6068 61C7 660F
6606 6839 68B1 6DF7 75D5 7D3A 826E 9B42 4E9B 4F50
53C9 5506 5D6F 5DE6 5DEE 67FB 6C99 7473 7802 8A50
9396 88DF 5750 5EA7 632B 50B5 50AC 518D 6700 54C9
585E 59BB 5BB0 5F69 624D 63A1 683D 6B73 6E08 707D
91C7 7280 7815 7826 796D 658E 7D30 83DC 88C1 8F09
969B 5264 5728 6750 7F6A 8CA1 51B4 5742 962A 583A
698A 80B4 54B2 5D0E 57FC 7895 9DFA 4F5C 524A 548B
643E 6628 6714 67F5 7A84 7B56 7D22 932F 685C 9BAD
7B39 5319 518A 5237 5BDF 62F6 64AE 64E6 672D 6BBA
85A9 96D1 7690 9BD6 634C 9306 9BAB 76BF 6652 4E09
5098 53C2 5C71 60E8 6492 6563 685F 71E6 73CA 7523
7B97 7E82 8695 8B83 8CDB 9178 9910 65AC 66AB 6B8B
4ED5 4ED4 4F3A 4F7F 523A 53F8 53F2 55E3 56DB 58EB
59CB 59C9 59FF 5B50 5C4D 5E02 5E2B 5FD7 601D 6307
652F 5B5C 65AF 65BD 65E8 679D 6B62 6B7B 6C0F 7345
7949 79C1 7CF8 7D19 7D2B 80A2 8102 81F3 8996 8A5E
8A69 8A66 8A8C 8AEE 8CC7 8CDC 96CC 98FC 6B6F 4E8B
4F3C 4F8D 5150 5B57 5BFA 6148 6301 6642 6B21 6ECB
6CBB 723E 74BD 75D4 78C1 793A 800C 8033 81EA 8494
8F9E 6C50 9E7F 5F0F 8B58 9D2B 7AFA 8EF8 5B8D 96EB
4E03 53F1 57F7 5931 5AC9 5BA4 6089 6E7F 6F06 75BE
8CEA 5B9F 8500 7BE0 5072 67F4 829D 5C61 854A 7E1E
820E 5199 5C04 6368 8D66 659C 716E 793E 7D17 8005
8B1D 8ECA 906E 86C7 90AA 501F 52FA 5C3A 6753 707C
7235 914C 91C8 932B 82E5 5BC2 5F31 60F9 4E3B 53D6
5B88 624B 6731 6B8A 72E9 73E0 7A2E 816B 8DA3 9152
9996 5112 53D7 546A 5BFF 6388 6A39 7DAC 9700 56DA
53CE 5468 5B97 5C31 5DDE 4FEE 6101 62FE 6D32 79C0
79CB 7D42 7E4D 7FD2 81ED 821F 8490 8846 8972 8B90
8E74 8F2F 9031 914B 916C 96C6 919C 4EC0 4F4F 5145
5341 5F93 620E 67D4 6C41 6E0B 7363 7E26 91CD 9283
53D4 5919 5BBF 6DD1 795D 7E2E 7C9B 587E 719F 51FA
8853 8FF0 4FCA 5CFB 6625 77AC 7AE3 821C 99FF 51C6
5FAA 65EC 696F 6B89 6DF3 6E96 6F64 76FE 7D14 5DE1
9075 9187 9806 51E6 521D 6240 6691 66D9 6E1A 5EB6
7DD2 7F72 66F8 85AF 85F7 8AF8 52A9 53D9 5973 5E8F
5F90 6055 92E4 9664 50B7 511F 52DD 5320 5347 53EC
54E8 5546 5531 5617 5968 59BE 5A3C 5BB5 5C06 5C0F
5C11 5C1A 5E84 5E8A 5EE0 5F70 627F 6284 62DB 638C
6377 6607 660C 662D 6676 677E 68A2 6A1F 6A35 6CBC
6D88 6E09 6E58 713C 7126 7167 75C7 7701 785D 7901
7965 79F0 7AE0 7B11 7CA7 7D39 8096 83D6 848B 8549
885D 88F3 8A1F 8A3C 8A54 8A73 8C61 8CDE 91A4 9266
937E 9418 969C 9798 4E0A 4E08 4E1E 4E57 5197 5270
57CE 5834 58CC 5B22 5E38 60C5 64FE 6761 6756 6D44
72B6 7573 7A63 84B8 8B72 91B8 9320 5631 57F4 98FE
62ED 690D 6B96 71ED 7E54 8077 8272 89E6 98DF 8755
8FB1 5C3B 4F38 4FE1 4FB5 5507 5A20 5BDD 5BE9 5FC3
614E 632F 65B0 664B 68EE 699B 6D78 6DF1 7533 75B9
771F 795E 79E6 7D33 81E3 82AF 85AA 89AA 8A3A 8EAB
8F9B 9032 91DD 9707 4EBA 4EC1 5203 5875 58EC 5C0B
751A 5C3D 814E 8A0A 8FC5 9663 976D 7B25 8ACF 9808
9162 56F3 53A8 9017 5439 5782 5E25 63A8 6C34 708A
7761 7C8B 7FE0 8870 9042 9154 9310 9318 968F 745E
9AC4 5D07 5D69 6570 67A2 8DA8 96DB 636E 6749 6919
83C5 9817 96C0 88FE 6F84 647A 5BF8 4E16 702C 755D
662F 51C4 5236 52E2 59D3 5F81 6027 6210 653F 6574
661F 6674 68F2 6816 6B63 6E05 7272 751F 76DB 7CBE
8056 58F0 88FD 897F 8AA0 8A93 8ACB 901D 9192 9752
9759 6589 7A0E 8106 96BB 5E2D 60DC 621A 65A5 6614
6790 77F3 7A4D 7C4D 7E3E 810A 8CAC 8D64 8DE1 8E5F
78A9 5207 62D9 63A5 6442 6298 8A2D 7A83 7BC0 8AAC
96EA 7D76 820C 8749 4ED9 5148 5343 5360 5BA3 5C02
5C16 5DDD 6226 6247 64B0 6813 6834 6CC9 6D45 6D17
67D3 6F5C 714E 717D 65CB 7A7F 7BAD 7DDA 7E4A 7FA8
817A 821B 8239 85A6 8A6E 8CCE 8DF5 9078 9077 92AD
9291 9583 9BAE 524D 5584 6F38 7136 5168 7985 7E55
81B3 7CCE 564C 5851 5CA8 63AA 66FE 66FD 695A 72D9
758F 758E 790E 7956 79DF 7C97 7D20 7D44 8607 8A34
963B 9061 9F20 50E7 5275 53CC 53E2 5009 55AA 58EE
594F 723D 5B8B 5C64 531D 60E3 60F3 635C 6383 633F
63BB 64CD 65E9 66F9 5DE3 69CD 69FD 6F15 71E5 4E89
75E9 76F8 7A93 7CDF 7DCF 7D9C 8061 8349 8358 846C
84BC 85FB 88C5 8D70 9001 906D 9397 971C 9A12 50CF
5897 618E 81D3 8535 8D08 9020 4FC3 5074 5247 5373
606F 6349 675F 6E2C 8DB3 901F 4FD7 5C5E 8CCA 65CF
7D9A 5352 8896 5176 63C3 5B58 5B6B 5C0A 640D 6751
905C 4ED6 591A 592A 6C70 8A51 553E 5815 59A5 60F0
6253 67C1 8235 6955 9640 99C4 9A28 4F53 5806 5BFE
8010 5CB1 5E2F 5F85 6020 614B 6234 66FF 6CF0 6EDE
80CE 817F 82D4 888B 8CB8 9000 902E 968A 9EDB 9BDB
4EE3 53F0 5927 7B2C 918D 984C 9DF9 6EDD 7027 5353
5544 5B85 6258 629E 62D3 6CA2 6FEF 7422 8A17 9438
6FC1 8AFE 8338 51E7 86F8 53EA 53E9 4F46 9054 8FB0
596A 8131 5DFD 7AEA 8FBF 68DA 8C37 72F8 9C48 6A3D
8AB0 4E39 5358 5606 5766 62C5 63A2 65E6 6B4E 6DE1
6E5B 70AD 77ED 7AEF 7BAA 7DBB 803D 80C6 86CB 8A95
935B 56E3 58C7 5F3E 65AD 6696 6A80 6BB5 7537 8AC7
5024 77E5 5730 5F1B 6065 667A 6C60 75F4 7A1A 7F6E
81F4 8718 9045 99B3 7BC9 755C 7AF9 7B51 84C4 9010
79E9 7A92 8336 5AE1 7740 4E2D 4EF2 5B99 5FE0 62BD
663C 67F1 6CE8 866B 8877 8A3B 914E 92F3 99D0 6A17
7026 732A 82E7 8457 8CAF 4E01 5146 51CB 558B 5BF5
5E16 5E33 5E81 5F14 5F35 5F6B 5FB4 61F2 6311 66A2
671D 6F6E 7252 753A 773A 8074 8139 8178 8776 8ABF
8ADC 8D85 8DF3 929A 9577 9802 9CE5 52C5 6357 76F4
6715 6C88 73CD 8CC3 93AE 9673 6D25 589C 690E 69CC
8FFD 939A 75DB 901A 585A 6802 63B4 69FB 4F43 6F2C
67D8 8FBB 8526 7DB4 9354 693F 6F70 576A 58F7 5B2C
7D2C 722A 540A 91E3 9DB4 4EAD 4F4E 505C 5075 5243
8C9E 5448 5824 5B9A 5E1D 5E95 5EAD 5EF7 5F1F 608C
62B5 633A 63D0 68AF 6C40 7887 798E 7A0B 7DE0 8247
8A02 8AE6 8E44 9013 90B8 912D 91D8 9F0E 6CE5 6458
64E2 6575 6EF4 7684 7B1B 9069 93D1 6EBA 54F2 5FB9
64A4 8F4D 8FED 9244 5178 586B 5929 5C55 5E97 6DFB
7E8F 751C 8CBC 8EE2 985B 70B9 4F1D 6BBF 6FB1 7530
96FB 514E 5410 5835 5857 59AC 5C60 5F92 6597 675C
6E21 767B 83DF 8CED 9014 90FD 934D 7825 783A 52AA
5EA6 571F 5974 6012 5012 515A 51AC 51CD 5200 5510
5854 5858 5957 5B95 5CF6 5D8B 60BC 6295 642D 6771
6843 68BC 68DF 76D7 6DD8 6E6F 6D9B 706F 71C8 5F53
75D8 7977 7B49 7B54 7B52 7CD6 7D71 5230 8463 8569
85E4 8A0E 8B04 8C46 8E0F 9003 900F 9419 9676 982D
9A30 95D8 50CD 52D5 540C 5802 5C0E 61A7 649E 6D1E
77B3 7AE5 80F4 8404 9053 9285 5CE0 9D07 533F 5F97
5FB3 6D9C 7279 7763 79BF 7BE4 6BD2 72EC 8AAD 6803
6A61 51F8 7A81 6934 5C4A 9CF6 82EB 5BC5 9149 701E
5678 5C6F 60C7 6566 6C8C 8C5A 9041 9813 5451 66C7
920D 5948 90A3 5185 4E4D 51EA 8599 8B0E 7058 637A
934B 6962 99B4 7E04 7577 5357 6960 8EDF 96E3 6C5D
4E8C 5C3C 5F10 8FE9 5302 8CD1 8089 8679 5EFF 65E5
4E73 5165 5982 5C3F 97EE 4EFB 598A 5FCD 8A8D 6FE1
79B0 7962 5BE7 8471 732B 71B1 5E74 5FF5 637B 649A
71C3 7C98 4E43 5EFC 4E4B 57DC 56A2 60A9 6FC3 7D0D
80FD 8133 81BF 8FB2 8997 86A4 5DF4 628A 64AD 8987
6777 6CE2 6D3E 7436 7834 5A46 7F75 82AD 99AC 4FF3
5EC3 62DD 6392 6557 676F 76C3 724C 80CC 80BA 8F29
914D 500D 57F9 5A92 6885 6973 7164 72FD 8CB7 58F2
8CE0 966A 9019 877F 79E4 77E7 8429 4F2F 5265 535A
62CD 67CF 6CCA 767D 7B94 7C95 8236 8584 8FEB 66DD
6F20 7206 7E1B 83AB 99C1 9EA6 51FD 7BB1 7872 7BB8
8087 7B48 6AE8 5E61 808C 7551 7560 516B 9262 6E8C
767A 9197 9AEA 4F10 7F70 629C 7B4F 95A5 9CE9 567A
5859 86E4 96BC 4F34 5224 534A 53CD 53DB 5E06 642C
6591 677F 6C3E 6C4E 7248 72AF 73ED 7554 7E41 822C
85E9 8CA9 7BC4 91C6 7169 9812 98EF 633D 6669 756A
76E4 78D0 8543 86EE 532A 5351 5426 5983 5E87 5F7C
60B2 6249 6279 62AB 6590 6BD4 6CCC 75B2 76AE 7891
79D8 7DCB 7F77 80A5 88AB 8AB9 8CBB 907F 975E 98DB
6A0B 7C38 5099 5C3E 5FAE 6787 6BD8 7435 7709 7F8E
9F3B 67CA 7A17 5339 758B 9AED 5F66 819D 83F1 8098
5F3C 5FC5 7562 7B46 903C 6867 59EB 5A9B 7D10 767E
8B2C 4FF5 5F6A 6A19 6C37 6F02 74E2 7968 8868 8A55
8C79 5EDF 63CF 75C5 79D2 82D7 9328 92F2 849C 86ED
9C2D 54C1 5F6C 658C 6D5C 7015 8CA7 8CD3 983B 654F
74F6 4E0D 4ED8 57E0 592B 5A66 5BCC 51A8 5E03 5E9C
6016 6276 6577 65A7 666E 6D6E 7236 7B26 8150 819A
8299 8B5C 8CA0 8CE6 8D74 961C 9644 4FAE 64AB 6B66
821E 8461 856A 90E8 5C01 6953 98A8 847A 8557 4F0F
526F 5FA9 5E45 670D 798F 8179 8907 8986 6DF5 5F17
6255 6CB8 4ECF 7269 9B92 5206 543B 5674 58B3 61A4
626E 711A 596E 7C89 7CDE 7D1B 96F0 6587 805E 4E19
4F75 5175 5840 5E63 5E73 5F0A 67C4 4E26 853D 9589
965B 7C73 9801 50FB 58C1 7656 78A7 5225 77A5 8511
7B86 504F 5909 7247 7BC7 7DE8 8FBA 8FD4 904D 4FBF
52C9 5A29 5F01 97AD 4FDD 8217 92EA 5703 6355 6B69
752B 88DC 8F14 7A42 52DF 5893 6155 620A 66AE 6BCD
7C3F 83E9 5023 4FF8 5305 5446 5831 5949 5B9D 5CF0
5CEF 5D29 5E96 62B1 6367 653E 65B9 670B 6CD5 6CE1
70F9 7832 7E2B 80DE 82B3 840C 84EC 8702 8912 8A2A
8C4A 90A6 92D2 98FD 9CF3 9D6C 4E4F 4EA1 508D 5256
574A 59A8 5E3D 5FD8 5FD9 623F 66B4 671B 67D0 68D2
5192 7D21 80AA 81A8 8B00 8C8C 8CBF 927E 9632 5420
982C 5317 50D5 535C 58A8 64B2 6734 7267 7766 7A46
91E6 52C3 6CA1 6B86 5800 5E4C 5954 672C 7FFB 51E1
76C6 6469 78E8 9B54 9EBB 57CB 59B9 6627 679A 6BCE
54E9 69D9 5E55 819C 6795 9BAA 67FE 9C52 685D 4EA6
4FE3 53C8 62B9 672B 6CAB 8FC4 4FAD 7E6D 9EBF 4E07
6162 6E80 6F2B 8513 5473 672A 9B45 5DF3 7B95 5CAC
5BC6 871C 6E4A 84D1 7A14 8108 5999 7C8D 6C11 7720
52D9 5922 7121 725F 77DB 9727 9D61 690B 5A7F 5A18
51A5 540D 547D 660E 76DF 8FF7 9298 9CF4 59EA 725D
6EC5 514D 68C9 7DBF 7DEC 9762 9EBA 6478 6A21 8302
5984 5B5F 6BDB 731B 76F2 7DB2 8017 8499 5132 6728
9ED9 76EE 6762 52FF 9905 5C24 623B 7C7E 8CB0 554F
60B6 7D0B 9580 5301 4E5F 51B6 591C 723A 8036 91CE
5F25 77E2 5384 5F79 7D04 85AC 8A33 8E8D 9756 67F3
85AE 9453 6109 6108 6CB9 7652 8AED 8F38 552F 4F51
512A 52C7 53CB 5BA5 5E7D 60A0 6182 63D6 6709 67DA
6E67 6D8C 7336 7337 7531 7950 88D5 8A98 904A 9091
90F5 96C4 878D 5915 4E88 4F59 4E0E 8A89 8F3F 9810
50AD 5E7C 5996 5BB9 5EB8 63DA 63FA 64C1 66DC 694A
69D8 6D0B 6EB6 7194 7528 7AAF 7F8A 8000 8449 84C9
8981 8B21 8E0A 9065 967D 990A 617E 6291 6B32 6C83
6D74 7FCC 7FFC 6DC0 7F85 87BA 88F8 6765 83B1 983C
96F7 6D1B 7D61 843D 916A 4E71 5375 5D50 6B04 6FEB
85CD 862D 89A7 5229 540F 5C65 674E 68A8 7406 7483
75E2 88CF 88E1 91CC 96E2 9678 5F8B 7387 7ACB 844E
63A0 7565 5289 6D41 6E9C 7409 7559 786B 7C92 9686
7ADC 9F8D 4FB6 616E 65C5 865C 4E86 4EAE 50DA 4E21
51CC 5BEE 6599 6881 6DBC 731F 7642 77AD 7A1C 7CE7
826F 8AD2 907C 91CF 9675 9818 529B 7DD1 502B 5398
6797 6DCB 71D0 7433 81E8 8F2A 96A3 9C57 9E9F 7460
5841 6D99 7D2F 985E 4EE4 4F36 4F8B 51B7 52B1 5DBA
601C 73B2 793C 82D3 9234 96B7 96F6 970A 9E97 9F62
66A6 6B74 5217 52A3 70C8 88C2 5EC9 604B 6190 6F23
7149 7C3E 7DF4 806F 84EE 9023 932C 5442 9B6F 6AD3
7089 8CC2 8DEF 9732 52B4 5A41 5ECA 5F04 6717 697C
6994 6D6A 6F0F 7262 72FC 7BED 8001 807E 874B 90CE
516D 9E93 7984 808B 9332 8AD6 502D 548C 8A71 6B6A
8CC4 8107 60D1 67A0 9DF2 4E99 4E98 9C10 8A6B 85C1
8568 6900 6E7E 7897 8155 5F0C 4E10 4E15 4E2A 4E31
4E36 4E3C 4E3F 4E42 4E56 4E58 4E82 4E85 8C6B 4E8A
8212 5F0D 4E8E 4E9E 4E9F 4EA0 4EA2 4EB0 4EB3 4EB6
4ECE 4ECD 4EC4 4EC6 4EC2 4ED7 4EDE 4EED 4EDF 4EF7
4F09 4F5A 4F30 4F5B 4F5D 4F57 4F47 4F76 4F88 4F8F
4F98 4F7B 4F69 4F70 4F91 4F6F 4F86 4F96 5118 4FD4
4FDF 4FCE 4FD8 4FDB 4FD1 4FDA 4FD0 4FE4 4FE5 501A
5028 5014 502A 5025 5005 4F1C 4FF6 5021 5029 502C
4FFE 4FEF 5011 5006 5043 5047 6703 5055 5050 5048
505A 5056 506C 5078 5080 509A 5085 50B4 50B2 50C9
50CA 50B3 50C2 50D6 50DE 50E5 50ED 50E3 50EE 50F9
50F5 5109 5101 5102 5116 5115 5114 511A 5121 513A
5137 513C 513B 513F 5140 5152 514C 5154 5162 7AF8
5169 516A 516E 5180 5182 56D8 518C 5189 518F 5191
5193 5195 5196 51A4 51A6 51A2 51A9 51AA 51AB 51B3
51B1 51B2 51B0 51B5 51BD 51C5 51C9 51DB 51E0 8655
51E9 51ED 51F0 51F5 51FE 5204 520B 5214 520E 5227
522A 522E 5233 5239 524F 5244 524B 524C 525E 5254
526A 5274 5269 5273 527F 527D 528D 5294 5292 5271
5288 5291 8FA8 8FA7 52AC 52AD 52BC 52B5 52C1 52CD
52D7 52DE 52E3 52E6 98ED 52E0 52F3 52F5 52F8 52F9
5306 5308 7538 530D 5310 530F 5315 531A 5323 532F
5331 5333 5338 5340 5346 5345 4E17 5349 534D 51D6
535E 5369 536E 5918 537B 5377 5382 5396 53A0 53A6
53A5 53AE 53B0 53B6 53C3 7C12 96D9 53DF 66FC 71EE
53EE 53E8 53ED 53FA 5401 543D 5440 542C 542D 543C
542E 5436 5429 541D 544E 548F 5475 548E 545F 5471
5477 5470 5492 547B 5480 5476 5484 5490 5486 54C7
54A2 54B8 54A5 54AC 54C4 54C8 54A8 54AB 54C2 54A4
54BE 54BC 54D8 54E5 54E6 550F 5514 54FD 54EE 54ED
54FA 54E2 5539 5540 5563 554C 552E 555C 5545 5556
5557 5538 5533 555D 5599 5580 54AF 558A 559F 557B
557E 5598 559E 55AE 557C 5583 55A9 5587 55A8 55DA
55C5 55DF 55C4 55DC 55E4 55D4 5614 55F7 5616 55FE
55FD 561B 55F9 564E 5650 71DF 5634 5636 5632 5638
566B 5664 562F 566C 566A 5686 5680 568A 56A0 5694
568F 56A5 56AE 56B6 56B4 56C2 56BC 56C1 56C3 56C0
56C8 56CE 56D1 56D3 56D7 56EE 56F9 5700 56FF 5704
5709 5708 570B 570D 5713 5718 5716 55C7 571C 5726
5737 5738 574E 573B 5740 574F 5769 57C0 5788 5761
577F 5789 5793 57A0 57B3 57A4 57AA 57B0 57C3 57C6
57D4 57D2 57D3 580A 57D6 57E3 580B 5819 581D 5872
5821 5862 584B 5870 6BC0 5852 583D 5879 5885 58B9
589F 58AB 58BA 58DE 58BB 58B8 58AE 58C5 58D3 58D1
58D7 58D9 58D8 58E5 58DC 58E4 58DF 58EF 58FA 58F9
58FB 58FC 58FD 5902 590A 5910 591B 68A6 5925 592C
592D 5932 5938 593E 7AD2 5955 5950 594E 595A 5958
5962 5960 5967 596C 5969 5978 5981 599D 4F5E 4FAB
59A3 59B2 59C6 59E8 59DC 598D 59D9 59DA 5A25 5A1F
5A11 5A1C 5A09 5A1A 5A40 5A6C 5A49 5A35 5A36 5A62
5A6A 5A9A 5ABC 5ABE 5ACB 5AC2 5ABD 5AE3 5AD7 5AE6
5AE9 5AD6 5AFA 5AFB 5B0C 5B0B 5B16 5B32 5AD0 5B2A
5B36 5B3E 5B43 5B45 5B40 5B51 5B55 5B5A 5B5B 5B65
5B69 5B70 5B73 5B75 5B78 6588 5B7A 5B80 5B83 5BA6
5BB8 5BC3 5BC7 5BC9 5BD4 5BD0 5BE4 5BE6 5BE2 5BDE
5BE5 5BEB 5BF0 5BF6 5BF3 5C05 5C07 5C08 5C0D 5C13
5C20 5C22 5C28 5C38 5C39 5C41 5C46 5C4E 5C53 5C50
5C4F 5B71 5C6C 5C6E 4E62 5C76 5C79 5C8C 5C91 5C94
599B 5CAB 5CBB 5CB6 5CBC 5CB7 5CC5 5CBE 5CC7 5CD9
5CE9 5CFD 5CFA 5CED 5D8C 5CEA 5D0B 5D15 5D17 5D5C
5D1F 5D1B 5D11 5D14 5D22 5D1A 5D19 5D18 5D4C 5D52
5D4E 5D4B 5D6C 5D73 5D76 5D87 5D84 5D82 5DA2 5D9D
5DAC 5DAE 5DBD 5D90 5DB7 5DBC 5DC9 5DCD 5DD3 5DD2
5DD6 5DDB 5DEB 5DF2 5DF5 5E0B 5E1A 5E19 5E11 5E1B
5E36 5E37 5E44 5E43 5E40 5E4E 5E57 5E54 5E5F 5E62
5E64 5E47 5E75 5E76 5E7A 9EBC 5E7F 5EA0 5EC1 5EC2
5EC8 5ED0 5ECF 5ED6 5EE3 5EDD 5EDA 5EDB 5EE2 5EE1
5EE8 5EE9 5EEC 5EF1 5EF3 5EF0 5EF4 5EF8 5EFE 5F03
5F09 5F5D 5F5C 5F0B 5F11 5F16 5F29 5F2D 5F38 5F41
5F48 5F4C 5F4E 5F2F 5F51 5F56 5F57 5F59 5F61 5F6D
5F73 5F77 5F83 5F82 5F7F 5F8A 5F88 5F91 5F87 5F9E
5F99 5F98 5FA0 5FA8 5FAD 5FBC 5FD6 5FFB 5FE4 5FF8
5FF1 5FDD 60B3 5FFF 6021 6060 6019 6010 6029 600E
6031 601B 6015 602B 6026 600F 603A 605A 6041 606A
6077 605F 604A 6046 604D 6063 6043 6064 6042 606C
606B 6059 6081 608D 60E7 6083 609A 6084 609B 6096
6097 6092 60A7 608B 60E1 60B8 60E0 60D3 60B4 5FF0
60BD 60C6 60B5 60D8 614D 6115 6106 60F6 60F7 6100
60F4 60FA 6103 6121 60FB 60F1 610D 610E 6147 613E
6128 6127 614A 613F 613C 612C 6134 613D 6142 6144
6173 6177 6158 6159 615A 616B 6174 616F 6165 6171
615F 615D 6153 6175 6199 6196 6187 61AC 6194 619A
618A 6191 61AB 61AE 61CC 61CA 61C9 61F7 61C8 61C3
61C6 61BA 61CB 7F79 61CD 61E6 61E3 61F6 61FA 61F4
61FF 61FD 61FC 61FE 6200 6208 6209 620D 620C 6214
621B 621E 6221 622A 622E 6230 6232 6233 6241 624E
625E 6263 625B 6260 6268 627C 6282 6289 627E 6292
6293 6296 62D4 6283 6294 62D7 62D1 62BB 62CF 62FF
62C6 64D4 62C8 62DC 62CC 62CA 62C2 62C7 629B 62C9
630C 62EE 62F1 6327 6302 6308 62EF 62F5 6350 633E
634D 641C 634F 6396 638E 6380 63AB 6376 63A3 638F
6389 639F 63B5 636B 6369 63BE 63E9 63C0 63C6 63E3
63C9 63D2 63F6 63C4 6416 6434 6406 6413 6426 6436
651D 6417 6428 640F 6467 646F 6476 644E 652A 6495
6493 64A5 64A9 6488 64BC 64DA 64D2 64C5 64C7 64BB
64D8 64C2 64F1 64E7 8209 64E0 64E1 62AC 64E3 64EF
652C 64F6 64F4 64F2 64FA 6500 64FD 6518 651C 6505
6524 6523 652B 6534 6535 6537 6536 6538 754B 6548
6556 6555 654D 6558 655E 655D 6572 6578 6582 6583
8B8A 659B 659F 65AB 65B7 65C3 65C6 65C1 65C4 65CC
65D2 65DB 65D9 65E0 65E1 65F1 6772 660A 6603 65FB
6773 6635 6636 6634 661C 664F 6644 6649 6641 665E
665D 6664 6667 6668 665F 6662 6670 6683 6688 668E
6689 6684 6698 669D 66C1 66B9 66C9 66BE 66BC 66C4
66B8 66D6 66DA 66E0 663F 66E6 66E9 66F0 66F5 66F7
670F 6716 671E 6726 6727 9738 672E 673F 6736 6741
6738 6737 6746 675E 6760 6759 6763 6764 6789 6770
67A9 677C 676A 678C 678B 67A6 67A1 6785 67B7 67EF
67B4 67EC 67B3 67E9 67B8 67E4 67DE 67DD 67E2 67EE
67B9 67CE 67C6 67E7 6A9C 681E 6846 6829 6840 684D
6832 684E 68B3 682B 6859 6863 6877 687F 689F 688F
68AD 6894 689D 689B 6883 6AAE 68B9 6874 68B5 68A0
68BA 690F 688D 687E 6901 68CA 6908 68D8 6922 6926
68E1 690C 68CD 68D4 68E7 68D5 6936 6912 6904 68D7
68E3 6925 68F9 68E0 68EF 6928 692A 691A 6923 6921
68C6 6979 6977 695C 6978 696B 6954 697E 696E 6939
6974 693D 6959 6930 6961 695E 695D 6981 696A 69B2
69AE 69D0 69BF 69C1 69D3 69BE 69CE 5BE8 69CA 69DD
69BB 69C3 69A7 6A2E 6991 69A0 699C 6995 69B4 69DE
69E8 6A02 6A1B 69FF 6B0A 69F9 69F2 69E7 6A05 69B1
6A1E 69ED 6A14 69EB 6A0A 6A12 6AC1 6A23 6A13 6A44
6A0C 6A72 6A36 6A78 6A47 6A62 6A59 6A66 6A48 6A38
6A22 6A90 6A8D 6AA0 6A84 6AA2 6AA3 6A97 8617 6ABB
6AC3 6AC2 6AB8 6AB3 6AAC 6ADE 6AD1 6ADF 6AAA 6ADA
6AEA 6AFB 6B05 8616 6AFA 6B12 6B16 9B31 6B1F 6B38
6B37 76DC 6B39 98EE 6B47 6B43 6B49 6B50 6B59 6B54
6B5B 6B5F 6B61 6B78 6B79 6B7F 6B80 6B84 6B83 6B8D
6B98 6B95 6B9E 6BA4 6BAA 6BAB 6BAF 6BB2 6BB1 6BB3
6BB7 6BBC 6BC6 6BCB 6BD3 6BDF 6BEC 6BEB 6BF3 6BEF
9EBE 6C08 6C13 6C14 6C1B 6C24 6C23 6C5E 6C55 6C62
6C6A 6C82 6C8D 6C9A 6C81 6C9B 6C7E 6C68 6C73 6C92
6C90 6CC4 6CF1 6CD3 6CBD 6CD7 6CC5 6CDD 6CAE 6CB1
6CBE 6CBA 6CDB 6CEF 6CD9 6CEA 6D1F 884D 6D36 6D2B
6D3D 6D38 6D19 6D35 6D33 6D12 6D0C 6D63 6D93 6D64
6D5A 6D79 6D59 6D8E 6D95 6FE4 6D85 6DF9 6E15 6E0A
6DB5 6DC7 6DE6 6DB8 6DC6 6DEC 6DDE 6DCC 6DE8 6DD2
6DC5 6DFA 6DD9 6DE4 6DD5 6DEA 6DEE 6E2D 6E6E 6E2E
6E19 6E72 6E5F 6E3E 6E23 6E6B 6E2B 6E76 6E4D 6E1F
6E43 6E3A 6E4E 6E24 6EFF 6E1D 6E38 6E82 6EAA 6E98
6EC9 6EB7 6ED3 6EBD 6EAF 6EC4 6EB2 6ED4 6ED5 6E8F
6EA5 6EC2 6E9F 6F41 6F11 704C 6EEC 6EF8 6EFE 6F3F
6EF2 6F31 6EEF 6F32 6ECC 6F3E 6F13 6EF7 6F86 6F7A
6F78 6F81 6F80 6F6F 6F5B 6FF3 6F6D 6F82 6F7C 6F58
6F8E 6F91 6FC2 6F66 6FB3 6FA3 6FA1 6FA4 6FB9 6FC6
6FAA 6FDF 6FD5 6FEC 6FD4 6FD8 6FF1 6FEE 6FDB 7009
700B 6FFA 7011 7001 700F 6FFE 701B 701A 6F74 701D
7018 701F 7030 703E 7032 7051 7063 7099 7092 70AF
70F1 70AC 70B8 70B3 70AE 70DF 70CB 70DD 70D9 7109
70FD 711C 7119 7165 7155 7188 7166 7162 714C 7156
716C 718F 71FB 7184 7195 71A8 71AC 71D7 71B9 71BE
71D2 71C9 71D4 71CE 71E0 71EC 71E7 71F5 71FC 71F9
71FF 720D 7210 721B 7228 722D 722C 7230 7232 723B
723C 723F 7240 7246 724B 7258 7274 727E 7282 7281
7287 7292 7296 72A2 72A7 72B9 72B2 72C3 72C6 72C4
72CE 72D2 72E2 72E0 72E1 72F9 72F7 500F 7317 730A
731C 7316 731D 7334 732F 7329 7325 733E 734E 734F
9ED8 7357 736A 7368 7370 7378 7375 737B 737A 73C8
73B3 73CE 73BB 73C0 73E5 73EE 73DE 74A2 7405 746F
7425 73F8 7432 743A 7455 743F 745F 7459 7441 745C
7469 7470 7463 746A 7476 747E 748B 749E 74A7 74CA
74CF 74D4 73F1 74E0 74E3 74E7 74E9 74EE 74F2 74F0
74F1 74F8 74F7 7504 7503 7505 750C 750E 750D 7515
7513 751E 7526 752C 753C 7544 754D 754A 7549 755B
7546 755A 7569 7564 7567 756B 756D 7578 7576 7586
7587 7574 758A 7589 7582 7594 759A 759D 75A5 75A3
75C2 75B3 75C3 75B5 75BD 75B8 75BC 75B1 75CD 75CA
75D2 75D9 75E3 75DE 75FE 75FF 75FC 7601 75F0 75FA
75F2 75F3 760B 760D 7609 761F 7627 7620 7621 7622
7624 7634 7630 763B 7647 7648 7646 765C 7658 7661
7662 7668 7669 766A 7667 766C 7670 7672 7676 7678
767C 7680 7683 7688 768B 768E 7696 7693 7699 769A
76B0 76B4 76B8 76B9 76BA 76C2 76CD 76D6 76D2 76DE
76E1 76E5 76E7 76EA 862F 76FB 7708 7707 7704 7729
7724 771E 7725 7726 771B 7737 7738 7747 775A 7768
776B 775B 7765 777F 777E 7779 778E 778B 7791 77A0
779E 77B0 77B6 77B9 77BF 77BC 77BD 77BB 77C7 77CD
77D7 77DA 77DC 77E3 77EE 77FC 780C 7812 7926 7820
792A 7845 788E 7874 7886 787C 789A 788C 78A3 78B5
78AA 78AF 78D1 78C6 78CB 78D4 78BE 78BC 78C5 78CA
78EC 78E7 78DA 78FD 78F4 7907 7912 7911 7919 792C
792B 7940 7960 7957 795F 795A 7955 7953 797A 797F
798A 799D 79A7 9F4B 79AA 79AE 79B3 79B9 79BA 79C9
79D5 79E7 79EC 79E1 79E3 7A08 7A0D 7A18 7A19 7A20
7A1F 7980 7A31 7A3B 7A3E 7A37 7A43 7A57 7A49 7A61
7A62 7A69 9F9D 7A70 7A79 7A7D 7A88 7A97 7A95 7A98
7A96 7AA9 7AC8 7AB0 7AB6 7AC5 7AC4 7ABF 9083 7AC7
7ACA 7ACD 7ACF 7AD5 7AD3 7AD9 7ADA 7ADD 7AE1 7AE2
7AE6 7AED 7AF0 7B02 7B0F 7B0A 7B06 7B33 7B18 7B19
7B1E 7B35 7B28 7B36 7B50 7B7A 7B04 7B4D 7B0B 7B4C
7B45 7B75 7B65 7B74 7B67 7B70 7B71 7B6C 7B6E 7B9D
7B98 7B9F 7B8D 7B9C 7B9A 7B8B 7B92 7B8F 7B5D 7B99
7BCB 7BC1 7BCC 7BCF 7BB4 7BC6 7BDD 7BE9 7C11 7C14
7BE6 7BE5 7C60 7C00 7C07 7C13 7BF3 7BF7 7C17 7C0D
7BF6 7C23 7C27 7C2A 7C1F 7C37 7C2B 7C3D 7C4C 7C43
7C54 7C4F 7C40 7C50 7C58 7C5F 7C64 7C56 7C65 7C6C
7C75 7C83 7C90 7CA4 7CAD 7CA2 7CAB 7CA1 7CA8 7CB3
7CB2 7CB1 7CAE 7CB9 7CBD 7CC0 7CC5 7CC2 7CD8 7CD2
7CDC 7CE2 9B3B 7CEF 7CF2 7CF4 7CF6 7CFA 7D06 7D02
7D1C 7D15 7D0A 7D45 7D4B 7D2E 7D32 7D3F 7D35 7D46
7D73 7D56 7D4E 7D72 7D68 7D6E 7D4F 7D63 7D93 7D89
7D5B 7D8F 7D7D 7D9B 7DBA 7DAE 7DA3 7DB5 7DC7 7DBD
7DAB 7E3D 7DA2 7DAF 7DDC 7DB8 7D9F 7DB0 7DD8 7DDD
7DE4 7DDE 7DFB 7DF2 7DE1 7E05 7E0A 7E23 7E21 7E12
7E31 7E1F 7E09 7E0B 7E22 7E46 7E66 7E3B 7E35 7E39
7E43 7E37 7E32 7E3A 7E67 7E5D 7E56 7E5E 7E59 7E5A
7E79 7E6A 7E69 7E7C 7E7B 7E83 7DD5 7E7D 8FAE 7E7F
7E88 7E89 7E8C 7E92 7E90 7E93 7E94 7E96 7E8E 7E9B
7E9C 7F38 7F3A 7F45 7F4C 7F4D 7F4E 7F50 7F51 7F55
7F54 7F58 7F5F 7F60 7F68 7F69 7F67 7F78 7F82 7F86
7F83 7F88 7F87 7F8C 7F94 7F9E 7F9D 7F9A 7FA3 7FAF
7FB2 7FB9 7FAE 7FB6 7FB8 8B71 7FC5 7FC6 7FCA 7FD5
7FD4 7FE1 7FE6 7FE9 7FF3 7FF9 98DC 8006 8004 800B
8012 8018 8019 801C 8021 8028 803F 803B 804A 8046
8052 8058 805A 805F 8062 8068 8073 8072 8070 8076
8079 807D 807F 8084 8086 8085 809B 8093 809A 80AD
5190 80AC 80DB 80E5 80D9 80DD 80C4 80DA 80D6 8109
80EF 80F1 811B 8129 8123 812F 814B 968B 8146 813E
8153 8151 80FC 8171 816E 8165 8166 8174 8183 8188
818A 8180 8182 81A0 8195 81A4 81A3 815F 8193 81A9
81B0 81B5 81BE 81B8 81BD 81C0 81C2 81BA 81C9 81CD
81D1 81D9 81D8 81C8 81DA 81DF 81E0 81E7 81FA 81FB
81FE 8201 8202 8205 8207 820A 820D 8210 8216 8229
822B 8238 8233 8240 8259 8258 825D 825A 825F 8264
8262 8268 826A 826B 822E 8271 8277 8278 827E 828D
8292 82AB 829F 82BB 82AC 82E1 82E3 82DF 82D2 82F4
82F3 82FA 8393 8303 82FB 82F9 82DE 8306 82DC 8309
82D9 8335 8334 8316 8332 8331 8340 8339 8350 8345
832F 832B 8317 8318 8385 839A 83AA 839F 83A2 8396
8323 838E 8387 838A 837C 83B5 8373 8375 83A0 8389
83A8 83F4 8413 83EB 83CE 83FD 8403 83D8 840B 83C1
83F7 8407 83E0 83F2 840D 8422 8420 83BD 8438 8506
83FB 846D 842A 843C 855A 8484 8477 846B 84AD 846E
8482 8469 8446 842C 846F 8479 8435 84CA 8462 84B9
84BF 849F 84D9 84CD 84BB 84DA 84D0 84C1 84C6 84D6
84A1 8521 84FF 84F4 8517 8518 852C 851F 8515 8514
84FC 8540 8563 8558 8548 8541 8602 854B 8555 8580
85A4 8588 8591 858A 85A8 856D 8594 859B 85EA 8587
859C 8577 857E 8590 85C9 85BA 85CF 85B9 85D0 85D5
85DD 85E5 85DC 85F9 860A 8613 860B 85FE 85FA 8606
8622 861A 8630 863F 864D 4E55 8654 865F 8667 8671
8693 86A3 86A9 86AA 868B 868C 86B6 86AF 86C4 86C6
86B0 86C9 8823 86AB 86D4 86DE 86E9 86EC 86DF 86DB
86EF 8712 8706 8708 8700 8703 86FB 8711 8709 870D
86F9 870A 8734 873F 8737 873B 8725 8729 871A 8760
875F 8778 874C 874E 8774 8757 8768 876E 8759 8753
8763 876A 8805 87A2 879F 8782 87AF 87CB 87BD 87C0
87D0 96D6 87AB 87C4 87B3 87C7 87C6 87BB 87EF 87F2
87E0 880F 880D 87FE 87F6 87F7 880E 87D2 8811 8816
8815 8822 8821 8831 8836 8839 8827 883B 8844 8842
8852 8859 885E 8862 886B 8881 887E 889E 8875 887D
88B5 8872 8882 8897 8892 88AE 8899 88A2 888D 88A4
88B0 88BF 88B1 88C3 88C4 88D4 88D8 88D9 88DD 88F9
8902 88FC 88F4 88E8 88F2 8904 890C 890A 8913 8943
891E 8925 892A 892B 8941 8944 893B 8936 8938 894C
891D 8960 895E 8966 8964 896D 896A 896F 8974 8977
897E 8983 8988 898A 8993 8998 89A1 89A9 89A6 89AC
89AF 89B2 89BA 89BD 89BF 89C0 89DA 89DC 89DD 89E7
89F4 89F8 8A03 8A16 8A10 8A0C 8A1B 8A1D 8A25 8A36
8A41 8A5B 8A52 8A46 8A48 8A7C 8A6D 8A6C 8A62 8A85
8A82 8A84 8AA8 8AA1 8A91 8AA5 8AA6 8A9A 8AA3 8AC4
8ACD 8AC2 8ADA 8AEB 8AF3 8AE7 8AE4 8AF1 8B14 8AE0
8AE2 8AF7 8ADE 8ADB 8B0C 8B07 8B1A 8AE1 8B16 8B10
8B17 8B20 8B33 97AB 8B26 8B2B 8B3E 8B28 8B41 8B4C
8B4F 8B4E 8B49 8B56 8B5B 8B5A 8B6B 8B5F 8B6C 8B6F
8B74 8B7D 8B80 8B8C 8B8E 8B92 8B93 8B96 8B99 8B9A
8C3A 8C41 8C3F 8C48 8C4C 8C4E 8C50 8C55 8C62 8C6C
8C78 8C7A 8C82 8C89 8C85 8C8A 8C8D 8C8E 8C94 8C7C
8C98 621D 8CAD 8CAA 8CBD 8CB2 8CB3 8CAE 8CB6 8CC8
8CC1 8CE4 8CE3 8CDA 8CFD 8CFA 8CFB 8D04 8D05 8D0A
8D07 8D0F 8D0D 8D10 9F4E 8D13 8CCD 8D14 8D16 8D67
8D6D 8D71 8D73 8D81 8D99 8DC2 8DBE 8DBA 8DCF 8DDA
8DD6 8DCC 8DDB 8DCB 8DEA 8DEB 8DDF 8DE3 8DFC 8E08
8E09 8DFF 8E1D 8E1E 8E10 8E1F 8E42 8E35 8E30 8E34
8E4A 8E47 8E49 8E4C 8E50 8E48 8E59 8E64 8E60 8E2A
8E63 8E55 8E76 8E72 8E7C 8E81 8E87 8E85 8E84 8E8B
8E8A 8E93 8E91 8E94 8E99 8EAA 8EA1 8EAC 8EB0 8EC6
8EB1 8EBE 8EC5 8EC8 8ECB 8EDB 8EE3 8EFC 8EFB 8EEB
8EFE 8F0A 8F05 8F15 8F12 8F19 8F13 8F1C 8F1F 8F1B
8F0C 8F26 8F33 8F3B 8F39 8F45 8F42 8F3E 8F4C 8F49
8F46 8F4E 8F57 8F5C 8F62 8F63 8F64 8F9C 8F9F 8FA3
8FAD 8FAF 8FB7 8FDA 8FE5 8FE2 8FEA 8FEF 9087 8FF4
9005 8FF9 8FFA 9011 9015 9021 900D 901E 9016 900B
9027 9036 9035 9039 8FF8 904F 9050 9051 9052 900E
9049 903E 9056 9058 905E 9068 906F 9076 96A8 9072
9082 907D 9081 9080 908A 9089 908F 90A8 90AF 90B1
90B5 90E2 90E4 6248 90DB 9102 9112 9119 9132 9130
914A 9156 9158 9163 9165 9169 9173 9172 918B 9189
9182 91A2 91AB 91AF 91AA 91B5 91B4 91BA 91C0 91C1
91C9 91CB 91D0 91D6 91DF 91E1 91DB 91FC 91F5 91F6
921E 91FF 9214 922C 9215 9211 925E 9257 9245 9249
9264 9248 9295 923F 924B 9250 929C 9296 9293 929B
925A 92CF 92B9 92B7 92E9 930F 92FA 9344 932E 9319
9322 931A 9323 933A 9335 933B 935C 9360 937C 936E
9356 93B0 93AC 93AD 9394 93B9 93D6 93D7 93E8 93E5
93D8 93C3 93DD 93D0 93C8 93E4 941A 9414 9413 9403
9407 9410 9436 942B 9435 9421 943A 9441 9452 9444
945B 9460 9462 945E 946A 9229 9470 9475 9477 947D
945A 947C 947E 9481 947F 9582 9587 958A 9594 9596
9598 9599 95A0 95A8 95A7 95AD 95BC 95BB 95B9 95BE
95CA 6FF6 95C3 95CD 95CC 95D5 95D4 95D6 95DC 95E1
95E5 95E2 9621 9628 962E 962F 9642 964C 964F 964B
9677 965C 965E 965D 965F 9666 9672 966C 968D 9698
9695 9697 96AA 96A7 96B1 96B2 96B0 96B4 96B6 96B8
96B9 96CE 96CB 96C9 96CD 894D 96DC 970D 96D5 96F9
9704 9706 9708 9713 970E 9711 970F 9716 9719 9724
972A 9730 9739 973D 973E 9744 9746 9748 9742 9749
975C 9760 9764 9766 9768 52D2 976B 9771 9779 9785
977C 9781 977A 9786 978B 978F 9790 979C 97A8 97A6
97A3 97B3 97B4 97C3 97C6 97C8 97CB 97DC 97ED 9F4F
97F2 7ADF 97F6 97F5 980F 980C 9838 9824 9821 9837
983D 9846 984F 984B 986B 986F 9870 9871 9874 9873
98AA 98AF 98B1 98B6 98C4 98C3 98C6 98E9 98EB 9903
9909 9912 9914 9918 9921 991D 991E 9924 9920 992C
992E 993D 993E 9942 9949 9945 9950 994B 9951 9952
994C 9955 9997 9998 99A5 99AD 99AE 99BC 99DF 99DB
99DD 99D8 99D1 99ED 99EE 99F1 99F2 99FB 99F8 9A01
9A0F 9A05 99E2 9A19 9A2B 9A37 9A45 9A42 9A40 9A43
9A3E 9A55 9A4D 9A5B 9A57 9A5F 9A62 9A65 9A64 9A69
9A6B 9A6A 9AAD 9AB0 9ABC 9AC0 9ACF 9AD1 9AD3 9AD4
9ADE 9ADF 9AE2 9AE3 9AE6 9AEF 9AEB 9AEE 9AF4 9AF1
9AF7 9AFB 9B06 9B18 9B1A 9B1F 9B22 9B23 9B25 9B27
9B28 9B29 9B2A 9B2E 9B2F 9B32 9B44 9B43 9B4F 9B4D
9B4E 9B51 9B58 9B74 9B93 9B83 9B91 9B96 9B97 9B9F
9BA0 9BA8 9BB4 9BC0 9BCA 9BB9 9BC6 9BCF 9BD1 9BD2
9BE3 9BE2 9BE4 9BD4 9BE1 9C3A 9BF2 9BF1 9BF0 9C15
9C14 9C09 9C13 9C0C 9C06 9C08 9C12 9C0A 9C04 9C2E
9C1B 9C25 9C24 9C21 9C30 9C47 9C32 9C46 9C3E 9C5A
9C60 9C67 9C76 9C78 9CE7 9CEC 9CF0 9D09 9D08 9CEB
9D03 9D06 9D2A 9D26 9DAF 9D23 9D1F 9D44 9D15 9D12
9D41 9D3F 9D3E 9D46 9D48 9D5D 9D5E 9D64 9D51 9D50
9D59 9D72 9D89 9D87 9DAB 9D6F 9D7A 9D9A 9DA4 9DA9
9DB2 9DC4 9DC1 9DBB 9DB8 9DBA 9DC6 9DCF 9DC2 9DD9
9DD3 9DF8 9DE6 9DED 9DEF 9DFD 9E1A 9E1B 9E1E 9E75
9E79 9E7D 9E81 9E88 9E8B 9E8C 9E92 9E95 9E91 9E9D
9EA5 9EA9 9EB8 9EAA 9EAD 9761 9ECC 9ECE 9ECF 9ED0
9ED4 9EDC 9EDE 9EDD 9EE0 9EE5 9EE8 9EEF 9EF4 9EF6
9EF7 9EF9 9EFB 9EFC 9EFD 9F07 9F08 76B7 9F15 9F21
9F2C 9F3E 9F4A 9F52 9F54 9F63 9F5F 9F60 9F61 9F66
9F67 9F6C 9F6A 9F77 9F72 9F76 9F95 9F9C 9FA0 582F
69C7 9059 7464 51DC 7199
__END__

=head1 NAME

Unicode::Collate::CJK::JISX0208 - weighting JIS KANJI for Unicode::Collate

=head1 SYNOPSIS

    use Unicode::Collate;
    use Unicode::Collate::CJK::JISX0208;

    my $collator = Unicode::Collate->new(
        overrideCJK => \&Unicode::Collate::CJK::JISX0208::weightJISX0208
    );

=head1 DESCRIPTION

C<Unicode::Collate::CJK::JISX0208> provides C<weightJISX0208()>,
that is adequate for C<overrideCJK> of C<Unicode::Collate>
and makes tailoring of 6355 kanji (CJK Unified Ideographs)
in the JIS X 0208 order.

=head1 SEE ALSO

=over 4

=item L<Unicode::Collate>

=item L<Unicode::Collate::Locale>

=back

=cut
