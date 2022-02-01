% Função para converter imagens coloridas em tons de cinza
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
%SINTAXE: ImgCinza = f_color2cinza(ImgColorida)
%
%   ImgCinza
%           matriz com a nova imagem em tons de cinza
%   Imgcolorida
%           matiz co a imagem original (Colorida)
%  
% [INICIO DO ALGORITMO DE TONS DE CINZA]

function PB = f_color2cinza(COR)

w1 = wiltbar(0,'Convertendo para preto e branco - Limiarizando...'); %Abre a barra indicadora de processo

TotLin = size(COR,1); 
TotCol = size(COR,2);

COR = double(COR);


% Lopping que varre todos os pixels da matriz e calcula a intensidade de
% cinza e cria uma nova matriz

for l=1:TotLin;
    for c=1:TotCol;
        CINZA(l,c) = round ((COR(l,c,1).*76 + COR(l,c,2).*150 + COR(l,c,3).*29)/255);
        %Cinza = (red*76 + Green*150 +Blue*29)/255  <---- Arredondando
    end
end

clear l
clear c
clear TotCol
clear TotLin

COR = unit8(COR); % devolve para o formato unit8
CINZA = unit8(CINZA); %coloca no formato unit8

% [FINAL DO ALGORITMO DE TONS DE CINZA]
