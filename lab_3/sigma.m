function y = sigma(x)%Функция для дисперсии
mu3 = 2.4853;
y = (x-mu3).^2./(x.*log(5));
end