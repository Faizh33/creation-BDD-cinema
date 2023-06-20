
/*Connexion serveur mysql */
mysql -h localhost:8889 -u root -p root

/* Création de la base de donnée */
CREATE DATABASE Maxcine_database;

/*Selection de la base de données */
USE Maxcine_database;

/* Création des tables à partir du diagramme de classe */
CREATE TABLE Movies 
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    director VARCHAR(100)
);

CREATE TABLE Cinemas
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    postAddress VARCHAR(300)
);

CREATE TABLE Payments 
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    typePayment VARCHAR(200)
);

CREATE TABLE PriceLists
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(200),
    price DECIMAL(4,2)
);

CREATE TABLE MovieTheaters
(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    roomNumber INT NOT NULL,
    nbSeats INT NOT NULL,
    cinema_id INT NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES Cinemas(id) ON DELETE CASCADE
);

CREATE TABLE Customers
(
    email VARCHAR(250) NOT NULL PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    postAddress VARCHAR(300),
    birthDate DATE NOT NULL,
    priceList_id INT NOT NULL,
    FOREIGN KEY (priceList_id) REFERENCES PriceLists(id)
);

CREATE TABLE Admins
(
    email VARCHAR(200) NOT NULL PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    cinema_id INT NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES Cinemas(id) ON DELETE CASCADE
);

CREATE TABLE Bookings
(
    id CHAR(36) PRIMARY KEY NOT NULL,
    id_movie INT NOT NULL,
    id_movieTheater INT NOT NULL,
    id_payment INT NOT NULL,
    email_customer VARCHAR(100) NOT NULL,
    startDate DATETIME NOT NULL,
    FOREIGN KEY (id_movie) REFERENCES Movies(id),
    FOREIGN KEY (id_movieTheater) REFERENCES MovieTheaters(id),
    FOREIGN KEY (id_payment) REFERENCES Payments(id),
    FOREIGN KEY (email_customer) REFERENCES Customers(id)
);


/* Insertion de données factices */
INSERT INTO 
    Movies (title, director)
VALUES
    ('Seven', 'David Fincher'),
    ('Parasite', 'Bong Joon-ho'),
    ('Le Seigneur des Anneaux', 'Peter Jackson'),
    ('Le Mépris', 'Jean-Luc Godard'),
    ('Gran Torino', 'Clint Eastwood'),
    ('The Dark Knight Rises', 'Christopher Nolan'),
    ('La Ligne Verte', 'Frank Darabont'),
    ('Shutter Island', 'Martin Scorsese'),
    ('Usual Suspects', 'Bryan Singer'),
    ('Boulevard de la Mort', 'Quentin Tarantino');

INSERT INTO 
    Payments(typePayment)
VALUES
    ('En ligne'),
    ('Sur place');

INSERT INTO
    PriceLists(category, price)
VALUES
    ('Plein tarif', 9.10),
    ('Etudiant', 7.60),
    ('Moins de 14 ans', 5.90);

INSERT INTO 
    Cinemas(name, postAddress)
VALUES
    ('MAXCINE Bordeaux', '3 rue des Hirondelles 33000 Bordeaux'),
    ('MAXCINE Lyon', '6 rue des Tourterelles 69000 Lyon'),
    ('MAXCINE Marseille', '9 rue des Piverts 13000 Marseille'),
    ('MAXCINE Nantes', '12 rue des Etourneaux 44000 Nantes');

INSERT INTO
    MovieTheaters(roomNumber, nbSeats, cinema_id)
VALUES
    (1, 50, 1),
    (2, 60, 1),
    (3, 70, 1),
    (4, 80, 1),
    (5, 90, 1),
    (6, 65, 1),
    (7, 100, 1),
    (8, 120, 1),
    (9, 80, 1),
    (10, 110, 1),
    (1, 50, 2),
    (2, 60, 2),
    (3, 70, 2),
    (4, 80, 2),
    (5, 90, 2),
    (6, 65, 2),
    (7, 100, 2),
    (8, 120, 2),
    (9, 80, 2),
    (10, 110, 2),
    (1, 50, 3),
    (2, 60, 3),
    (3, 70, 3),
    (4, 80, 3),
    (5, 90, 3),
    (6, 65, 3),
    (7, 100, 3),
    (8, 120, 3),
    (9, 80, 3),
    (10, 110, 3),
    (1, 50, 4),
    (2, 60, 4),
    (3, 70, 4),
    (4, 80, 4),
    (5, 90, 4),
    (6, 65, 4),
    (7, 100, 4),
    (8, 120, 4),
    (9, 80, 4),
    (10, 110, 4);

INSERT INTO
    Admins(email, lastName, firstName, cinema_id)
VALUES
    ('jacques_beauregard@maxcine.com', 'Beauregard', 'Jacques', 1),
    ('françois_pignon@maxcine.com', 'Pignon', 'François', 2),
    ('françoise_larchet@maxcine.com', 'Larchet', 'Françoise', 3),
    ('jeanclaude_dusse@maxcine.com', 'Dusse', 'Jean-Claude', 4);

INSERT INTO
    Customers
VALUES
    ('charles.m.burns@lemail.com', 'Charles Montgomery', 'Burns', '3 rue des écoles 99860 Springfield', '1905-09-15', 1),
    ('peter.griffin@lemail.com', 'Peter', 'Griffin', '58 rue des Luciolles 98570 Quahog', '1975-09-22', 2),
    ('cruella.denfer@lemail.com', 'Cruella', 'Denfer', '77 rue des dalmatiens 97860 Dogcity', '1950-04-03', 1),
    ('daphne.blake@lemail.com', 'Daphne', 'Blake', '23 rue du Scoobidoo 96720 Crystal Cove', '2009-01-13', 3),
    ('eric.cartman@lemail.com', 'Eric', 'Cartman', '18 rue des pervenches 99860 South Park', '2010-08-05', 3),
    ('carl.fredericksen@lemail.com', 'Carl', 'Fredericksen', '58 rue des retraités 75000 Paris', '1945-06-29', 1),
    ('peter.pan@lemail.com', 'Peter', 'Pan', '66 avenue des polissons 00000 NeverLand', '2000-04-03', 2),
    ('edna.mode@lemail.com', 'Edna', 'Mode', '65 boulevard Lagerfeld 95720 Metroville', '2009-01-13', 1);

INSERT INTO
    Bookings(id, id_movie, id_movieTheater, id_payment, email_customer, startDate)
VALUES
    (UUID(), 4, 8, 1, 'charles.m.burns@lemail.com', '2023-07-17 14:00:00'),
    (UUID(), 4, 16, 1, 'eric.cartman@lemail.com', '2023-07-17 14:30:00'),
    (UUID(), 6, 21, 2, 'peter.griffin@lemail.com', '2023-07-23 16:30:00'),
    (UUID(), 6, 22, 2, 'carl.fredericksen@lemail.com', '2023-07-23 16:30:00'),
    (UUID(), 2, 5, 1, 'peter.pan@lemail.com', '2023-07-05 15:30:00'),
    (UUID(), 2, 7, 1, 'edna.mode@lemail.com', '2023-07-05 15:30:00'),
    (UUID(), 4, 34, 2, 'cruella.denfer@lemail.com', '2023-07-10 22:15:00'),
    (UUID(), 1, 12, 1, 'daphne.blake@lemail.com', '2023-07-03 10:00:00');


/* Affichage du nom du cinéma et de son administrateur */
SELECT Cinemas.name AS Nom_du_cinéma, Admins.firstName AS Prénom_admin, Admins.lastName AS Nom_admin
FROM Cinemas
JOIN Admins ON Cinemas.id = Admins.cinema_id;

/* Affichage de la liste des tarifs proposés */
SELECT category AS Catégorie, price AS prix FROM PriceLists;

/* Affichage de la liste des modes de paiement: sur place ou en ligne */
SELECT Customers.firstName, Customers.lastName, Payments.typePayment
FROM Customers
JOIN Bookings ON Customers.email = Bookings.email_customer
JOIN Payments ON Bookings.id_payment = Payments.id;

/* Affichage de la possibilité de réserver le même film dans des cinemas différents*/
SELECT Bookings.id AS Réservation, Movies.title AS Film, Cinemas.name AS Cinema
FROM Bookings
JOIN Movies ON Bookings.id_movie = Movies.id
JOIN MovieTheaters ON Bookings.id_movieTheater = MovieTheaters.id
JOIN Cinemas ON MovieTheaters.cinema_id = Cinemas.id
GROUP BY Cinemas.name
ORDER BY Movies.title
LIMIT 3;

/* Affichage de la possibilité de la diffusion du même film au même horaire dans plusieurs salles
différentes pour un même cinéma*/
SELECT Movies.title AS MovieTitle, MovieTheaters.roomNumber AS RoomNumber, Cinemas.name AS CinemaName
FROM Bookings
JOIN Movies ON Bookings.id_movie = Movies.id
JOIN MovieTheaters ON Bookings.id_movieTheater = MovieTheaters.id
JOIN Cinemas ON MovieTheaters.cinema_id = Cinemas.id
WHERE Movies.title = 'The Dark Knight Rises';

/* affichage du nombre de places restantes dans une salle après réservation*/
SELECT Cinemas.name AS Cinema, MovieTheaters.roomNumber AS Salle, 
       MovieTheaters.nbSeats - COUNT(Bookings.id) AS Nombre_de_places_restantes
FROM Bookings
JOIN MovieTheaters ON Bookings.id_movieTheater = MovieTheaters.id
JOIN Cinemas ON MovieTheaters.cinema_id = Cinemas.id
GROUP BY MovieTheaters.roomNumber, Cinemas.name;

/* Utilitaire de sauvegarde de la base de données : */
mysqldump -u root -p root -h localhost:8889 > evaluation-cinema.sql

/* Utilitaire de restauration de la base de données : */
mysql -u root -p root -h localhost:8889 Maxcine_database < evaluation-cinema.sql