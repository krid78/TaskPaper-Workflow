FasdUAS 1.101.10   ��   ��    k             l      ��  ��    q k
	create reminder
	usage:
		CreateReminder <title> <text> <list> <xxxx-xx-xx [xx:xx]> <xxxx-xx-xx [xx:xx]>
     � 	 	 � 
 	 c r e a t e   r e m i n d e r 
 	 u s a g e : 
 	 	 C r e a t e R e m i n d e r   < t i t l e >   < t e x t >   < l i s t >   < x x x x - x x - x x   [ x x : x x ] >   < x x x x - x x - x x   [ x x : x x ] > 
   
  
 i         I     �� ��
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    k     �       l     ��������  ��  ��        Z     �      =        l     ����  I    �� ��
�� .corecnte****       ****  o     ���� 0 argv  ��  ��  ��    m    ����   k   
 ;       r   
      I   
 �� !���� 0 	trim_line   !  " # " n     $ % $ 4    �� &
�� 
cobj & m    ����  % o    ���� 0 argv   #  ' ( ' m     ) ) � * *  " (  +�� + m    ���� ��  ��     o      ���� 0 thetitle theTitle   , - , r    % . / . I    #�� 0���� 0 	trim_line   0  1 2 1 n     3 4 3 4    �� 5
�� 
cobj 5 m    ����  4 o    ���� 0 argv   2  6 7 6 m     8 8 � 9 9  " 7  :�� : m    ���� ��  ��   / o      ���� 0 thetext theText -  ; < ; r   & , = > = n   & * ? @ ? 4   ' *�� A
�� 
cobj A m   ( )����  @ o   & '���� 0 argv   > o      ���� 0 thelist theList <  B C B r   - 3 D E D n   - 1 F G F 4   . 1�� H
�� 
cobj H m   / 0����  G o   - .���� 0 argv   E o      ����  0 reminddatetime remindDateTime C  I�� I r   4 ; J K J b   4 9 L M L b   4 7 N O N o   4 5����  0 reminddatetime remindDateTime O m   5 6 P P � Q Q    M m   7 8 R R � S S 
 0 9 : 0 0 K o      ����  0 reminddatetime remindDateTime��     T U T =  > E V W V l  > C X���� X I  > C�� Y��
�� .corecnte****       **** Y o   > ?���� 0 argv  ��  ��  ��   W m   C D����  U  Z�� Z k   H x [ [  \ ] \ r   H U ^ _ ^ I   H S�� `���� 0 	trim_line   `  a b a n   I M c d c 4   J M�� e
�� 
cobj e m   K L����  d o   I J���� 0 argv   b  f g f m   M N h h � i i  " g  j�� j m   N O���� ��  ��   _ o      ���� 0 thetitle theTitle ]  k l k r   V c m n m I   V a�� o���� 0 	trim_line   o  p q p n   W [ r s r 4   X [�� t
�� 
cobj t m   Y Z����  s o   W X���� 0 argv   q  u v u m   [ \ w w � x x  " v  y�� y m   \ ]���� ��  ��   n o      ���� 0 thetext theText l  z { z r   d j | } | n   d h ~  ~ 4   e h�� �
�� 
cobj � m   f g����   o   d e���� 0 argv   } o      ���� 0 thelist theList {  ��� � r   k x � � � b   k v � � � b   k q � � � l  k o ����� � n   k o � � � 4   l o�� �
�� 
cobj � m   m n����  � o   k l���� 0 argv  ��  ��   � m   o p � � � � �    � l  q u ����� � n   q u � � � 4   r u�� �
�� 
cobj � m   s t����  � o   q r���� 0 argv  ��  ��   � o      ����  0 reminddatetime remindDateTime��  ��    k   { � � �  � � � r   { � � � � m   { ~ � � � � �   � o      ���� 0 cmdline   �  � � � X   � � ��� � � r   � � � � � b   � � � � � b   � � � � � o   � ����� 0 cmdline   � m   � � � � � � �    � o   � ����� 0 arg   � o      ���� 0 cmdline  �� 0 arg   � o   � ����� 0 argv   �  ��� � L   � � � � b   � � � � � b   � � � � � l  � � ����� � c   � � � � � l  � � ����� � I  � ��� ���
�� .corecnte****       **** � o   � ����� 0 argv  ��  ��  ��   � m   � ���
�� 
ctxt��  ��   � m   � � � � � � �  :   � o   � ����� 0 cmdline  ��     � � � l  � ���������  ��  ��   �  � � � =   � � � � � o   � ����� 0 ret   � I   � ��� �����  0 createreminder createReminder �  � � � o   � ����� 0 thetitle theTitle �  � � � o   � ����� 0 thetext theText �  � � � o   � ����� 0 thelist theList �  ��� � o   � �����  0 reminddatetime remindDateTime��  ��   �  ��� � Z   � � � ����� � >  � � � � � o   � ����� 0 ret   � m   � ���
�� 
null � L   � � � � o   � ����� 0 ret  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� *0 getdatetimefromtext getDateTimeFromText �  ��� � o      ���� 0 
indatetime 
inDateTime��  ��   � k     � �  � � � r      � � � m     ��
�� 
null � o      ���� 0 vdate vDate �  � � � r     � � � m    ��
�� 
null � o      ���� 0 timetext timeText �  � � � l   ��������  ��  ��   �  � � � r     � � � J     � �  ��� � m    	 � � � � �   ��   � n      � � � 1    �
� 
txdl � 1    �~
�~ 
ascr �  � � � r     � � � n     � � � 4    �} �
�} 
citm � m    �|�|  � o    �{�{ 0 
indatetime 
inDateTime � o      �z�z 0 datetext dateText �  � � � Z    - � ��y�x � ?      � � � l    ��w�v � I   �u ��t
�u .corecnte****       **** � l    ��s�r � n     � � � 2   �q
�q 
citm � o    �p�p 0 
indatetime 
inDateTime�s  �r  �t  �w  �v   � m    �o�o  � r   # ) � � � n   # ' � � � 4   $ '�n �
�n 
citm � m   % &�m�m  � o   # $�l�l 0 
indatetime 
inDateTime � o      �k�k 0 timetext timeText�y  �x   �  � � � l  . .�j�i�h�j  �i  �h   �  � � � l  . .�g � ��g   �   set the date    � �      s e t   t h e   d a t e �  r   . 5 J   . 1 �f m   . / �  -�f   n     	
	 1   2 4�e
�e 
txdl
 1   1 2�d
�d 
ascr  Z   6 ��c�b =  6 ? l  6 =�a�` I  6 =�_�^
�_ .corecnte****       **** n   6 9 m   7 9�]
�] 
citm o   6 7�\�\ 0 datetext dateText�^  �a  �`   m   = >�[�[  k   B �  r   B H n   B F 4   C F�Z
�Z 
citm m   D E�Y�Y  o   B C�X�X 0 datetext dateText o      �W�W 0 vyear vYear  r   I O  n   I M!"! 4   J M�V#
�V 
citm# m   K L�U�U " o   I J�T�T 0 datetext dateText  o      �S�S 0 vmonth vMonth $%$ r   P V&'& n   P T()( 4   Q T�R*
�R 
citm* m   R S�Q�Q ) o   P Q�P�P 0 datetext dateText' o      �O�O 0 vday vDay% +�N+ Z   W �,-�M�L, F   W z./. F   W j010 l  W Z2�K�J2 ?   W Z343 o   W X�I�I 0 vyear vYear4 m   X Y�H�H��K  �J  1 l  ] h5�G�F5 F   ] h676 ?   ] `898 o   ] ^�E�E 0 vmonth vMonth9 m   ^ _�D�D  7 A   c f:;: o   c d�C�C 0 vmonth vMonth; m   d e�B�B �G  �F  / l  m x<�A�@< F   m x=>= ?   m p?@? o   m n�?�? 0 vday vDay@ m   n o�>�>  > A   s vABA o   s t�=�= 0 vday vDayB m   t u�<�<  �A  �@  - k   } �CC DED r   } �FGF I  } ��;�:�9
�; .misccurdldt    ��� null�:  �9  G o      �8�8 0 vdate vDateE HIH r   � �JKJ l  � �L�7�6L c   � �MNM o   � ��5�5 0 vyear vYearN m   � ��4
�4 
long�7  �6  K n      OPO 1   � ��3
�3 
yearP o   � ��2�2 0 vdate vDateI QRQ r   � �STS c   � �UVU o   � ��1�1 0 vmonth vMonthV m   � ��0
�0 
longT n      WXW m   � ��/
�/ 
mnthX o   � ��.�. 0 vdate vDateR YZY r   � �[\[ c   � �]^] o   � ��-�- 0 vday vDay^ m   � ��,
�, 
long\ n      _`_ 1   � ��+
�+ 
day ` o   � ��*�* 0 vdate vDateZ a�)a r   � �bcb m   � ��(�(  c n      ded 1   � ��'
�' 
timee o   � ��&�& 0 vdate vDate�)  �M  �L  �N  �c  �b   fgf l  � ��%�$�#�%  �$  �#  g hih l  � ��"jk�"  j   set the time   k �ll    s e t   t h e   t i m ei mnm Z   �op�!� o >  � �qrq o   � ��� 0 timetext timeTextr m   � ��
� 
nullp k   �ss tut r   � �vwv J   � �xx y�y m   � �zz �{{  :�  w n     |}| 1   � ��
� 
txdl} 1   � ��
� 
ascru ~�~ Z   ���� =  � ���� l  � ����� I  � ����
� .corecnte****       ****� n   � ���� m   � ��
� 
citm� o   � ��� 0 timetext timeText�  �  �  � m   � ��� � k   ��� ��� r   � ���� n   � ���� 4   � ���
� 
citm� m   � ��� � o   � ��� 0 timetext timeText� o      �� 0 vhour vHour� ��� r   � ���� n   � ���� 4   � ���
� 
citm� m   � ��� � o   � ��
�
 0 timetext timeText� o      �	�	 0 vminute vMinute� ��� Z   ������ F   � ���� l  � ����� F   � ���� @   � ���� o   � ��� 0 vhour vHour� m   � ���  � A   � ���� o   � ��� 0 vhour vHour� m   � �� �  �  �  � l  � ������� F   � ���� @   � ���� o   � ����� 0 vminute vMinute� m   � �����  � A   � ���� o   � ����� 0 vminute vMinute� m   � ����� <��  ��  � r   ���� [   ���� ]   � ��� m   � ������ l  � ������� c   � ���� o   � ����� 0 vhour vHour� m   � ���
�� 
long��  ��  � ]   ��� m   ���� <� l ������ c  ��� o  ���� 0 vminute vMinute� m  ��
�� 
long��  ��  � n      ��� 1  	��
�� 
time� o  	���� 0 vdate vDate�  �  �  �  �  �  �!  �   n ��� l ��������  ��  ��  � ��� l ������  � M Gdisplay dialog dateText & " and " & timeText & " is " & (vDate as text)   � ��� � d i s p l a y   d i a l o g   d a t e T e x t   &   "   a n d   "   &   t i m e T e x t   &   "   i s   "   &   ( v D a t e   a s   t e x t )� ���� L  �� o  ���� 0 vdate vDate��   � ��� l     ��������  ��  ��  � ��� i    ��� I      �������  0 createreminder createReminder� ��� o      ���� 0 thetitle theTitle� ��� o      ���� 0 thetext theText� ��� o      ���� 0 thelist theList� ���� o      ����  0 reminddatetime remindDateTime��  ��  � k     ;�� ��� l     ������  � P Jon createReminder(theTitle, theText, theList, dueDateTime, remindDateTime)   � ��� � o n   c r e a t e R e m i n d e r ( t h e T i t l e ,   t h e T e x t ,   t h e L i s t ,   d u e D a t e T i m e ,   r e m i n d D a t e T i m e )� ��� O     8��� Q    7���� k    -�� ��� l   ������  � E ?tell me to set dueDateTimeD to getDateTimeFromText(dueDateTime)   � ��� ~ t e l l   m e   t o   s e t   d u e D a t e T i m e D   t o   g e t D a t e T i m e F r o m T e x t ( d u e D a t e T i m e )� ��� O   ��� r    ��� I    ������� *0 getdatetimefromtext getDateTimeFromText� ���� o    ����  0 reminddatetime remindDateTime��  ��  � o      ���� "0 reminddatetimed remindDateTimeD�  f    � ��� l   ������  � M Gdisplay dialog (dueDateTimeD as text) & " " & (remindDateTimeD as text)   � ��� � d i s p l a y   d i a l o g   ( d u e D a t e T i m e D   a s   t e x t )   &   "   "   &   ( r e m i n d D a t e T i m e D   a s   t e x t )� ��� l   ������  � � �make new reminder at end of (list theList) with properties {name:theTitle, body:theText, due date:dueDateTimeD, remind me date:remindDateTimeD}   � ��� m a k e   n e w   r e m i n d e r   a t   e n d   o f   ( l i s t   t h e L i s t )   w i t h   p r o p e r t i e s   { n a m e : t h e T i t l e ,   b o d y : t h e T e x t ,   d u e   d a t e : d u e D a t e T i m e D ,   r e m i n d   m e   d a t e : r e m i n d D a t e T i m e D }� ���� =    -��� o    ���� 0 ret  � l   ,������ I   ,�����
�� .corecrel****      � null��  � ����
�� 
kocl� m    ��
�� 
remi� ����
�� 
insh� n    ���  ;    � l    ����  4    ��
�� 
list o    ���� 0 thelist theList��  ��  � ����
�� 
prdt K     ( ��
�� 
pnam o   ! "���� 0 thetitle theTitle ��
�� 
body o   # $���� 0 thetext theText ����
�� 
rmdt o   % &���� "0 reminddatetimed remindDateTimeD��  ��  ��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � L   5 7		 m   5 6��
�� 
null� m     

�                                                                                  rmnd  alis    X  Macintosh HD               Η��H+     OReminders.app                                                   f%ͭ��        ����  	                Applications    Η��      ͭ�{       O  (Macintosh HD:Applications: Reminders.app    R e m i n d e r s . a p p    M a c i n t o s h   H D  Applications/Reminders.app  / ��  � �� L   9 ; o   9 :���� 0 ret  ��  �  l     ��������  ��  ��    l     ����   D > http://www.macosxautomation.com/applescript/sbrt/sbrt-06.html    � |   h t t p : / / w w w . m a c o s x a u t o m a t i o n . c o m / a p p l e s c r i p t / s b r t / s b r t - 0 6 . h t m l �� i     I      ������ 0 	trim_line    o      ���� 0 	this_text    o      ���� 0 
trim_chars   �� o      ���� 0 trim_indicator  ��  ��   k     {  l     �� !��    ' ! 0 = beginning, 1 = end, 2 = both   ! �"" B   0   =   b e g i n n i n g ,   1   =   e n d ,   2   =   b o t h #$# r     %&% l    '����' n     ()( 1    ��
�� 
leng) l    *����* o     ���� 0 
trim_chars  ��  ��  ��  ��  & o      ���� 0 x  $ +,+ l   ��-.��  -   TRIM BEGINNING   . �//    T R I M   B E G I N N I N G, 010 Z    >23����2 E   454 J    
66 787 m    ����  8 9��9 m    ���� ��  5 l  
 :����: o   
 ���� 0 trim_indicator  ��  ��  3 V    :;<; Q    5=>?= r    +@A@ c    )BCB n    'DED 7   '��FG
�� 
cha F l   #H����H [    #IJI o     !���� 0 x  J m   ! "���� ��  ��  G m   $ &������E o    ���� 0 	this_text  C m   ' (��
�� 
TEXTA o      ���� 0 	this_text  > R      ������
�� .ascrerr ****      � ****��  ��  ? k   3 5KK LML l  3 3��NO��  N 8 2 the text contains nothing but the trim characters   O �PP d   t h e   t e x t   c o n t a i n s   n o t h i n g   b u t   t h e   t r i m   c h a r a c t e r sM Q��Q L   3 5RR m   3 4SS �TT  ��  < C   UVU o    ���� 0 	this_text  V l   W����W o    ���� 0 
trim_chars  ��  ��  ��  ��  1 XYX l  ? ?��Z[��  Z   TRIM ENDING   [ �\\    T R I M   E N D I N GY ]^] Z   ? x_`����_ E  ? Eaba J   ? Ccc ded m   ? @���� e f��f m   @ A���� ��  b l  C Dg����g o   C D���� 0 trim_indicator  ��  ��  ` V   H thih Q   P ojklj r   S emnm c   S copo n   S aqrq 7  T a��st
�� 
cha s m   X Z���� t d   [ `uu l  \ _v��~v [   \ _wxw o   \ ]�}�} 0 x  x m   ] ^�|�| �  �~  r o   S T�{�{ 0 	this_text  p m   a b�z
�z 
TEXTn o      �y�y 0 	this_text  k R      �x�w�v
�x .ascrerr ****      � ****�w  �v  l k   m oyy z{z l  m m�u|}�u  | 8 2 the text contains nothing but the trim characters   } �~~ d   t h e   t e x t   c o n t a i n s   n o t h i n g   b u t   t h e   t r i m   c h a r a c t e r s{ �t L   m o�� m   m n�� ���  �t  i D   L O��� o   L M�s�s 0 	this_text  � l  M N��r�q� o   M N�p�p 0 
trim_chars  �r  �q  ��  ��  ^ ��o� L   y {�� o   y z�n�n 0 	this_text  �o  ��       �m������m  � �l�k�j�i
�l .aevtoappnull  �   � ****�k *0 getdatetimefromtext getDateTimeFromText�j  0 createreminder createReminder�i 0 	trim_line  � �h �g�f���e
�h .aevtoappnull  �   � ****�g 0 argv  �f  � �d�c�d 0 argv  �c 0 arg  � �b�a�` )�_�^ 8�]�\�[ P R�Z h w � ��Y�X ��W ��V�U�T
�b .corecnte****       ****�a 
�` 
cobj�_ 0 	trim_line  �^ 0 thetitle theTitle�] 0 thetext theText�\ 0 thelist theList�[  0 reminddatetime remindDateTime�Z �Y 0 cmdline  
�X 
kocl
�W 
ctxt�V 0 ret  �U  0 createreminder createReminder
�T 
null�e ܠj  �  6*��k/�lm+ E�O*��l/�lm+ E�O��m/E�O���/E�O��%�%E�Y ~�j  �  5*��k/�lm+ E�O*��l/�lm+ E�O��m/E�O���/�%���/%E�Y Aa E` O #�[a �l  kh _ a %�%E` [OY��O�j  a &a %_ %O_ *�����+  O_ a  	_ Y h� �S ��R�Q���P�S *0 getdatetimefromtext getDateTimeFromText�R �O��O �  �N�N 0 
indatetime 
inDateTime�Q  � 	�M�L�K�J�I�H�G�F�E�M 0 
indatetime 
inDateTime�L 0 vdate vDate�K 0 timetext timeText�J 0 datetext dateText�I 0 vyear vYear�H 0 vmonth vMonth�G 0 vday vDay�F 0 vhour vHour�E 0 vminute vMinute� �D ��C�B�A�@�?�>�=�<�;�:�9�8�7�6z�5�4�3
�D 
null
�C 
ascr
�B 
txdl
�A 
citm
�@ .corecnte****       ****�?��> 
�= 
bool�<  
�; .misccurdldt    ��� null
�: 
long
�9 
year
�8 
mnth
�7 
day 
�6 
time�5 �4 <�3�P�E�O�E�O�kv��,FO��k/E�O��-j k ��l/E�Y hO�kv��,FO��,j m  k��k/E�O��l/E�O��m/E�O��	 �j	 ���&�&	 �j	 ���&�& ,*j E�O��&��,FO��&��,FO��&��,FOj�a ,FY hY hO�� ha kv��,FO��,j l  N��k/E�O��l/E�O�j	 	�a �&	 �j	 	�a �&�& a ��& a ��& �a ,FY hY hY hO�� �2��1�0���/�2  0 createreminder createReminder�1 �.��. �  �-�,�+�*�- 0 thetitle theTitle�, 0 thetext theText�+ 0 thelist theList�*  0 reminddatetime remindDateTime�0  � �)�(�'�&�%�$�) 0 thetitle theTitle�( 0 thetext theText�' 0 thelist theList�&  0 reminddatetime remindDateTime�% "0 reminddatetimed remindDateTimeD�$ 0 ret  � 
�#�"�!� �����������# *0 getdatetimefromtext getDateTimeFromText
�" 
kocl
�! 
remi
�  
insh
� 
list
� 
prdt
� 
pnam
� 
body
� 
rmdt� 
� .corecrel****      � null�  �  
� 
null�/ <� 5 +) 
*�k+ E�UO�*���*�/6������  W 	X  �UO�� ������� 0 	trim_line  � ��� �  ���� 0 	this_text  � 0 
trim_chars  � 0 trim_indicator  �  � ����
� 0 	this_text  � 0 
trim_chars  � 0 trim_indicator  �
 0 x  � �	����S�
�	 
leng
� 
cha 
� 
TEXT�  �  � |��,E�Ojllv� 0 *h�� �[�\[Z�k\Zi2�&E�W 	X  �[OY��Y hOkllv� 1 +h�� �[�\[Zk\Z�k'2�&E�W 	X  �[OY��Y hO� ascr  ��ޭ