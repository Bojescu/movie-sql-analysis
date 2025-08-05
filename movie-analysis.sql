-- Task 5 - Interogări SQL avansate
-- Autor: [Ana Bojescu]
-- Data generării: 2025-04-16

USE model_conceptual;

-- 1. Filme cu buget mai mare decât bugetul mediu
-- Această interogare selectează filmele al căror buget este mai mare decât bugetul mediu din tabelul movie
SELECT * FROM movie
WHERE budget > (SELECT AVG(budget) FROM movie);

-- 2. Numărul de filme per țară
-- Afișează numărul de filme produse în fiecare țară
SELECT country.name AS country_name, COUNT(*) AS number_of_movies
FROM movie
JOIN country ON movie.country_id = country.country_id
GROUP BY country.name;

-- 3. Genuri cu mai mult de 5 filme
-- Afișează genurile care apar în mai mult de 5 filme
SELECT genre.name AS genre_name, COUNT(*) AS total_movies
FROM movie_genre
JOIN genre ON genre.genre_id = movie_genre.genre_id
GROUP BY genre.name
HAVING COUNT(*) > 5;

-- 4. Top 10 filme după încasări
-- Afișează cele mai profitabile 10 filme, sortate descrescător după încasări
SELECT title, box_office
FROM movie
ORDER BY box_office DESC
LIMIT 10;

-- 5. Top 5 cele mai scurte filme
-- Afișează cele mai scurte 5 filme din baza de date
SELECT title, duration
FROM movie
ORDER BY duration ASC
LIMIT 5;

-- 6. Venitul total al tuturor filmelor
-- Calculează suma totală a încasărilor tuturor filmelor
SELECT SUM(box_office) AS total_revenue
FROM movie;

-- 7. Durata medie a tuturor filmelor
-- Afișează durata medie a filmelor din baza de date
SELECT AVG(duration) AS average_duration
FROM movie;

-- 8. Cel mai scump și cel mai ieftin film după buget
-- Returnează bugetul maxim și minim al filmelor
SELECT MAX(budget) AS highest_budget, MIN(budget) AS lowest_budget
FROM movie;

-- 9. Filme cu titlul mai lung de 15 caractere, afișate cu majuscule
-- Selectează filmele cu titluri lungi și le afișează cu litere mari
SELECT UPPER(title) AS upper_title
FROM movie
WHERE LENGTH(title) > 15;

-- 10. Primele 5 caractere din titlurile tuturor filmelor
-- Afișează un prefix de 5 litere din titlul fiecărui film
SELECT SUBSTRING(title, 1, 5) AS title_prefix
FROM movie;
