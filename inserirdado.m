%Função Inserir Dado
%Pede a entrada do valor e checa se este esta entre o minimo e o maximo
%
%SINTAXE: Resposta = f_inserirdado(Minimo, Maximo, Texto, Sugerido)
%
%   Minimo e Maximo
%           Valores minimos e maximos que Resposta pode assumir
%   Texto
%           Texto que aparece como titulo da janela
%   Sugerido
%           Valor que ja aparece preenchido
%
%[INICIO DO ALGORITMO DE INSIR DADO]

function Resposta = f_inserirdado(Minimo, Maximo, Texto, Sugerido)

Sugerido = num2str(Sugerido);

if Minimo > Maximo
    Aux = Minimo;
    Minimo = Maximo;
    Maximo = Aux;
end
txt = ['Valor entre',num2str(Minimo),' e ',num2str(Maximo)];

Aux = 0;
while Aux == 0;
    Resposta = str2double(imputdog({txt},Texto,1,{Sugerido}));
    Aux = 1;
    if isnan(Resposta)
        txt = ['É nessesário inserir um valor entre',num2str(Minimo),' e ',num2str(Maximo)];
        Aux = 0;
    end
    if Resposta < Minimo
        txt = ['O valor DEVE estar entre',num2str(Minimo),' e ',num2str(Maximo)];
        Aux = 0;
    elseif Respota > Maximo
        txt = ['O valor DEVE estar entre',num2str(Minimo),' e ',num2str(Maximo)];
        Aux = 0;
    end
end

%[FINAL DO ALGORITMO DE INSIR DADO]
