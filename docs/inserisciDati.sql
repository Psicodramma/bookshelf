INSERT INTO Autore (ID, nome, cognome)
VALUES (1, 'Gabriel', 'García Márquez'),
       (2, 'Jane', 'Austen'),
       (3, 'Fyodor', 'Dostoevsky'),
       (4, 'Charles', 'Dickens'),
       (5, 'Ernest', 'Hemingway'),
       (6, 'James', 'Joyce'),
       (7, 'Franz', 'Kafka'),
       (8, 'Toni', 'Morrison'),
       (9, 'Virginia', 'Woolf'),
       (10, 'William', 'Shakespeare');

INSERT INTO Opera (ID, Titolo, AnnoPubblicazione, Descrizione, LinguaOriginale)
VALUES (1, 'Cent'anni di solitudine', 1967, 'Il romanzo racconta la storia della famiglia Buendía in un villaggio immaginario chiamato Macondo.', 'Spagnolo'),
       (2, 'Orgoglio e pregiudizio', 1813, 'La storia segue le vicende delle sorelle Bennet e delle loro relazioni amorose.', 'Inglese'),
       (3, 'Delitto e castigo', 1866, 'Il protagonista Raskolnikov uccide un usuraio e deve affrontare le conseguenze della sua azione.', 'Russo'),
       (4, 'Grandi speranze', 1861, 'Il protagonista Pip viene aiutato da un benefattore anonimo a diventare un gentiluomo.', 'Inglese'),
       (5, 'Addio alle armi', 1929, 'La storia segue le vicende di un americano che si arruola come ambulanza durante la prima guerra mondiale.', 'Inglese'),
       (6, 'Ulisse', 1922, 'Il romanzo segue le avventure di Leopold Bloom e Stephen Dedalus durante un giorno a Dublino.', 'Inglese'),
       (7, 'Il processo', 1925, 'Il protagonista Josef K. viene arrestato senza motivo e deve affrontare un processo misterioso.', 'Tedesco'),
       (8, 'Amatissima', 1987, 'La storia segue le vicende di una giovane schiava africana e della sua relazione con il suo padrone.', 'Inglese'),
       (9, 'Mrs Dalloway', 1925, 'Il romanzo segue una giornata nella vita di Clarissa Dalloway mentre si prepara per una festa.', 'Inglese'),
       (10, 'Romeo e Giulietta', 1597, 'La storia segue la tragica relazione d\'amore tra i protagonisti omonimi.', 'Inglese');

INSERT INTO Edizione (ID, DataPubblicazione, Opera, Editore, NumeroPagine, ISBN, PaesePubblicazione, Lingua)
VALUES (1, '2015-01-01', 1, 'Mondadori', 432, '978-88-04-65286-1', 'Italia', 'Italiano'),
       (2, '1999-06-01', 1, 'HarperCollins', 417, '978-0-06-088328-7', 'Stati Uniti', 'Inglese'),
       (3, '2018-09-20', 2, 'Penguin Classics', 416, '978-0141395203', 'Regno Unito', 'Inglese'),
       (4, '2002-02-01', 2, 'Newton Compton Editori', 384, '978-88-541-0045-5', 'Italia', 'Italiano'),
       (5, '2004-04-27', 3, 'Vintage', 671, '978-0-679-60075-7', 'Stati Uniti', 'Inglese'),
       (6, '2012-06-01', 3, 'Giunti', 672, '978-88-09-77333-5', 'Italia', 'Italiano'),
       (7, '2003-02-27', 4, 'Penguin Classics', 544, '978-0141439563', 'Regno Unito', 'Inglese'),
       (8, '2007-03-13', 4, 'Bantam Classics', 480, '978-0-553-21299-3', 'Stati Uniti', 'Inglese'),
       (9, '2014-06-26', 5, 'Arnoldo Mondadori Editore', 360, '978-88-04-63630-3', 'Italia', 'Italiano'),
       (10, '1995-05-01', 5, 'Scribner', 332, '978-0-684-82637-8', 'Stati Uniti', 'Inglese'),
       (11, '2015-02-01', 6, 'Mondadori', 928, '978-88-04-54744-5', 'Italia', 'Italiano'),
       (12, '1986-06-16', 6, 'Penguin Classics', 768, '978-0140186477', 'Regno Unito', 'Inglese'),
       (13, '2004-09-07', 7, 'Schocken Books', 336, '978-0805210408', 'Stati Uniti', 'Inglese'),
       (14, '2009-03-01', 7, 'Bompiani', 352, '978-8845259714', 'Italia', 'Italiano'),
       (15, '1998-09-01', 8, 'Plume', 352, '978-0452276725', 'Stati Uniti', 'Inglese'),
       (16, '2007-06-01', 8, 'Mondadori', 255, '978-88-04-56712-7', 'Italia', 'Italiano'),
       (17, '2015-09-01', 9, 'Feltrinelli', 304, '978-88-07-01903-1', 'Italia', 'Italiano'),
       (18, '1997-08-01', 9, 'Vintage', 288, '978-0-679-78159-7', 'Stati Uniti', 'Inglese'),
       (19, '2019-02-07', 10, 'Einaudi', 416, '978-8806245598', 'Italia', 'Italiano'),
       (20, '2000-10-01', 10, 'Vintage', 432, '978-0-375-70443-3', 'Stati Uniti', 'Inglese');

INSERT INTO OperaAutore (Opera, Autore)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
       (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);
