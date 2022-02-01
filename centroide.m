%Função para extrair o centroide de uma figura limiarizada
%
%Os valores de x e y do centroide estão em relção ao canto superior
%esquerdo da imagem
%
%SINTAXE: Resp = f_centroide(imgA,Cor,Tipo)
%
%   Resp
%           Valores x e y do centroide da figura
%   imgA
%           Imagem original com a na qual se quer achar a altura máxima
%   Cor
%           Nº de intensidade da cor da figura a extrair o contorno 0 a 254
%   Tipo
%           Forma que será dada a resposta se Tipo = 1 resp sera dado como
%           valor inteiro se no o valor será decimal
%
% [INICIO DO ALGORITMO DE CENTROIDE]

function Resp = f_centroide(imgA,Cor,Tipo)

[TotLin,TotCol] = size(imgA);
arealtotal = 0;
Xtot = 0;
YTot = 0;
for L=1:TotLin;
    for C=1:TotCol;
        if imgA(L,C) == Cor;
            x = C - 0.5;
            y = L - 0.5;
            Xtot = Xtot + x;
            Ytot = Ytot + y;
            areatotal = areatotal + 1;
        end
    end
end
Centrcalc = [Xtot / areatotal, Ytot/ arealtotal];
centrpixel = [ceil(centrcalc(1,1)),ceil(centrcalc(1,2))];

if Tipo == 1
    Resp = Centrpixel;
else
    Resp = Centrcalc;
end
