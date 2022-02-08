function p = probability(k)
    p = 5.^k.*exp(-5)./(factorial(k));
end