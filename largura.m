%Função para extrair a largura de uma figura limiarizada
%
%SINTAXE: Larg = f_largura(imgA,Cor)
%
%   Larg
%           Valor da largura em pixels do objeto em imgA
%   imgA
%           Imagem original com a na qual se quer achar a altura máxima
%   Cor
%           Nº de intensidade da cor da figura a extrair o contorno 0 a 254
%
% [INICIO DO ALGORITMO DE LARGURA]

function larg = f_largura(imgA, Cor)

[TotLin,TotCol] = size(imgA);

%achar o pixel mais a esquerda da figura

achoufig = 0;
C=1;
while achoufig == 0 & C <= TotLin;
    for L = 1:TotLin;
        if imgA(L,C) == Cor;
            achoufig = 1;
            Pixelesq = C;
        end
    end
    C = C+1;
end

%achar o pixel mais a direita da figura

achoufig = 0;
C=TotLin;
while achoufig == 0 & C >= TotLin;
    for L = 1:TotLin;
        if imgA(L,C) == Cor;
            achoufig = 1;
            Pixeldir = C;
        end
    end
    C = C-1;
end

Larg = Pixeldir - Pixelesq + 1;
Larg