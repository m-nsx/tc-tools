function corr_xy = calcul_intercorrelation(x, y, t)
    % Calculer l'intercorrélation entre les fonctions x(t) et y(t)
    % d'entrée, à partir du vecteur de temps t

    % Créer un vecteur pour stocker l'intercorrélation
    corr_xy = zeros(1, length(t)); 
    
    % Calculer l'intercorrélation pour différents décalages tau
    for k = 1:length(t)
        tau = t(k);  % Décalage temporel tau
        % Décaler y(t) de tau
        y_shifted = interp1(t, y, t + tau, 'linear', 0);  % Interpolation pour y(t+tau)
        
        % Calculer l'intégrale de x(t) * y(t+tau)
        corr_xy(k) = trapz(t, x .* y_shifted);  % Approximations par la somme de Riemann
    end
end

% Définir les paramètres
t_min = -2;        % Temps minimum
t_max = 2;         % Temps maximum
dt = 0.001;        % Discrétisation fine
t = t_min:dt:t_max; % Vecteur de temps

% Définir les fonctions
x = double(abs(t) <= 0.5);  % Fonction x(t)
y = double(abs(t) <= 0.5);  % Fonction y(t)

% Appeler la fonction calcul_intercorrélation
corr_xy = calcul_intercorrelation(x, y, t);

% Affichage de l'intercorrélation
figure;
plot(t, corr_xy);
title('Intercorrélation entre x(t) et y(t) - Fonctions portes');
xlabel('Décalage temporel \tau');
ylabel('R_{xy}(\tau)');
grid on;

% QUELQUES SIGNAUX %

% 1. Fonction Porte : largeur 1, centrée sur 0
% x_porte = double(abs(t) <= 0.5); % x(t) = 1 si |t| <= 0.5, 0 sinon

% 2. Fonction Dirac en t = 0 (approximation)
% x_dirac = zeros(size(t)); 
% x_dirac(t == 0) = 1 / dt; % Approximation de Dirac avec une impulsion

% 3. Fonction Rampe
% x_rampe = max(0, t); % x(t) = max(0, t)

% 4. Fonction Échelon Unité
% x_echelon = double(t >= 0); % x(t) = 1 pour t >= 0, 0 sinon

% AFFICHER FONCTIONS USUELLES %

% figure;

% subplot(2, 2, 1);
% plot(t, x_porte);
% title('x(t) = Fonction Porte');
% xlabel('Temps');
% ylabel('Amplitude');
% grid on;
% 
% subplot(2, 2, 2);
% plot(t, x_dirac);
% title('x(t) = Fonction Dirac en 0');
% xlabel('Temps');
% ylabel('Amplitude');
% grid on;
% 
% subplot(2, 2, 3);
% plot(t, x_rampe);
% title('x(t) = Fonction Rampe');
% xlabel('Temps');
% ylabel('Amplitude');
% grid on;
% 
% subplot(2, 2, 4);
% plot(t, x_echelon);
% title('x(t) = Fonction Échelon Unité');
% xlabel('Temps');
% ylabel('Amplitude');
% grid on;
