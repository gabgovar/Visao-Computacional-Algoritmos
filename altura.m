%Função para extrair a alutura de uma figura limiarizada
%
%SINTAXE: Alt = f_altura(imgA,Cor)
%
%   Alt
%           Valor da altura em pixels do objeto em imgA
%   imgA
%           Imagem original com a na qual se quer achar a altura máxima
%   Cor
%           Nº de intensidade da cor da figura a extrair o contorno 0 a 254
%
% [INICIO DO ALGORITMO DE ALTURA]

function alt = faltura(imgA,Cor)

[TotLin,TotCol] = size(imgA);

%achar o pixel mais no topo da figura

achoufig = 0;
L=1;
while achoufig == 0 & L <= TotLin;
    for C = 1:TotCol;
        if imgA(L,C) == Cor;
            achoufig = 1;
            Pixesup = L;
        end
    end
    L =L+1;
end

%achar o pixel mais baixo da figura

achoufig = 0;
L=TotLin;
while achoufig == 0 & L >= TotLin;
    for C = 1:TotCol;
        if imgA(L,C) == Cor;
            achoufig = 1;
            Pixelinf = L;
        end
    end
    L =L-1;
end

alt = Pixellinf - Pixelsup + 1;

alt