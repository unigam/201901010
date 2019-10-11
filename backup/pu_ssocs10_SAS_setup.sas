
/********************************************************************************
 The purpose of this program is to read the Public Use ASCII (text)
 fixed format data file.
********************************************************************************/

/* The following line should contain the complete path and name of your raw data file */
FILENAME datafile 'c:\ssocs\PU_ssocs10_ASCII.txt' ;

/* The following line should contain the directory in which you wish your SAS file to be stored */
libname library 'c:\ssocs' ;

/* The following line contains the name (without the extension) for your SAS dataset */
%LET dataset = pu_ssocs10_SAS;

proc format;

value C0014F
-1='Legitimate Skip' 
 1='Principal'
 2='Vice Principal or Disciplinarian'
 3='Other';

value C0014_RF
-1 = 'Missing'
1 = 'Principal'
2 = 'Vice-principal or disciplinarian'
3 = 'Security staff'
4 = 'Other school-level staff'
5 = 'Superintendent or district staff';

value LOC12F
11 = 'City, Large'
12 = 'City, Midsize'
13 = 'City, Small'
21 = 'Suburb, Large'
22 = 'Suburb, Midsize'
23 = 'Suburb, Small'
31 = 'Town, Fringe'
32 = 'Town, Distant'
33 = 'Town, Remote'
41 = 'Rural, Fringe'
42 = 'Rural, Distant'
43 = 'Rural, Remote';


value $ C0016_RF
'-1'='Missing'
'00'='0'
'01'='1'
'02'='2'
'03'='3'
'04'='4'
'05'='5'
'06'='6'
'07'='7'
'08'='8'
'09'='9'
'10'='10'
'11'='11'
'12'='12'
'13'='13'
'14'='14'
'15'='15'
'16'='16'
'17'='17'
'18'='18'
'19'='19'
'20'='20'
'21'='21'
'22'='22'
'23'='23'
'24'='24'
'25'='25'
'26'='26'
'27'='27'
'28'='28'
'29'='29'
'30'='30'
'31'='More than 30';

value CRIME
1='High level of crime'
2='Moderate level of crime'
3='Low level of crime'
4='Students come from areas with very different levels of crime' ;

value FLG
0='Value not imputed'
1="Missing value imputed to = 'zero'"
2="Missing value logically imputed to = 'yes'/'no'"
3="'No'/'yes' value logically imputed to = 'yes'/'no'"
4='Out of range value assumed to be count rather than percent - value used to impute a percent'
5='Missing value imputed using Best Match procedure (perfect match)'
6='Missing value imputed using Best Match procedure (relaxed criteria)'
7='Missing value imputed using data from the SASS Sample Frame'
8='Missing value imputed based on survey proportions'
9='Out of range value topcoded'
10='Zeros imputed based on % observed in the donor class'
11='Values found using average ratio from 5 donors'
12="When Q22 col1='1' and all other columns were missing, one column selected to have a '1' imputed"
13='Value imputed in order to maintain balance within Q22 row and between Q22 and Q23'
14='Values found by taking average ratio from an entire imputation class'
15='Original value was deleted and imputed based on an imputed value'
16='Modal value imputed'
17='Missing value was imputed based on an imputed value'
18='Values found by finding avg values within an entire imputation'
19='When col1=1 and all other columns were missing/zero one column selected to have a 1 imputed and remainder set to zero'
20='Values imputed from nonimputed column 1 values'
21='Values imputed from nonimputed column 2-5 values '
22='Values adjusted downward to maintain relationship between q22 and q23'
23='Values imputed from at least one imputed Q22 value'
24='Values imputed from all existing Q23 values'
25='Values modified by nonimputed Q33 value'
26='Values imputed from imputed q23b values'
27='Values imputed from existing q23b values'
28='Values imputed clerically'
30='Imputation specification new to SSOCS:2010'
;

value FR_CATMN
-8 = 'Not reported'
1 = 'More than 95 percent'
2 = 'More than 80 to 95 percent'
3 = 'More than 50 to 80 percent'
4 = '50 percent or less';

value $ FR_CHRT
'1' = 'Charter school'
'2' = 'Not charter school'
'-8' = "Not reported";


value FR_LVELF
1 = 'Primary'
2 = 'Middle'
3 = 'High school'
4 = 'Combined';

value FR_SIZEF
1 = '< 300'
2 = '300 - 499'
3 = '500 - 999'
4 = '1,000 + ';


value MONTHF
1='January'
2='February'
3='March'
4='April'
5='May'
6='June'
7='July'
8='August'
9='September'
10='October'
11='November'
12='December' ;

value MSSG
-1='Legitimate Skip';

value Q5F
1='0-25%'
2='26-50%'
3='51-75%'
4='76-100%'
5='School does not offer' ;

value Q13F
1='Limits in major way'
2='Limits in minor way'
3='Does not limit' ;

value Q20F
1='Happens daily'
2='Happens at least once a week'
3='Happens at least once a month'
4='Happens on occasion'
5='Never happens' ;

value Q24CATF
1 = '< 300'
2 = '300 - 499'
3 = '500 - 999'
4 = '1,000 + ';

value Q25ACATF
1 = '0 - 20 percent'
2 = '21 - 50 percent'
3 = 'More than 50 percent';

value Q25DCATF
1 = '0 - 47 percent'
2 = '48 - 52 percent'
3 = 'More than 52 percent';

value Q31F
1='Regular public school'
2='Charter school'
3='Part magnet program'
4='Magnet school'
5='Other specify' ;

value REGION
1 = 'Northeast'
2 = 'Midwest'
3 = 'South'
4 = 'West';


value SASMSG
.='Missing'
-8='Not reported' ;

value STRCATF
1 = 'Less than 12'
2 = '12 - 16'
3 = 'More than 16';

value urban
1='City'
2='Suburb'
3='Town'
4='Rural';

value  STRF
111=   'Primary, <300, City'
112=   'Primary, <300, Suburb'
113=   'Primary, <300, Town'
114=   'Primary, <300, Rural'
121=   'Primary, 300-499, City'
122=   'Primary, 300-499, Suburb'
123=   'Primary, 300-499, Town'
124=   'Primary, 300-499, Rural'
131=   'Primary, 500-999, City'
132=   'Primary, 500-999, Suburb'
133=   'Primary, 500-999, Town'
134=   'Primary, 500-999, Rural'
141=   'Primary, 1,000+, City'
142=   'Primary, 1,000+, Suburb'
143=   'Primary, 1,000+, Town'
144=   'Primary, 1,000+, Rural'
211=   'Middle, <300, City'
212=   'Middle, <300, Suburb'
213=   'Middle, <300, Town'
214=   'Middle, <300, Rural'
221=   'Middle, 300-499, City'
222=   'Middle, 300-499, Suburb'
223=   'Middle, 300-499, Town'
224=   'Middle, 300-499, Rural'
231=   'Middle, 500-999, City'
232=   'Middle, 500-999, Suburb'
233=   'Middle, 500-999, Town'
234=   'Middle, 500-999, Rural'
241=   'Middle, 1,000+, City'
242=   'Middle, 1,000+, Suburb'
243=   'Middle, 1,000+, Town'
244=   'Middle, 1,000+, Rural'
311=   'High School, <300, City'
312=   'High School, <300, Suburb'
313=   'High School, <300, Town'
314=   'High School, <300, Rural'
321=   'High School, 300-499, City'
322=   'High School, 300-499, Suburb'
323=   'High School, 300-499, Town'
324=   'High School, 300-499, Rural'
331=   'High School, 500-999, City'
332=   'High School, 500-999, Suburb'
333=   'High School, 500-999, Town'
334=   'High School, 500-999, Rural'
341=   'High School, 1,000+, City'
342=   'High School, 1,000+, Suburb'
343=   'High School, 1,000+, Town'
344=   'High School, 1,000+, Rural'
411=   'Combined, <300, City'
412=   'Combined, <300, Suburb'
413=   'Combined, <300, Town'
414=   'Combined, <300, Rural'
421=   'Combined, 300-499, City'
422=   'Combined, 300-499, Suburb'
423=   'Combined, 300-499, Town'
424=   'Combined, 300-499, Rural'
431=   'Combined, 500-999, City'
432=   'Combined, 500-999, Suburb'
433=   'Combined, 500-999, Town'
434=   'Combined, 500-999, Rural'
441=   'Combined, 1,000+, City'
442=   'Combined, 1,000+, Suburb'
443=   'Combined, 1,000+, Town'
444=   'Combined, 1,000+, Rural';

value $ STRMSG
' ' = 'Missing' ;

value yesno
 1='Yes'
 2='No'
-1='Legitimate Skip';


run ;

DATA library.&dataset ;
INFILE datafile LRECL=1924 truncover;
INPUT
SCHID   1-4
C0014_R  6-13
C0016_R $     15-16
C0110  18-20
C0112  22-24
C0114  26-28
C0116  30-32
C0120  34-36
C0122  38-40
C0124  42-44
C0126  46-48
C0128  50-52
C0130  54-56
C0132  58-60
C0134  62-64
C0136  66-68
C0138  70-72
C0140  74-76
C0141  78-80
C0142  82-84
C0143  86-88
C0144  90-92
C0146  94-96
C0148  98-100
C0150  102-104
C0151  106-108
C0153  110-112
C0154  114-116
C0156  118-120
C0158  122-124
C0160  126-128
C0162  130-132
C0164  134-136
C0166  138-140
C0168  142-144
C0169  146-148
C0170  150-152
C0171  154-156
C0172  158-160
C0173  162-164
C0174  166-168
C0176  170-172
C0178  174-176
C0180  178-180
C0181  182-184
C0182  186-188
C0184  190-192
C0186  194-196
C0190  198-200
C0192  202-204
C0194  206-208
C0196  210-212
C0198  214-216
C0200  218-220
C0202  222-224
C0204  226-228
C0206  230-232
C0208  234-236
C0210  238-240
C0212  242-244
C0214  246-248
C0216  250-252
C0218  254-256
C0220  258-260
C0222  262-264
C0224  266-268
C0226  270-272
C0228  274-276
C0246  278-280
C0248  282-284
C0250  286-288
C0252  290-292
C0254  294-296
C0256  298-300
C0258  302-304
C0260  306-308
C0262  310-312
C0264  314-316
C0266  318-320
C0268  322-324
C0269  326-328
C0270  330-332
C0272  334-336
C0274  338-340
C0276  342-344
C0277  346-348
C0280  350-352
C0282  354-356
C0284  358-360
C0286  362-364
C0288  366-368
C0290  370-372
C0292  374-376
C0294  378-380
C0296  382-384
C0298  386-388
C0300  390-392
C0302  394-396
C0304  398-400
C0306  402-404
C0308  406-408
C0374  410-412
C0376  414-416
C0378  418-420
C0379  422-424
C0380  426-428
C0382  430-432
C0384  434-436
C0386  438-440
C0388  442-444
C0389  446-448
C0390  450-452
C0391  454-456
C0392  458-460
C0393  462-464
C0394  466-468
C0396  470-472
C0398  474-476
C0400  478-480
C0402  482-484
C0404  486-488
C0406  490-492
C0408  494-496
C0410  498-500
C0412  502-504
C0414  506-508
C0416  510-512
C0418  514-516
C0420  518-520
C0422  522-524
C0424  526-528
C0426  530-532
C0428  534-536
C0430  538-540
C0432  542-544
C0434  546-548
C0436  550-552
C0438  554-556
C0440  558-560
C0442  562-564
C0444  566-568
C0446  570-572
C0448  574-576
C0450  578-580
C0452  582-584
C0454  586-588
C0456  590-592
C0518  594-596
C0520  598-601
C0526  603-605
C0528  607-609
C0532  611-613
C0534  615-617
C0536  619-621
C0538  623-625
C0560  627-629
C0562  631-633
C0568  635-637
C0570  639-642
C0572  644-647
C0578 $ 649-656
C0578_DD  658-660
C0578_MM  662-664
C0578_YY  666-669
CRISIS10  671-673
DISTOT10  675-678
INCID10  680-683
INCPOL10  685-688
OTHACT10  690-693
OUTSUS10  695-698
PROBWK10  700-702
REMOVL10  704-706
STRATA  708-711
STUOFF10  713-716
SVINC10  718-721
SVPOL10  723-725
TRANSF10  727-730
VIOINC10  732-735
VIOPOL10  737-740
DISFIRE10  742-749
DISDRUG10 751-758
DISWEAP10 760-767
GANGHATE  769-776
DISRUPT  778-785
DISATT10  787-794
DISALC10  796-803
SEC_FT10  805-812
SEC_PT10  814-821
FR_LVEL  823-825
FR_SIZE  827-829
FR_URBAN  831-833
PERCWHT  835-837
FINALWGT  839-846
REPWGT1  848-855
REPWGT2  857-864
REPWGT3  866-873
REPWGT4  875-882
REPWGT5  884-891
REPWGT6  893-900
REPWGT7  902-909
REPWGT8  911-918
REPWGT9  920-927
REPWGT10  929-936
REPWGT11  938-945
REPWGT12  947-954
REPWGT13  956-963
REPWGT14  965-972
REPWGT15  974-981
REPWGT16  983-990
REPWGT17  992-999
REPWGT18  1001-1008
REPWGT19  1010-1017
REPWGT20  1019-1026
REPWGT21  1028-1035
REPWGT22  1037-1044
REPWGT23  1046-1053
REPWGT24  1055-1062
REPWGT25  1064-1071
REPWGT26  1073-1080
REPWGT27  1082-1089
REPWGT28  1091-1098
REPWGT29  1100-1107
REPWGT30  1109-1116
REPWGT31  1118-1125
REPWGT32  1127-1134
REPWGT33  1136-1143
REPWGT34  1145-1152
REPWGT35  1154-1161
REPWGT36  1163-1170
REPWGT37  1172-1179
REPWGT38  1181-1188
REPWGT39  1190-1197
REPWGT40  1199-1206
REPWGT41  1208-1215
REPWGT42  1217-1224
REPWGT43  1226-1233
REPWGT44  1235-1242
REPWGT45  1244-1251
REPWGT46  1253-1260
REPWGT47  1262-1269
REPWGT48  1271-1278
REPWGT49  1280-1287
REPWGT50  1289-1296
IC0110  1298-1300
IC0112  1302-1304
IC0114  1306-1308
IC0116  1310-1312
IC0120  1314-1316
IC0122  1318-1320
IC0124  1322-1324
IC0126  1326-1328
IC0128  1330-1332
IC0130  1334-1336
IC0132  1338-1340
IC0134  1342-1344
IC0136  1346-1348
IC0138  1350-1352
IC0140  1354-1356
IC0141  1358-1360
IC0142  1362-1364
IC0143  1366-1368
IC0144  1370-1372
IC0146  1374-1376
IC0148  1378-1380
IC0150  1382-1384
IC0151  1386-1388
IC0153  1390-1392
IC0154  1394-1396
IC0156  1398-1400
IC0158  1402-1404
IC0160  1406-1408
IC0162  1410-1412
IC0164  1414-1416
IC0166  1418-1420
IC0168  1422-1424
IC0169  1426-1428
IC0170  1430-1432
IC0171  1434-1436
IC0172  1438-1440
IC0173  1442-1444
IC0174  1446-1448
IC0176  1450-1452
IC0178  1454-1456
IC0180  1458-1460
IC0181  1462-1464
IC0182  1466-1468
IC0184  1470-1472
IC0186  1474-1476
IC0190  1478-1480
IC0192  1482-1484
IC0194  1486-1488
IC0196  1490-1492
IC0198  1494-1496
IC0200  1498-1500
IC0202  1502-1504
IC0204  1506-1508
IC0206  1510-1512
IC0208  1514-1516
IC0210  1518-1520
IC0212  1522-1524
IC0214  1526-1528
IC0216  1530-1532
IC0218  1534-1536
IC0220  1538-1540
IC0222  1542-1544
IC0224  1546-1548
IC0226  1550-1552
IC0228  1554-1556
IC0246  1558-1560
IC0248  1562-1564
IC0250  1566-1568
IC0252  1570-1572
IC0254  1574-1576
IC0256  1578-1580
IC0258  1582-1584
IC0260  1586-1588
IC0262  1590-1592
IC0264  1594-1596
IC0266  1598-1600
IC0268  1602-1604
IC0269  1606-1608
IC0270  1610-1612
IC0272  1614-1616
IC0274  1618-1620
IC0276  1622-1624
IC0277  1626-1628
IC0280  1630-1632
IC0282  1634-1636
IC0284  1638-1640
IC0286  1642-1644
IC0288  1646-1648
IC0290  1650-1652
IC0292  1654-1656
IC0294  1658-1660
IC0296  1662-1664
IC0298  1666-1668
IC0300  1670-1672
IC0302  1674-1676
IC0304  1678-1680
IC0306  1682-1684
IC0308  1686-1688
IC0374  1690-1692
IC0376  1694-1696
IC0378  1698-1700
IC0379  1702-1704
IC0380  1706-1708
IC0382  1710-1712
IC0384  1714-1716
IC0386  1718-1720
IC0388  1722-1724
IC0389  1726-1728
IC0390  1730-1732
IC0391  1734-1736
IC0392  1738-1740
IC0393  1742-1744
IC0394  1746-1748
IC0396  1750-1752
IC0398  1754-1756
IC0400  1758-1760
IC0402  1762-1764
IC0404  1766-1768
IC0406  1770-1772
IC0408  1774-1776
IC0410  1778-1780
IC0412  1782-1784
IC0414  1786-1788
IC0416  1790-1792
IC0418  1794-1796
IC0420  1798-1800
IC0422  1802-1804
IC0424  1806-1808
IC0426  1810-1812
IC0428  1814-1816
IC0430  1818-1820
IC0432  1822-1824
IC0434  1826-1828
IC0436  1830-1832
IC0438  1834-1836
IC0440  1838-1840
IC0442  1842-1844
IC0444  1846-1848
IC0446  1850-1852
IC0448  1854-1856
IC0450  1858-1860
IC0452  1862-1864
IC0454  1866-1868
IC0456  1870-1872
IC0518  1874-1876
IC0520  1878-1880
IC0526  1882-1884
IC0528  1886-1888
IC0532  1890-1892
IC0534  1894-1896
IC0536  1898-1900
IC0538  1902-1904
IC0560  1906-1908
IC0562  1910-1912
IC0568  1914-1916
IC0570  1918-1920
IC0572  1922-1924
 ;                       

LABEL
SCHID = "Unique school identifier"
C0014_R = "Title/position of respondent (recoded)"
C0016_R = "# of years respondent at the school (topcoded)"
C0110 = "School practice require visitor check in"
C0112 = "Access controlled locked/monitored doors"
C0114 = "Grounds have locked/monitored gates"
C0116 = "Students pass through metal detectors"
C0120 = "Have random metal detector checks on students"
C0122 = "Practice to close campus for lunch"
C0124 = "Practice random dog sniffs for drugs"
C0126 = "Random sweeps for contraband not including dog sniffs"
C0128 = "Require drug testing for athletes"
C0130 = "Require drug testing for students in extra-curricular activities"
C0132 = "Require drug testing for any students"
C0134 = "Require students to wear uniforms"
C0136 = "Practice to enforce a strict dress code"
C0138 = "Provide school lockers to students"
C0140 = "Require clear book bags or ban book bags"
C0141 = "Provide an electronic notification system that automatically notifies parents in case of a school-wide emergency"
C0142 = "Require students to wear badge or photo ID"
C0143 = "Provide a structured anonymous threat reporting system"
C0144 = "Require faculty/staff to wear badge or photo ID"
C0146 = "Security camera(s) monitor the school"
C0148 = "Provide telephones in most classrooms"
C0150 = "Provide two-way radios to any staff"
C0151 = "Limit access to social networking sites"
C0153 = "Prohibit use of cell phones and text messaging devices"
C0154 = "School has written plan for shootings"
C0156 = "Drilled students on plan for shootings"
C0158 = "Written plan for natural disasters"
C0160 = "Drilled students on plan for natural disasters"
C0162 = "Written crisis plan for hostages"
C0164 = "Drilled students on plan for hostages"
C0166 = "Written plan for bomb threats"
C0168 = "Drilled students on plan for bomb threats"
C0169 = "Written plan for suicide threat or incident"
C0170 = "Written plan for chemical, biological, or radiological threats"
C0171 = "Written plan for the U.S. national threat level is changed to Red"
C0172 = "Drilled students on plan for chemical, biological, or radiological threats"
C0173 = "Written plan for pandemic flu"
C0174 = "Prevention curriculum/instruction/training"
C0176 = "Behavioral modification for students"
C0178 = "Student counseling/social work"
C0180 = "Individual mentoring/tutoring by students"
C0181 = "Individual mentoring/tutoring by adults"
C0182 = "Recreation/enrichment student activities"
C0184 = "Student involvement resolving problems"
C0186 = "Promote sense of community/integration"
C0190 = "Formal process to obtain parental input"
C0192 = "Provide training/assistance to parents"
C0194 = "Program involves parents at school"
C0196 = "Parent participates in open house or back to school night"
C0198 = "Parent participates in parent-teacher conference"
C0200 = "Parent participates in subject-area events"
C0202 = "Parent volunteers at school"
C0204 = "Community involvement-parent groups"
C0206 = "Community involvement-social services"
C0208 = "Community involvement-juvenile justice"
C0210 = "Community involvement-law enforcement"
C0212 = "Community involvement-mental health"
C0214 = "Community involvement-civic organizations"
C0216 = "Community involvement-business"
C0218 = "Community involvement-religious organizations"
C0220 = "Security guard, security personnel, or sworn law enforcement officer"
C0222 = "Security used during school hours"
C0224 = "Security while students arrive/leave"
C0226 = "Security at selected school activities"
C0228 = "Security when school not occurring"
C0246 = "Guards carry a stun gun"
C0248 = "Guards carry chemical aerosol sprays"
C0250 = "Guards armed with firearms"
C0252 = "Security enforcement and patrol"
C0254 = "Maintain school discipline"
C0256 = "Coordinated with local police"
C0258 = "Identify problems and seek solutions"
C0260 = "Train teachers in school safety"
C0262 = "Mentor students"
C0264 = "Teach or train students (e.g., drug-related education)"
C0266 = "Teacher training-classroom management"
C0268 = "Teacher training-discipline policies"
C0269 = "Teacher training-alcohol or drug discipline policy"
C0270 = "Teacher training-safety procedures"
C0272 = "Teacher training-early warning signs for violent behavior"
C0274 = "Teacher training-student alcohol/drug abuse"
C0276 = "Teacher training-positive behavioral intervention"
C0277 = "Teacher training-crisis prevention and intervention"
C0280 = "Efforts limited by inadequate/lack of teacher training"
C0282 = "Efforts limited by inadequate/lack of alternative placement"
C0284 = "Efforts limited by parental complaints"
C0286 = "Efforts limited by inadequate/lack of teacher support"
C0288 = "Efforts limited by inadequate/lack of parent support"
C0290 = "Efforts limited by fear of student retaliation"
C0292 = "Efforts limited by fear of litigation"
C0294 = "Efforts limited by inadequate funds"
C0296 = "Efforts limited by inconsistent application of policies"
C0298 = "Efforts limited by fear of district or state reprisal"
C0300 = "Efforts limited by fed policies/special ed"
C0302 = "Efforts limited by other federal policies-not special ed"
C0304 = "Efforts limited by other state/district policies-not special ed"
C0306 = "Any school deaths from homicides"
C0308 = "School shooting incidents"
C0374 = "How often student racial/ethnic tensions"
C0376 = "How often student bullying occurs"
C0378 = "How often student sexual harassment of students"
C0379 = "How often student harassment based on sexual orientation"
C0380 = "How often student verbal abuse of teachers"
C0382 = "How often widespread disorder in classrooms"
C0384 = "How often student acts of disrespect for teachers-not verbal abuse"
C0386 = "How often student gang activities"
C0388 = "How often student cult or extremist activites"
C0389 = "How often cyberbullying among students"
C0390 = "Removal with no services available"
C0391 = "How often school environment affected by cyberbullying"
C0392 = "Removal with no services available-action used"
C0393 = "How often staff resources used to deal with cyberbullying"
C0394 = "Removal with tutoring/at-home instruction available"
C0396 = "Removal with tutoring/at-home instruction available-action used"
C0398 = "Transfer to specialized school available"
C0400 = "Transfer to specialized school available-action used"
C0402 = "Transfer to regular school available"
C0404 = "Transfer to regular school available-action used"
C0406 = "Outside suspension/no services available"
C0408 = "Outside suspension/no services available-action used"
C0410 = "Outside suspension with services available"
C0412 = "Outside suspension with services available-action used"
C0414 = "In-school suspension/no services available"
C0416 = "In-school suspension/no services available-action used"
C0418 = "In-school suspension with services available"
C0420 = "In-school suspension with services available-action used"
C0422 = "Referral to school counselor available"
C0424 = "Referral to school counselor available-action used"
C0426 = "In-school disciplinary plan available"
C0428 = "In-school disciplinary plan available - action used"
C0430 = "Outside school disciplinary plan available"
C0432 = "Outside school disciplinary plan available - action used"
C0434 = "Loss of bus privileges for misbehavior available"
C0436 = "Loss of bus privileges for misbehavior available-action used"
C0438 = "Corporal punishment available"
C0440 = "Corporal punishment available-action used"
C0442 = "School probation available"
C0444 = "School probation available-action used"
C0446 = "Detention/Saturday school available"
C0448 = "Detention/Saturday school available-action used"
C0450 = "Loss of student privileges available"
C0452 = "Loss of student privileges available-action used"
C0454 = "Require community service available"
C0456 = "Require community service available-action used"
C0518 = "# of removals with no service-total"
C0520 = "# of transfers to specialized schools-total"
C0526 = "Percent students limited English proficient"
C0528 = "Percent special education students"
C0532 = "Percent students below 15th percentile standardized tests"
C0534 = "Percent students likely to go to college"
C0536 = "Percent students academic achievement important"
C0538 = "Typical number of classroom changes"
C0560 = "Crime where students live"
C0562 = "Crime where school located"
C0568 = "Average percent daily attendance"
C0570 = "# of students transferred to school"
C0572 = "# of students transferred from school"
C0578 = "Date questionnaire completed MMDDYYYY"
C0578_DD = "Day questionnaire completed"
C0578_MM = "Month questionnaire completed"
C0578_YY = "Year questionnaire completed"
CRISIS10 = "# of types of crises covered in written plans"
DISTOT10 = "Total number of disciplinary actions recorded"
INCID10 = "Total number of incidents recorded"
INCPOL10 = "Total number of incidents reported to police"
OTHACT10 = "Total 'other actions' for specified offenses"
OUTSUS10 = "Total OSS > 5 days but < the remainder of school for specified offenses"
PROBWK10 = "# of types of problems that occur at least once a week"
REMOVL10 = "Total removals with no continuing school services for specified offenses"
STRATA = "Collapsed STRATUM code"
STUOFF10 = "Total students involved in specified offenses"
SVINC10 = "Total number of serious violent incidents recorded"
SVPOL10 = "Total number of serious violent incidents reported to police"
TRANSF10 = "Total transfers to specialized schools for specified offenses"
VIOINC10 = "Total number of violent incidents recorded"
VIOPOL10 = "Total number of violent incidents reported to police"
DISFIRE10 = "Total number of disciplinary actions recorded for use or possession of a firearm or explosive device"
DISDRUG10 = "Total number of disciplinary actions recorded for distribution, possession, or use of illegal drugs"
DISWEAP10 = "Total number of disciplinary actions recorded for use or possession of a weapon other than a firearm or explosive device"
GANGHATE = "Total number of gang-related and hate crimes"
DISRUPT = "Total number of disruptions"
DISATT10 = "Total number of disciplinary actions recorded for physical attacks or fights"
DISALC10 = "Total number of disciplinary actions recorded for distribution, possession, or use of alcohol"
SEC_FT10 = "Total number of full-time security guards, SROs, or sworn law enforcement officers"
SEC_PT10 = "Total number of part-time security guards, SROs, or sworn law enforcement officers"
FR_LVEL = "School grades offered - based on 07-08 CCD frame variables (School)"
FR_SIZE = "School size categories - based on 07-08 CCD frame variables (School)"
FR_URBAN = "Urbanicity - Based on Urban-centric location of school"
PERCWHT = "Percent White enrollment (categorical)"
FINALWGT = "Final weight for the sample"
REPWGT1 = "Jackknife replicate 1"
REPWGT2 = "Jackknife replicate 2"
REPWGT3 = "Jackknife replicate 3"
REPWGT4 = "Jackknife replicate 4"
REPWGT5 = "Jackknife replicate 5"
REPWGT6 = "Jackknife replicate 6"
REPWGT7 = "Jackknife replicate 7"
REPWGT8 = "Jackknife replicate 8"
REPWGT9 = "Jackknife replicate 9"
REPWGT10 = "Jackknife replicate 10"
REPWGT11 = "Jackknife replicate 11"
REPWGT12 = "Jackknife replicate 12"
REPWGT13 = "Jackknife replicate 13"
REPWGT14 = "Jackknife replicate 14"
REPWGT15 = "Jackknife replicate 15"
REPWGT16 = "Jackknife replicate 16"
REPWGT17 = "Jackknife replicate 17"
REPWGT18 = "Jackknife replicate 18"
REPWGT19 = "Jackknife replicate 19"
REPWGT20 = "Jackknife replicate 20"
REPWGT21 = "Jackknife replicate 21"
REPWGT22 = "Jackknife replicate 22"
REPWGT23 = "Jackknife replicate 23"
REPWGT24 = "Jackknife replicate 24"
REPWGT25 = "Jackknife replicate 25"
REPWGT26 = "Jackknife replicate 26"
REPWGT27 = "Jackknife replicate 27"
REPWGT28 = "Jackknife replicate 28"
REPWGT29 = "Jackknife replicate 29"
REPWGT30 = "Jackknife replicate 30"
REPWGT31 = "Jackknife replicate 31"
REPWGT32 = "Jackknife replicate 32"
REPWGT33 = "Jackknife replicate 33"
REPWGT34 = "Jackknife replicate 34"
REPWGT35 = "Jackknife replicate 35"
REPWGT36 = "Jackknife replicate 36"
REPWGT37 = "Jackknife replicate 37"
REPWGT38 = "Jackknife replicate 38"
REPWGT39 = "Jackknife replicate 39"
REPWGT40 = "Jackknife replicate 40"
REPWGT41 = "Jackknife replicate 41"
REPWGT42 = "Jackknife replicate 42"
REPWGT43 = "Jackknife replicate 43"
REPWGT44 = "Jackknife replicate 44"
REPWGT45 = "Jackknife replicate 45"
REPWGT46 = "Jackknife replicate 46"
REPWGT47 = "Jackknife replicate 47"
REPWGT48 = "Jackknife replicate 48"
REPWGT49 = "Jackknife replicate 49"
REPWGT50 = "Jackknife replicate 50"
IC0110 = "Imputation Flag"
IC0112 = "Imputation Flag"
IC0114 = "Imputation Flag"
IC0116 = "Imputation Flag"
IC0120 = "Imputation Flag"
IC0122 = "Imputation Flag"
IC0124 = "Imputation Flag"
IC0126 = "Imputation Flag"
IC0128 = "Imputation Flag"
IC0130 = "Imputation Flag"
IC0132 = "Imputation Flag"
IC0134 = "Imputation Flag"
IC0136 = "Imputation Flag"
IC0138 = "Imputation Flag"
IC0140 = "Imputation Flag"
IC0141 = "Imputation Flag"
IC0142 = "Imputation Flag"
IC0143 = "Imputation Flag"
IC0144 = "Imputation Flag"
IC0146 = "Imputation Flag"
IC0148 = "Imputation Flag"
IC0150 = "Imputation Flag"
IC0151 = "Imputation Flag"
IC0153 = "Imputation Flag"
IC0154 = "Imputation Flag"
IC0156 = "Imputation Flag"
IC0158 = "Imputation Flag"
IC0160 = "Imputation Flag"
IC0162 = "Imputation Flag"
IC0164 = "Imputation Flag"
IC0166 = "Imputation Flag"
IC0168 = "Imputation Flag"
IC0169 = "Imputation Flag"
IC0170 = "Imputation Flag"
IC0171 = "Imputation Flag"
IC0172 = "Imputation Flag"
IC0173 = "Imputation Flag"
IC0174 = "Imputation Flag"
IC0176 = "Imputation Flag"
IC0178 = "Imputation Flag"
IC0180 = "Imputation Flag"
IC0181 = "Imputation Flag"
IC0182 = "Imputation Flag"
IC0184 = "Imputation Flag"
IC0186 = "Imputation Flag"
IC0190 = "Imputation Flag"
IC0192 = "Imputation Flag"
IC0194 = "Imputation Flag"
IC0196 = "Imputation Flag"
IC0198 = "Imputation Flag"
IC0200 = "Imputation Flag"
IC0202 = "Imputation Flag"
IC0204 = "Imputation Flag"
IC0206 = "Imputation Flag"
IC0208 = "Imputation Flag"
IC0210 = "Imputation Flag"
IC0212 = "Imputation Flag"
IC0214 = "Imputation Flag"
IC0216 = "Imputation Flag"
IC0218 = "Imputation Flag"
IC0220 = "Imputation Flag"
IC0222 = "Imputation Flag"
IC0224 = "Imputation Flag"
IC0226 = "Imputation Flag"
IC0228 = "Imputation Flag"
IC0246 = "Imputation Flag"
IC0248 = "Imputation Flag"
IC0250 = "Imputation Flag"
IC0252 = "Imputation Flag"
IC0254 = "Imputation Flag"
IC0256 = "Imputation Flag"
IC0258 = "Imputation Flag"
IC0260 = "Imputation Flag"
IC0262 = "Imputation Flag"
IC0264 = "Imputation Flag"
IC0266 = "Imputation Flag"
IC0268 = "Imputation Flag"
IC0269 = "Imputation Flag"
IC0270 = "Imputation Flag"
IC0272 = "Imputation Flag"
IC0274 = "Imputation Flag"
IC0276 = "Imputation Flag"
IC0277 = "Imputation Flag"
IC0280 = "Imputation Flag"
IC0282 = "Imputation Flag"
IC0284 = "Imputation Flag"
IC0286 = "Imputation Flag"
IC0288 = "Imputation Flag"
IC0290 = "Imputation Flag"
IC0292 = "Imputation Flag"
IC0294 = "Imputation Flag"
IC0296 = "Imputation Flag"
IC0298 = "Imputation Flag"
IC0300 = "Imputation Flag"
IC0302 = "Imputation Flag"
IC0304 = "Imputation Flag"
IC0306 = "Imputation Flag"
IC0308 = "Imputation Flag"
IC0374 = "Imputation Flag"
IC0376 = "Imputation Flag"
IC0378 = "Imputation Flag"
IC0379 = "Imputation Flag"
IC0380 = "Imputation Flag"
IC0382 = "Imputation Flag"
IC0384 = "Imputation Flag"
IC0386 = "Imputation Flag"
IC0388 = "Imputation Flag"
IC0389 = "Imputation Flag"
IC0390 = "Imputation Flag"
IC0391 = "Imputation Flag"
IC0392 = "Imputation Flag"
IC0393 = "Imputation Flag"
IC0394 = "Imputation Flag"
IC0396 = "Imputation Flag"
IC0398 = "Imputation Flag"
IC0400 = "Imputation Flag"
IC0402 = "Imputation Flag"
IC0404 = "Imputation Flag"
IC0406 = "Imputation Flag"
IC0408 = "Imputation Flag"
IC0410 = "Imputation Flag"
IC0412 = "Imputation Flag"
IC0414 = "Imputation Flag"
IC0416 = "Imputation Flag"
IC0418 = "Imputation Flag"
IC0420 = "Imputation Flag"
IC0422 = "Imputation Flag"
IC0424 = "Imputation Flag"
IC0426 = "Imputation Flag"
IC0428 = "Imputation Flag"
IC0430 = "Imputation Flag"
IC0432 = "Imputation Flag"
IC0434 = "Imputation Flag"
IC0436 = "Imputation Flag"
IC0438 = "Imputation Flag"
IC0440 = "Imputation Flag"
IC0442 = "Imputation Flag"
IC0444 = "Imputation Flag"
IC0446 = "Imputation Flag"
IC0448 = "Imputation Flag"
IC0450 = "Imputation Flag"
IC0452 = "Imputation Flag"
IC0454 = "Imputation Flag"
IC0456 = "Imputation Flag"
IC0518 = "Imputation Flag"
IC0520 = "Imputation Flag"
IC0526 = "Imputation Flag"
IC0528 = "Imputation Flag"
IC0532 = "Imputation Flag"
IC0534 = "Imputation Flag"
IC0536 = "Imputation Flag"
IC0538 = "Imputation Flag"
IC0560 = "Imputation Flag"
IC0562 = "Imputation Flag"
IC0568 = "Imputation Flag"
IC0570 = "Imputation Flag"
IC0572 = "Imputation Flag"
;
LENGTH
SCHID      4    
C0014_R    8    
C0110      3    
C0112      3    
C0114      3    
C0116      3    
C0120      3    
C0122      3    
C0124      3    
C0126      3    
C0128      3    
C0130      3    
C0132      3    
C0134      3    
C0136      3    
C0138      3    
C0140      3    
C0141      3    
C0142      3    
C0143      3    
C0144      3    
C0146      3    
C0148      3    
C0150      3    
C0151      3    
C0153      3    
C0154      3    
C0156      3    
C0158      3    
C0160      3    
C0162      3    
C0164      3    
C0166      3    
C0168      3    
C0169      3    
C0170      3    
C0171      3    
C0172      3    
C0173      3    
C0174      3    
C0176      3    
C0178      3    
C0180      3    
C0181      3    
C0182      3    
C0184      3    
C0186      3    
C0190      3    
C0192      3    
C0194      3    
C0196      3    
C0198      3    
C0200      3    
C0202      3    
C0204      3    
C0206      3    
C0208      3    
C0210      3    
C0212      3    
C0214      3    
C0216      3    
C0218      3    
C0220      3    
C0222      3    
C0224      3    
C0226      3    
C0228      3    
C0246      3    
C0248      3    
C0250      3    
C0252      3    
C0254      3    
C0256      3    
C0258      3    
C0260      3    
C0262      3    
C0264      3    
C0266      3    
C0268      3    
C0269      3    
C0270      3    
C0272      3    
C0274      3    
C0276      3    
C0277      3    
C0280      3    
C0282      3    
C0284      3    
C0286      3    
C0288      3    
C0290      3    
C0292      3    
C0294      3    
C0296      3    
C0298      3    
C0300      3    
C0302      3    
C0304      3    
C0306      3    
C0308      3    
C0374      3    
C0376      3    
C0378      3    
C0379      3    
C0380      3    
C0382      3    
C0384      3    
C0386      3    
C0388      3    
C0389      3    
C0390      3    
C0391      3    
C0392      3    
C0393      3    
C0394      3    
C0396      3    
C0398      3    
C0400      3    
C0402      3    
C0404      3    
C0406      3    
C0408      3    
C0410      3    
C0412      3    
C0414      3    
C0416      3    
C0418      3    
C0420      3    
C0422      3    
C0424      3    
C0426      3    
C0428      3    
C0430      3    
C0432      3    
C0434      3    
C0436      3    
C0438      3    
C0440      3    
C0442      3    
C0444      3    
C0446      3    
C0448      3    
C0450      3    
C0452      3    
C0454      3    
C0456      3    
C0518      3    
C0520      4    
C0526      3    
C0528      3    
C0532      3    
C0534      3    
C0536      3    
C0538      3    
C0560      3    
C0562      3    
C0568      3    
C0570      4    
C0572      4    
C0578_DD   3    
C0578_MM   3    
C0578_YY   4    
CRISIS10   3    
DISTOT10   4    
INCID10    4    
INCPOL10   4    
OTHACT10   4    
OUTSUS10   4    
PROBWK10   3    
REMOVL10   3    
STRATA     4    
STUOFF10   4    
SVINC10    4    
SVPOL10    3    
TRANSF10   4    
VIOINC10   4    
VIOPOL10   4    
DISFIRE10  8    
DISDRUG10  8    
DISWEAP10  8    
GANGHATE   8    
DISRUPT    8    
DISATT10   8    
DISALC10   8    
SEC_FT10   8    
SEC_PT10   8    
FR_LVEL    3    
FR_SIZE    3    
FR_URBAN   3    
PERCWHT    3    
FINALWGT   8    
REPWGT1    8    
REPWGT2    8    
REPWGT3    8    
REPWGT4    8    
REPWGT5    8    
REPWGT6    8    
REPWGT7    8    
REPWGT8    8    
REPWGT9    8    
REPWGT10   8    
REPWGT11   8    
REPWGT12   8    
REPWGT13   8    
REPWGT14   8    
REPWGT15   8    
REPWGT16   8    
REPWGT17   8    
REPWGT18   8    
REPWGT19   8    
REPWGT20   8    
REPWGT21   8    
REPWGT22   8    
REPWGT23   8    
REPWGT24   8    
REPWGT25   8    
REPWGT26   8    
REPWGT27   8    
REPWGT28   8    
REPWGT29   8    
REPWGT30   8    
REPWGT31   8    
REPWGT32   8    
REPWGT33   8    
REPWGT34   8    
REPWGT35   8    
REPWGT36   8    
REPWGT37   8    
REPWGT38   8    
REPWGT39   8    
REPWGT40   8    
REPWGT41   8    
REPWGT42   8    
REPWGT43   8    
REPWGT44   8    
REPWGT45   8    
REPWGT46   8    
REPWGT47   8    
REPWGT48   8    
REPWGT49   8    
REPWGT50   8    
IC0110     3    
IC0112     3    
IC0114     3    
IC0116     3    
IC0120     3    
IC0122     3    
IC0124     3    
IC0126     3    
IC0128     3    
IC0130     3    
IC0132     3    
IC0134     3    
IC0136     3    
IC0138     3    
IC0140     3    
IC0141     3    
IC0142     3    
IC0143     3    
IC0144     3    
IC0146     3    
IC0148     3    
IC0150     3    
IC0151     3    
IC0153     3    
IC0154     3    
IC0156     3    
IC0158     3    
IC0160     3    
IC0162     3    
IC0164     3    
IC0166     3    
IC0168     3    
IC0169     3    
IC0170     3    
IC0171     3    
IC0172     3    
IC0173     3    
IC0174     3    
IC0176     3    
IC0178     3    
IC0180     3    
IC0181     3    
IC0182     3    
IC0184     3    
IC0186     3    
IC0190     3    
IC0192     3    
IC0194     3    
IC0196     3    
IC0198     3    
IC0200     3    
IC0202     3    
IC0204     3    
IC0206     3    
IC0208     3    
IC0210     3    
IC0212     3    
IC0214     3    
IC0216     3    
IC0218     3    
IC0220     3    
IC0222     3    
IC0224     3    
IC0226     3    
IC0228     3    
IC0246     3    
IC0248     3    
IC0250     3    
IC0252     3    
IC0254     3    
IC0256     3    
IC0258     3    
IC0260     3    
IC0262     3    
IC0264     3    
IC0266     3    
IC0268     3    
IC0269     3    
IC0270     3    
IC0272     3    
IC0274     3    
IC0276     3    
IC0277     3    
IC0280     3    
IC0282     3    
IC0284     3    
IC0286     3    
IC0288     3    
IC0290     3    
IC0292     3    
IC0294     3    
IC0296     3    
IC0298     3    
IC0300     3    
IC0302     3    
IC0304     3    
IC0306     3    
IC0308     3    
IC0374     3    
IC0376     3    
IC0378     3    
IC0379     3    
IC0380     3    
IC0382     3    
IC0384     3    
IC0386     3    
IC0388     3    
IC0389     3    
IC0390     3    
IC0391     3    
IC0392     3    
IC0393     3    
IC0394     3    
IC0396     3    
IC0398     3    
IC0400     3    
IC0402     3    
IC0404     3    
IC0406     3    
IC0408     3    
IC0410     3    
IC0412     3    
IC0414     3    
IC0416     3    
IC0418     3    
IC0420     3    
IC0422     3    
IC0424     3    
IC0426     3    
IC0428     3    
IC0430     3    
IC0432     3    
IC0434     3    
IC0438     3    
IC0440     3    
IC0442     3    
IC0444     3    
IC0446     3    
IC0448     3    
IC0450     3    
IC0452     3    
IC0454     3    
IC0456     3    
IC0518     3    
IC0520     3    
IC0526     3    
IC0528     3    
IC0532     3    
IC0534     3    
IC0536     3    
IC0538     3    
IC0560     3    
IC0562     3    
IC0568     3    
IC0570     3    
IC0572     3    ;
   
format
C0014_R      C0014_RF.    
C0016_R      $C0016_RF.   
C0110        YESNO.       
C0112        YESNO.       
C0114        YESNO.       
C0116        YESNO.       
C0120        YESNO.       
C0122        YESNO.       
C0124        YESNO.       
C0126        YESNO.       
C0128        YESNO.       
C0130        YESNO.       
C0132        YESNO.       
C0134        YESNO.       
C0136        YESNO.       
C0138        YESNO.       
C0140        YESNO.       
C0141        YESNO.       
C0142        YESNO.       
C0143        YESNO.       
C0144        YESNO.       
C0146        YESNO.       
C0148        YESNO.       
C0150        YESNO.       
C0151        YESNO.       
C0153        YESNO.       
C0154        YESNO.       
C0156        YESNO.       
C0158        YESNO.       
C0160        YESNO.       
C0162        YESNO.       
C0164        YESNO.       
C0166        YESNO.       
C0168        YESNO.       
C0169        YESNO.       
C0170        YESNO.       
C0171        YESNO.       
C0172        YESNO.       
C0173        YESNO.       
C0174        YESNO.       
C0176        YESNO.       
C0178        YESNO.       
C0180        YESNO.       
C0181        YESNO.       
C0182        YESNO.       
C0184        YESNO.       
C0186        YESNO.       
C0190        YESNO.       
C0192        YESNO.       
C0194        YESNO.       
C0196        Q5F.         
C0198        Q5F.         
C0200        Q5F.         
C0202        Q5F.         
C0204        YESNO.       
C0206        YESNO.       
C0208        YESNO.       
C0210        YESNO.       
C0212        YESNO.       
C0214        YESNO.       
C0216        YESNO.       
C0218        YESNO.       
C0220        YESNO.       
C0222        YESNO.       
C0224        YESNO.       
C0226        YESNO.       
C0228        YESNO.       
C0246        YESNO.       
C0248        YESNO.       
C0250        YESNO.       
C0252        YESNO.       
C0254        YESNO.       
C0256        YESNO.       
C0258        YESNO.       
C0260        YESNO.       
C0262        YESNO.       
C0264        YESNO.       
C0266        YESNO.       
C0268        YESNO.       
C0269        YESNO.       
C0270        YESNO.       
C0272        YESNO.       
C0274        YESNO.       
C0276        YESNO.       
C0277        YESNO.       
C0280        Q13F.        
C0282        Q13F.        
C0284        Q13F.        
C0286        Q13F.        
C0288        Q13F.        
C0290        Q13F.        
C0292        Q13F.        
C0294        Q13F.        
C0296        Q13F.        
C0298        Q13F.        
C0300        Q13F.        
C0302        Q13F.        
C0304        Q13F.        
C0306        YESNO.       
C0308        YESNO.       
C0374        Q20F.        
C0376        Q20F.        
C0378        Q20F.        
C0379        Q20F.        
C0380        Q20F.        
C0382        Q20F.        
C0384        Q20F.        
C0386        Q20F.        
C0388        Q20F.        
C0389        Q20F.        
C0390        YESNO.       
C0391        Q20F.        
C0392        YESNO.       
C0393        Q20F.        
C0394        YESNO.       
C0396        YESNO.       
C0398        YESNO.       
C0400        YESNO.       
C0402        YESNO.       
C0404        YESNO.       
C0406        YESNO.       
C0408        YESNO.       
C0410        YESNO.       
C0412        YESNO.       
C0414        YESNO.       
C0416        YESNO.       
C0418        YESNO.       
C0420        YESNO.       
C0422        YESNO.       
C0424        YESNO.       
C0426        YESNO.       
C0428        YESNO.       
C0430        YESNO.       
C0432        YESNO.       
C0434        YESNO.       
C0436        YESNO.       
C0438        YESNO.       
C0440        YESNO.       
C0442        YESNO.       
C0444        YESNO.       
C0446        YESNO.       
C0448        YESNO.       
C0450        YESNO.       
C0452        YESNO.       
C0454        YESNO.       
C0456        YESNO.       
C0560        CRIME.       
C0562        CRIME.       
C0578        $STRMSG.     
C0578_DD     SASMSG.      
C0578_MM     SASMSG.      
C0578_YY     SASMSG.      
STRATA       STRF.        
FR_LVEL      FR_LVELF.    
FR_SIZE      FR_SIZEF.    
FR_URBAN     URBAN.       
PERCWHT      FR_CATMN.    
IC0110       FLG.         
IC0112       FLG.         
IC0114       FLG.         
IC0116       FLG.         
IC0120       FLG.         
IC0122       FLG.         
IC0124       FLG.         
IC0126       FLG.         
IC0128       FLG.         
IC0130       FLG.         
IC0132       FLG.         
IC0134       FLG.         
IC0136       FLG.         
IC0138       FLG.         
IC0140       FLG.         
IC0141       FLG.         
IC0142       FLG.         
IC0143       FLG.         
IC0144       FLG.         
IC0146       FLG.         
IC0148       FLG.         
IC0150       FLG.         
IC0151       FLG.         
IC0153       FLG.         
IC0154       FLG.         
IC0156       FLG.         
IC0158       FLG.         
IC0160       FLG.         
IC0162       FLG.         
IC0164       FLG.         
IC0166       FLG.         
IC0168       FLG.         
IC0169       FLG.         
IC0170       FLG.         
IC0171       FLG.         
IC0172       FLG.         
IC0173       FLG.         
IC0174       FLG.         
IC0176       FLG.         
IC0178       FLG.         
IC0180       FLG.         
IC0181       FLG.         
IC0182       FLG.         
IC0184       FLG.         
IC0186       FLG.         
IC0190       FLG.         
IC0192       FLG.         
IC0194       FLG.         
IC0196       FLG.         
IC0198       FLG.         
IC0200       FLG.         
IC0202       FLG.         
IC0204       FLG.         
IC0206       FLG.         
IC0208       FLG.         
IC0210       FLG.         
IC0212       FLG.         
IC0214       FLG.         
IC0216       FLG.         
IC0218       FLG.         
IC0220       FLG.         
IC0222       FLG.         
IC0224       FLG.         
IC0226       FLG.         
IC0228       FLG.         
IC0246       FLG.         
IC0248       FLG.         
IC0250       FLG.         
IC0252       FLG.         
IC0254       FLG.         
IC0256       FLG.         
IC0258       FLG.         
IC0260       FLG.         
IC0262       FLG.         
IC0264       FLG.         
IC0266       FLG.         
IC0268       FLG.         
IC0269       FLG.         
IC0270       FLG.         
IC0272       FLG.         
IC0274       FLG.         
IC0276       FLG.         
IC0277       FLG.         
IC0280       FLG.         
IC0282       FLG.         
IC0284       FLG.         
IC0286       FLG.         
IC0288       FLG.         
IC0290       FLG.         
IC0292       FLG.         
IC0294       FLG.         
IC0296       FLG.         
IC0298       FLG.         
IC0300       FLG.         
IC0302       FLG.         
IC0304       FLG.         
IC0306       FLG.         
IC0308       FLG.         
IC0374       FLG.         
IC0376       FLG.         
IC0378       FLG.         
IC0379       FLG.         
IC0380       FLG.         
IC0382       FLG.         
IC0384       FLG.         
IC0386       FLG.         
IC0388       FLG.         
IC0389       FLG.         
IC0390       FLG.         
IC0391       FLG.         
IC0392       FLG.         
IC0393       FLG.         
IC0394       FLG.         
IC0396       FLG.         
IC0398       FLG.         
IC0400       FLG.         
IC0402       FLG.         
IC0404       FLG.         
IC0406       FLG.         
IC0408       FLG.         
IC0410       FLG.         
IC0412       FLG.         
IC0414       FLG.         
IC0416       FLG.         
IC0418       FLG.         
IC0420       FLG.         
IC0422       FLG.         
IC0424       FLG.         
IC0426       FLG.         
IC0428       FLG.         
IC0430       FLG.         
IC0432       FLG.         
IC0434       FLG.         
IC0438       FLG.         
IC0440       FLG.         
IC0442       FLG.         
IC0444       FLG.         
IC0446       FLG.         
IC0448       FLG.         
IC0450       FLG.         
IC0452       FLG.         
IC0454       FLG.         
IC0456       FLG.         
IC0518       FLG.         
IC0520       FLG.         
IC0526       FLG.         
IC0528       FLG.         
IC0532       FLG.         
IC0534       FLG.         
IC0536       FLG.         
IC0538       FLG.         
IC0560       FLG.         
IC0562       FLG.         
IC0568       FLG.         
IC0570       FLG.         
IC0572       FLG.         
;
     
 
RUN ;
