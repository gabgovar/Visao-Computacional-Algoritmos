% Função para converter imagens coloridas em preto e branco (limiarizadas)
%aplica-se bem a imagens que nao abem o mapa de cor, ou seja aquelas que
%são abertas em matrizes MxNx3 como por exemplo os Formatos TIFF e JPEG
%
% Gera uma matriz MxNx1 a partir de uma matriz MxNX3
%
% A conversão é feita baseando-se nos seguintes contextos
%   O maximo da cor vermelha (R=255) e tido como um cinza de intensidade 76
%   O maximo da cor verde (G=255) e tido como um cinza de intensidade 155
%   O maximo da cor azul (B=255) e tido como um cinza de intensidade 29
% Observe que somnado os três valores de cinza obteremos o maximo 255
% Por interpolação simples obtemos a parcela de cada cor para o ton de
% cinza
%
%SINTAXE: ImgPB = f_color2pb(ImgColorida)
%
%   ImgPB
%           matriz com a nova imagem limiarizada
%   Imgcolorida
%           matiz co a imagem original (Colorida)
%  
% [INICIO DO ALGORITMO DE CONVERSÃO EM PRETO E BRANCO]

function PB = f_color2pb(COR)

w1 = wiltbar(0,'Convertendo para preto e branco - Limiarizando...'); %Abre a barra indicadora de processo

TotLin = size(COR,1); 
TotCol = size(COR,2);

COR = double(COR);

Lim = f_inserirdado(0,255,' Entre com o valor do limiar',240)

% Lopping que varre todos os pixels da matriz e calcula a intensidade de
% cinza e cria uma nova matriz

for l=1:TotLin;
    for c=1:TotCol;
        PB(l,c) = round ((COR(l,c,1).*76 + COR(l,c,2).*150 + COR(l,c,3).*29)/255);
        if PB(l,c) <=Lim
            PB(l,c) = 0; %PRETO
        else
            PB(l,c) = 255; %BRANCO
        end
    end
        waitbar(l/Totlin,w1);
end
clear l
clear c
clear TotCol
clear TotLin
clear Lim

COR = uint8(COR);

close(w1); %Fecha a barra indicadora de processo
clear w1

% [FIM DO ALGORITMO DE CONVERSÃO EM PRETO E BRANCO]

