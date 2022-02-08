%Есть 8250 значений, генерирует случайные числа, распределенные по закону
%Пуассона.Выводим первые 12. Находим минимум и максимум значений.
%считаем практическое и теоретическое матожидание и среднеквадратичекое
%отклонение.Считаем центры карманов, строим гистограмму, считаем
%вероятности. Строим график Распределение вероятностей дискретной
%случайной величины по этим данным.
M = 8250;
Lambda = 8.5;
K = 12;

%Puasson
y = poissrnd(Lambda, 1, M);% Распределение Пуассона
disp('First K values');
disp(y(1:K));

%min / max
Ymin = min(y);
Ymax = max(y);
disp(['Ymin: ' num2str(Ymin) '; Ymax: ' num2str(Ymax)]);

%math weit
matW = mean(y);
disp(['Theoretical math weit: ' num2str(Lambda) '; Practical mat weit: ' num2str(matW)]);

%std Среднеквадратическое отклонение
stdVal = std(y);
disp(['Теоретическое среднеквадратичное отклонение: ' num2str(sqrt(Lambda)) '; Практическое среднеквадратичное отклонение: ' num2str(stdVal)]);

%Вероятность
c= 0:Ymax;%центры
h = hist(y, c);
h
p_exp = h/M;
p_theor = poisspdf(c, Lambda);
disp(['вероятность практическая: ' num2str(p_exp) '; Вероятность теоретическая: ' num2str(p_theor)]);

%figure
hold on;
title('Распределение вероятностей дискретной случайной величины');
bar(c, p_exp);
plot(c, p_theor, 'r');
grid on;
hold off;





