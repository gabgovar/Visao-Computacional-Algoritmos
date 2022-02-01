% Fun��o para limiariza��o de imagens que s�o lidas em matrizes LxCx3 e que
% nao abrem mapta de cores e possuem valores de 0 a 255 formato TIF e JPEG
% Subentende-se que aimagem ja esta em tons de cinza logo LxCx1
%
%Limiarizador:
%   Colocar a imagem para preto e branco pela avalia��o de cada pixel em
%   rela��o a uma cor camada limiar se a cor do pixel avaliado for mais
%   clara que o limiar ele ficar� branco, se mais escuro, preto.
%
%SINTAXE: novamimg = f_limiar(img)
%
%   novaimg
%           matriz que a fun�ao devolvera processada (imagem preto e
%           branco)
%   img
%           matriz com imagem original (em escalas de cinza)
%
% [INICIO DO ALGOTIMO PARA A limiariza��o]

function novaimg = f_limiar(img)

w1 = waitbar(0,'Convertendo para preto e branco - Limiarizado...'); %abre a barra indicadora de progresso

Altura = size(img,1); %numero de linhas de matriz img
Largura = size (img,2); %numero de colunas da matriz img 

novaimg = img; %a mariz novaimg � um clone de img onde ser�o feitas as modifica��es

    %ao inves de um usuario entrar com o valor Lim este pode ser passado
    %pela fun��o ou dado diretamente
Lim = f_inserirdado(0,255,'Entre com o valor de limiar',240)%chama a sub fun��o inserirdado
%Lim recebe o valor de limiar inserido pelo usuario que deve estar entre 0
%e 255
%veja a fun��o inserirdado.m

%looping que varre todos os pixels da matriz e troca o correspondente em
%'novaimg' para branco ou preto com base no limiar

for l=1:Altura;
    for c=1:Largura;
        if img(l,c) <= Lim
            novaimg(l,c) = 0; %preto
        else
            novaimg(l,c) = 255; %Branco
        end
    end
    waitbar(l/Altura,w1); %Altera a barra indicadora
end

close(w1); %fecha a barra indicadora de progresso
clear w1

% [FINAL DO ALGORITMO PARA LIMIARIZA��O]