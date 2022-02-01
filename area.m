%Função para extrair a área de uma figura limiarizada
%
%SINTAXE: Area = f_area(imgA,cor)
%
%   AREA
%           Valor da área em pixels do objeto em imgA
%   imgA
%           Imagem original com a figura no qual deseja retirar as caracteristcas 
%   Cor
%           Nº de intensidade da cor da figura a extrair o contorno 0 a 254
%
% [INICIO DO ALGORITMO DA ÁREA]

function a = f_area(imgA,0)
[TotLin,TotCol] = size(imgA);
a=0;
for L=1:TotLin;
    for C=1:TotCol;
        if imgA(L,C) == Cor;
            a = a + 1;
        end
    end
end

