% Função para remover pontos indesejados que aparecem na imagem apos a
% limiazação (Ruidos) funciona baseando em apagar todos os grupos de pixels
% cuja quantidade de pixels for inferior ao fator de corte
%
%SINTAXE: limparuido(Imagem,FatordeCorte)
%
%   Imagem
%           matriz com a imagem limiarizada e com o ruido
%   FatordeCorte
%           Valor do numero de pixels abaixo do qual um aglomerado de
%           pixels e considerado uma falha na imagem
%
% [INICIO DO ALGOTIMO PARA LIMPAR RUIDOS]

function IMG = f_limparuido(IMG,FatordeCorte)

w1 = waitbar(0,'faendo ajustes na imagem - Removendo Ruidos...'); %abre a barra indicadora de progresso

TotLin = size(IMG,1); %numero de linhas de matriz img
TotCol = size (IMG,2); %numero de colunas da matriz img 

IMG = double(IMG);

%"Pinta" cada figura em preto como uma "cor"
w=0;
Cor=1001;
SubObj = [0,0];
for l = 1:TotLin;
    for c = 1:TotCol;
        if IMG(l,c) == 0;
            [IMG TotPix] = f_preenche(IMG, Cor, [l,c]);
%cria a matriz com o indice de cada furo e sua respectiva cor
        EsteSubObj = [Cor,TotPix];
        if SubObj(1,1) == 0;
            SubObj = EsteSubObj;
            elseSubObj = [SubObj ; EsteSubObj];
        end
        Cor = Cor + 1;
        end
    end
    w=w+1
    waitbar(w/(2*TotLin),w1); %Altera a barra indicadora
end
clear TotPix
clear EsteSubObj
clear cor
for l = 1:TotLin;
    for c = 1:TotCol;
        if IMG (l,c) > 1000;
            if SubObj (IMG(l,c) - 1000,2) <= FatordeCorte
                IMG(l,c) = 255;
            else
                IMG(l,c) = 0;
            end
        elseif IMG (l,c) < -1000;
            if SubObj((IMG(l,c) .*-1) -1000,2) <= FatordeCorte
                IMG(l,c)=0;
            else
                IMG(l,c)=255;
            end
        end
    end
    w=w+1;
    waitbar(l/Altura,w1); %Altera a barra indicadora
end
close(w1); %fecha a barra indicadora de progresso
clear w1
clear w

clear TotLin
clear TotCol
clear FatordeCorte
clear SubObj
clear l
clear c
% [FINAL DO ALGORITMO PARA LIMPAR RUIDOS]