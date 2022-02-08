a = 1;
b = 5;
n = 10000;

z = rand(1, n);%Равномерное распределение
x = g(z);%Обратная функция
disp(x(1:10));

%Математическое ожидание
mu1 = sum(x)/n;
mu2 = mean(x);
mu3 = integral(@mu, a, b);
disp(['Матожидание вручную: ' num2str(mu1)]);
disp(['Матожидание практическое: ' num2str(mu2)]);
disp(['Матожидание через ф-цию плотности распределения (теоретическое): ' num2str(mu3)]);

%Дисперсия
sigma1 = 1 / (n - 1) * sum(x.^2) - 1 / (n*(n-1)) * sum(x)^2;
sigma2 = var(x);
sigma3 = integral(@sigma, a, b);
disp(['Дисперсия вручную: ' num2str(sigma1)]);
disp(['Дисперсия по функции var (практическое): ' num2str(sigma2)]);
disp(['Дисперсия через функцию плотности (теоретическое): ' num2str(sigma3)]);

%Доверительный интервал
beta = 0.95;
y_beta = norminv(1-(1-beta)/2);
sigma = sqrt(sigma3);
border_a = mu1 - y_beta*sigma/sqrt(n);
border_b = mu1 + y_beta*sigma/sqrt(n);
disp(['Доверительный интервал: [' num2str(border_a) '; ' num2str(border_b) ']']);

%Графики эмпирической плотности распределения и теоретической плотности
%распеределения
k = 20;%число карманов
delta = (b-a)/k;%ширина
c = a+delta/2:delta:b-delta/2;%вектор центров карманов
h = hist(x, c);%Гистограмма смоделированных значений
empery_density = h/(n*delta);%Эмпирическая плотность распределения
theor_density = density(c);% Теоретиеская плотность распределения
hold on;
title('Графики эмперической и теоретической плотности распределения');
bar(c, empery_density);
plot(c, theor_density, 'r');
grid on;
hold off;



