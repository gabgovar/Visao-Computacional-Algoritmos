%Função para corrigir defeitos como "FUROS" na figura devido a brilho ou
%areas mais claras que a media
%
% SINTAXE: imgB = f_tapaburaco(imgA)
%
%   imgB
%           Nova imagem com a figura corrigida
%   imgA
%           Imagem original com a figura no qual quer corrigir
%
%   [INICIO DO ALGORITMO DE TAPAR FUROS]

function B = f_tapaburaco(A)

[L,C] = size(A);

%Cria imagem de bordas
Ba = A; %Passo anterior da interação da dilatação
Bp = A; %Passo anterior da interação da dilatação

%Transforma Ba em branco e Bp branco com fina borda preta
for J=1:c
    for I=1:L
        if ((J==1) | (I==1) | (J==I));
            Bp(I,J)=0;
        else
            Bp(I,J)=255;
        end
        Ba(I,J)=255;
    end
end

%inverte imagem
for J=1:C;
    for I=1:L;
        if A(I,J)==255;
            A(I,J)=0;
        else
            A(I,J)=255;
        end
    end
end

%loop de preenchimento
x=1
while x ==1;
    Ba=Bp;
    x=0;
    
%Dilatação
for J=1:C-1;
    for I=2:L-1;
        if Ba(I,J)==255;
            if ((Ba(I-1,J-1)==0) |(Ba(I-1,J)==0) | (Ba(I-1,J+1)==0) | Ba(I,J-1)==0) |Ba(I,J+1)==0) | Ba(I+1,J-1)==0) | Ba(I+1,J)==0) | Ba(I+1,J+1)==0));
                Bp(I,J)=0;
            end
        end
    end
end

%intercessão
for J=1:C;
    for I=1:L;
        if ( (A(I,J)==0) & (Bp(I,J)==0) );
            Bp(I,J)=0;
        else
            Bp(I,J)=255;
        end
    end
end

%verificar e houve mudanças
for J=1:C;
    for I=1:L;
        if Ba(I,J) ~= Bp(I,J);
            x=1;
        end
    end
end
end %fim do while

B = Bp; %Cria uma nova imagem a partir de Bp

%iverte a nova imagem
for J=1:C;
    for I=1:L;
        if B(I,J)==255;
            B(I,J)=0;
        else
            B(I,J)=255;
        end
    end
end

% [FINAL DO ALGORITMO]
  
            
            
            
