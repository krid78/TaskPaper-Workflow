JsOsaDAS1.001.00bplist00�Vscripto / * ! / u s r / b i n / e n v   o s a s c r i p t   - l   J a v a S c r i p t 
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
   *   F i l e                     :     @ F I L E _ E X T @ 
   *   A u t h o r ( s )           :     D a n i e l   K r i e s t e n 
   *   E m a i l                   :     d a n i e l @ d i e - k r i e s t e n s . d e 
   *   C r e a t i o n   D a t e   :     S o   2 0   M � r   1 6 : 5 1 : 2 2   2 0 1 6 
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
   *   C h e c k   i f   T a s k P a p e r   i s   r u n n i n g   a n d   t e l l   i t   t o   s a v e   a l l   o p e n   d o c u m e n t s . 
   * / 
 ( f u n c t i o n   ( )   { 
         ' u s e   s t r i c t ' ; 
 
         / * *   C h e c k   i f   T a s k P a p e r 3   i s   r u n n i n g 
         *   c o d e   f r o m :   h t t p s : / / g i t h u b . c o m / d t i n t h / J X A - C o o k b o o k / w i k i / G e t t i n g - t h e - A p p l i c a t i o n - I n s t a n c e 
         * / 
         f u n c t i o n   t p C h e c k I f R u n n i n g ( )   { 
                 O b j C . i m p o r t ( ' s t d l i b ' ) 
                 O b j C . i m p o r t ( ' A p p K i t ' ) 
                 v a r   i s R u n n i n g   =   f a l s e 
                 v a r   a p p s   =   $ . N S W o r k s p a c e . s h a r e d W o r k s p a c e . r u n n i n g A p p l i c a t i o n s   / /   N o t e   t h e s e   n e v e r   t a k e   ( )   u n l e s s   t h e y   h a v e   a r g u m e n t s 
                 a p p s   =   O b j C . u n w r a p ( a p p s )   / /   U n w r a p   t h e   N S A r r a y   i n s t a n c e   t o   a   n o r m a l   J S   a r r a y 
                 v a r   a p p 
                 f o r   ( v a r   i   =   0 ,   j   =   a p p s . l e n g t h ;   i   <   j ;   i + + )   { 
                         a p p   =   a p p s [ i ] 
 
                         / /   S o m e   a p p l i c a t i o n s   d o   n o t   h a v e   a   b u n d l e I d e n t i f i e r   a s   a n   N S S t r i n g 
                         i f   ( t y p e o f   a p p . b u n d l e I d e n t i f i e r . i s E q u a l T o S t r i n g   = = =   ' u n d e f i n e d ' )   { 
                                 c o n t i n u e ; 
                         } 
 
                         i f   ( a p p . b u n d l e I d e n t i f i e r . i s E q u a l T o S t r i n g ( ' c o m . h o g b a y s o f t w a r e . T a s k P a p e r 3 ' ) )   { 
                                 i s R u n n i n g   =   t r u e ; 
                                 b r e a k ; 
                         } 
                 } 
 
                 i f   ( i s R u n n i n g )   { 
                         c o n s o l e . l o g ( ' T a s k P a p e r 3   i s   r u n n i n g ! ' ) ; 
                         r e t u r n   t r u e ; 
                 } 
 
                 c o n s o l e . l o g ( ' T a s k P a p e r 3   i s   n o t   r u n n i n g ! ' ) ; 
                 r e t u r n   f a l s e ; 
         } 
 
         i f   ( t p C h e c k I f R u n n i n g ( ) )   { 
                 v a r   t a s k p a p e r   =   A p p l i c a t i o n ( ' c o m . h o g b a y s o f t w a r e . T a s k P a p e r 3 ' ) ; 
                 v a r   d o c u m e n t s   =   t a s k p a p e r . d o c u m e n t s ; 
 
                 f o r   ( v a r   i   =   0 ,   j   =   d o c u m e n t s . l e n g t h ;   i   <   j ;   i + + )   { 
                         c o n s o l e . l o g ( ' S a v i n g   d o c u m e n t   N o .   '   +   i ) ; 
                         v a r   d   =   d o c u m e n t s [ i ] ; 
                         d . s a v e ( ) ; 
                 } 
                 r e t u r n   t r u e ; 
         } 
 
         r e t u r n   f a l s e ; 
 
 } ) ( ) ; 
 
 / *   v i m :   t s = 4 : s w = 4 : s t s = 4 : t w = 1 2 0 : f i l e f o r m a t = u n i x 
   *   v i m :   c o m m e n t s &   c o m m e n t s + = b \ : *   f o r m a t o p t i o n s &   f o r m a t o p t i o n s + = o r 
   * /                              Rjscr  ��ޭ