% Função para facilitar a abertuda das imagens
%
%SINTAXE: Imagem = f_abreimagem
%
%   Imagem
%           Matriz com a nova imagem a ser aberta
%
% [INICIO DO ALGOTIMO PARA A ABERTURA DA IMAGEM]

function Imagem = f_abreimagem()

[Nome path] = uigetfile({'*.tif';'*.jpg'},'Escolha um Arquivo'); % Caixa para entrada com o nome do arquivo
if isequal (Nome,0)|isequal(Path,0)
    warndlg('Você não selecionou um nome de aquivo válido');
end
NomeArquivo = fullfile(Path,Nome); %Compoe o nome do arquivo

[Imagem Mapa] = Imread(nomeArquivo);
clear mapa
clear NomeArquivo
clear Nome
clear Path

% [FINAL DO ALGORITMO PARA ABERTURA DA IMAGEM]