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
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    k     �       r         m     ��
�� 
null  o      ���� 0 ret        l   ��������  ��  ��        Z    �      =       l   	 ����  I   	�� ��
�� .corecnte****       ****  o    ���� 0 argv  ��  ��  ��    m   	 
����   k    ?      ! " ! r     # $ # I    �� %���� 0 	trim_line   %  & ' & n     ( ) ( 4    �� *
�� 
cobj * m    ����  ) o    ���� 0 argv   '  + , + m     - - � . .  " ,  /�� / m    ���� ��  ��   $ o      ���� 0 thetitle theTitle "  0 1 0 r    ) 2 3 2 I    '�� 4���� 0 	trim_line   4  5 6 5 n    ! 7 8 7 4    !�� 9
�� 
cobj 9 m     ����  8 o    ���� 0 argv   6  : ; : m   ! " < < � = =  " ;  >�� > m   " #���� ��  ��   3 o      ���� 0 thetext theText 1  ? @ ? r   * 0 A B A n   * . C D C 4   + .�� E
�� 
cobj E m   , -����  D o   * +���� 0 argv   B o      ���� 0 thelist theList @  F G F r   1 7 H I H n   1 5 J K J 4   2 5�� L
�� 
cobj L m   3 4����  K o   1 2���� 0 argv   I o      ����  0 reminddatetime remindDateTime G  M�� M r   8 ? N O N b   8 = P Q P b   8 ; R S R o   8 9����  0 reminddatetime remindDateTime S m   9 : T T � U U    Q m   ; < V V � W W 
 0 9 : 0 0 O o      ����  0 reminddatetime remindDateTime��     X Y X =  B I Z [ Z l  B G \���� \ I  B G�� ]��
�� .corecnte****       **** ] o   B C���� 0 argv  ��  ��  ��   [ m   G H����  Y  ^�� ^ k   L � _ _  ` a ` r   L Y b c b I   L W�� d���� 0 	trim_line   d  e f e n   M Q g h g 4   N Q�� i
�� 
cobj i m   O P����  h o   M N���� 0 argv   f  j k j m   Q R l l � m m  " k  n�� n m   R S���� ��  ��   c o      ���� 0 thetitle theTitle a  o p o r   Z i q r q I   Z g�� s���� 0 	trim_line   s  t u t n   [ _ v w v 4   \ _�� x
�� 
cobj x m   ] ^����  w o   [ \���� 0 argv   u  y z y m   _ b { { � | |  " z  }�� } m   b c���� ��  ��   r o      ���� 0 thetext theText p  ~  ~ r   j p � � � n   j n � � � 4   k n�� �
�� 
cobj � m   l m����  � o   j k���� 0 argv   � o      ���� 0 thelist theList   ��� � r   q � � � � b   q ~ � � � b   q y � � � l  q u ����� � n   q u � � � 4   r u�� �
�� 
cobj � m   s t����  � o   q r���� 0 argv  ��  ��   � m   u x � � � � �    � l  y } ����� � n   y } � � � 4   z }�� �
�� 
cobj � m   { |����  � o   y z���� 0 argv  ��  ��   � o      ����  0 reminddatetime remindDateTime��  ��    k   � � � �  � � � r   � � � � � m   � � � � � � �   � o      ���� 0 cmdline   �  � � � X   � � ��� � � r   � � � � � b   � � � � � b   � � � � � o   � ����� 0 cmdline   � m   � � � � � � �    � o   � ����� 0 arg   � o      ���� 0 cmdline  �� 0 arg   � o   � ����� 0 argv   �  ��� � L   � � � � b   � � � � � b   � � � � � l  � � ����� � c   � � � � � l  � � ����� � I  � ��� ���
�� .corecnte****       **** � o   � ����� 0 argv  ��  ��  ��   � m   � ���
�� 
ctxt��  ��   � m   � � � � � � �  :   � o   � ����� 0 cmdline  ��     � � � l  � ���������  ��  ��   �  � � � r   � � � � � I   � ��� �����  0 createreminder createReminder �  � � � o   � ����� 0 thetitle theTitle �  � � � o   � ����� 0 thetext theText �  � � � o   � ����� 0 thelist theList �  ��� � o   � �����  0 reminddatetime remindDateTime��  ��   � o      ���� 0 ret   �  ��� � Z   � � � ����� � >  � � � � � o   � ����� 0 ret   � m   � ���
�� 
null � L   � � � � o   � ����� 0 ret  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� *0 getdatetimefromtext getDateTimeFromText �  ��� � o      ���� 0 
indatetime 
inDateTime��  ��   � k     � �  � � � r      � � � m     ��
�� 
null � o      ���� 0 vdate vDate �  � � � r     � � � m    ��
�� 
null � o      ���� 0 timetext timeText �  � � � l   �������  ��  �   �  � � � r     � � � J     � �  ��~ � m    	 � � � � �   �~   � n      � � � 1    �}
�} 
txdl � 1    �|
�| 
ascr �  � � � r     � � � n     � � � 4    �{ �
�{ 
citm � m    �z�z  � o    �y�y 0 
indatetime 
inDateTime � o      �x�x 0 datetext dateText �  � � � Z    - � ��w�v � ?      � � � l    ��u�t � I   �s ��r
�s .corecnte****       **** � l    ��q�p � n     � � � 2   �o
�o 
citm � o    �n�n 0 
indatetime 
inDateTime�q  �p  �r  �u  �t   � m    �m�m  � r   # ) � � � n   # ' � � � 4   $ '�l �
�l 
citm � m   % &�k�k  � o   # $�j�j 0 
indatetime 
inDateTime � o      �i�i 0 timetext timeText�w  �v   �  � � � l  . .�h�g�f�h  �g  �f   �    l  . .�e�e     set the date    �    s e t   t h e   d a t e  r   . 5 J   . 1		 
�d
 m   . / �  -�d   n      1   2 4�c
�c 
txdl 1   1 2�b
�b 
ascr  Z   6 ��a�` =  6 ? l  6 =�_�^ I  6 =�]�\
�] .corecnte****       **** n   6 9 m   7 9�[
�[ 
citm o   6 7�Z�Z 0 datetext dateText�\  �_  �^   m   = >�Y�Y  k   B �  r   B H n   B F 4   C F�X 
�X 
citm  m   D E�W�W  o   B C�V�V 0 datetext dateText o      �U�U 0 vyear vYear !"! r   I O#$# n   I M%&% 4   J M�T'
�T 
citm' m   K L�S�S & o   I J�R�R 0 datetext dateText$ o      �Q�Q 0 vmonth vMonth" ()( r   P V*+* n   P T,-, 4   Q T�P.
�P 
citm. m   R S�O�O - o   P Q�N�N 0 datetext dateText+ o      �M�M 0 vday vDay) /�L/ Z   W �01�K�J0 F   W z232 F   W j454 l  W Z6�I�H6 ?   W Z787 o   W X�G�G 0 vyear vYear8 m   X Y�F�F��I  �H  5 l  ] h9�E�D9 F   ] h:;: ?   ] `<=< o   ] ^�C�C 0 vmonth vMonth= m   ^ _�B�B  ; A   c f>?> o   c d�A�A 0 vmonth vMonth? m   d e�@�@ �E  �D  3 l  m x@�?�>@ F   m xABA ?   m pCDC o   m n�=�= 0 vday vDayD m   n o�<�<  B A   s vEFE o   s t�;�; 0 vday vDayF m   t u�:�:  �?  �>  1 k   } �GG HIH r   } �JKJ I  } ��9�8�7
�9 .misccurdldt    ��� null�8  �7  K o      �6�6 0 vdate vDateI LML r   � �NON l  � �P�5�4P c   � �QRQ o   � ��3�3 0 vyear vYearR m   � ��2
�2 
long�5  �4  O n      STS 1   � ��1
�1 
yearT o   � ��0�0 0 vdate vDateM UVU r   � �WXW c   � �YZY o   � ��/�/ 0 vmonth vMonthZ m   � ��.
�. 
longX n      [\[ m   � ��-
�- 
mnth\ o   � ��,�, 0 vdate vDateV ]^] r   � �_`_ c   � �aba o   � ��+�+ 0 vday vDayb m   � ��*
�* 
long` n      cdc 1   � ��)
�) 
day d o   � ��(�( 0 vdate vDate^ e�'e r   � �fgf m   � ��&�&  g n      hih 1   � ��%
�% 
timei o   � ��$�$ 0 vdate vDate�'  �K  �J  �L  �a  �`   jkj l  � ��#�"�!�#  �"  �!  k lml l  � �� no�   n   set the time   o �pp    s e t   t h e   t i m em qrq Z   �st��s >  � �uvu o   � ��� 0 timetext timeTextv m   � ��
� 
nullt k   �ww xyx r   � �z{z J   � �|| }�} m   � �~~ �  :�  { n     ��� 1   � ��
� 
txdl� 1   � ��
� 
ascry ��� Z   ������ =  � ���� l  � ����� I  � ����
� .corecnte****       ****� n   � ���� m   � ��
� 
citm� o   � ��� 0 timetext timeText�  �  �  � m   � ��� � k   ��� ��� r   � ���� n   � ���� 4   � ���
� 
citm� m   � ��� � o   � ��� 0 timetext timeText� o      �� 0 vhour vHour� ��� r   � ���� n   � ���� 4   � ��
�
�
 
citm� m   � ��	�	 � o   � ��� 0 timetext timeText� o      �� 0 vminute vMinute� ��� Z   ������ F   � ���� l  � ����� F   � ���� @   � ���� o   � ��� 0 vhour vHour� m   � �� �   � A   � ���� o   � ����� 0 vhour vHour� m   � ����� �  �  � l  � ������� F   � ���� @   � ���� o   � ����� 0 vminute vMinute� m   � �����  � A   � ���� o   � ����� 0 vminute vMinute� m   � ����� <��  ��  � r   ���� [   ���� ]   � ��� m   � ������ l  � ������� c   � ���� o   � ����� 0 vhour vHour� m   � ���
�� 
long��  ��  � ]   ��� m   ���� <� l ������ c  ��� o  ���� 0 vminute vMinute� m  ��
�� 
long��  ��  � n      ��� 1  	��
�� 
time� o  	���� 0 vdate vDate�  �  �  �  �  �  �  �  r ��� l ��������  ��  ��  � ��� l ������  � M Gdisplay dialog dateText & " and " & timeText & " is " & (vDate as text)   � ��� � d i s p l a y   d i a l o g   d a t e T e x t   &   "   a n d   "   &   t i m e T e x t   &   "   i s   "   &   ( v D a t e   a s   t e x t )� ���� L  �� o  ���� 0 vdate vDate��   � ��� l     ��������  ��  ��  � ��� i    ��� I      �������  0 createreminder createReminder� ��� o      ���� 0 thetitle theTitle� ��� o      ���� 0 thetext theText� ��� o      ���� 0 thelist theList� ���� o      ����  0 reminddatetime remindDateTime��  ��  � k     ?�� ��� l     ������  � P Jon createReminder(theTitle, theText, theList, dueDateTime, remindDateTime)   � ��� � o n   c r e a t e R e m i n d e r ( t h e T i t l e ,   t h e T e x t ,   t h e L i s t ,   d u e D a t e T i m e ,   r e m i n d D a t e T i m e )� ��� r     ��� m     ��
�� 
null� o      ���� 0 ret  � ��� O    <��� Q    ;���� k    1�� ��� l   ������  � E ?tell me to set dueDateTimeD to getDateTimeFromText(dueDateTime)   � ��� ~ t e l l   m e   t o   s e t   d u e D a t e T i m e D   t o   g e t D a t e T i m e F r o m T e x t ( d u e D a t e T i m e )� ��� O   ��� r    ��� I    ������� *0 getdatetimefromtext getDateTimeFromText� ���� o    ����  0 reminddatetime remindDateTime��  ��  � o      ���� "0 reminddatetimed remindDateTimeD�  f    � ��� l   ������  � M Gdisplay dialog (dueDateTimeD as text) & " " & (remindDateTimeD as text)   � ��� � d i s p l a y   d i a l o g   ( d u e D a t e T i m e D   a s   t e x t )   &   "   "   &   ( r e m i n d D a t e T i m e D   a s   t e x t )� ��� l   ������  � � �make new reminder at end of (list theList) with properties {name:theTitle, body:theText, due date:dueDateTimeD, remind me date:remindDateTimeD}   � ��� m a k e   n e w   r e m i n d e r   a t   e n d   o f   ( l i s t   t h e L i s t )   w i t h   p r o p e r t i e s   { n a m e : t h e T i t l e ,   b o d y : t h e T e x t ,   d u e   d a t e : d u e D a t e T i m e D ,   r e m i n d   m e   d a t e : r e m i n d D a t e T i m e D }� ���� r    1��� l   / ����  I   /����
�� .corecrel****      � null��   ��
�� 
kocl m    ��
�� 
remi ��
�� 
insh n    "  ;   ! " l   !���� 4    !��	
�� 
list	 o     ���� 0 thelist theList��  ��   ��
��
�� 
prdt
 K   # + ��
�� 
pnam o   $ %���� 0 thetitle theTitle ��
�� 
body o   & '���� 0 thetext theText ����
�� 
rmdt o   ( )���� "0 reminddatetimed remindDateTimeD��  ��  ��  ��  � o      ���� 0 ret  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � L   9 ; m   9 :��
�� 
null� m    �                                                                                  rmnd  alis    X  Macintosh HD               Η��H+     OReminders.app                                                   f%ͭ��        ����  	                Applications    Η��      ͭ�{       O  (Macintosh HD:Applications: Reminders.app    R e m i n d e r s . a p p    M a c i n t o s h   H D  Applications/Reminders.app  / ��  � �� L   = ? o   = >���� 0 ret  ��  �  l     ��������  ��  ��    l     ����   D > http://www.macosxautomation.com/applescript/sbrt/sbrt-06.html    � |   h t t p : / / w w w . m a c o s x a u t o m a t i o n . c o m / a p p l e s c r i p t / s b r t / s b r t - 0 6 . h t m l �� i     I      ������ 0 	trim_line    !  o      ���� 0 	this_text  ! "#" o      ���� 0 
trim_chars  # $��$ o      ���� 0 trim_indicator  ��  ��   k     {%% &'& l     ��()��  ( ' ! 0 = beginning, 1 = end, 2 = both   ) �** B   0   =   b e g i n n i n g ,   1   =   e n d ,   2   =   b o t h' +,+ r     -.- l    /����/ n     010 1    ��
�� 
leng1 l    2����2 o     ���� 0 
trim_chars  ��  ��  ��  ��  . o      ���� 0 x  , 343 l   ��56��  5   TRIM BEGINNING   6 �77    T R I M   B E G I N N I N G4 898 Z    >:;����: E   <=< J    
>> ?@? m    ����  @ A��A m    ���� ��  = l  
 B����B o   
 ���� 0 trim_indicator  ��  ��  ; V    :CDC Q    5EFGE r    +HIH c    )JKJ n    'LML 7   '��NO
�� 
cha N l   #P����P [    #QRQ o     !���� 0 x  R m   ! "���� ��  ��  O m   $ &������M o    ���� 0 	this_text  K m   ' (��
�� 
TEXTI o      ���� 0 	this_text  F R      ������
�� .ascrerr ****      � ****��  ��  G k   3 5SS TUT l  3 3��VW��  V 8 2 the text contains nothing but the trim characters   W �XX d   t h e   t e x t   c o n t a i n s   n o t h i n g   b u t   t h e   t r i m   c h a r a c t e r sU Y��Y L   3 5ZZ m   3 4[[ �\\  ��  D C   ]^] o    ���� 0 	this_text  ^ l   _����_ o    ���� 0 
trim_chars  ��  ��  ��  ��  9 `a` l  ? ?��bc��  b   TRIM ENDING   c �dd    T R I M   E N D I N Ga efe Z   ? xgh����g E  ? Eiji J   ? Ckk lml m   ? @���� m n��n m   @ A���� ��  j l  C Do���o o   C D�~�~ 0 trim_indicator  ��  �  h V   H tpqp Q   P orstr r   S euvu c   S cwxw n   S ayzy 7  T a�}{|
�} 
cha { m   X Z�|�| | d   [ `}} l  \ _~�{�z~ [   \ _� o   \ ]�y�y 0 x  � m   ] ^�x�x �{  �z  z o   S T�w�w 0 	this_text  x m   a b�v
�v 
TEXTv o      �u�u 0 	this_text  s R      �t�s�r
�t .ascrerr ****      � ****�s  �r  t k   m o�� ��� l  m m�q���q  � 8 2 the text contains nothing but the trim characters   � ��� d   t h e   t e x t   c o n t a i n s   n o t h i n g   b u t   t h e   t r i m   c h a r a c t e r s� ��p� L   m o�� m   m n�� ���  �p  q D   L O��� o   L M�o�o 0 	this_text  � l  M N��n�m� o   M N�l�l 0 
trim_chars  �n  �m  ��  ��  f ��k� L   y {�� o   y z�j�j 0 	this_text  �k  ��       �i�����������h�g�f�e�d�c�b�i  � �a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R
�a .aevtoappnull  �   � ****�` *0 getdatetimefromtext getDateTimeFromText�_  0 createreminder createReminder�^ 0 	trim_line  �] 0 ret  �\ 0 thetitle theTitle�[ 0 thetext theText�Z 0 thelist theList�Y  0 reminddatetime remindDateTime�X  �W  �V  �U  �T  �S  �R  � �Q �P�O���N
�Q .aevtoappnull  �   � ****�P 0 argv  �O  � �M�L�M 0 argv  �L 0 arg  � �K�J�I�H�G -�F�E <�D�C�B T V�A l { � ��@�? ��> ��=
�K 
null�J 0 ret  
�I .corecnte****       ****�H 
�G 
cobj�F 0 	trim_line  �E 0 thetitle theTitle�D 0 thetext theText�C 0 thelist theList�B  0 reminddatetime remindDateTime�A �@ 0 cmdline  
�? 
kocl
�> 
ctxt�=  0 createreminder createReminder�N ��E�O�j �  6*��k/�lm+ E�O*��l/�lm+ E�O��m/E�O���/E�O��%�%E�Y ��j �  9*��k/�lm+ E�O*��l/a lm+ E�O��m/E�O���/a %���/%E�Y Aa E` O #�[a �l kh _ a %�%E` [OY��O�j a &a %_ %O*�����+ E�O�� �Y h� �< ��;�:���9�< *0 getdatetimefromtext getDateTimeFromText�; �8��8 �  �7�7 0 
indatetime 
inDateTime�:  � 	�6�5�4�3�2�1�0�/�.�6 0 
indatetime 
inDateTime�5 0 vdate vDate�4 0 timetext timeText�3 0 datetext dateText�2 0 vyear vYear�1 0 vmonth vMonth�0 0 vday vDay�/ 0 vhour vHour�. 0 vminute vMinute� �- ��,�+�*�)�(�'�&�%�$�#�"�!� �~���
�- 
null
�, 
ascr
�+ 
txdl
�* 
citm
�) .corecnte****       ****�(��' 
�& 
bool�%  
�$ .misccurdldt    ��� null
�# 
long
�" 
year
�! 
mnth
�  
day 
� 
time� � <��9�E�O�E�O�kv��,FO��k/E�O��-j k ��l/E�Y hO�kv��,FO��,j m  k��k/E�O��l/E�O��m/E�O��	 �j	 ���&�&	 �j	 ���&�& ,*j E�O��&��,FO��&��,FO��&��,FOj�a ,FY hY hO�� ha kv��,FO��,j l  N��k/E�O��l/E�O�j	 	�a �&	 �j	 	�a �&�& a ��& a ��& �a ,FY hY hY hO�� ��������  0 createreminder createReminder� ��� �  ����� 0 thetitle theTitle� 0 thetext theText� 0 thelist theList�  0 reminddatetime remindDateTime�  � ������� 0 thetitle theTitle� 0 thetext theText� 0 thelist theList�  0 reminddatetime remindDateTime� 0 ret  � "0 reminddatetimed remindDateTimeD� ���
�	��������� ��
� 
null� *0 getdatetimefromtext getDateTimeFromText
�
 
kocl
�	 
remi
� 
insh
� 
list
� 
prdt
� 
pnam
� 
body
� 
rmdt� 
� .corecrel****      � null�   ��  � @�E�O� 5 +) 
*�k+ E�UO*���*�/6������ E�W 	X  �UO�� ������������ 0 	trim_line  �� ����� �  �������� 0 	this_text  �� 0 
trim_chars  �� 0 trim_indicator  ��  � ���������� 0 	this_text  �� 0 
trim_chars  �� 0 trim_indicator  �� 0 x  � ����������[�
�� 
leng
�� 
cha 
�� 
TEXT��  ��  �� |��,E�Ojllv� 0 *h�� �[�\[Z�k\Zi2�&E�W 	X  �[OY��Y hOkllv� 1 +h�� �[�\[Zk\Z�k'2�&E�W 	X  �[OY��Y hO�� �� �����
�� 
remi� ��� n x - a p p l e - r e m i n d e r : / / 1 A 9 2 4 D 9 6 - F F 7 4 - 4 2 B 4 - B 6 5 3 - 7 4 3 D 3 6 1 0 E 4 0 0
�� kfrmID  � ���  . . .   t r i g g e r n� ���  . . .   t r i g g e r n� ��� 
 I n b o x� ���   2 0 1 4 - 0 5 - 2 6   0 9 : 0 0�h  �g  �f  �e  �d  �c  �b   ascr  ��ޭ