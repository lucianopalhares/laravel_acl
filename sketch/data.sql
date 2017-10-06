-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.18-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela acl.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `migration` varchar(200) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acl.migrations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela acl.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(200) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acl.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Copiando estrutura para tabela acl.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `label` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acl.permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
	(1, 'view_post', 'Ver POst', '2017-10-06 16:12:40', NULL),
	(2, 'edit_post', 'Editar Post', '2017-10-06 16:12:52', NULL),
	(3, 'delete_post', 'Deletar Post', '2017-10-06 16:13:02', NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela acl.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`permission_id`,`role_id`),
  KEY `fk_permission_role_roles1_idx` (`role_id`),
  KEY `fk_permission_role_permissions1_idx` (`permission_id`),
  CONSTRAINT `fk_permission_role_permissions1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_role_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acl.permission_role: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
	(1, 2, 2),
	(3, 1, 2),
	(2, 1, 4);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Copiando estrutura para tabela acl.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_posts_users_idx` (`user_id`),
  CONSTRAINT `fk_posts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acl.posts: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(1, 2, 'Title Carlos', 'desc', '2017-10-06 16:02:36', '2017-10-06 16:02:59'),
	(2, 1, 'Title Luciano', 'desc', '2017-10-06 16:02:51', '2017-10-06 16:02:52');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Copiando estrutura para tabela acl.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acl.roles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
	(2, 'Admin', 'Administrador', '2017-10-06 16:10:44', NULL),
	(3, 'Manager', 'Gerente', '2017-10-06 16:10:52', '2017-10-06 16:11:06'),
	(4, 'Editor', 'Editor', '2017-10-06 16:11:03', NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Copiando estrutura para tabela acl.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`role_id`),
  KEY `fk_role_user_users1_idx` (`user_id`),
  KEY `fk_role_user_roles1_idx` (`role_id`),
  CONSTRAINT `fk_role_user_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_user_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acl.role_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
	(1, 1, 2),
	(3, 2, 4);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Copiando estrutura para tabela acl.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela acl.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `password`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'LUCIANO PALHARES ROSA', '$2y$10$s6UMLHkfeNA2lOEQCZQkD.3Qb5/GG64LQwSO5zzxQgrCbWpNkw/Z2', 'lucianopalharesrosa@hotmail.com', 'T4eA6TLkpBJYyQQvICEpGpyGIR2k1SjBYWrwonlG18qh49k7KQoYKpgFpDnn', '2017-10-06 18:48:24', '2017-10-06 17:55:00'),
	(2, 'Carlos da Silva', '$2y$10$IVrhQNaAoclZJuw9IHsUM.SUWIoeCB3fRIAQPBAzWS2Db.H.P1QiW', 'carlos@carlos.com.br', '21OBhZZU32ni40MAFEm6v1YABqXysY9pMS6EmEayCnCHpxkv78qgjzLbAUPo', '2017-10-06 19:02:12', '2017-10-06 16:02:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
