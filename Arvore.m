%%%%%%%%%%%%%%%LIMPA AMBIENTE DE TRABALHO%%%%%%%%%%%%%%%%%%%%%%%

clear all  % destroi as variaveis de ambiente
close all  % destroi as janelas graficas

%%%%%%%%%%%%%%%%%%%%%%CONSTANTES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%format long

%%%%%%%%%%%%%%%%%%%%%%%PROGRAMA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Pega caracteristicas da imagem

path = input('Digite o caminho da foto:','s');
[area rmax rmin exc] = caract(path);
aux = [area rmax rmin exc];

%�rvore de decisao Binaria

if (aux(1) > 12500)
	disp('Isto � um Controle Remoto')
else
	if (aux(1) > 7500)
		if (aux(4) > 10)
			disp('Isto � uma Chave de Boca')
		else
			if (aux(4) < 1.3)
				disp('Isto � uma Fita')
			else
				disp('Isto � um Celular')
			end
		end
	else
		if (aux(4) > 9)
			disp('Isto � uma Caneta')
		else
			if (aux(4) < 2.5)
				disp('Isto � um Dado')
			else
				disp ('Isto � uma Chave')
			end
		end
	end
end

%Resposta

resp = upper(input('Adicionar mais fotos? S/N [S]','s'));
if isempty(resp)
	resp = 'S';
end

%Loop para varias fotos

while (resp == 'S')
	path = input('Digite o caminho da foto:','s');
	[area rmax rmin exc] = caract(path);
	aux = [area rmax rmin exc];

if (aux(1) > 12500)
	disp('Isto � um Controle Remoto')
else
	if (aux(1) > 7500)
		if (aux(4) > 10)
			disp('Isto � uma Chave de Boca')
		else
			if (aux(4) < 1.3)
				disp('Isto � uma Fita')
			else
				disp('Isto � um Celular')
			end
		end
	else
		if (aux(4) > 9)
			disp('Isto � uma Caneta')
		else
			if (aux(4) < 2.5)
				disp('Isto � um Dado')
			else
				disp ('Isto � uma Chave')
			end
		end
	end
end	

resp = upper(input('Adicionar mais fotos? S/N [S]','s'));
if isempty(resp)
	resp = 'S';
end
	
end