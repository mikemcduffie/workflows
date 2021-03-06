FasdUAS 1.101.10   ��   ��    k             l      ��  ��   *$

Sending Images via iMessage with AppleScript
https://discussions.apple.com/thread/5007228?tstart=0

Applescript: Mail this selcted item
https://brooksreview.net/2012/12/km-mail-file/

In Safari, this copies the Title and URL of the current tab to the clipboard.  
-- Save the script in ~/Library/Scripts/Applications/Safari
-- Using QuickSilver, I assign a trigger to this script using the hotkey ?-C (option c), with the scope of the trigger limited to Safari.
-- Inspired by CopyURL + (http://copyurlplus.mozdev.org/)
-- Christopher R. Murphy 
     � 	 	H 
 
 S e n d i n g   I m a g e s   v i a   i M e s s a g e   w i t h   A p p l e S c r i p t 
 h t t p s : / / d i s c u s s i o n s . a p p l e . c o m / t h r e a d / 5 0 0 7 2 2 8 ? t s t a r t = 0 
 
 A p p l e s c r i p t :   M a i l   t h i s   s e l c t e d   i t e m 
 h t t p s : / / b r o o k s r e v i e w . n e t / 2 0 1 2 / 1 2 / k m - m a i l - f i l e / 
 
 I n   S a f a r i ,   t h i s   c o p i e s   t h e   T i t l e   a n d   U R L   o f   t h e   c u r r e n t   t a b   t o   t h e   c l i p b o a r d .     
 - -   S a v e   t h e   s c r i p t   i n   ~ / L i b r a r y / S c r i p t s / A p p l i c a t i o n s / S a f a r i 
 - -   U s i n g   Q u i c k S i l v e r ,   I   a s s i g n   a   t r i g g e r   t o   t h i s   s c r i p t   u s i n g   t h e   h o t k e y  #% - C   ( o p t i o n   c ) ,   w i t h   t h e   s c o p e   o f   t h e   t r i g g e r   l i m i t e d   t o   S a f a r i . 
 - -   I n s p i r e d   b y   C o p y U R L   +   ( h t t p : / / c o p y u r l p l u s . m o z d e v . o r g / ) 
 - -   C h r i s t o p h e r   R .   M u r p h y   
   
  
 l     ��������  ��  ��        l     ����  O         k           r        6       4  �� 
�� 
icsv  m    ����   =   	     1   
 ��
�� 
styp  m    ��
�� stypsims  o      ���� 0 	myservice 	myService   ��  r        n        4    ��  
�� 
pres   m     ! ! � " " ( m a r i e m c d u f f i e @ m e . c o m  o    ���� 0 	myservice 	myService  o      ���� 0 mybuddy myBuddy��    m      # #�                                                                                  fez!  alis    X  Yosemite Beta              �J"�H+   �Messages.app                                                    x�͊�        ����  	                Applications    �J�%      ���?     �  (Yosemite Beta:Applications: Messages.app    M e s s a g e s . a p p    Y o s e m i t e   B e t a  Applications/Messages.app   / ��  ��  ��     $ % $ l     ��������  ��  ��   %  & ' & l   2 (���� ( O   2 ) * ) r     1 + , + 6    / - . - n     & / 0 / 1   $ &��
�� 
pnam 0 4    $�� 1
�� 
prcs 1 m   " #����  . =  ' . 2 3 2 1   ( *��
�� 
pisf 3 m   + -��
�� boovtrue , o      ���� 0 frontapp frontApp * m     4 4�                                                                                  sevs  alis    �  Yosemite Beta              �J"�H+   ��System Events.app                                               �=�&sb        ����  	                CoreServices    �J�%      �&��     �� � �  >Yosemite Beta:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    Y o s e m i t e   B e t a  -System/Library/CoreServices/System Events.app   / ��  ��  ��   '  5 6 5 l     ��������  ��  ��   6  7 8 7 l  3 L 9 : ; 9 Z  3 L < =���� < G   3 @ > ? > l  3 6 @���� @ =   3 6 A B A o   3 4���� 0 frontapp frontApp B m   4 5 C C � D D $ A p p l e S c r i p t   E d i t o r��  ��   ? l  9 < E���� E =   9 < F G F o   9 :���� 0 frontapp frontApp G m   : ; H H � I I  S c r i p t   E d i t o r��  ��   = r   C H J K J m   C F L L � M M  S a f a r i K o      ���� 0 frontapp frontApp��  ��   : $  test mode w/ 10.10 editor ref    ; � N N <   t e s t   m o d e   w /   1 0 . 1 0   e d i t o r   r e f 8  O P O l     ��������  ��  ��   P  Q R Q l  M S���� S Z   M T U V�� T G   M ^ W X W l  M R Y���� Y =   M R Z [ Z o   M N���� 0 frontapp frontApp [ m   N Q \ \ � ] ]  S a f a r i��  ��   X l  U Z ^���� ^ =   U Z _ ` _ o   U V���� 0 frontapp frontApp ` m   V Y a a � b b  W e b k i t��  ��   U k   a � c c  d e d w   a � f g f O   e � h i h k   n � j j  k l k r   n | m n m n   n x o p o 1   t x��
�� 
pURL p 4  n t�� q
�� 
docu q m   r s����  n o      ���� 0 currenttaburl currentTabUrl l  r s r r   } � t u t n   } � v w v 1   � ���
�� 
pnam w 4  } ��� x
�� 
docu x m   � �����  u o      ���� "0 currenttabtitle currentTabTitle s  y�� y r   � � z { z l  � � |���� | I  � ��� } ~
�� .sfridojs****       utxt } m   � �   � � � & ( ' ' + g e t S e l e c t i o n ( ) ) ~ �� ���
�� 
dcnm � 4   � ��� �
�� 
docu � m   � ����� ��  ��  ��   { o      ���� 0 selectedtext selectedText��   i 4   e k�� �
�� 
capp � o   i j���� 0 frontapp frontApp g�                                                                                  sfri  alis    P  Yosemite Beta              �J"�H+   �
Safari.app                                                      ��_        ����  	                Applications    �J�%      �y�     �  &Yosemite Beta:Applications: Safari.app   
 S a f a r i . a p p    Y o s e m i t e   B e t a  Applications/Safari.app   / ��   e  � � � r   � � � � � c   � � � � � b   � � � � � b   � � � � � o   � ����� "0 currenttabtitle currentTabTitle � o   � ���
�� 
ret  � o   � ����� 0 currenttaburl currentTabUrl � m   � ���
�� 
TEXT � o      ���� 
0 mytext   �  ��� � O   � � � � � k   � � � �  � � � l  � ��� � ���   �  activate    � � � �  a c t i v a t e �  � � � I  � ��� � �
�� .ichtsendnull���     **** � o   � ����� 
0 mytext   � �� ���
�� 
TO   � o   � ����� 0 mybuddy myBuddy��   �  ��� � Z   � � � ��� � � =   � � � � � o   � ����� 0 selectedtext selectedText � m   � � � � � � �   � l  � � � � � � L   � � � � m   � � � � � � � F S a f a r i   T i t l e   &   U R L   s e n t   a s   m e s s a g e . � "  No text selected in browser    � � � � 8   N o   t e x t   s e l e c t e d   i n   b r o w s e r��   � k   � � � �  � � � I  � ��� � �
�� .ichtsendnull���     **** � o   � ����� 0 selectedtext selectedText � �� ���
�� 
TO   � o   � ����� 0 mybuddy myBuddy��   �  ��� � L   � � � � m   � � � � � � � b S a f a r i   T i t l e , U R L   &   s e l e c t e d   t e x t   s e n t   a s   m e s s a g e .��  ��   � m   � � � ��                                                                                  fez!  alis    X  Yosemite Beta              �J"�H+   �Messages.app                                                    x�͊�        ����  	                Applications    �J�%      ���?     �  (Yosemite Beta:Applications: Messages.app    M e s s a g e s . a p p    Y o s e m i t e   B e t a  Applications/Messages.app   / ��  ��   V  � � � G   � � � � G   � � � � � l  � � ����� � =   � � � � � o   � ����� 0 frontapp frontApp � m   � � � � � � �  G o o g l e   C h r o m e��  ��   � l  � � ����� � =   � � � � � o   � ����� 0 frontapp frontApp � m   � � � � � � � ( G o o g l e   C h r o m e   C a n a r y��  ��   � l  � ����� � =   � � � � o   � ����� 0 frontapp frontApp � m   � � � � � �  C h r o m i u m��  ��   �  � � � k  	o � �  � � � w  	D � � � k  D � �  � � � O ) � � � r  ( � � � n  $ � � � 1   $��
�� 
URL  � n    � � � 1   ��
�� 
acTa � 4 �� �
�� 
cwin � m  ����  � o      ���� 0 currenttaburl currentTabUrl � 4  �� �
�� 
capp � o  ���� 0 frontapp frontApp �  ��� � O *D � � � r  3C � � � n  3? � � � 1  =?��
�� 
pnam � n  3= � � � 1  9=��
�� 
acTa � 4 39�� �
�� 
cwin � m  78����  � o      ���� "0 currenttabtitle currentTabTitle � 4  *0�� �
�� 
capp � o  ./���� 0 frontapp frontApp��   ��                                                                                  rimZ  alis    �  Macintosh SSD              �7��H+  V�Google Chrome.app                                               �l�6��        ����  	                Applications    �8W_      �7Vo    V�  -Macintosh SSD:Applications: Google Chrome.app   $  G o o g l e   C h r o m e . a p p    M a c i n t o s h   S S D  /Applications/Google Chrome.app   /Volumes/Macintosh SSD��   �  � � � r  EX � � � c  ET � � � b  EP � � � b  EL � � � o  EH���� "0 currenttabtitle currentTabTitle � o  HK��
�� 
ret  � o  LO���� 0 currenttaburl currentTabUrl � m  PS��
�� 
TEXT � o      ���� 
0 mytext   �  ��� � O  Yo � � � k  ]n � �  � � � I ]b������
�� .miscactvnull��� ��� null��  ��   �  ��� � I cn�� � �
�� .ichtsendnull���     **** � o  cf���� 
0 mytext   � �� ��
�� 
TO   � o  ij�~�~ 0 mybuddy myBuddy�  ��   � m  YZ � ��                                                                                  fez!  alis    X  Yosemite Beta              �J"�H+   �Messages.app                                                    x�͊�        ����  	                Applications    �J�%      ���?     �  (Yosemite Beta:Applications: Messages.app    M e s s a g e s . a p p    Y o s e m i t e   B e t a  Applications/Messages.app   / ��  ��   �  �  � l rw�}�| =  rw o  rs�{�{ 0 frontapp frontApp m  sv �  F i n d e r�}  �|    �z O  z� k  ��		 

 l ���y�y   < 6 Make a list to gather the names of the selected files    � l   M a k e   a   l i s t   t o   g a t h e r   t h e   n a m e s   o f   t h e   s e l e c t e d   f i l e s  r  �� J  ���x�x   o      �w�w 0 filealiases fileAliases  l ���v�v   7 1 Get the selection of the frontmost Finder window    � b   G e t   t h e   s e l e c t i o n   o f   t h e   f r o n t m o s t   F i n d e r   w i n d o w  r  �� l ���u�t 1  ���s
�s 
sele�u  �t   o      �r�r 0 fileselection fileSelection  l ���q �q     Iterate of the selection     �!! 2   I t e r a t e   o f   t h e   s e l e c t i o n "#" X  ��$�p%$ s  ��&'& c  ��()( l ��*�o�n* o  ���m�m 0 fileitem fileItem�o  �n  ) m  ���l
�l 
alis' l     +�k�j+ n      ,-,  ;  ��- o  ���i�i 0 filealiases fileAliases�k  �j  �p 0 fileitem fileItem% o  ���h�h 0 fileselection fileSelection# ./. l ���g01�g  0 * $ Check if the selection is not empty   1 �22 H   C h e c k   i f   t h e   s e l e c t i o n   i s   n o t   e m p t y/ 3�f3 Z  ��45�e64 = ��787 l ��9�d�c9 n  ��:;: m  ���b
�b 
nmbr; n  ��<=< 2 ���a
�a 
cobj= o  ���`�` 0 filealiases fileAliases�d  �c  8 m  ���_�_  5 k  ��>> ?@? l ���^AB�^  A = 7 Audible feedback, so the script always does something.   B �CC n   A u d i b l e   f e e d b a c k ,   s o   t h e   s c r i p t   a l w a y s   d o e s   s o m e t h i n g .@ D�]D I ���\�[�Z
�\ .sysobeepnull��� ��� long�[  �Z  �]  �e  6 k  ��EE FGF O  ��HIH X  ��J�YKJ I ���XLM
�X .ichtsendnull���     ****L o  ���W�W 0 	filealias 	fileAliasM �VN�U
�V 
TO  N o  ���T�T 0 mybuddy myBuddy�U  �Y 0 	filealias 	fileAliasK o  ���S�S 0 filealiases fileAliasesI m  ��OO�                                                                                  fez!  alis    X  Yosemite Beta              �J"�H+   �Messages.app                                                    x�͊�        ����  	                Applications    �J�%      ���?     �  (Yosemite Beta:Applications: Messages.app    M e s s a g e s . a p p    Y o s e m i t e   B e t a  Applications/Messages.app   / ��  G P�RP L  ��QQ m  ��RR �SS 0 F i n d e r   i t e m s   a s   m e s s a g e .�R  �f   m  z}TT�                                                                                  MACS  alis    x  Yosemite Beta              �J"�H+   ��
Finder.app                                                      
<;�6�p        ����  	                CoreServices    �J�%      �7�     �� � �  7Yosemite Beta:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    Y o s e m i t e   B e t a  &System/Library/CoreServices/Finder.app  / ��  �z  ��  ��  ��   R U�QU l     �P�O�N�P  �O  �N  �Q       �MVW�M  V �L
�L .aevtoappnull  �   � ****W �KX�J�IYZ�H
�K .aevtoappnull  �   � ****X k    [[  \\  &]]  7^^  Q�G�G  �J  �I  Y �F�E�F 0 fileitem fileItem�E 0 	filealias 	fileAliasZ : #�D_�C�B�A�@ !�? 4�>�=�<�; C H�: L \ a g�9�8�7�6�5 �4�3�2�1�0�/�.�- � � � � � � ��,�+�*�)T�(�'�&�%�$�#�"�!� R
�D 
icsv_  
�C 
styp
�B stypsims�A 0 	myservice 	myService
�@ 
pres�? 0 mybuddy myBuddy
�> 
prcs
�= 
pnam
�< 
pisf�; 0 frontapp frontApp
�: 
bool
�9 
capp
�8 
docu
�7 
pURL�6 0 currenttaburl currentTabUrl�5 "0 currenttabtitle currentTabTitle
�4 
dcnm
�3 .sfridojs****       utxt�2 0 selectedtext selectedText
�1 
ret 
�0 
TEXT�/ 
0 mytext  
�. 
TO  
�- .ichtsendnull���     ****
�, 
cwin
�+ 
acTa
�* 
URL 
�) .miscactvnull��� ��� null�( 0 filealiases fileAliases
�' 
sele�& 0 fileselection fileSelection
�% 
kocl
�$ 
cobj
�# .corecnte****       ****
�" 
alis
�! 
nmbr
�  .sysobeepnull��� ��� long�H� *�k/�[�,\Z�81E�O���/E�UO� *�k/�,�[�,\Ze81E�UO�� 
 	�� a & 
a E�Y hO�a  
 �a  a & �a Z*a �/ 2*a k/a ,E` O*a k/�,E` Oa a *a k/l E` UO_ _ %_ %a &E`  O� /_  a !�l "O_ a #  	a $Y _ a !�l "Oa %UY�a & 
 �a ' a &
 �a ( a & ka )Z*a �/ *a *k/a +,a ,,E` UO*a �/ *a *k/a +,�,E` UO_ _ %_ %a &E`  O� *j -O_  a !�l "UY ��a .  �a / jvE` 0O*a 1,E` 2O $_ 2[a 3a 4l 5kh  �a 6&_ 06G[OY��O_ 0a 4-a 7,j  
*j 8Y 0� & #_ 0[a 3a 4l 5kh �a !�l "[OY��UOa 9UY hascr  ��ޭ