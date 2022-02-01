%Função para tapar buracos na figura devido a brilho ou areas mais claras
%que a media, seve tambem para separar as figuras de seus proprios furos
%A imagem deve estar Limiarizada(Preto e Branco)
%
% SINTAXE: imgB = f_tapafuror(imgA)
%
%   novaimg
%           matriz que a função devolve processada (sem as falhas)
%   img
%           matriz com a imagem original (em P e B)
%
%   [INICIO DO ALGORITMO DE TAPAR FUROS]

function imgC = f_limiar(imgA)

[Lin,Col] =size(A);
imgB=imgA;
imgC=imgA;

%acredita que o pixel imgA(1,1) esta na cor do fundo
Pixel = [1,1];

%preenche o fundo com a cor 175
CorMarca = 175;
imgB = f_preenche(imgA,CorMarca,Pixel);

%na imgB tudo que não tiver sido marcado (não é fundo) pinda de preto em
%imgC e o que tiver marcado (fundo) coloca branco em imgC

for L=1:Lin;
    for C=1:Col;
        if imgB(L,C)==CorMarca;
            imgC(L,C)==255;
        else
            imgC(L,C)=0;
        end
    end
end

%   [FINAL DO ALGORITMO DE TAPAR FUROS]
