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
ctxt��  ��   � m   � � � � � � �  :   � o   � ����� 0 cmdline  ��     � � � l  � ���������  ��  ��   �  � � � I   � ��� �����  0 createreminder createReminder �  � � � o   � ����� 0 thetitle theTitle �  � � � o   � ����� 0 thetext theText �  � � � o   � ����� 0 thelist theList �  ��� � o   � �����  0 reminddatetime remindDateTime��  ��   �  ��� � l  � ���������  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� *0 getdatetimefromtext getDateTimeFromText �  ��� � o      ���� 0 
indatetime 
inDateTime��  ��   � k     � �  � � � r      � � � m     ��
�� 
null � o      ���� 0 vdate vDate �  � � � r     � � � m    ��
�� 
null � o      ���� 0 timetext timeText �  � � � l   ��������  ��  ��   �  � � � r     � � � J     � �  ��� � m    	 � � � � �   ��   � n      � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr �  � � � r     � � � n     � � � 4    �� �
�� 
citm � m    ��  � o    �~�~ 0 
indatetime 
inDateTime � o      �}�} 0 datetext dateText �  � � � Z    - � ��|�{ � ?      � � � l    ��z�y � I   �x ��w
�x .corecnte****       **** � l    ��v�u � n     � � � 2   �t
�t 
citm � o    �s�s 0 
indatetime 
inDateTime�v  �u  �w  �z  �y   � m    �r�r  � r   # ) � � � n   # ' � � � 4   $ '�q �
�q 
citm � m   % &�p�p  � o   # $�o�o 0 
indatetime 
inDateTime � o      �n�n 0 timetext timeText�|  �{   �  � � � l  . .�m�l�k�m  �l  �k   �  � � � l  . .�j � ��j   �   set the date    � � � �    s e t   t h e   d a t e �  � � � r   . 5 � � � J   . 1 � �  ��i � m   . /   �  -�i   � n      1   2 4�h
�h 
txdl 1   1 2�g
�g 
ascr �  Z   6 ��f�e =  6 ?	 l  6 =
�d�c
 I  6 =�b�a
�b .corecnte****       **** n   6 9 m   7 9�`
�` 
citm o   6 7�_�_ 0 datetext dateText�a  �d  �c  	 m   = >�^�^  k   B �  r   B H n   B F 4   C F�]
�] 
citm m   D E�\�\  o   B C�[�[ 0 datetext dateText o      �Z�Z 0 vyear vYear  r   I O n   I M 4   J M�Y
�Y 
citm m   K L�X�X  o   I J�W�W 0 datetext dateText o      �V�V 0 vmonth vMonth  r   P V  n   P T!"! 4   Q T�U#
�U 
citm# m   R S�T�T " o   P Q�S�S 0 datetext dateText  o      �R�R 0 vday vDay $�Q$ Z   W �%&�P�O% F   W z'(' F   W j)*) l  W Z+�N�M+ ?   W Z,-, o   W X�L�L 0 vyear vYear- m   X Y�K�K��N  �M  * l  ] h.�J�I. F   ] h/0/ ?   ] `121 o   ] ^�H�H 0 vmonth vMonth2 m   ^ _�G�G  0 A   c f343 o   c d�F�F 0 vmonth vMonth4 m   d e�E�E �J  �I  ( l  m x5�D�C5 F   m x676 ?   m p898 o   m n�B�B 0 vday vDay9 m   n o�A�A  7 A   s v:;: o   s t�@�@ 0 vday vDay; m   t u�?�?  �D  �C  & k   } �<< =>= r   } �?@? I  } ��>�=�<
�> .misccurdldt    ��� null�=  �<  @ o      �;�; 0 vdate vDate> ABA r   � �CDC l  � �E�:�9E c   � �FGF o   � ��8�8 0 vyear vYearG m   � ��7
�7 
long�:  �9  D n      HIH 1   � ��6
�6 
yearI o   � ��5�5 0 vdate vDateB JKJ r   � �LML c   � �NON o   � ��4�4 0 vmonth vMonthO m   � ��3
�3 
longM n      PQP m   � ��2
�2 
mnthQ o   � ��1�1 0 vdate vDateK RSR r   � �TUT c   � �VWV o   � ��0�0 0 vday vDayW m   � ��/
�/ 
longU n      XYX 1   � ��.
�. 
day Y o   � ��-�- 0 vdate vDateS Z�,Z r   � �[\[ m   � ��+�+  \ n      ]^] 1   � ��*
�* 
time^ o   � ��)�) 0 vdate vDate�,  �P  �O  �Q  �f  �e   _`_ l  � ��(�'�&�(  �'  �&  ` aba l  � ��%cd�%  c   set the time   d �ee    s e t   t h e   t i m eb fgf Z   �hi�$�#h >  � �jkj o   � ��"�" 0 timetext timeTextk m   � ��!
�! 
nulli k   �ll mnm r   � �opo J   � �qq r� r m   � �ss �tt  :�   p n     uvu 1   � ��
� 
txdlv 1   � ��
� 
ascrn w�w Z   �xy��x =  � �z{z l  � �|��| I  � ��}�
� .corecnte****       ****} n   � �~~ m   � ��
� 
citm o   � ��� 0 timetext timeText�  �  �  { m   � ��� y k   ��� ��� r   � ���� n   � ���� 4   � ���
� 
citm� m   � ��� � o   � ��� 0 timetext timeText� o      �� 0 vhour vHour� ��� r   � ���� n   � ���� 4   � ���
� 
citm� m   � ��� � o   � ��� 0 timetext timeText� o      �� 0 vminute vMinute� ��� Z   ����
�	� F   � ���� l  � ����� F   � ���� @   � ���� o   � ��� 0 vhour vHour� m   � ���  � A   � ���� o   � ��� 0 vhour vHour� m   � ��� �  �  � l  � ����� F   � ���� @   � ���� o   � �� �  0 vminute vMinute� m   � �����  � A   � ���� o   � ����� 0 vminute vMinute� m   � ����� <�  �  � r   ���� [   ���� ]   � ��� m   � ������ l  � ������� c   � ���� o   � ����� 0 vhour vHour� m   � ���
�� 
long��  ��  � ]   ��� m   ���� <� l ������ c  ��� o  ���� 0 vminute vMinute� m  ��
�� 
long��  ��  � n      ��� 1  	��
�� 
time� o  	���� 0 vdate vDate�
  �	  �  �  �  �  �$  �#  g ��� l ��������  ��  ��  � ��� l ������  � M Gdisplay dialog dateText & " and " & timeText & " is " & (vDate as text)   � ��� � d i s p l a y   d i a l o g   d a t e T e x t   &   "   a n d   "   &   t i m e T e x t   &   "   i s   "   &   ( v D a t e   a s   t e x t )� ���� L  �� o  ���� 0 vdate vDate��   � ��� l     ��������  ��  ��  � ��� i    ��� I      �������  0 createreminder createReminder� ��� o      ���� 0 thetitle theTitle� ��� o      ���� 0 thetext theText� ��� o      ���� 0 thelist theList� ���� o      ����  0 reminddatetime remindDateTime��  ��  � k     +�� ��� l     ������  � P Jon createReminder(theTitle, theText, theList, dueDateTime, remindDateTime)   � ��� � o n   c r e a t e R e m i n d e r ( t h e T i t l e ,   t h e T e x t ,   t h e L i s t ,   d u e D a t e T i m e ,   r e m i n d D a t e T i m e )� ���� O     +��� k    *�� ��� l   ������  � 	 try   � ���  t r y� ��� l   ������  � E ?tell me to set dueDateTimeD to getDateTimeFromText(dueDateTime)   � ��� ~ t e l l   m e   t o   s e t   d u e D a t e T i m e D   t o   g e t D a t e T i m e F r o m T e x t ( d u e D a t e T i m e )� ��� O   ��� r    ��� I    ������� *0 getdatetimefromtext getDateTimeFromText� ���� o   	 
����  0 reminddatetime remindDateTime��  ��  � o      ���� "0 reminddatetimed remindDateTimeD�  f    � ��� l   ������  � M Gdisplay dialog (dueDateTimeD as text) & " " & (remindDateTimeD as text)   � ��� � d i s p l a y   d i a l o g   ( d u e D a t e T i m e D   a s   t e x t )   &   "   "   &   ( r e m i n d D a t e T i m e D   a s   t e x t )� ��� l   ������  � � �make new reminder at end of (list theList) with properties {name:theTitle, body:theText, due date:dueDateTimeD, remind me date:remindDateTimeD}   � ��� m a k e   n e w   r e m i n d e r   a t   e n d   o f   ( l i s t   t h e L i s t )   w i t h   p r o p e r t i e s   { n a m e : t h e T i t l e ,   b o d y : t h e T e x t ,   d u e   d a t e : d u e D a t e T i m e D ,   r e m i n d   m e   d a t e : r e m i n d D a t e T i m e D }� ��� I   (�����
�� .corecrel****      � null��  � ����
�� 
kocl� m    ��
�� 
remi� ����
�� 
insh� n    ���  ;    � l   ������ 4    ���
�� 
list� o    ���� 0 thelist theList��  ��  � �����
�� 
prdt� K    $�� ����
�� 
pnam� o    ���� 0 thetitle theTitle� ����
�� 
body� o     ���� 0 thetext theText� �� ��
�� 
rmdt  o   ! "���� "0 reminddatetimed remindDateTimeD��  ��  � �� l  ) )����    end try    �  e n d   t r y��  � m     �                                                                                  rmnd  alis    X  Macintosh HD               Η��H+     OReminders.app                                                   f%ͭ��        ����  	                Applications    Η��      ͭ�{       O  (Macintosh HD:Applications: Reminders.app    R e m i n d e r s . a p p    M a c i n t o s h   H D  Applications/Reminders.app  / ��  ��  �  l     ��������  ��  ��   	 l     ��
��  
 D > http://www.macosxautomation.com/applescript/sbrt/sbrt-06.html    � |   h t t p : / / w w w . m a c o s x a u t o m a t i o n . c o m / a p p l e s c r i p t / s b r t / s b r t - 0 6 . h t m l	 �� i     I      ������ 0 	trim_line    o      ���� 0 	this_text    o      ���� 0 
trim_chars   �� o      ���� 0 trim_indicator  ��  ��   k     {  l     ����   ' ! 0 = beginning, 1 = end, 2 = both    � B   0   =   b e g i n n i n g ,   1   =   e n d ,   2   =   b o t h  r      l     ����  n     !"! 1    ��
�� 
leng" l    #����# o     ���� 0 
trim_chars  ��  ��  ��  ��   o      ���� 0 x   $%$ l   ��&'��  &   TRIM BEGINNING   ' �((    T R I M   B E G I N N I N G% )*) Z    >+,����+ E   -.- J    
// 010 m    ����  1 2��2 m    ���� ��  . l  
 3����3 o   
 ���� 0 trim_indicator  ��  ��  , V    :454 Q    56786 r    +9:9 c    );<; n    '=>= 7   '��?@
�� 
cha ? l   #A����A [    #BCB o     !���� 0 x  C m   ! "���� ��  ��  @ m   $ &������> o    ���� 0 	this_text  < m   ' (��
�� 
TEXT: o      ���� 0 	this_text  7 R      ������
�� .ascrerr ****      � ****��  ��  8 k   3 5DD EFE l  3 3��GH��  G 8 2 the text contains nothing but the trim characters   H �II d   t h e   t e x t   c o n t a i n s   n o t h i n g   b u t   t h e   t r i m   c h a r a c t e r sF J��J L   3 5KK m   3 4LL �MM  ��  5 C   NON o    ���� 0 	this_text  O l   P����P o    ���� 0 
trim_chars  ��  ��  ��  ��  * QRQ l  ? ?��ST��  S   TRIM ENDING   T �UU    T R I M   E N D I N GR VWV Z   ? xXY����X E  ? EZ[Z J   ? C\\ ]^] m   ? @���� ^ _��_ m   @ A���� ��  [ l  C D`����` o   C D���� 0 trim_indicator  ��  ��  Y V   H taba Q   P ocdec r   S efgf c   S chih n   S ajkj 7  T a��lm
�� 
cha l m   X Z���� m d   [ `nn l  \ _o����o [   \ _pqp o   \ ]���� 0 x  q m   ] ^���� ��  ��  k o   S T���� 0 	this_text  i m   a b��
�� 
TEXTg o      ���� 0 	this_text  d R      �����
�� .ascrerr ****      � ****��  �  e k   m orr sts l  m m�~uv�~  u 8 2 the text contains nothing but the trim characters   v �ww d   t h e   t e x t   c o n t a i n s   n o t h i n g   b u t   t h e   t r i m   c h a r a c t e r st x�}x L   m oyy m   m nzz �{{  �}  b D   L O|}| o   L M�|�| 0 	this_text  } l  M N~�{�z~ o   M N�y�y 0 
trim_chars  �{  �z  ��  ��  W �x L   y {�� o   y z�w�w 0 	this_text  �x  ��       �v������v  � �u�t�s�r
�u .aevtoappnull  �   � ****�t *0 getdatetimefromtext getDateTimeFromText�s  0 createreminder createReminder�r 0 	trim_line  � �q �p�o���n
�q .aevtoappnull  �   � ****�p 0 argv  �o  � �m�l�m 0 argv  �l 0 arg  � �k�j�i )�h�g 8�f�e�d P R�c h w � ��b�a ��` ��_
�k .corecnte****       ****�j 
�i 
cobj�h 0 	trim_line  �g 0 thetitle theTitle�f 0 thetext theText�e 0 thelist theList�d  0 reminddatetime remindDateTime�c �b 0 cmdline  
�a 
kocl
�` 
ctxt�_  0 createreminder createReminder�n Ǡj  �  6*��k/�lm+ E�O*��l/�lm+ E�O��m/E�O���/E�O��%�%E�Y ~�j  �  5*��k/�lm+ E�O*��l/�lm+ E�O��m/E�O���/�%���/%E�Y Aa E` O #�[a �l  kh _ a %�%E` [OY��O�j  a &a %_ %O*�����+ OP� �^ ��]�\���[�^ *0 getdatetimefromtext getDateTimeFromText�] �Z��Z �  �Y�Y 0 
indatetime 
inDateTime�\  � 	�X�W�V�U�T�S�R�Q�P�X 0 
indatetime 
inDateTime�W 0 vdate vDate�V 0 timetext timeText�U 0 datetext dateText�T 0 vyear vYear�S 0 vmonth vMonth�R 0 vday vDay�Q 0 vhour vHour�P 0 vminute vMinute� �O ��N�M�L�K �J�I�H�G�F�E�D�C�B�As�@�?�>
�O 
null
�N 
ascr
�M 
txdl
�L 
citm
�K .corecnte****       ****�J��I 
�H 
bool�G  
�F .misccurdldt    ��� null
�E 
long
�D 
year
�C 
mnth
�B 
day 
�A 
time�@ �? <�>�[�E�O�E�O�kv��,FO��k/E�O��-j k ��l/E�Y hO�kv��,FO��,j m  k��k/E�O��l/E�O��m/E�O��	 �j	 ���&�&	 �j	 ���&�& ,*j E�O��&��,FO��&��,FO��&��,FOj�a ,FY hY hO�� ha kv��,FO��,j l  N��k/E�O��l/E�O�j	 	�a �&	 �j	 	�a �&�& a ��& a ��& �a ,FY hY hY hO�� �=��<�;���:�=  0 createreminder createReminder�< �9��9 �  �8�7�6�5�8 0 thetitle theTitle�7 0 thetext theText�6 0 thelist theList�5  0 reminddatetime remindDateTime�;  � �4�3�2�1�0�4 0 thetitle theTitle�3 0 thetext theText�2 0 thelist theList�1  0 reminddatetime remindDateTime�0 "0 reminddatetimed remindDateTimeD� �/�.�-�,�+�*�)�(�'�&�%�/ *0 getdatetimefromtext getDateTimeFromText
�. 
kocl
�- 
remi
�, 
insh
�+ 
list
�* 
prdt
�) 
pnam
�( 
body
�' 
rmdt�& 
�% .corecrel****      � null�: ,� () 
*�k+ E�UO*���*�/6������ OPU� �$�#�"���!�$ 0 	trim_line  �# � ��  �  ���� 0 	this_text  � 0 
trim_chars  � 0 trim_indicator  �"  � ����� 0 	this_text  � 0 
trim_chars  � 0 trim_indicator  � 0 x  � �����Lz
� 
leng
� 
cha 
� 
TEXT�  �  �! |��,E�Ojllv� 0 *h�� �[�\[Z�k\Zi2�&E�W 	X  �[OY��Y hOkllv� 1 +h�� �[�\[Zk\Z�k'2�&E�W 	X  �[OY��Y hO� ascr  ��ޭ