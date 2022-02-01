%Função que recebe figura limiarizada em imgA e preenche com a cor
%'novacor' todos os pixels que estao em contato com o pixel que tem as
%coordenadas em 'Rec' e que tem a mesma cor ' corproc' que ele.
%
%similar clicar no pixel que esta em Rec com a ferramenta peenchimento do
%paint (baldinho) estando com a cor 'novacor' selecionada
%
%SINTAXE: ImgResposta = f_preenche(ImgOriginal, Corparapeencher, ponto)
%   OU  :
%   [imgResposta,TotPixEncontrados]=f_preenche(imgOriginal,corparapreencher
%   ,ponto)
%   
%   imgResposta
%           matriz que a funçao devolverá processanda
%
%   TotPixEncontrados
%           Numero de pixel achado na sequncia(area) preenchida
%
%   Corparapreencher
%           numero de intensidade de cor co que se vai preencher 0 a 255
%
%   Ponto
%           matriz 1x2 com as coordenadas do ponto de partida para o
%           preenchimento pode ser Nx2 mas so valerá se todos tiverem a
%           mesma cor da 1ª linha
%
% [ INICIO DO ALGORITMO PREENCHE]

function [imgB, TotPixEncontrados] = f_preenche(imgA,novacor,rec)

[TotLin,TotCol] = size(imgA);           %dimenções da imagem
corproc=imgA(Rec(1,1),Rec(1,2));        %le a imgA a cor do pixel com as coordenadas que estao em Rec
Dev = [0,0];                            %pixels devolvidos
imgB=imgA;                              %Cora matriz imgB de mesmo tamanho de imgA

%pinta o(s) primeiro(s) pixel recebido(s)
Total=size(Rec,1);                      %recebe o numero de linhas de Rec
for i=1:Total;                          %repete para cada linha de Rec
    L=Rec(i,1);
    C=Rec(i,2);                         % L e C recebem as coordenadas que estao armazenadas em Rec
    imgB(L,C) = novacor;
end

TotPixEncontrandos = Total;             % ja conta os pontos que foram passados por Rec inicial

Teste = 1;                              %=1 se existirem pixels de mesma cor na vizinhaça do ponto avaliado
while Teste == 1;
    Teste = 0;
    Total = size(Rec,1);                %recebe o numero de linhas de Rec
    for i=1:Total;                      %repete para cada linha de Rec
        L=Rec(i,1); 
        C=Rec(i,2);                     %L e C recebem as coordenadas que estao armazenadas em Rec
        if L-1>=1;                                              % testa se nao esta no limite da matriz
            if imgA(L-1,C) == corproc & imgB(L-1,C) ~=nova cor  %Testa se o pixel de cima tem a corproc e se ja foi marcado
                Aux = [L-1,C];
                Dev = [Dev;Aux];        %se nao foi marcado coloca as coordenadas em Dev
                imgB(L-1,C)=novacor;
                Teste=1;
            end
        end
        if L+1 <=TotLin
            if imgA(L+1,C) == corproc & imgB(L+1,C) ~= novacor      %testa se o pixel mais baixo ...
            Aux = [L+1,C];
                Dev = [Dev;Aux];        
                imgB(L+1,C)=novacor;
                Teste=1;
            end
        end
        if C-1 >=1
            if imgA(L,C-1) == corproc & imgB(L,C-1) ~= novacor      %testa se o pixel da esquerda ...
            Aux = [L,C-1];
                Dev = [Dev;Aux];        
                imgB(L,C-1)=novacor;
                Teste=1;
            end
        end
        if C+1 <=TotLin
            if imgA(L,C+1) == corproc & imgB(L,C+1) ~= novacor      %testa se o pixel da direita ...
            Aux = [L,C+1];
                Dev = [Dev;Aux];        
                imgB(L,C+1)=novacor;
                Teste=1;
            end
        end
    end
    if Teste == 1;                  % se foi colocado algo em Dev (achado algum pixel)
        TotPixEncontrados = TotPixEncontrados + size(Dev,1) - 1;
        Rec = dev(2:end,:);         %Rec receve estes pixels
        Dev = [0,0];                %zera o Dev
    end
end

% [ FINAL DO ALGORITMO PREENCHE]