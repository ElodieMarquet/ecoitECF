CREATE DATABASE  IF NOT EXISTS heroku_6ed042dc7f89794 /*!40100 DEFAULT CHARACTER SET utf8 */;
USE heroku_6ed042dc7f89794;
-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 11 avr. 2022 à 21:38
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `heroku_6ed042dc7f89794`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220326143754', '2022-03-26 15:39:18', 62),
('DoctrineMigrations\\Version20220326144705', '2022-03-27 20:19:19', 64),
('DoctrineMigrations\\Version20220327173034', '2022-03-27 20:19:19', 147),
('DoctrineMigrations\\Version20220328152702', '2022-03-28 17:29:35', 160),
('DoctrineMigrations\\Version20220328190348', '2022-03-28 21:04:08', 210),
('DoctrineMigrations\\Version20220329104430', '2022-03-29 12:44:46', 162),
('DoctrineMigrations\\Version20220329115944', '2022-03-29 14:00:00', 63),
('DoctrineMigrations\\Version20220329170857', '2022-03-29 19:09:20', 91),
('DoctrineMigrations\\Version20220331121321', '2022-03-31 14:13:31', 387),
('DoctrineMigrations\\Version20220404100518', '2022-04-04 12:06:25', 240),
('DoctrineMigrations\\Version20220404204502', '2022-04-04 22:46:00', 244),
('DoctrineMigrations\\Version20220407151515', '2022-04-07 17:16:06', 656);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(140) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_auteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `section_id`, `name`, `image`, `description`, `contenu`, `video`, `created_at`, `slug`, `nom_auteur_id`) VALUES
(81, 105, 'Comment fonctionne un site web', 'telechargement-624e17d587d65.jpg', 'Bienvenue à tous ! Voici donc le premier chapitre de ce cours pour débutants, qui va vous apprendre à créer votre site web !', 'Je vous propose de commencer par la question la plus simple mais aussi la plus importante : comment fonctionnent les sites web ?\r\n\r\nNon, n\'ayez pas peur de poser des questions, même si vous pensez qu\'elles sont « bêtes ». Il est très important que nous en parlions un peu avant de nous lancer à fond dans la création de sites !\r\nJe suis certain que vous consultez des sites web tous les jours. Pour cela, vous lancez un programme appelé le navigateur web. Avec le navigateur, vous pouvez consulter n\'importe quel site web. Aujourd\'hui, tout le monde sait aller sur le Web… mais qui sait vraiment comment le Web fonctionne ? Comment créer des sites web comme celui-ci ?\r\n\r\nJ\'ai entendu parler de HTML, de CSS, est-ce que cela a un rapport avec le fonctionnement des sites web ? \r\n\r\nTout à fait !\r\n\r\nIl s\'agit de langages informatiques qui permettent de créer des sites web. Tous les sites web sont basés sur ces langages, ils sont incontournables et universels aujourd\'hui. Ils sont la base même du Web. Le langage HTML a été inventé par un certain Tim Berners-Lee en 1991…\r\nDe nombreuses personnes confondent (à tort) Internet et le Web. Il faut savoir que le Web fait partie d\'Internet.\r\nInternet est un grand ensemble qui comprend, entre autres : le Web, les e-mails, la messagerie instantanée, etc.\r\nTim Berners-Lee n\'est donc pas l\'inventeur d\'Internet, c\'est « seulement » l\'inventeur du Web.\r\n\r\nLes langages HTML et CSS sont à la base du fonctionnement de tous les sites web. Quand vous consultez un site avec votre navigateur, il faut savoir que, en coulisses, des rouages s\'activent pour permettre au site web de s\'afficher. L\'ordinateur se base sur ce qu\'on lui a expliqué en HTML et CSS pour savoir ce qu\'il doit afficher.\r\nHTML et CSS sont deux « langues » qu\'il faut savoir parler pour créer des sites web. C\'est le navigateur web qui fera la traduction entre ces langages informatiques et ce que vous verrez s\'afficher à l\'écran.', 'https://www.youtube.com/embed/dYgNvn98Nag', '2022-04-06 17:54:10', 'comment-fonctionne-un-site-web', 282),
(82, 106, 'Installation de symfony 6', 'images-62508e91627a5.jpg', 'Dans ce 1er tutoriel de la série sur Symfony 6, nous allons voir les différentes méthodes d\'installation du script selon les besoins.', 'Vous devez installer le gestionnaire de dépendances Composer (https://getcomposer.org) en suivant les étapes correspondant à votre système d\'exploitation.\r\nPour vérifier si l\'installation est fonctionnelle, aller dans un terminal et saisir la commande :\r\n [ composer --version ] \r\n\r\nEn cas de succès la commande affichera le numéro de version de composer.\r\nSymfony CLI\r\nIl est recommandé d\'utiliser l\'interface de ligne de commande Symfony CLI que vous trouverez sur https://symfony.com/download \r\nPour vérifier si l\'installation est fonctionnelle, aller dans un terminal et saisir la commande : [ symfony --version ] \r\nEn cas de succès la commande affichera le numéro de version de Symfony CLI (à ne pas confondre avec la version du script).\r\nCréation d\'un projet\r\nPour créer un projet, nous aurons la possibilité d\'utiliser Symfony CLI ou Composer.\r\nDans la suite des tutoriels, j\'utiliserai toujours Symfony CLI.\r\nCréation d\'un projet “Micro service, Console ou API”\r\nUn projet n\'est pas nécessairement un site web, il peut s\'agir d\'un micro service, d\'une API ou d\'une application console, ne nécessitant pas d\'interface graphique ou de composants avancés.\r\nVous pouvez créer un projet de base de ce type en utilisant l\'une des deux commandes ci-dessous, selon l\'utilisation ou non de Symfony CLI. En utilisant Symfony CLI : [ symfony new nom_du_projet ]  En utilisant Composer  [  composer create-project symfony/skeleton nom_du_projet ] \r\nA la suite de cette commande, le dossier “nom_du_projet” (à modifier selon le nom de votre projet) sera créé et contiendra les fichiers et dossiers de base d\'un projet Symfony dans la version en cours lors de l\'exécution de la commande (6.0.2 lors de l\'écriture de ce tuto).\r\nCréation d\'un projet de site web\r\nSi votre projet est un site web, vous pouvez le créer en utilisant l\'une des deux commandes ci-dessous, selon l\'utilisation ou non de Symfony CLI.  En utilisant Symfony CLI : [ symfony new –webapp nom_du_projet ]  En utilisant Composer  [  composer create-project symfony/skeleton nom_du_projet (taper entrée puis) cd nom_du_projet (taper entrée puis) composer require webapp ] \r\nA la suite de cette/ces commande, le dossier “nom_du_projet” (à modifier selon le nom de votre projet) sera créé et contiendra les fichiers et dossiers de base d\'un projet Symfony dans la version en cours lors de l\'exécution de la commande (6.0.2 lors de l\'écriture de ce tuto).', 'https://www.youtube.com/embed/kuKb3VfcTWE', '2022-04-07 14:32:46', 'installation-de-symfony-6', 283),
(83, 106, 'Présentation et configuration du projet (Symfony 6)', 'symfony2bis-624edf94bdacc.jpg', 'Dans ce 2ème tutoriel de la série sur Symfony 6, nous allons voir comment configurer notre projet Symfony 6.', 'Dans ce 2ème tutoriel de la série sur Symfony 6, nous allons voir comment configurer notre projet Symfony 6.\r\nIl s\'agit d\'un projet de e-commerce dont la base de données est structurée comme indiqué sur ce site https://dbdiagram.io/d/61643981940c4c4eec8f40a5 \r\nCette base de données évoluera au fil des tutoriels.\r\nOutils nécessaires\r\nPHP 8.0.2 au minimum\r\nMySQL, PGSQL…\r\nSymfony CLI (voir tuto précédent)\r\nComposer\r\nVérifications\r\nNous allons vérifier que nous avons tout ce qui est nécessaire pour exécuter efficacement Symfony.\r\nNous allons utiliser la commande suivante pour effectuer cette vérification [ symfony check:requirements ]  Cette commande vous donnera une liste de recommandations pour faire fonctionner Symfony.\r\nSi, par exemple, il vous manque un module d\'extension de PHP, il vous faudra les installer ou activer.\r\nSi vous utilisez Windows, les modules seront à activer dans php.ini.\r\nSur Mac ou Linux, il faudra utiliser votre terminal.\r\nSur une édition Debian ou équivalent, vous installerez, par exemple mysql, en exécutant la commande [ apt install php-mysql ] puis  [ phpenmod pdo_mysql ] \r\nConfiguration de l\'environnement de développement\r\nCommencer par copier le fichier .env en .env.local pour avoir vos paramètres locaux.\r\nModifiez les lignes selon vos besoins\r\nMESSENGER_TRANSPORT_DSN : méthode de transport des messages (mails, notifications…)\r\nDATABASE_URL : paramétrage de la connexion à la base de données (pilote, utilisateur, mot de passe, hôte, nom de la base de données, version du serveur)\r\nMAILER_DSN : serveur utilisé pour l\'envoi de mails', 'https://www.youtube.com/embed/kpSYFMV4eJc', '2022-04-07 14:56:52', 'presentation-et-configuration-du-projet-symfony-6', 283),
(84, 105, 'Les bases d\'HTML et CSS', 'telechargement1-624f43bcb7937.jpg', 'Dans ce cours, vous apprendrez comment utiliser HTML5 et CSS3, les deux langages de programmation à la base de tous les sites web.', 'Description du Cours:\r\nVous souhaitez devenir dévelopeur web ? Vous voulez être capable de créer un site Internet ? Mais vous êtes un total débutant dans ce domaine ?\r\nAlors bonne nouvelle! Ce cours est fait pour vous..\r\nD’abord on va apprendre les bases du développement web, c’est-à-dire HTML et CSS.\r\nC’est quoi HTML ?\r\nC’est un langage composé de ce qu’on appelle des tags qui permet de représenter la structure de nos pages Web.\r\nUn titre, un paragraphe, des images, etc…\r\nMaintenant, il faut savoir que HTML sans CSS c’est pas très joli !\r\nC’est pourquoi HTML vient souvent avec son fidèle compagnon : le CSS.\r\nC’est quoi CSS ?\r\nC’est un langage qui va décorer notre HTML. Il est responsable des couleurs, des tailles, de la mise en page, etc…\r\nDans ce cours vous allez construire un site Web depuis 0 avec uniquement de l’HTML et du CSS.\r\nVous allez taper vos premières lignes de code ! Je vous assisterai et vous expliquerai en détails chacune des étapes.\r\nAllez ! On passe à l’action !', 'https://www.youtube.com/embed/Tnym_6qCcNE', '2022-04-07 21:57:38', 'les-bases-dhtml-et-css', 282),
(85, 105, 'Bootstrap 4 créer une page web responsive', 'telechargement2-624f50ca19c7b.jpg', 'Dans ce cours vous créerez des pages web à l\'aide de Bootstrap 4. Vous rendrez ces pages réactives grâce de la grille flexible de Bootstrap.', 'Maintenant que nous savons installer Bootstrap, nous voulons commencer à l\'utiliser pour nos projets. Nous allons donc voir comment utiliser le système de grille, qui nous permettra de créer nos mises en page. Afin de pouvoir construire différentes mises en forme pour nos projets web, nous allons étudier le système de grille de Bootstrap. Comment fonctionne ce système ? Une grille Bootstrap peut être visualisée comme un tableau constitué de plusieurs lignes et colonnes, et sur laquelle il est possible de placer les différents blocs de contenus. Dans les faits, elle est constituée d\'un conteneur disposant de lignes, elles-mêmes composées de cellules (ou colonnes). Chacun de ces éléments (conteneur, ligne, colonne) étant représenté par une balise HTML (ex : \r\n). Au niveau de son fonctionnement, la grille Bootstrap repose sur un système de classes CSS à affecter à nos balises HTML (ex : \r\n) : Les classes CSS dédiées au conteneur, qui est l\'élément qui va englober nos différentes lignes et colonnes. Il peut y avoir plusieurs conteneurs dans une page en fonction des besoins, mais il n\'est pas nécessaire de les imbriquer. Les classes dédiées à une ligne : il peut y avoir zéro ou plusieurs lignes dans un conteneur, et celles-ci vont contenir les différentes colonnes. Les classes permettant de définir les différentes colonnes. Des classes pour gérer les alignements horizontaux et verticaux ou pour redéfinir l\'ordre des colonnes. La grille de Bootstrap dispose de douze colonnes et cinq points de rupture (pour le responsive web design). Une colonne peut donc avoir une taille de 1/12, 2/12, ..., ou 12/12 de l\'espace disponible. Il est possible de réaliser des lignes avec le nombre de colonnes que l\'on souhaite (1 à 12) et plusieurs lignes peuvent être déclarées avec un nombre différent de colonnes dans le même conteneur. La grille de Bootstrap est donc extrêmement flexible et permet de réaliser tout type de mise en page. Depuis la version 4 de Bootstrap, la grille utilise les propriétés CSS de flexbox.', 'https://www.youtube.com/embed/-XBNfaa81SA', '2022-04-07 22:57:00', 'bootstrap-4-creer-une-page-web-responsive', 282),
(86, 106, 'Création de la base de données (Symfony 6)', 'symfony3-624f57a74fc9c.jpg', 'Un projet Symfony c\'est bien, mais avoir une base de données qui va avec, c\'est mieux. On va donc aborder la création d\'une base de données.', 'Après avoir configuré notre projet, il est temps de créer notre base de données.\r\nCréer la base\r\nDans un premier temps, nous allons créer la base vide au moyen du terminal en utilisant Doctrine par la commande suivante :  [  synfony console doctrine:database:create  ]  \r\nCréer les entités\r\nAprès avoir créé la base de données, nous allons créer les entités dans notre projet, chaque entité correspondra à une table dans la base de données.\r\nJe fais le choix de nommer mes entités au pluriel, c\'est un choix personnel.\r\nIl n\'existe aucune règle, ce qui compte est la cohérence sur tout le projet.\r\nPour créer une entité, nous utiliserons la commande suivante dans le terminal  [  symfony console make:entity ]  \r\nEnsuite, en suivant l\'assistant, nous définirons plusieurs critères :  - Le nom de l\'entité, par exemple Produits qui sera intégré dans la base de données sous le nom produits. - La liste des propriétés souhaitées et leur type. Voici la liste des types principaux : string, text, boolean, integer (or smallint, bigint), float.  -  Les propriétés spécifiques au type choisi.  \r\nAprès avoir suivi l\'assistant, nous obtenons un fichier php dans src/Entity qui porte le nom de l\'entité, par exemple Produits.php\r\nDans ce fichier, vous retrouverez les propriétés, le type de données et les accesseurs.\r\nVous retrouverez tous les exemples dans la vidéo.', 'https://www.youtube.com/embed/MhVAwrujifQ&t=883s', '2022-04-07 23:29:11', 'creation-de-la-base-de-donnees-symfony-6', 283),
(89, 107, 'Débuter en Javascript - Les bases', 'images1-6252a9cf6b1b2.jpg', 'Ce cours est conçu pour vous enseigner les bases du langage de programmation JavaScript et pour vous apporter beaucoup de pratique au passag', 'Afin d\'exécuter du JavaScript dans un fichier HTML, vous devrez écrire le code dans un fichier à part que vous inclurez ensuite dans votre fichier HTML. Cela vous permettra de réutiliser ce code sur toutes les pages où vous en aurez besoin, mais aussi d\'organiser votre code en séparant les différentes parties de votre site web (HTML/CSS/JavaScript). Pour cela, nous allons créer deux fichiers à la racine d\'un même dossier : Le fichier HTML : index.html, Le fichier JavaScript : main.js. Ensuite, nous allons inclure le fichier \"main.js\" dans notre fichier HTML grâce à l\'attribut \"src\" de la balise <script>  Il suffit ensuite d\'ouvrir le fichier HTML avec votre navigateur web Firefox ou Chrome afin d\'afficher le message d\'alerte. À retenir : l\'attribut \"src\" de la balise <script>   vous permet de renseigner le chemin vers votre fichier JavaScript.  Écrivez votre code JavaScript dans des fichiers à part afin de pouvoir le réutiliser et afin de séparer les différentes parties de votre site web (HTML/CSS/JavaScript).Que vous souhaitiez tester du code JavaScript sur une page web ou le déboguer, vous serez amenés à utiliser les outils des navigateurs pour cela. En effet, les navigateurs web modernes (Firefox, Chrome) proposent des outils permettant d\'inspecter, déboguer une page et tester du JavaScript. Ces outils sont accessibles en faisant un clic droit sur la page web puis \"Examiner\" ou \"Inspecter\", ou encore via la touche \"F12\" de votre clavier. Ensuite, dans l\'onglet \"Console\", tapez : 1 alert(\'Hello world\') Puis validez avec la touche \"Entrée\" afin d\'afficher le message d\'alerte. À retenir : Accédez aux outils des navigateurs via le clic droit sur la page web, puis \"Examiner\" ou \"Inspecter\", ou encore via la touche \"F12\", puis tapez votre JavaScript dans l\'onglet \"Console\". Il est possible d\'écrire du code sur plusieurs lignes en appuyant sur \"Shift\" + \"Entrée\" afin de passer à la ligne. Vous pouvez également déclarer des variables. Taper le nom de la variable dans la console permet de voir sa valeur. Il est vivement conseillé d\'apprendre à utiliser et maîtriser ces outils, qui seront indispensables dans votre quotidien de développeur JavaScript', 'https://www.youtube.com/embed/0h6pig0xUo0', '2022-04-10 11:56:31', 'debuter-en-javascript-les-bases', 283),
(90, 107, 'Débuter en Javascript - Gérer les nombres', 'image2-6252aad7cd591.jpg', 'À ce point du didacticiel, nous parlerons de « mathématiques en JavaScript » — comment utiliser les operators et autres fonctionnalités pour', 'Dans un cours précédent, nous avons vu que les variables servaient à stocker des données afin de les réutiliser et les manipuler par la suite. Dans le cas des données de type numérique (integer, float), différentes opérations sont possibles par le biais des opérateurs arithmétiques. Nous allons voir à quoi ils servent et comment les utiliser.\r\nLes opérateurs arithmétiques utilisent des valeurs numériques comme opérandes, sous forme de littéraux ou de variables, et renvoient une valeur numérique. Les plus utilisés sont l\'addition, la soustraction, la multiplication et la division. Les opérateurs arithmétiques standards (+, -, * et /) fonctionnent de la même manière que toute opération classique.\r\nEn plus des opérateurs arithmétiques standards, JavaScript fournit quelques opérateurs arithmétiques supplémentaires, comme le modulo (%), l\'incrémentation (++), la décrémentation (--), le plus et la négation unaire (+ et -). Le modulo (%) est un opérateur qui renvoie le reste entier de la division entre deux opérandes. Ce reste est toujours plus petit que la valeur du diviseur. L\'incrémentation permet d\'ajouter 1 à l\'opérande et renvoie une valeur numérique. Si l\'opérateur est utilisé en suffixe (variable++), il renvoie la valeur avant l\'incrémentation. S\'il est utilisé en préfixe (++variable), il renvoie la valeur après l\'incrémentation. La décrémentation permet de soustraire 1 à l\'opérande et renvoie une valeur numérique. Si l\'opérateur est utilisé en suffixe (variable--), il renvoie la valeur avant la décrémentation. S\'il est utilisé en préfixe (--variable), il renvoie la valeur après la décrémentation. Le plus unaire est situé avant l\'opérande et retourne l\'opérande, converti en nombre si cela est possible et que ce n\'en est pas déjà un. Il permet donc de convertir des chaînes de caractères composées uniquement de nombres entiers ou flottants, ainsi que des booléens et la valeur null. Si l\'opération ne peut pas être effectuée, la valeur retournée sera NaN. Nous avons vu comment procéder à des opérations standards telles que les additions, soustractions, multiplications et divisions, mais aussi comment incrémenter et décrémenter une valeur, et obtenir le reste entier d\'une division grâce au modulo. Ces opérations sont les plus courantes en JavaScript et seront donc utiles dans de nombreuses situations.', 'https://www.youtube.com/embed/K7nqIwKbL-Y', '2022-04-10 12:00:55', 'debuter-en-javascript-gerer-les-nombres', 283),
(91, 107, 'Débuter en Javascript - Gérer les textes', 'images3-6252ac4054eb0.jpg', 'Concentrons-nous maintenant sur les chaînes de caractères - c\'est le nom donné à un segment de texte en programmation. Dans cet article, nou', 'Lors de la manipulation de chaînes de caractères, nous pouvons avoir besoin de joindre des chaînes entre elles à l\'aide de l\'opérateur de concaténation, afin de compléter un message, par exemple, ou d\'afficher directement la valeur d\'une variable dans la chaîne de caractères en utilisant les littéraux de gabarits. Concaténer des chaînes JavaScript :   pour concaténer des chaînes JavaScript, nous allons utiliser le signe plus (+) entre les différentes chaînes à concaténer. Additionner et concaténer des éléments : L\'utilisation du signe + après une chaîne de caractères entraîne la conversion des nombres en chaînes, alors que, si le signe est utilisé en premier sur des nombres, ceux-ci sont additionnés.\r\nPour pallier cela, il est possible de mettre les nombres que l\'on souhaite additionner entre parenthèses. Il est également possible de concaténer des tableaux (arrays), notion qui sera détaillée dans un cours dédié, à l’aide de la méthode concat(). Il est également possible de concaténer des chaînes de caractères à l’aide de la méthode concat(), cependant la concaténation à l’aide des opérateurs + ou += est préférée pour des raisons de performances. Les littéraux de gabarits (Template literals / Template strings) Avec cette technique, nous allons entourer nos chaînes de caractères avec des accents graves (`) et non avec des apostrophes ou guillemets, comme nous le faisions jusqu\'à présent. En utilisant les accents graves, nous pouvons afficher directement les valeurs de nos variables en les entourant d\'accolades, et précédées du symbole dollar (ex : ${myVar}). Contrairement à la concaténation avec le signe +, il n\'est pas nécessaire ici de refermer la chaîne de caractères pour y concaténer une variable. L\'utilisation des accents graves permet également de conserver les retours à la ligne et les décalages.', 'https://www.youtube.com/embed/Zm1aDNQdhUA', '2022-04-10 12:06:56', 'debuter-en-javascript-gerer-les-textes', 283),
(92, 108, 'Débuter en PHP - Les bases (PHP8)', 'php1-6252ad16b6b37.jpg', 'PHP permet de développer toutes sortes de sites web : blogs, réseaux sociaux, sites e-commerce… car ce langage a justement été conçu pour cr', 'L’intérêt du PHP est qu\'il permet de modifier dynamiquement le contenu d\'une page HTML. Il est possible d\'intégrer le PHP directement dans une structure HTML et de l\'utiliser pour générer des fragments de la page HTML. Pour intégrer du PHP dans du HTML, il faut : Créer un fichier PHP , ajouter normalement les parties statiques en HTML, par exemple les éléments html, head et body, pour chaque section dynamique, ajouter le code PHP entre une balise ouvrante <?php et une balise fermante ?>. La balise de fermeture est obligatoire, sinon tout ce qu\'il y a après la balise d\'ouverture sera considéré comme du PHP.', 'https://www.youtube.com/embed/fIOidjf1y5I', '2022-04-10 12:10:30', 'debuter-en-php-les-bases-php8', 283),
(93, 108, 'Débuter en PHP - Manipuler les chaînes de caractères (PHP8)', 'php2-6252ae3eab775.jpg', 'Comment manipuler les chaînes de caractère avec PHP ? Découvrez une sélection de fonctions très pratique.', 'Une chaîne de caractères est une suite de caractères dont le nombre maximal n\'est pas limité. Elle est toujours délimitée par des simples cotes ou des doubles cotes. Pour concaténer les chaînes de caractères on utilise l\'opérateur point (.). Cet opérateur permet d\'unir deux chaînes de caractères en une seule. PHP dispose d\'une panoplie de fonctions qui permettent de manipuler les chaînes de caractères. Elles sont tellement nombreuses qu\'il faut des pages et des pages pour toutes les énumérer. Je me contente donc des fonctions les plus fréquentes et les plus utiles. Bien entendu vous pouvez les combiner ou créer vos propres fonctions PHP  Jusqu\'ici nous nous sommes servis de la fonction echo pour afficher nos chaînes de caractères. Cependant, echo n\'est pas une fonction proprement parlant car elle n\'exige pas les parenthèses. Mais c\'est le moyen le plus utilisé pour exporter nos chaînes de caractères sur l\'écran. Il existe aussi la structure print qui permet d\'afficher un message de la même manière que la structure echo. Notez que print n\'est pas une fonction non plus car elle n\'exige pas les parenthèses.', 'https://www.youtube.com/embed/GTlWnub31SQ', '2022-04-10 12:15:26', 'debuter-en-php-manipuler-les-chaines-de-caracteres-php8', 283),
(94, 108, 'Débuter en PHP - Manipuler les nombres (PHP8)', 'php3-6252aef679145.jpg', 'Cette série de tutoriels traite des bases de php. Celui-ci concerne la manipulation des nombres en PHP et sera effectuée sur PHP8.', 'Nous allons voir dans ce cours comment effectuer des calculs mathématiques simples, comme des additions ou des concaténations (c\'est-à-dire la mise bout à bout de chaînes de caractères), et nous allons étudier les opérateurs d\'affectation. En PHP, nous pouvons effectuer toutes sortes d\'opérations simples sur les nombres en utilisant : Les signes + et - pour les additions et soustractions, Les signes * (étoile) et / (barre oblique ou slash) pour les multiplications et les divisions. Priorité des opérateurs , comme pour les calculs mathématiques, il y a une priorité par défaut dans les opérateurs (la multiplication est prioritaire sur l\'addition, par exemple) et l\'utilisation de parenthèses permet de modifier cette priorité. L\'opération de concaténation a la même priorité que l\'addition, il faut donc être vigilant en concaténant des opérations directement. Attention Utiliser les espaces autour du caractère de concaténation : Étant donné que le point est également le délimiteur des nombres flottants et qu\'il est possible d\'écrire .1 pour 0.1, alors il ne faut surtout pas oublier l\'espace entre la chaîne de caractères et le nombre. D\'une manière générale, il est fortement conseillé de stocker le résultat des calculs dans une variable puis de la concaténer, plutôt que de faire les calculs en même temps que la concaténation. Les différents opérateurs d\'affectation : en PHP, il existe différents opérateurs permettant d\'affecter une valeur à une variable. Le plus simple est le signe égal (=), qui fait une simple affectation de valeur à une variable. Mais il y a en d\'autres qui sont une combinaison d\'un symbole (+, ., -, *, /, etc.) avec le signe égal (=) et qui permettent de manipuler la variable de façon plus synthétique. Il existe également deux autres opérateurs pour ajouter ou enlever 1 rapidement à une variable : $myVar++ et $myVar-- (qui équivalent respectivement à $myVar += 1 et $myVar -= 1).', 'https://www.youtube.com/embed/TsOFRKrHBI8', '2022-04-10 12:18:30', 'debuter-en-php-manipuler-les-nombres-php8', 283),
(95, 109, 'Apprendre et maitriser SQL : Qu\'est ce que le SQL ?', 'sql1-6252b402d8a1f.jpg', 'SQL, pour Structured Query Language, est un langage qui permet d\'interroger une base de données et modifier ou récupérer des informations.', 'SQL, pour Structured Query Language, est un langage qui permet d\'interroger une base de données relationnelle afin de pouvoir modifier ou récupérer des informations. Les bases de données relationnelles permettent de sauvegarder les informations sous forme de tableau à 2 dimensions.\r\n\r\nCes bases de données vont s\'avérer utiles pour sauvegarder les informations qui permettront plus tard de générer des pages dynamiquement. Par exemple dans le cadre d\'un site de recette de cuisine, on ne peut pas se permettre de créer autant de pages HTML que l\'on a de recettes. Grâce à une base de données on pourra sauvegarder les informations, utiliser le langage SQL pour les récupérer et pour générer les différentes pages automatiquement.', 'https://www.youtube.com/embed/iHKE_4KeNWQ', '2022-04-10 12:40:02', 'apprendre-et-maitriser-sql-quest-ce-que-le-sql', 284),
(96, 109, 'Apprendre et maitriser SQL : Démarrer avec SQLite sur VSCode', 'sql2-6252b49e220c6.jpg', 'Dans ce chapitre, nous allons voir comment configurer le système de gestion de base de données (SGBD) SQLite', 'Dans ce chapitre, nous allons voir comment configurer le système de gestion de base de données (SGBD) SQLite pour l\'utiliser au sein de l\'éditeur Visual Studio Code. Cet éditeur nous permettra d\'avoir la coloration syntaxique des requêtes SQL et aussi de pouvoir créer plusieurs requêtes que l\'on pourra éxécuter les unes à la suite des autres.\r\n\r\nPour que Visual Studio Code puisse ouvrir notre base de données nous allons installer l\'extension SQLite. On commence par créer une nouvelle base de données SQLite en créant un simple fichier vide que l\'on nommera db.sqlite. On pourra ensuite ouvrir cette base de données en faisant un clic droit et en sélectionnant l\'option Open Database ce qui déploiera un nouveau panneau en bas à gauche de notre explorateur de fichier. On pourra alors depuis ce panneau créer un nouveau fichier qui nous servira à taper nos commandes et les éxécuter.', 'https://www.youtube.com/embed/HM8ihP0MzE8', '2022-04-10 12:42:38', 'apprendre-et-maitriser-sql-demarrer-avec-sqlite-sur-vscode', 284),
(97, 109, 'Apprendre et maitriser SQL : Démarrer avec SQLite dans le terminal', 'sql3-6252b56196d8d.jpg', 'Dans ce chapitre, nous allons voir comment configurer le système de gestion de base de données (SGBD) SQLite pour l\'utiliser directement dan', 'Dans ce chapitre, nous allons voir comment configurer le système de gestion de base de données (SGBD) SQLite pour l\'utiliser directement dans le terminal. Cette base de données simple d\'utilisation nous permettra de commencer facilement notre apprentissage du langage SQL.\r\n\r\nPour commencer, on se rend sur le site officiel de SQLite et on va télécharger la version qui correspond à notre système d\'exploitation. On se retrouvera alors avec un exécutable que l\'on pourra utiliser pour ouvrir le shell SQLite. C\'est dans cet environnement que l\'on pourra taper nos différentes commandes dans la suite de cette formation.\r\n\r\nPour ouvrir une base de données SQLite depuis votre terminal, vous pouvez créer un simple fichier vide et l\'ouvrir à l\'aide de la commande sqlite (ou sqlite.exe dans le cas de Windows).', 'https://www.youtube.com/embed/wGqVjwNpBxY', '2022-04-10 12:45:53', 'apprendre-et-maitriser-sql-demarrer-avec-sqlite-dans-le-terminal', 284),
(98, 109, 'Apprendre et maitriser SQL : Créer sa première table', 'sql4-6252b7f730500.jpg', 'Dans ce chapitre, nous allons voir nos premières requêtes SQL et on va commencer par les requêtes DDL (Data Definition Language) qui permett', 'La commande CREATE TABLE permet de créer une table en SQL. Un tableau est une entité qui est contenu dans une base de données pour stocker des données ordonnées dans des colonnes. La création d’une table sert à définir les colonnes et le type de données qui seront contenus dans chacun des colonne (entier, chaîne de caractères, date, valeur binaire …). La syntaxe générale pour créer une table est la suivante :\r\nCREATE TABLE nom_de_la_table\r\n( colonne1 type_donnees, colonne2 type_donnees, colonne3 type_donnees, colonne4 type_donnees ) Dans cette requête, 4 colonnes ont été définies. Le mot-clé “type_donnees” sera à remplacer par un mot-clé pour définir le type de données (INT, DATE, TEXT …). Pour chaque colonne, il est également possible de définir des options telles que (liste non-exhaustive): NOT NULL (empêche d’enregistrer une valeur nulle pour une colonne.), DEFAULT : (attribuer une valeur par défaut si aucune données n’est indiquée pour cette colonne lors de l’ajout d’une ligne dans la table.), PRIMARY KEY : (indiquer si cette colonne est considérée comme clé primaire pour un index.)', 'https://www.youtube.com/embed/67pOwWxhXP4', '2022-04-10 12:56:54', 'apprendre-et-maitriser-sql-creer-sa-premiere-table', 284),
(99, 109, 'Apprendre et maitriser SQL : SELECT, UPDATE & INSERT', 'sql5-6252b9ea35121.jpg', 'Maintenant que nos tables sont créées, on va voir les requêtes qui vont permettre d\'insérer des données, de les modifier ou de les supprimer', 'L’insertion de données dans une table s’effectue à l’aide de la commande INSERT INTO. Cette commande permet au choix d’inclure une seule ligne à la base existante ou plusieurs lignes d’un coup.\r\nPour insérer des données dans une base, il y a 2 syntaxes principales :\r\nInsérer une ligne en indiquant les informations pour chaque colonne existante (en respectant l’ordre), Insérer une ligne en spécifiant les colonnes que vous souhaiter compléter. Il est possible d’insérer une ligne renseignant seulement une partie des colonnes.\r\nInsérer une ligne en spécifiant toutes les colonnes\r\nLa syntaxe pour remplir une ligne avec cette méthode est la suivante :\r\nINSERT INTO table VALUES (\'valeur 1\', \'valeur 2\', ...)\r\nCette syntaxe possède les avantages et inconvénients suivants :\r\nObliger de remplir toutes les données, tout en respectant l’ordre des colonnes, \r\nIl n’y a pas le nom de colonne, donc les fautes de frappe sont limitées. Par ailleurs les colonnes peuvent être renommées sans avoir à changer la requête, \r\nL’ordre des colonnes doit resté identique sinon certaines valeurs prennent le risque d’être complétée dans la mauvaise colonne.\r\nInsérer une ligne en spécifiant seulement les colonnes souhaitées\r\nCette deuxième solution est très similaire, excepté qu’il faut indiquer le nom des colonnes avant “VALUES”. La syntaxe est la suivante :\r\nINSERT INTO table (nom_colonne_1, nom_colonne_2, ...\r\n VALUES (\'valeur 1\', \'valeur 2\', ...)\r\nA noter : il est possible de ne pas renseigner toutes les colonnes. De plus, l’ordre des colonnes n’est pas important. Il est possible d’ajouter plusieurs lignes à un tableau avec une seule requête. Pour ce faire, il convient d’utiliser la syntaxe suivante :\r\nINSERT INTO client (prenom, nom, ville, age)\r\n VALUES\r\n (\'Rébecca\', \'Armand\', \'Saint-Didier-des-Bois\', 24),\r\n (\'Aimée\', \'Hebert\', \'Marigny-le-Châtel\', 36),\r\n (\'Marielle\', \'Ribeiro\', \'Maillères\', 27),\r\n (\'Hilaire\', \'Savary\', \'Conie-Molitard\', 58);\r\nA noter : lorsque le champ à remplir est de type VARCHAR ou TEXT il faut indiquer le texte entre guillemet simple. En revanche, lorsque la colonne est un numérique tel que INT ou BIGINT il n’y a pas besoin d’utiliser de guillemet, il suffit juste d’indiquer le nombre.', 'https://www.youtube.com/embed/YgyB6ZRbX9w', '2022-04-10 13:05:14', 'apprendre-et-maitriser-sql-select-update-insert', 284),
(100, 109, 'Apprendre et maitriser SQL : Clés primaires et index', 'sql6-6252be42d6fb6.jpg', 'La clé primaire est tout simplement une clé que nous choisissons comme celle qui nous permettra d’identifier un tuple dans une relation.', 'Lorsque l\'on crée des enregistrements dans notre table, il est important de pouvoir les identifier de manière unique pour les conditions de récupération des modifications et des suppressions. En effet, si on utilise le champ titre, il peut être amené à changer dans le futur. Il nous faut donc une valeur qui sera invariante tout au long de la vie de notre enregistrement. Pour remplir ce besoin, on pourra se baser sur les clés primaires. Ces clés constituent un identifiant unique qui sera assigné à chaque ligne et qui permettra ensuite d\'y faire référence plus simplement. Ces clés primaires offrent aussi l\'avantage d\'être indexée par le SGBD et permettent une récupération plus rapide lorsqu\'elles sont utilisées dans les condition.\r\nIl sera aussi possible de préciser que cette valeur s\'incrémentera de manière automatique afin de ne pas avoir à préciser manuellement la clé lors de chaque insertion.\r\n\r\nEn plus de la clé primaire, il sera possible d\'indexer d\'autres champs qui sont souvent utilisés comme condition de récupération. On pourra aussi y adjoindre des contraintes d\'unicité pour éviter les duplications.', 'https://www.youtube.com/embed/vYpiLn3JXiA', '2022-04-10 13:23:46', 'apprendre-et-maitriser-sql-cles-primaires-et-index', 284);

-- --------------------------------------------------------

--
-- Structure de la table `progression`
--

CREATE TABLE `progression` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `progression`
--

INSERT INTO `progression` (`id`, `user_id`, `formation_id`) VALUES
(1, 278, 81),
(9, 278, 84);

-- --------------------------------------------------------

--
-- Structure de la table `ressource`
--

CREATE TABLE `ressource` (
  `id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ressource`
--

INSERT INTO `ressource` (`id`, `formation_id`, `name`) VALUES
(1, 82, 'https://symfony.com/doc/current/quick_tour/the_big_picture.html'),
(4, 89, 'https://developer.mozilla.org/fr/docs/Web/JavaScript'),
(5, 90, 'https://developer.mozilla.org/fr/docs/web/javascript/guide/expressions_and_operators#Op%C3%A9rateurs_arithm%C3%A9tiques'),
(6, 91, 'https://developer.mozilla.org/fr/docs/web/javascript/reference/global_objects/string/length'),
(7, 91, 'https://developer.mozilla.org/fr/docs/web/javascript/reference/template_literals'),
(8, 92, 'https://www.php.net/manual/fr/language.basic-syntax.phptags.php'),
(9, 93, 'https://www.php.net/manual/fr/language.operators.string.php'),
(10, 94, 'https://www.php.net/manual/fr/language.operators.arithmetic.php'),
(11, 97, 'https://sqlite.org/download.html'),
(12, 98, 'https://sqlite.org/lang_createtable.html'),
(13, 98, 'https://mariadb.com/kb/en/create-table/'),
(14, 98, 'https://www.postgresql.org/docs/9.1/sql-createtable.html');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `section`
--

INSERT INTO `section` (`id`, `name`) VALUES
(105, 'HTML et CSS'),
(106, 'Symfony'),
(107, 'Javascript'),
(108, 'PHP'),
(109, 'SQL');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `prenom`, `nom`, `photo`) VALUES
(278, 'martin.jo@exemple.com', '[]', '$2y$13$eRKzU/akqhc/hBAHHP/GXuPrGt57YEpZch2yEYMEvt2uHnhMkerIq', NULL, 'Martin', NULL),
(279, 'lila32@test.com', '[]', '$2y$13$naoOqslQgw08o54fydBp9e0zNPNv8bHAVzcXxyhKw35jXBzjXuX36', NULL, 'Sophie', NULL),
(280, 'harry.potter@poudlar.com', '[]', '$2y$13$P36Oz.71wVLMgrIpu8E1uuJi8deEfRRFhnHE1IwGhya943Y6NFP2.', NULL, 'Potter', NULL),
(281, 'ecoitgestion@gmail.com', '[\"ROLE_SUPER_ADMIN\"]', '$2y$13$ouzKZEZbhGV5rXTjZ0nvtubXMq5eGxBsNosY.GIwj1.jAXUzTKL1m', 'Laure', 'Dupont', NULL),
(282, 'johnmartin@email.com', '[\"ROLE_INSTRUCTEUR\"]', '$2y$13$ZNYnGLy3s5H9LKxVVXSUxu91qR2zqBzkG56upScCN53WyOGNe5XNK', 'John', 'Dartagnan', 'photo-profil-624cae1eb7186.png'),
(283, 'fisher.renee@email.com', '[\"ROLE_INSTRUCTEUR\"]', '$2y$13$6HqyvlrjXkepJUn7j3IIVuYrCjqiOiEq8xKU2xEnhH8fSyE7f3Gmm', 'Renée', 'Fisher', 'reneefisher-624cb0662dfad.jpg'),
(284, 'Garfiart@email.com', '[\"ROLE_USER\",\"ROLE_INSTRUCTEUR\"]', '$2y$13$CLQezUXI4o.OpXTMv.Mt.eA804/zhBcQVL4nbr6P4bcyTG8nnTj5q', 'Arthur', 'Grafi', 'grafikart-6252b2c8667fe.jpg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_404021BF989D9B62` (`slug`),
  ADD KEY `IDX_404021BFD823E37A` (`section_id`),
  ADD KEY `IDX_404021BFF44A1EA7` (`nom_auteur_id`);
ALTER TABLE `formation` ADD FULLTEXT KEY `search_idx` (`name`,`description`);

--
-- Index pour la table `progression`
--
ALTER TABLE `progression`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D5B25073A76ED395` (`user_id`),
  ADD KEY `IDX_D5B250735200282E` (`formation_id`);

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_939F45445200282E` (`formation_id`);

--
-- Index pour la table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `progression`
--
ALTER TABLE `progression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BFD823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `FK_404021BFF44A1EA7` FOREIGN KEY (`nom_auteur_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `progression`
--
ALTER TABLE `progression`
  ADD CONSTRAINT `FK_D5B250735200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `FK_D5B25073A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD CONSTRAINT `FK_939F45445200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
