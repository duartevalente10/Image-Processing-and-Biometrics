function read_image()  
% Fechar todas as janelas de figuras.
close all;
% Limpar a consola.
clc

% Ler a imagem a partir do ficheiro.
I = imread('camera.gif');
%I = imread('bird.gif');
%I = imread('squares.gif');

% Obter as dimensões (resolução da imagem).
[M, N] = size(I); 
[pixelCounts, greyLevels] = imhist(I);
numberOfPixels = sum(pixelCounts);
% Imprimir mensagem com as dimensões e resolução da imagem.
fprintf('Image with resolution %d x %d = %d pixels\n', M, N, numberOfPixels);
fprintf ('(i) Numero de Pixeis distintos: ');
fprintf ('%d ',pixelCounts);

H = entropy(I)

% Lançar nova janela de figura e mostrar a imagem em níveis de cinzento
% e o respetivo histograma.
figure(1);
subplot(121); imshow(I); colorbar; title(' Image ' );
subplot(122); imhist(I); title( sprintf(' Histogram. H=%.2f\n',H) );
impixelinfo;

% Escrever a imagem em níveis de cinzento como ficheiro PNG.
imwrite( I, 'out.png' );

% Calcular a energia da imagem.
E = sum(sum( I.^2 ));

% Calcular a potência da imagem.
P = E / (M*N);

% Calcular o valor médio da imagem.
m = sum(sum( I )) / (M*N);

C = max(max(I)) - min(min(I));
mi  = min(min(I));
mx = max(max(I));

[maxOc,ind] = max(pixelCounts);


fprintf('(ii) O pixel que ocorre o maior número de vezes é de intensidade %d e occore %d vezes.\n',ind-1,maxOc );
fprintf('(iii) Pixel com maior valor de intensidade: %d\n', mx );
fprintf('(iv) Valor Médio: %.2f, Contraste: %d, Entropia: %.2f\n',m, C, H);

% Calcular o valor mínimo e valor máximo da imagem.


% 
% 
% for level=0.1 : 0.01: 0.99
% %     
% % l = graythresh(I);
% % Ib = im2bw(I,0.1);
% % figure(2);
% % imshow(Ib);
% % impixelinfo;
% 
%     Ib = im2bw(I,level);
%     figure(3);
%     imshow(Ib); title(num2str(level));
%     impixelinfo;
%     pause(2);
% end

end