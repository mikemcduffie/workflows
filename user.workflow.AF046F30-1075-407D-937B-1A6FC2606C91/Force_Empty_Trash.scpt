FasdUAS 1.101.10   ��   ��    k             l     ����  r       	  m      
 
 �     	 o      ���� 0 trashcontents  ��  ��        l    ����  O       r        n        1    ��
�� 
psxp  l    ����  c        n        1    ��
�� 
pare  l    ����  I   �� ��
�� .earsffdralis        afdr   f    	��  ��  ��    m    ��
�� 
TEXT��  ��    o      ���� 
0 mypath    m      �                                                                                  MACS  alis    x  Macintosh SSD              �7��H+  V��
Finder.app                                                     X� �_�        ����  	                CoreServices    �8W_      �`D    V��V��V��  7Macintosh SSD:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    M a c i n t o s h   S S D  &System/Library/CoreServices/Finder.app  / ��  ��  ��        l    ����  r       !   n     " # " 1    ��
�� 
psxp # o    ���� 
0 mypath   ! o      ���� 
0 mypath  ��  ��     $ % $ l     ��������  ��  ��   %  & ' & l   > (���� ( Q    > ) *�� ) k     5 + +  , - , r     ) . / . n     ' 0 1 0 1   % '��
�� 
strq 1 l    % 2���� 2 I    %�� 3��
�� .sysoexecTEXT���     TEXT 3 m     ! 4 4 � 5 5 � l s   / V o l u m e s / * / . T r a s h e s / *   2 > & 1   |   g r e p   - v   ' N o   s u c h   f i l e   o r   d i r e c t o r y '��  ��  ��   / o      ���� 0 trashcontents   -  6�� 6 r   * 5 7 8 7 b   * 3 9 : 9 o   * +���� 0 trashcontents   : n   + 2 ; < ; 1   0 2��
�� 
strq < l  + 0 =���� = I  + 0�� >��
�� .sysoexecTEXT���     TEXT > m   + , ? ? � @ @ d l s   ~ / . T r a s h /   |   g r e p   - v   ' N o   s u c h   f i l e   o r   d i r e c t o r y '��  ��  ��   8 o      ���� 0 trashcontents  ��   * R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��   '  A B A l     ��������  ��  ��   B  C D C l  ? D E���� E r   ? D F G F c   ? B H I H o   ? @���� 0 trashcontents   I m   @ A��
�� 
TEXT G o      ���� 0 trashcontents  ��  ��   D  J�� J l  E w K���� K Z   E w L M�� N L B  E J O P O n   E H Q R Q 1   F H��
�� 
leng R o   E F���� 0 trashcontents   P m   H I����   M l  M V S T U S k   M V V V  W X W l  M M�� Y Z��   Y ~ xdisplay dialog "Trash is empty." & return & "Contents: " & trashcontents & return & "Length: " & length of trashcontents    Z � [ [ � d i s p l a y   d i a l o g   " T r a s h   i s   e m p t y . "   &   r e t u r n   &   " C o n t e n t s :   "   &   t r a s h c o n t e n t s   &   r e t u r n   &   " L e n g t h :   "   &   l e n g t h   o f   t r a s h c o n t e n t s X  \ ] \ l  M M��������  ��  ��   ]  ^ _ ^ l  M M�� ` a��   ` I C Applescript notifications not working in scpt launched from alfred    a � b b �   A p p l e s c r i p t   n o t i f i c a t i o n s   n o t   w o r k i n g   i n   s c p t   l a u n c h e d   f r o m   a l f r e d _  c d c l  M M�� e f��   e * $set variableWithSoundName to "Basso"    f � g g H s e t   v a r i a b l e W i t h S o u n d N a m e   t o   " B a s s o " d  h i h l  M M�� j k��   j t ndisplay notification "Trash is already empty." with title "Force Empty Trash" sound name variableWithSoundName    k � l l � d i s p l a y   n o t i f i c a t i o n   " T r a s h   i s   a l r e a d y   e m p t y . "   w i t h   t i t l e   " F o r c e   E m p t y   T r a s h "   s o u n d   n a m e   v a r i a b l e W i t h S o u n d N a m e i  m n m l  M M��������  ��  ��   n  o�� o I  M V�� p��
�� .sysoexecTEXT���     TEXT p b   M R q r q n   M P s t s 1   N P��
�� 
strq t o   M N���� 
0 mypath   r m   P Q u u � v v � / t e r m i n a l - n o t i f i e r   - t i t l e   ' F o r c e   E m p t y   T r a s h '   - m e s s a g e   ' T r a s h   i s   a l r e a d y   e m p t y . '   - s o u n d   ' B a s s o '   - s e n d e r   ' c o m . a p p l e . f i n d e r '��  ��   T ) # checking for "" didn't always work    U � w w F   c h e c k i n g   f o r   " "   d i d n ' t   a l w a y s   w o r k��   N k   Y w x x  y z y l  Y Y�� { |��   { � |display dialog "Trash is NOT empty." & return & "Contents: " & trashcontents & return & "Length: " & length of trashcontents    | � } } � d i s p l a y   d i a l o g   " T r a s h   i s   N O T   e m p t y . "   &   r e t u r n   &   " C o n t e n t s :   "   &   t r a s h c o n t e n t s   &   r e t u r n   &   " L e n g t h :   "   &   l e n g t h   o f   t r a s h c o n t e n t s z  ~  ~ l  Y Y�� � ���   � * $set myPath to (path to me as string)    � � � � H s e t   m y P a t h   t o   ( p a t h   t o   m e   a s   s t r i n g )   ��� � O   Y w � � � k   _ v � �  � � � I  _ d������
�� .miscactvnull��� ��� null��  ��   �  ��� � I  e v�� � �
�� .sysoexecTEXT���     TEXT � b   e n � � � b   e j � � � m   e h � � � � � � s u d o   r m   - r f v   / V o l u m e s / * / . T r a s h e s ;   s u d o   r m   - r f v   ~ / . T r a s h ;   a f p l a y   ' � o   h i���� 
0 mypath   � m   j m � � � � � " / e m p t y   t r a s h . a i f ' � �� ���
�� 
badm � m   q r��
�� boovtrue��  ��   � m   Y \��
�� misccura��  ��  ��  ��       �� � � 
 �����   � ��������
�� .aevtoappnull  �   � ****�� 0 trashcontents  �� 
0 mypath  ��   � �� ����� � ���
�� .aevtoappnull  �   � **** � k     w � �   � �   � �   � �  & � �  C � �  J����  ��  ��   �   �  
�� ���������� 4���� ?������ u���� � ����� 0 trashcontents  
�� .earsffdralis        afdr
�� 
pare
�� 
TEXT
�� 
psxp�� 
0 mypath  
�� .sysoexecTEXT���     TEXT
�� 
strq��  ��  
�� 
leng
�� misccura
�� .miscactvnull��� ��� null
�� 
badm�� x�E�O� )j �,�&�,E�UO��,E�O �j 	�,E�O��j 	�,%E�W X  hO��&E�O��,j ��,�%j 	Y  a  *j Oa �%a %a el 	U � � � �, / U s e r s / m i k e m c d u f f i e / D r o p b o x / A p p l i c a t i o n   S u p p o r t / A l f r e d   v 2   P r e f s / A l f r e d . a l f r e d p r e f e r e n c e s / w o r k f l o w s / u s e r . w o r k f l o w . A F 0 4 6 F 3 0 - 1 0 7 5 - 4 0 7 D - 9 3 7 B - 1 A 6 F C 2 6 0 6 C 9 1 /��  ascr  ��ޭ