function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    % Inicializace proměnných
    n = length(y0);
    vec = y0;
    lambda = 0;

    % Iterace
    for it = 1:maxit
        % Mocnina matice A na vektor vec
        vec = A * vec;

        % Normalizace vektoru
        vec = vec / norm(vec);

        % Výpočet vlastního čísla
        lambda_new = vec' * A * vec;

        % Kontrola konvergence
        if abs(lambda_new - lambda) < tol
            lambda = lambda_new;
            break;
        end

        lambda = lambda_new;
    end
end
