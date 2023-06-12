-- post_bac(niveau)
create table signature.post_bac (
	niveau int not null,
	
	primary key(niveau)
);

insert into signature.post_bac values (1);
insert into signature.post_bac values (2);
insert into signature.post_bac values (3);
insert into signature.post_bac values (4);
insert into signature.post_bac values (5);

-- type_salle(num_type, desc_type)
create table signature.type_salle (
	num_type int auto_increment not null,
	desc_type character(20),
	primary key(num_type)
	
);

insert into signature.type_salle(desc_type) values('salle de cours');
insert into signature.type_salle(desc_type) values('amphithéâtre');
insert into signature.type_salle(desc_type) values('distanciel');
insert into signature.type_salle(desc_type) values('bureau');
insert into signature.type_salle(desc_type) values('atelier');

-- salle(num_salle, etage, #num_type)
create table signature.salle (
	num_salle int not null,
	etage int,
	num_type int,
	
	primary key(num_salle),
	foreign key(num_type) references signature.type_salle(num_type)
);

insert into signature.salle  values(
	-102,
	-1,
	1
);

-- insertion des salles étages
-- -1 de -101 à -102
-- rdc pas de salles
-- 1 de 101 a 108
-- 2 de 201 a 207
-- 3 de 301 a 312
-- 4 de 401 a 418
-- 5 de 501 a 514
-- 6 de 601 a 614
-- 7 de 701 a 713

-- ecole(code_ecole, nom_ecole, acronyme_ecole)
create table signature.ecole (
	code_ecole int auto_increment not null,
	nom_ecole character(50),
	acronyme_ecole character(10),
	logo_ecole character(128),
	
	primary key(code_ecole)
);

insert into signature.ecole(nom_ecole, acronyme_ecole) values(
	'Ecole Supérieure de Génie Informatique',
	'ESGI'
);
-- insertion des 14 écoles

-- role_utilisateur(code_role, nom_role)

create table signature.role_utilisateur (
	code_role int auto_increment not null,
	nom_role character(20),
	
	primary key(code_role)
);

insert into signature.role_utilisateur(nom_role) values('étudiant');
insert into signature.role_utilisateur(nom_role) values('administratif');
insert into signature.role_utilisateur(nom_role) values('intervenant');

-- insert into signature.droit(desc_droit) values('DDIR');
create table signature.droit (
	code_droit int auto_increment not null,
	desc_droit character(20),
	
	primary key(code_droit)
);

insert into signature.droit(desc_droit) values('DETU');
insert into signature.droit(desc_droit) values('DAP');
insert into signature.droit(desc_droit) values('DRP');
insert into signature.droit(desc_droit) values('DDIR');

-- specialite(code_specialite, nom_specialite, acronyme_specialite, #code_ecole)
create table signature.specialite (
	code_specialite int auto_increment not null,
	nom_specialite character(50),
	acronyme_specialite character(10) default '-',
	code_ecole int,
	
	primary key(code_specialite),
	foreign key(code_ecole) references signature.ecole(code_ecole)
);

insert into signature.specialite(nom_specialite , acronyme_specialite, code_ecole) values(
	'Intelligence Artificielle et Big Data',
	'IABD',
	1
);

-- promotion(code_promotion, nom_promotion, #code_ecole, #code_specialite, #niveau)
create table signature.promotion (
	code_promotion int auto_increment not null,
	nom_promotion character(20),
	code_ecole int,
	code_specialite int,
	niveau int,
	
	primary key(code_promotion),
	foreign key(code_ecole) references signature.ecole(code_ecole),
	foreign key(code_specialite) references signature.specialite(code_specialite),
	foreign key(niveau) references signature.post_bac(niveau)
);

insert into signature.promotion(nom_promotion, code_ecole, niveau) values(
	'B1ESGI',
	1,
	1
);

-- utilisateur(code_utilisateur, nom, prénom, mail, chp_motPasSe_CY, #code_role, #code_droit)
create table signature.utilisateur (
	code_utilisateur int auto_increment not null,
	nom character(30),
	prenom character(30),
	mail character(64),
	chp_motPasSe_CY character(64),
	etu_nb_retard int,
	etu_nb_absence int,
	adm_service character(30),
	int_societe character(30),
	code_role int,
	code_droit int,
	code_promotion int,
	code_ecole int,
	
	primary key(code_utilisateur),
	foreign key(code_role) references signature.role_utilisateur(code_role),
	foreign key(code_droit) references signature.droit(code_droit),
	foreign key(code_promotion) references signature.promotion(code_promotion),
	foreign key(code_ecole) references signature.ecole(code_ecole)
);

-- insertion etudiant
insert into signature.utilisateur(nom, prenom, mail, chp_motPasSe_CY, etu_nb_retard, etu_nb_absence, code_role, code_droit, code_promotion) values(
	'Verstappen',
	'Max',
	'mverstappen@myges.fr',
	'etu',
	0,
	0,
	1,
	1,
	1
);

-- insertion administratif
insert into signature.utilisateur(nom, prenom, mail, chp_motPasSe_CY, adm_service, code_role, code_droit, code_ecole) values(
	'Horner',
	'Christian',
	'chorner@myges.fr',
	'admin',
	'Responsable Pédagogique',
	2,
	3,
	1
);

-- insertion intervenant
insert into signature.utilisateur(nom, prenom, mail, chp_motPasSe_CY, int_societe , code_role, code_droit) values(
	'Depp',
	'Johny',
	'jdepp@myges.fr',
	'inter',
	'Pirate des caraibes',
	3,
	2
);

-- matiere(code_matiere, nom_matiere, #code_utilisateur)
create table signature.matiere (
	code_matiere int auto_increment not null,
	nom_matiere character(50),
	code_utilisateur int,
	
	primary key(code_matiere),
	foreign key(code_utilisateur) references signature.utilisateur(code_utilisateur)
);

insert into signature.matiere(nom_matiere, code_utilisateur) values('Theorie des Systèmes d Exploitation','4');

-- creneau(code_creneau, desc_creneau)
create table signature.creneau (
	code_creneau int auto_increment not null,
	desc_creneau character(11),
	
	primary key(code_creneau)
);

insert into signature.creneau(desc_creneau) values('17h30-19h00');

-- cours(code_cours, date, #code_créneau, #code_promotion, #num_salle, #code_matiere)
create table signature.cours (
	code_cours int auto_increment not null,
	date_cours date,
	code_creneau int,
	code_promotion int,
	num_salle int,
	code_matiere int,
	
	primary key(code_cours),
	foreign key(code_creneau) references signature.creneau(code_creneau),
	foreign key(code_promotion) references signature.promotion(code_promotion),
	foreign key(num_salle) references signature.salle(num_salle),
	foreign key(code_matiere) references signature.matiere(code_matiere)
);

insert into signature.cours(date_cours, code_creneau, code_promotion, num_salle, code_matiere) values(
	'2023-06-05',
	1,
	2,
	509,
	1
);

-- absence(code_absence, justificatif, justifier, #code_cours, #code_utilisateur)
create table signature.absence (
	code_absence int auto_increment not null,
	justificatif character(128),
	justifier bool default 0,
	code_cours int,
	code_utilisateur int,
	primary key(code_absence),
	foreign key(code_cours) references signature.cours(code_cours),
	foreign key(code_utilisateur) references signature.utilisateur(code_utilisateur)
);

insert into signature.absence(code_cours, code_utilisateur) values(1, 1);

-- fin creation de table