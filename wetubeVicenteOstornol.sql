--WETUBE,  Vicente Ostornol :)

--Se crea la tabla users con los campos necesarios para almacenar la informacion de los usuarios
create table users(
    id_user number primary key,
    nickname varchar(20) not null unique,
    fullname varchar(50) not null,
    email varchar(50) not null unique,
    birthdate date not null,
    registration_date date not null,
    country varchar(30) not null
);

--Se crea la tabla videos con los campos necesarios para almacenar la informacion de los videos
create table videos(
    id_video number primary key,
    id_user number not null,
    video_name varchar(60) not null,
    publication_date date not null,
    visibility varchar(10) not null check(visibility in ('public', 'private', 'not_listed')),
    restriction_age smallint not null check(restriction_age in (0, 1)),
    genre varchar(20) not null check(genre in ('action', 'adventure', 'animation', 'comedy', 'drama', 'others')),
    likes number default 0,
    dislikes number default 0,
    visits number default 0,
    constraint fk_videos_users foreign key (id_user) references users(id_user) on delete cascade
);

--Se crea la tabla songs con los campos necesarios para almacenar la informacion de las canciones
create table songs(
    id_song number primary key,
    id_user number not null,
    song_name varchar(60) not null,
    genre varchar(20) not null check(genre in ('rock', 'pop', 'jazz', 'classical', 'others')),
    likes number default 0,
    dislikes number default 0,
    visits number default 0,
    constraint fk_songs_users foreign key (id_user) references users(id_user) on delete cascade
);

--Se crea la tabla moderators con los campos necesarios para almacenar la informacion de los moderadores
create table moderators(
    id_mod number primary key,
    id_user number not null,
    rut varchar(12) not null,
    account_number number not null unique,
    account_type varchar(9) not null check(account_type in('vista', 'ahorro', 'corriente')),
    bank_name varchar(60) not null,
    moderator_type varchar(15) not null check(moderator_type in ('normal', 'superior', 'supermoderador')),
    constraint fk_moderators_users foreign key (id_user) references users(id_user) on delete cascade
);

--Se crea la tabla servers con los campos necesarios para almacenar la informacion de los servidores
create table servers(
    id_server number primary key,
    server_name varchar(50) not null check(server_name in ('server1', 'server2', 'server3', 'server4', 'server5', 'server6', 'server7', 'server8', 'server9', 'server10')),
    country varchar(30) not null check(country in ('Brasil', 'Chile', 'Colombia', 'Paraguay')),
    location varchar(25) not null
);

-- En las siguientes 20 lineas se insertan 20 registros en la tabla users

insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (1, 'jpaxeford0', 'Josi Paxeford', 'jpaxeford0@ycombinator.com', '05-12-1992', '21-11-2021', 'China');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (2, 'ldeadman1', 'Lelah Deadman', 'ldeadman1@t-online.de', '25-03-1971', '05-02-2022', 'Colombia');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (3, 'klongrigg2', 'Karlotte Longrigg', 'klongrigg2@mapy.cz', '04-04-1972', '06-07-2022', 'Russia');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (4, 'ishaughnessy3', 'Inger Shaughnessy', 'ishaughnessy3@people.com.cn', '20-11-2008', '17-06-2019', 'China');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (5, 'vcromblehome4', 'Vinny Cromblehome', 'vcromblehome4@tuttocitta.it', '02-09-1977', '02-08-2021', 'Philippines');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (6, 'wkirvell5', 'Wilton Kirvell', 'wkirvell5@sitemeter.com', '16-04-2005', '26-11-2021', 'Indonesia');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (7, 'mgayden6', 'Marie-ann Gayden', 'mgayden6@google.ca', '02-06-1980', '27-10-2021', 'Indonesia');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (8, 'kgarvagh7', 'Katherina Garvagh', 'kgarvagh7@deviantart.com', '13-10-1988', '22-02-2022', 'Brazil');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (9, 'mclewlow8', 'Michel Clewlow', 'mclewlow8@issuu.com', '14-07-2014', '05-07-2022', 'United States');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (10, 'pmatches9', 'Perle Matches', 'pmatches9@ask.com', '09-12-1968', '13-05-2022', 'Indonesia');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (11, 'kpeeta', 'Kessiah Peet', 'kpeeta@squarespace.com', '12-09-1974', '12-08-2021', 'China');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (12, 'chulkb', 'Cassaundra Hulk', 'chulkb@istockphoto.com', '17-09-1975', '25-03-2022', 'Bosnia and Herzegovina');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (13, 'jharburtsonc', 'Jackelyn Harburtson', 'jharburtsonc@purevolume.com', '18-05-2012', '15-11-2020', 'Philippines');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (14, 'ddultond', 'Dolli Dulton', 'ddultond@taobao.com', '13-02-1984', '16-05-2020', 'Mexico');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (15, 'tcarmoe', 'Terrell Carmo', 'tcarmoe@gmpg.org', '11-08-1991', '12-11-2021', 'Ireland');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (16, 'rbatsonf', 'Rafaellle Batson', 'rbatsonf@blog.com', '03-10-1990', '21-11-2021', 'Russia');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (17, 'mlangdridgeg', 'Magnum Langdridge', 'mlangdridgeg@so-net.ne.jp', '09-10-1961', '24-08-2020', 'Sweden');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (18, 'halbertsonh', 'Hy Albertson', 'halbertsonh@live.com', '02-07-2016', '22-01-2022', 'France');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (19, 'kroyi', 'Kerrie Roy', 'kroyi@topsy.com', '30-04-1989', '13-06-2022', 'France');
insert into users (id_user, nickname, fullname, email, birthdate, registration_date, country) values (20, 'smiddlemassj', 'Sawyer Middlemass', 'smiddlemassj@walmart.com', '17-07-1992', '14-04-2018', 'Philippines');


-- En las siguientes 20 lineas se insertan 20 registros en la tabla videos

insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (1, 12, 'Germana Kubach', '19-05-2022', 'public', 0, 'action', 502, 599, 899);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (2, 18, 'Dex Prewett', '02-11-2021', 'not_listed', 1, 'action', 197, 505, 968);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (3, 7, 'Kelsy Dhillon', '02-07-2022', 'public', 1, 'animation', 80, 166, 708);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (4, 16, 'Minne Melluish', '04-12-2021', 'not_listed', 0, 'comedy', 480, 265, 740);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (5, 4, 'Dorice Slimme', '21-05-2022', 'public', 1, 'adventure', 573, 580, 882);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (6, 4, 'Byram Bonick', '28-02-2022', 'public', 1, 'comedy', 583, 117, 841);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (7, 15, 'Brocky Halburton', '06-07-2022', 'not_listed', 1, 'drama', 68, 216, 740);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (8, 5, 'Mignon Goad', '24-05-2022', 'public', 0, 'adventure', 458, 553, 818);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (9, 6, 'Clem Hitcham', '01-11-2021', 'not_listed', 1, 'action', 498, 161, 918);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (10, 16, 'Cindy Staton', '18-12-2021', 'not_listed', 1, 'adventure', 346, 109, 701);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (11, 3, 'Darcee Buscher', '15-11-2021', 'not_listed', 0, 'action', 41, 260, 668);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (12, 3, 'Dorisa Pickersail', '04-08-2021', 'not_listed', 0, 'animation', 485, 544, 706);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (13, 11, 'Hamel Stovold', '08-09-2021', 'public', 1, 'comedy', 318, 161, 883);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (14, 11, 'Beatrisa Wigginton', '12-02-2022', 'private', 1, 'comedy', 508, 416, 615);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (15, 15, 'Gayler McNalley', '28-06-2022', 'not_listed', 0, 'animation', 559, 565, 858);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (16, 11, 'Paula Liversley', '20-01-2022', 'not_listed', 1, 'others', 248, 571, 690);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (17, 10, 'Daffy Krolle', '19-10-2021', 'private', 1, 'others', 270, 457, 956);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (18, 15, 'Melissa Scruby', '04-10-2021', 'private', 1, 'animation', 11, 195, 651);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (19, 13, 'Ezequiel Surgeoner', '21-08-2021', 'private', 0, 'others', 129, 432, 916);
insert into videos (id_video, id_user, video_name, publication_date, visibility, restriction_age, genre, likes, dislikes, visits) values (20, 16, 'Adey Spittall', '31-10-2021', 'private', 1, 'animation', 146, 301, 818);


-- En las siguientes 20 lineas se insertan 20 registros en la tabla songs
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (1, 6, 'Kentuckian, The', 'others', 168, 799, 483);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (2, 19, 'Aziz Ansari: Live at Madison Square Garden', 'others', 535, 221, 497);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (3, 9, 'Disco Pigs', 'pop', 466, 326, 935);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (4, 11, 'The Great Alligator', 'classical', 723, 440, 805);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (5, 19, 'Jayne Mansfield''s Car', 'jazz', 712, 568, 945);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (6, 20, 'Vares: The Kiss of Evil (Vares - Pahan suudelma)', 'rock', 292, 285, 443);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (7, 10, 'Village of the Giants', 'jazz', 192, 300, 637);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (8, 17, 'Down and Out with the Dolls', 'rock', 334, 4, 884);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (9, 18, 'Linda Linda Linda', 'classical', 478, 564, 377);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (10, 4, 'Ring Finger, The (L''annulaire)', 'jazz', 98, 729, 93);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (11, 13, 'Heart of Me, The', 'jazz', 545, 408, 891);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (12, 4, 'Daddy Day Care', 'pop', 737, 756, 837);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (13, 15, 'Pineapple Express', 'rock', 673, 602, 164);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (14, 2, 'Horseman, The', 'classical', 35, 126, 12);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (15, 7, 'Austin Powers: The Spy Who Shagged Me', 'pop', 37, 694, 278);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (16, 20, 'In God''s Hands', 'jazz', 559, 281, 928);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (17, 11, 'Unmistaken Child', 'classical', 119, 741, 269);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (18, 8, 'Azumi', 'pop', 595, 629, 861);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (19, 19, 'Ice Poison', 'jazz', 26, 465, 289);
insert into songs (id_song, id_user, song_name, genre, likes, dislikes, visits) values (20, 7, 'Sound of Music, The', 'jazz', 628, 96, 952);


-- En las siguientes 20 lineas se insertan 20 registros en la tabla moderators
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (1, 14, '243538367-3', 123, 'ahorro', 'Yost-Bruen', 'normal');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (2, 20, '421796395-5', 687132, 'ahorro', 'Rau-Rutherford', 'normal');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (3, 7, '612258416-9', 1523798, 'ahorro', 'Trantow-Bartoletti', 'supermoderador');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (4, 16, '112477267-7', 132897, 'corriente', 'Nikolaus, Beahan and Gleichner', 'normal');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (5, 11, '468326880-9', 987132, 'corriente', 'Jaskolski-Lemke', 'superior');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (6, 16, '043826476-2', 387291, 'vista', 'Witting Inc', 'supermoderador');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (7, 3, '615969968-7', 321879, 'corriente', 'Willms-Ondricka', 'superior');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (8, 4, '105862151-3', 321798, 'corriente', 'Crist-Hickle', 'normal');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (9, 8, '484621641-1', 098, 'ahorro', 'Towne-Bernier', 'superior');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (10, 19, '352855927-6', 371298, 'ahorro', 'Bogan Group', 'normal');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (11, 15, '289075725-0', 231980, 'ahorro', 'Stiedemann, Kuphal and Conn', 'supermoderador');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (12, 11, '700164740-3', 938021, 'corriente', 'Reichert, Torp and Upton', 'supermoderador');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (13, 9, '104677420-4', 879321, 'ahorro', 'Erdman Group', 'superior');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (14, 6, '760686529-9', 321321, 'vista', 'Zboncak, Rodriguez and Kilback', 'normal');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (15, 14, '078868558-9', 432342, 'vista', 'Waters, Bayer and Mueller', 'supermoderador');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (16, 18, '352950194-8', 781623, 'vista', 'Ruecker Inc', 'normal');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (17, 14, '731913891-3', 768213, 'vista', 'Kutch and Sons', 'superior');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (18, 19, '930693240-5', 123768, 'corriente', 'Considine Inc', 'supermoderador');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (19, 20, '471035555-X', 901328, 'corriente', 'Sanford, Gulgowski and Schamberger', 'superior');
insert into moderators (id_mod, id_user, rut, account_number, account_type, bank_name, moderator_type) values (20, 18, '302029341-3', 321231312, 'ahorro', 'Kuvalis Inc', 'normal');


-- En las siguientes 20 lineas se insertan 20 registros en la tabla servers

insert into servers (id_server, server_name, country, location) values (1, 'server7', 'Chile', 'Golf View');
insert into servers (id_server, server_name, country, location) values (2, 'server6', 'Chile', 'Swallow');
insert into servers (id_server, server_name, country, location) values (3, 'server4', 'Brasil', 'Dunning');
insert into servers (id_server, server_name, country, location) values (4, 'server6', 'Colombia', 'Scofield');
insert into servers (id_server, server_name, country, location) values (5, 'server4', 'Colombia', 'Melrose');
insert into servers (id_server, server_name, country, location) values (6, 'server10', 'Chile', 'Butterfield');
insert into servers (id_server, server_name, country, location) values (7, 'server7', 'Chile', 'Golf View');
insert into servers (id_server, server_name, country, location) values (8, 'server6', 'Colombia', 'Mandrake');
insert into servers (id_server, server_name, country, location) values (9, 'server6', 'Colombia', 'Delladonna');
insert into servers (id_server, server_name, country, location) values (10, 'server2', 'Brasil', 'Anzinger');
insert into servers (id_server, server_name, country, location) values (11, 'server3', 'Brasil', 'Manufacturers');
insert into servers (id_server, server_name, country, location) values (12, 'server2', 'Chile', 'Warner');
insert into servers (id_server, server_name, country, location) values (13, 'server5', 'Chile', 'Autumn Leaf');
insert into servers (id_server, server_name, country, location) values (14, 'server4', 'Paraguay', 'Hermina');
insert into servers (id_server, server_name, country, location) values (15, 'server6', 'Colombia', 'Utah');
insert into servers (id_server, server_name, country, location) values (16, 'server5', 'Paraguay', 'Miller');
insert into servers (id_server, server_name, country, location) values (17, 'server9', 'Chile', 'Summer Ridge');
insert into servers (id_server, server_name, country, location) values (18, 'server10', 'Chile', 'Mockingbird');
insert into servers (id_server, server_name, country, location) values (19, 'server6', 'Colombia', 'Pearson');
insert into servers (id_server, server_name, country, location) values (20, 'server4', 'Paraguay', 'Larry');


--Consulta con la  cantidad de videos subidos por cada usuario
create view cant_videos_por_usuario as
select count(*) as cantidad_videos, id_user from videos group by id_user;

--Consulta que trae la cantidad de videos subidos por cada genero
create view cant_videos_por_genero as
select count(*) as cantidad_videos, genre as genero from videos group by genre;

-- Consulta que trae la cantidad de canciones subidas
create view cant_canciones_subidas as
select count(*) as cantidad_canciones from songs;

-- Consulta que trae la cantidad de usuarios que tengan mas de un año de antiguedad de registro
create view cant_usuarios_antiguos as
SELECT count(id_user) as usuarios_mayor_un_anio FROM users where (months_between(SYSDATE, registration_date) /12) > 1;

-- Consulta que trae la cantidad de usuarios que tengan menos de un año de antiguedad de registro
create view  cant_usuarios_nuevos as
SELECT count(id_user) as usuarios_menor_un_anio FROM users where (months_between(SYSDATE, registration_date) /12) < 1;


--Consulta que trae la cantidad de moderadores
create view cant_moderadores as
select count(*) as cantidad_moderadores from moderators;

--Consulta que trae cantidad de videos restringidos +18
create view cant_videos_restringidos as
select count(*) as cantidad_videos from videos where restriction_age = 1;

--Consulta que trae los ID_VIDEO de los videos publicados el ultimo mes
create view videos_ultimo_mes as
select id_video as id_video_ultimo_mes from videos where (months_between(SYSDATE, publication_date)) <= 1;

--Consulta que trae la cantidad de canciones subidas por cada genero
create view cant_canciones_por_genero as
select count(*) as cant_canciones, genre from songs group by genre;

--Consulta que trae la cancion con mas visitas y sus respectivas visitas
create view cancion_mas_visitada as
SELECT id_song, song_name, visits FROM songs WHERE visits=(SELECT max(visits) FROM songs);

--Consulta que trae la cantidad de los usuarios mayores a 13 años de edad
create view cant_usuarios_mayores_13 as
SELECT count(*) as cant_usuarios_mayor_13_anios FROM users WHERE (months_between(SYSDATE, birthdate) /12) > 13;



----- MODIFICACIONES Y ELIMINACIONES DE LOS REGISTROS ----- 

--modifica la fecha aumentando en 30 dias de todos los videos con menos de un año de antiguedad de la tabla videos
update videos set publication_date = add_months(publication_date, 1) where (months_between(SYSDATE, publication_date) /12) < 1;


--aumenta la cantidad de likes de todos los videos en 350
update videos set likes = likes + 350;


-- elimina todos los videos que tengan una calificación para mayores de 18.
delete from videos where restriction_age = 1;

-- elimina todos los usuarios menores a 13 años de edad
delete from users where (months_between(SYSDATE, birthdate) /12) < 13;


