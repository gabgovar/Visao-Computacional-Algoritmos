%Função para extrair o perimetro de uma figura limiarizada em imgA e que
%tenha intensidade de cor definida
%
%SINTAXE: Perim = f_perimotro(imgA, Cor)
%
%   Perim
%           Valor do perimetro em pixels do objeto em imgA
%   Cor
%           Nº de intensidade da cor da figura a extair 0 a 254
%
%[INICIO DO ALGORITMO DE CALCULO DE PERIMETRO]

function perimetro = f_perimetro(imgA, Cor)

[TotLin,TotCol] = size(imgA);

Perimetro = 0;
for L=1:TotLin;
    for C=1:TotCol;
        if imgA(L,C) == Cor;
            if imgA(L-1,C)==255;
            perimetro = perimetro + 1;
            end
            if imgA(L+1,C)==255;
            perimetro = perimetro + 1;
            end
            if imgA(L,C-1)==255;
            perimetro = perimetro + 1;
            end
            if imgA(L,C+1)==255;
            perimetro = perimetro + 1;
            end
        end
    end
end
Perimetro
        
           