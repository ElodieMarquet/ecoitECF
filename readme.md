WARNING : erreur sur la copie d'ECF pour le lien Heroku, le bon lien est  https://ecoit-ecf2022.herokuapp.com/

installation en local :
Ce projet est réalisé à partir de symfony 6 qui nécessite au minimum la version 8 de PHP. Assurer vous au préalable de mettre à jour votre version de PHP ou de l'installer. Pour le récupérer le projet, effecutez les commandes suivantes (dans votre console, en vous plaçant sur le dossier de travail dans lequel vous voulez importer le projet, et en prenant soin d'installer git sur votre ordinateur)

git init
git clone  https://github.com/ElodieMarquet/ecoitECF.git
Listez et vérifiez que vous êtes bien placés sur la branche main

git branch
Ensuite, installez toutes les dépendances nécessaires au bon fonctionnement du projet :

composer update

Pour les accés à la base de données vous pouvez utiliser une bdd en local.
Vous pouvez Télécharger et installer XAMPP
Une fois l'installation terminé ouvrez XAMPP, puis cliquez sur start pour Apache et MySQL, ensuite cliquez sur Admin de MySQL.
Votre serveur local phpMyAdmin va s'ouvrir dans votre navigateur internet. Sur la page d'accueil vous trouverez les informations
de votre serveur de base de données. Relevé le numero de votre server, le type de serveur et son numero de version.
Dans l'onglet SQL exécuté la commande pour créer votre base de données 

CREATE DATABASE nomdevotrebase

Une fois créer positionnez vous deçu puis cliquez sur importer, choisissez le fichier ecoit.sql qui est dans le dossier ANNEXES du projet puis exécuter.

Pour créer un SUPER_ADMIN dans l'onglet SQL de votre BDD et executer la commande

INSERT INTO user VALUES (0, 'adresse email', '[\"ROLE_SUPER_ADMIN"\]', 'mot de passe', 'prenom', 'nom', null)

Attention le mot de passe doit être hasher

Sur le fichier .env à la ligne 30 rajouter les information de votre BDD avec les information relevé sur phpMyAdmin

DATABASE_URL="mysql://root@numeroserveur:3306/nombasededonnées?serverVersion=typeserveur-numeroversionserveur"


Pour le MAILER DSN il vous faut une adresse mail google et rajouter sur le fichier .env en ligne 36 

MAILER_DSN=gmail://nomadressemail:motdepasse@default
###< symfony/google-mailer ###

le nomadressemail est tous ce qui est écrit avant le @gmail.com 
le mot de passe est celui d'accès à votre adresse email

Vous pouvez alors lancer le serveur symfony avec :

symfony serveur:start
