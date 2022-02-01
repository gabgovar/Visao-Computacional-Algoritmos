function   [m00,c,mus,I]= MomentosHu(img)
%F=imread('Hu15.bmp');
F=imread(img);
%format double 
m00=double(0);
m10=double(0);
m01=double(0);
mus=zeros(1,7);
%Momento de ordem zero e um
tamanho=size(F);      %Tamanho da figura
V=tamanho(1);         %Tamanho do eixo vertical   
H=tamanho(2);         %Tamanho do eixo Horizontal

for y=1:V
    linha=y;
   for x=1:H
       coluna=x;
       m00=double(m00 + F(linha,coluna));
       m10=double(m10 + (x*F(linha,coluna))); %p=1 q=0
       m01=double(m01 + (y*F(linha,coluna))); %p=0 q=1
   end
end
%m00
xm=double(m10/m00);
ym=double(m01/m00);
c=[xm ym];

%Momentos Centrais Normalizados
m11=double(0);   %p e q =1
m20=double(0);   %p=2 q=0
m02=double(0);   %p=0 q=2 
m12=double(0);   %p=1 e q=2
m21=double(0);   %p=2 e q=1
m30=double(0);   %p=3   q=0
m03=double(0);   %p=0   q=3  

for y=1:V
    linha=y;
    for x=1:H
        coluna=x;
        m20=double(m20 + ( ((x-xm)^2)* F(linha,coluna) ));
        m02=double(m02 + ( ((y-ym)^2)* F(linha,coluna) ));
        m11=double(m11 + ( ((x-xm) * (y-ym))* F(linha,coluna) ));
        m30=double(m30 + ( ((x-xm)^3)* F(linha,coluna) ));
        m03=double(m03 + ( ((y-ym)^3)* F(linha,coluna) ));
        m12=double(m12 + ( ((x-xm) * ( (y-ym)^2) )* F(linha,coluna) ));
        m21=double(m21 + ( ( ( (x-xm)^2 ) * (y-ym) )* F(linha,coluna) ));
      
    end
end
mus = [m20 m11 m02 m30 m21 m12 m03];
%O expoente gama é definido como ((p+q)/2)+1 e só assume dois valores
gama=double(2);
m00G=double(m00^2);
N20=double(m20/m00G);
N02=double(m02 /m00G);
N11=double(m11 /m00G);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gama=5/2;
m00G=double(m00^(5/2));
N30=double(m30 / m00G);
N03=double(m03 / m00G);
N12=double(m12 / m00G);
N21=double(m21 / m00G);

I=zeros(1,7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S1=(N30 + N12);
S2=(N21 + N03);
S3=(N30 - 3*N12);
S4=(N20 - N02);
S5=(3*N21 - N03);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S6 =( (S1^2) - (3*(S2^2))  );
S7 = ( (3*(S1^2)) - (S2^2) );
S8 = (S3*S1);
S9 = (S5*S2);
S10= (S5*S1);
S11= (S3*S2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I(1)= (N20 + N02);
I(2)= ( S4^2 ) +  ( (2*N11)^2 );
I(3)= ( S3^2 ) +  ( S5^2 );
I(4)= ( S1^2 ) +  ( S2^2 );
I(5)= ( S8 * S6) + (S9*S7);
I(6)= ( S4*((S1^2)-(S2^2)) ) + (4*N11*S1*S2);
I(7)= ( S10*S6 )+ (S11*S7);

I=abs(log(I));



