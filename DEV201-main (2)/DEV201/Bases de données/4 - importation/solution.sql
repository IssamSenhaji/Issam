drop database if exists importaion
create database if not exists importaion
use importaion

select * from etudiants

drop table if exists ville
create table ville ( id int primary key auto_increment )
select distinct ville libelle from etudiants;
select * from ville

drop table if exists classe
create table classe ( id int primary key auto_increment )
select distinct classe libelle from etudiants;
select * from classe

drop table if exists appreciation
create table appreciation ( id int primary key auto_increment )
select distinct appréciation libelle from etudiants;
select * from appreciation

drop table if exists Matiere
create table Matiere ( id int primary key auto_increment )
select distinct Matière libelle from etudiants;
select * from Matiere

drop table if exists stagiaire
create table ( id int primary key auto_increment )
select distinct `nom stagiaire` nom ,`prénom Stagiaire` prenom, c.id id_classe ,v.id id_ville,
date(concat(right(`Date Naissance`,4),'/',substring(`Date Naissance` ,4,2),'/',left(`Date Naissance` ,2))) date_naissance 
from etudiants e inner join ville v on v.libelle = e.ville
				 inner join classe c on c.libelle=e.classe;
select * from stagiaire

drop table if exists evaluation
create table evaluation ( id int primary key auto_increment )
select distinct convert(replace(Note,',','.'),double) note, a.id id_appreciation, m.id id_metier,s.id id_stagiaire from etudiants e
				 inner join stagiaire s on s.nom = e.`nom stagiaire` and s.prenom = e.`prénom Stagiaire`
				 inner join appreciation a on a.libelle=e.appréciation
				 inner join Matiere m on m.libelle=e.Matière;
select * from evaluation

 alter table stagiaire add constraint fk_stagiaire_ville foreign key (id_ville) references ville(id);
 alter table stagiaire add constraint fk_stagiaire_classe foreign key (id_classe) references classe(id);
 alter table evaluation add constraint fk_evaluation_stagiaire foreign key (id_stagiaire) references stagiaire(id);
 alter table evaluation add constraint fk_evaluation_matiere foreign key (id_metier) references matiere(id);
 alter table evaluation add constraint fk_evaluation_appreciation foreign key (id_appreciation) references appreciation(id);
 
#----------------------------------------------------------------------------------------------------------------------------------

#1/
select 

