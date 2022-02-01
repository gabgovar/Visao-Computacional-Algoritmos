function [area , rmax , rmin , exc] = caract(path)

%%%%%%%%%%%%%%%%%%%%%%CONSTANTES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%path = input('Digite o caminho da foto:','s');
fotorgb = imread(path);
foto = rgb2gray(fotorgb);
foto = double(foto);
line = size(foto,1);
col = size(foto,2);
area = 0;
xx = 0;
yy = 0;
rmax = 0;
rmin = 10^5;

%%%%%%%%%%%%%%%%%%%%%%PROGRAMA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Thresholding inicial

for x = 1:line %Loop das linhas da matriz da foto
	for y = 1:col %Loop das colunas da matriz da foto
		if (foto(x,y) <= 105)
		foto(x,y) = 0;
		else
		foto(x,y) = 1;
		end	
	end
end

%Filtro para remover inconsistencias

for x = 2:line-1 %Loop das linhas da matriz da foto
	for y = 2:col-1 %Loop das colunas da matriz da foto
	aux = 0;
		for z = -1:1
			for t = -1:1
				aux = aux + foto(x+z,y+t);
			end
		end
	foto2(x,y) = aux/9;
	end
end

%Filtro para a borda - Considerar borda sem objeto

for x = 1:line 
	foto2(x,1)=0;
	foto2(x,col)=0;
end
for y = 1:col
	foto2(1,y)=0;
	foto2(line,y)=0;
end

%Thresholding novamente

for x = 1:line %Loop das linhas da matriz da foto
	for y = 1:col %Loop das colunas da matriz da foto
		if (foto2(x,y) > 0.33)
		foto2(x,y) = 1;
		else
		foto2(x,y) = 0;
		end	
	end
end

%Calculo da area e centroide

for x = 1:line %Loop das linhas da matriz da foto
	for y = 1:col %Loop das colunas da matriz da foto
		if (foto2(x,y) == 1)
		area = area + 1;
		xx = xx + x;
		yy = yy + y;
		end
	end
end
cx = round(xx/area);
cy = round(yy/area);

%Preenchimento de possiveis furos

foto3 = foto2;
for x = 1:line
	aux = 0;
	for y = 1:col-1
		if (foto2(x,y) ~= foto2(x,y+1))		
			aux = aux + 1;
		end
		if (aux > 2)
			aux2 = 0;
			for y = 1:col-1
				if (foto2(x,y) ~= foto2(x,y+1))		
					aux2 = aux2 + 1;
				end
				if (aux2 >= 2) && (aux2 <= 3)
					foto3(x,y) = 1;
				end	
			end
		end
	end
end

foto4 = foto3;
for y = 1:col
	aux = 0;
	for x = 1:line-1
		if (foto3(x,y) ~= foto3(x+1,y))
			aux = aux + 1;
		end
		if (aux > 2)
			aux2 = 0;
			for x = 1:line-1
				if (foto3(x,y) ~= foto3(x+1,y))
					aux2 = aux2 + 1;
				end
				if (aux2 >= 2) && (aux2 <= 3)
					foto4(x,y) = 1;
				end	
			end
		end
	end
end

foto5 = foto4;
for y = 1:col
	aux = 0;
	for x = 1:line-1
		if (foto4(x,y) ~= foto4(x+1,y))
			aux = aux + 1;
		end
		if (aux > 2)
			aux2 = 0;
			for x = 1:line-1
				if (foto4(x,y) ~= foto4(x+1,y))
					aux2 = aux2 + 1;
				end
				if (aux2 >= 2) && (aux2 <= 3)
					foto5(x,y) = 1;
				end	
			end
		end
	end
end

%Deteccao de bordas - metodo de Roberts

foto6 = edge(foto5,'roberts');

%Calculo dos raios maximo e minimo

for x = 1:line %Loop das linhas da matriz da foto
	for y = 1:col %Loop das colunas da matriz da foto
		if (foto6(x,y) == 1)
		aux = sqrt((x-cx)^2+(y-cy)^2);
			if (aux > rmax)
			rmax = aux;
			end
			if (aux < rmin)
			rmin = aux;
			end
		end
	end
end

exc = rmax/rmin;