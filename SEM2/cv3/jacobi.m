% Táto funkcia má vstupy A matica, b vektor pravej strany, 
% tol tolerancia pre konvergenciu, 
% a maxit maximálny počet iterácií. 
% Výstupy sú x odhad riešenia, flag indikátor konvergencie, 
% rr hodnoty residuá 
% a rv hodnoty relatívnych zmien medzi iteráciami.

function [x, flag, rr, it, rv] = jacobi(A, b, tol, maxit)
    % Inicializácia premenných
    n = length(b);
    x = zeros(n, 1);
    x_new = x;
    flag = 0;
    rr = zeros(maxit, 1);
    rv = zeros(maxit, 1);
    
    % Iterácie
    for it = 1:maxit
        for i = 1:n
            sum1 = A(i, 1:i - 1) * x(1:i - 1);
            sum2 = A(i, i + 1:n) * x(i + 1:n);
            x_new(i) = (b(i) - sum1 - sum2) / A(i, i);
        end
        
        % Výpočet residua
        rr(it) = norm(b - A * x_new);
        rv(it) = norm(x_new - x);
        
        % Kontrola konvergencie
        if rr(it) < tol
            x = x_new;
            flag = 1;
            break;
        end
        
        x = x_new;
    end
end

