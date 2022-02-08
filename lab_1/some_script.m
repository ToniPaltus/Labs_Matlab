y = [];

% for x = -5:1:5
%     elem = get_polinom(7, -60, -60, x);
%     
%     disp('elem: ');
%     disp(elem);
%     
%     %y = [y elem];
%     y(end + 1) = elem;
% end  
x = -5:5;

disp('Y:');
disp(y);

%x = -5:5;

elem = get_polinom(7, -60, -60, x);


plot(x, elem, 'r');
grid on;
title('Some addiction');
xlabel('X');
ylabel('Y');