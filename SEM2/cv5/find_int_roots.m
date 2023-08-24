function [x, M] = find_int_roots(p)
    % Inicializace výstupních proměnných
    x = [];
    M = p;

    % Nalezení vhodných kandidátů na kořeny
    candidates = find_candidates(p);

    % Pro každého kandidáta provedeme Hornerovo schéma
    for candidate = candidates
        [remainder, steps] = horner_scheme(p, candidate);
        % Pokud zbytek je nula, candidate je kořen
        if remainder == 0
            x = [x; candidate];
            % Aktualizujeme polynom na zbytku
            p = steps;
        end
    end
end

function [remainder, steps] = horner_scheme(p, candidate)
    % Hornerovo schéma
    n = length(p);
    remainder = p(1);
    steps = zeros(1, n);
    steps(1) = remainder;

    for i = 2:n
        remainder = remainder * candidate + p(i);
        steps(i) = remainder;
    end
end

function candidates = find_candidates(p)
    % Inicializace prázdného pole kandidátů
    candidates = [];
    
    % Procházení možných hodnot (zde můžete přizpůsobit rozsah)
    for candidate = -100:100
        % Výpočet hodnoty polynomu pro daného kandidáta
        value = polyval(p, candidate);
        
        % Pokud je hodnota blízká nule, přidáme kandidáta do seznamu
        if abs(value) < 1e-6
            candidates = [candidates, candidate];
        end
    end
end
