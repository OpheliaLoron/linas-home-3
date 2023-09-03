-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 03 sep. 2023 à 12:17
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `linas_home_test`
--
CREATE DATABASE IF NOT EXISTS `linas_home_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `linas_home_test`;

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`id`, `user_id`, `name`, `firstname`, `lastname`, `adress`, `zipcode`, `city`, `country`, `phone`, `company`) VALUES
(1, 1, 'Ma première adresse', 'dxgf,hc;gj:hk!j', 'gdfhxgjcfhkgjlhkm', 'cgjlh:vkj!bl', '75024', 'Paris', 'FR', '0606060606', 'lckgjlvh:k!bjlnkM'),
(7, 1, 'fegrfhgjhk:', 'klchvjfck', 'tgrdytughilmjugyjvhg', 'kghkjgkcgk', '45678', 'Paris', 'FR', '7979797979', 'ghkghkcgk'),
(8, 1, 'Domicile', 'Lina', 'Princesse', '10 rue des princesses', '10819', 'Paris', 'FR', '10082019', NULL),
(10, 12, '3 rue verdun', 'bobo', 'toto', '3 rue verdun', '56789', 'poris', 'AW', '0999123456', NULL),
(11, 13, 'Mon chateau', 'Hassan', 'AKHTAR', '156 Rue de saussure', '75017', 'Paris', 'FR', '0616314137', NULL),
(12, 14, 'rrgr', 'dgd', 'fdg', 'df', 'gdf', 'gfd', 'GA', 'gdf', 'dfg'),
(13, 15, 'Domicile', 'Ophélia', 'Loron', '10 rue du Terrage', '24567', 'Paris', 'FR', '0783374334', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `carriers`
--

CREATE TABLE `carriers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carriers`
--

INSERT INTO `carriers` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'Profitez d\'une livraison premium avec un colis chez vous dans les 72 prochaines heures', 5.9),
(2, 'Chronopost', 'Profitez de la livraison express pour être livré le lendemain de votre commande', 9.9);

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_quantity` int(11) NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Lit', ''),
(2, 'Chaise', ''),
(3, 'Bureau', ''),
(4, 'Canapé', ''),
(5, 'Commode', ''),
(6, 'Bar', '');

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
('DoctrineMigrations\\Version20230619092942', '2023-06-19 11:30:01', 127);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `is_paid`) VALUES
(1, 1, '2023-07-02 12:10:04', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(2, 1, '2023-07-03 13:40:42', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(3, 1, '2023-07-03 13:42:08', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(4, 1, '2023-07-03 13:42:26', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(5, 1, '2023-07-03 13:42:44', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(6, 1, '2023-07-03 13:43:01', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(7, 1, '2023-07-03 13:43:29', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(8, 1, '2023-07-03 13:44:01', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(9, 1, '2023-07-03 13:44:42', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(10, 1, '2023-07-03 13:45:39', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(11, 13, '2023-07-03 16:07:47', 'Colissimo', 5.9, 'Hassan AKHTAR<br/>0616314137<br/>156 Rue de saussure<br/>75017 Paris<br/>FR', 0),
(12, 13, '2023-07-03 16:08:47', 'Colissimo', 5.9, 'Hassan AKHTAR<br/>0616314137<br/>156 Rue de saussure<br/>75017 Paris<br/>FR', 0),
(13, 13, '2023-07-03 16:09:32', 'Colissimo', 5.9, 'Hassan AKHTAR<br/>0616314137<br/>156 Rue de saussure<br/>75017 Paris<br/>FR', 0),
(14, 14, '2023-07-03 16:46:39', 'Colissimo', 5.9, 'dgd fdg<br/>gdf<br/>dfg<br/>df<br/>gdf gfd<br/>GA', 0),
(15, 1, '2023-07-04 15:59:04', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(16, 1, '2023-07-04 16:00:20', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(17, 1, '2023-07-04 16:02:15', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(18, 1, '2023-07-04 16:02:29', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(19, 1, '2023-07-04 16:02:44', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(20, 1, '2023-07-04 16:02:54', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(21, 1, '2023-07-04 16:03:05', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(22, 1, '2023-07-04 16:03:13', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(23, 1, '2023-07-04 16:03:22', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(24, 1, '2023-07-04 16:03:34', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(25, 1, '2023-07-04 16:03:55', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(26, 1, '2023-07-04 16:04:14', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(27, 1, '2023-07-04 16:04:27', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(28, 1, '2023-07-04 16:05:56', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(29, 1, '2023-07-04 16:06:32', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(30, 1, '2023-07-04 16:08:01', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(31, 1, '2023-07-04 16:08:22', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(32, 1, '2023-07-04 16:08:38', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(33, 1, '2023-07-04 16:09:32', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(34, 1, '2023-07-04 16:10:22', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(35, 1, '2023-07-04 16:10:45', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(36, 1, '2023-07-04 16:11:34', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(37, 1, '2023-07-04 16:11:43', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(38, 1, '2023-07-04 16:11:50', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(39, 1, '2023-07-05 00:14:31', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(40, 1, '2023-07-05 11:32:08', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0),
(41, 1, '2023-07-05 11:35:06', 'Chronopost', 9.9, 'dxgf,hc;gj:hk!j gdfhxgjcfhkgjlhkm<br/>0606060606<br/>lckgjlvh:k!bjlnkM<br/>cgjlh:vkj!bl<br/>75024 Paris<br/>FR', 0),
(42, 15, '2023-07-07 09:56:52', 'Colissimo', 5.9, 'Ophélia Loron<br/>0783374334<br/>10 rue du Terrage<br/>24567 Paris<br/>FR', 0),
(43, 1, '2023-07-24 12:23:34', 'Colissimo', 5.9, 'Lina Princesse<br/>10082019<br/>10 rue des princesses<br/>10819 Paris<br/>FR', 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(1, 1, 'Chaise Bleue', 1, 32, 32),
(2, 1, 'Canapé blanc', 1, 350, 350),
(3, 2, 'Chaise grise', 2, 2800, 5600),
(4, 2, 'Bar de cuisine blanc', 1, 3700, 3700),
(5, 3, 'Chaise grise', 2, 2800, 5600),
(6, 3, 'Bar de cuisine blanc', 1, 3700, 3700),
(7, 4, 'Chaise grise', 2, 2800, 5600),
(8, 4, 'Bar de cuisine blanc', 1, 3700, 3700),
(9, 5, 'Chaise grise', 2, 2800, 5600),
(10, 5, 'Bar de cuisine blanc', 1, 3700, 3700),
(11, 6, 'Chaise grise', 2, 2800, 5600),
(12, 6, 'Bar de cuisine blanc', 1, 3700, 3700),
(13, 7, 'Chaise grise', 2, 2800, 5600),
(14, 7, 'Bar de cuisine blanc', 1, 3700, 3700),
(15, 8, 'Chaise grise', 2, 2800, 5600),
(16, 8, 'Bar de cuisine blanc', 1, 3700, 3700),
(17, 9, 'Chaise grise', 2, 2800, 5600),
(18, 9, 'Bar de cuisine blanc', 1, 3700, 3700),
(19, 10, 'Chaise grise', 2, 2800, 5600),
(20, 10, 'Bar de cuisine blanc', 1, 3700, 3700),
(21, 11, 'Chaise grise', 2, 2800, 5600),
(22, 12, 'Chaise grise', 2, 2800, 5600),
(23, 13, 'Chaise grise', 2, 2800, 5600),
(24, 14, 'Lit Queen Size', 3, 13000, 39000),
(25, 15, 'Chaise Bleue', 1, 3200, 3200),
(26, 16, 'Chaise Bleue', 1, 3200, 3200),
(27, 17, 'Chaise Bleue', 1, 3200, 3200),
(28, 18, 'Chaise Bleue', 1, 3200, 3200),
(29, 19, 'Chaise Bleue', 1, 3200, 3200),
(30, 20, 'Chaise Bleue', 1, 3200, 3200),
(31, 21, 'Chaise Bleue', 1, 3200, 3200),
(32, 22, 'Chaise Bleue', 1, 3200, 3200),
(33, 23, 'Chaise Bleue', 1, 3200, 3200),
(34, 24, 'Chaise Bleue', 1, 3200, 3200),
(35, 25, 'Chaise Bleue', 1, 3200, 3200),
(36, 26, 'Chaise Bleue', 1, 3200, 3200),
(37, 27, 'Chaise Bleue', 1, 3200, 3200),
(38, 28, 'Chaise Bleue', 1, 3200, 3200),
(39, 29, 'Chaise Bleue', 1, 3200, 3200),
(40, 30, 'Chaise Bleue', 1, 3200, 3200),
(41, 31, 'Chaise Bleue', 1, 3200, 3200),
(42, 32, 'Chaise Bleue', 1, 3200, 3200),
(43, 33, 'Chaise Bleue', 1, 3200, 3200),
(44, 34, 'Chaise Bleue', 1, 3200, 3200),
(45, 35, 'Chaise Bleue', 1, 3200, 3200),
(46, 36, 'Chaise Bleue', 1, 3200, 3200),
(47, 37, 'Chaise Bleue', 1, 3200, 3200),
(48, 38, 'Chaise Bleue', 1, 3200, 3200),
(49, 39, 'Chaise Bleue', 1, 3200, 3200),
(50, 40, 'Chaise Bleue', 1, 3200, 3200),
(51, 40, 'Bar de cuisine blanc', 1, 3700, 3700),
(52, 41, 'Chaise Bleue', 1, 3200, 3200),
(53, 41, 'Bar de cuisine blanc', 1, 3700, 3700),
(54, 41, 'Commode blanche', 1, 15000, 15000),
(55, 42, 'Chaise Bleue', 2, 3200, 6400),
(56, 43, 'Lit small size', 2, 13000, 26000),
(57, 43, 'Chaise Bleue', 1, 3200, 3200);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `slug`, `alt`, `cart_id`, `photo`, `subtitle`, `category_id`) VALUES
(1, 'Lit small size', 13000, 'Lit Queen Size avec sommier et tête de lit', 'lit-queen-size', 'Lit Queen Size avec sommier et tête de lit', NULL, 'b90da0551d8ffcec2618cdd96c897b3ec275c5c6.jpg', 'Lit douillet pour les gros dormeurs', 1),
(2, 'Chaise Bleue', 3200, 'Chaise bleue en velours, pieds dorés.', 'chaise-bleue', 'Chaise bleue en velours, pieds dorés', NULL, 'chaises-bleues.jpg', 'Chaise parfaite pour ajouter une touche de couleur', 2),
(3, 'Bureau en bois', 2500, 'Bureau en bois, 2 tiroirs', 'bureau-en-bois', 'Bureau en bois, 2 tiroirs', NULL, 'bureau-blanc2.jpg', 'Bureau parfait pour travailler', 3),
(4, 'Canapé blanc', 35000, 'Canapé blanc avec ses oreillers', 'canape-blanc', 'Canapé blanc', NULL, 'a9b304b8505d5f53679d5e8c58db752f8f17b4af.jpg', 'Canapé simple et épuré pour le plaisir des yeux', 4),
(5, 'Chaise grise', 2800, 'Chaise grise, pieds en bois', 'chaise-grise', 'Chaise grise, pieds en bois', NULL, 'chaises-grises.jpg', 'Chaise simple et confortable', 2),
(6, 'Commode blanche', 15000, 'Commode blanche de salle de bain', 'commode-blanche', 'Commode blanche', NULL, 'c5faa81b7d38c4054d982859b7d7571392a28af7.jpg', 'Commode épurée et chaleureuse', 5),
(7, 'Bar de cuisine blanc', 3700, 'Bar de cuisine blanc, avec ses tabourets', 'bar-de-cuisine-blanc', 'Bar de cuisine blanc', NULL, 'd0d15e6f97ae61cfdc38fbd5dbd1caa1baec6565.jpg', 'Bar de cuisine agréable pour accueillir ses invités', 6),
(8, 'Canapé gris', 40000, 'Canapé gris, avec ses oreillers', 'canape-gris', 'Canapé gris, avec ses oreillers', NULL, 'deco2.jpg', 'Canapé confortable qui apporte une touche de couleur', 4),
(9, 'Chaise futuriste blanche', 4200, 'Chaise blanche au design futuriste', 'chaise-futuriste-blanche', 'Chaise blanche au design futuriste', NULL, 'be146c27ab8086e8745343bb16b408630657dd05.jpg', 'Chaise futuriste pour impressionner', 2);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `lastname` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `lastname`, `firstname`, `email`, `roles`, `password`) VALUES
(1, 'Princesse', 'Lina', 'princesse.lina@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$rqV4H0CE679rckiGUgvkpO1Oaa8yP5EPIUm/FpAG27s202YBdNKSu'),
(2, 'Yohann', 'Yohann', 'yohann.yohann@gmail.com', '[\"ROLE_USER\"]', '$2y$13$QDn.AQc0SEz/Eanz698OwOFEVuIY7sNC5i4iG4wUDgyG3JM6oaFbW'),
(3, 'Noire', 'Samira', 'samira.noire@gmail.com', '[\"ROLE_USER\"]', '$2y$13$6OO8.BgVDcVVcIwULXbZPe.a.M2PYD2Q9cPAqZZh7YXfdLVNyHcqK'),
(4, 'Jules', 'César', 'jules.cesar@gmail.com', '[\"ROLE_USER\"]', '$2y$13$GNHSl3cHmWdHe0olsnC6VuchtDg/81qc1uU6YodmtHD84NT.DRPCm'),
(7, 'Akhtar', 'Hassan', 'akhtar.hassan@gmail.com', '[\"ROLE_USER\"]', '$2y$13$tjH6GQN87I7eX.8QbXHucOMjAD6bL5d0gct.FX09OLOSDgmxkZ1DO'),
(10, 'Loron', 'Ophélia', 'ophelia.zocchi-loron@colombbus.org', '[]', '$2y$13$JPgiIFa.MptLh/Kb5lSxd.pkpzFyLLzmdRRrQtROxd3XMuwdDJiTa'),
(11, 'Zocchi', 'Cassandre', 'zocchi.cassandre@gmail.com', '[]', '$2y$13$KWamWFNiJOUjLi.zSjPlHOmZzo2HRIET22sykooY.s/jAAu4e2BkS'),
(12, 'bobo', 'toto', 'toto@gmail.com', '[]', '$2y$13$cA9ZAtkRDo2hmeQX0sqGJue6/D.coxZ.xofNqdExFvdQK0pxfFrZa'),
(13, 'AKHTAR', 'Hassan', 'akhtar.hassan1992@gmail.fr', '[]', '$2y$13$0WldsI/3uK/ToTwB6PqKBuAMfzgCFoHnkZsh0Dm3YOo1uYM9ZxfsW'),
(14, 'Boukhobza', 'Jacques', 'jacques.boukhobza@colombbus.org', '[]', '$2y$13$dVRN4vYbrjPGcJc5XH7fb.osj3Y3.dTkZy/elQ4M36l5FUct8gx3e'),
(15, 'Loron', 'Ophélia', 'ophelialoron@gmail.com', '[]', '$2y$13$zJwQl7HIfMIF7uG9V9p98Oa8vdCLEjDaVeZPX7n.R5Xlp5n.i80Lm');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EF192552A76ED395` (`user_id`);

--
-- Index pour la table `carriers`
--
ALTER TABLE `carriers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4E004AACA76ED395` (`user_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEEA76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B3BA5A5A1AD5CDBF` (`cart_id`),
  ADD KEY `IDX_B3BA5A5A12469DE2` (`category_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `FK_EF192552A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FK_4E004AACA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `orders` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FK_B3BA5A5A1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
