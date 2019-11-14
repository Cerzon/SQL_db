DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`id` SERIAL PRIMARY KEY,
    `firstname` VARCHAR(50),
    `lastname` VARCHAR(50),
    `email` VARCHAR(120) UNIQUE,
    `phone` BIGINT, 
    INDEX `users_phone_idx` (`phone`),
    INDEX `users_firstname_lastname_idx` (`firstname`, `lastname`)
);

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
	`id` SERIAL PRIMARY KEY,
	`from_user_id` BIGINT UNSIGNED NOT NULL,
    `to_user_id` BIGINT UNSIGNED NOT NULL,
    `body` TEXT NOT NULL,
    `created_at` DATETIME DEFAULT NOW(),
    INDEX `messages_from_user_idx` (`from_user_id`),
    INDEX `messages_to_user_idx` (`to_user_id`),
    FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
);

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
	`initiator_user_id` BIGINT UNSIGNED NOT NULL,
    `target_user_id` BIGINT UNSIGNED NOT NULL,
    `status` ENUM('requested', 'approved', 'unfriended', 'declined'),
	`requested_at` DATETIME DEFAULT NOW(),
	`confirmed_at` DATETIME,
	
    PRIMARY KEY (`initiator_user_id`, `target_user_id`),
	INDEX (`initiator_user_id`),
    INDEX (`target_user_id`),
    FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
);

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities`(
	`id` SERIAL PRIMARY KEY,
	`name` VARCHAR(150),

	INDEX `communities_name_idx` (`name`)
);

DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities`(
	`user_id` BIGINT UNSIGNED NOT NULL,
	`community_id` BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (`user_id`, `community_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types`(
	`id` SERIAL PRIMARY KEY,
    `name` VARCHAR(255),
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`(
	`id` SERIAL PRIMARY KEY,
    `media_type_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
  	`body` TEXT,
    `filename` VARCHAR(255),
    `size` INT,
	`metadata` JSON,
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

    INDEX (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
        ON UPDATE CASCADE,
    FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
	`id` SERIAL PRIMARY KEY,
	`name` varchar(255) DEFAULT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	`album_id` BIGINT UNSIGNED NOT NULL,
	`media_id` BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (`album_id`, `media_id`),
	FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
    `id` SERIAL PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `reply_to` BIGINT UNSIGNED DEFAULT NULL,
    `media_id` BIGINT UNSIGNED DEFAULT NULL,
    `body` TEXT DEFAULT NULL,
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

    INDEX (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`reply_to`) REFERENCES `posts` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
    `post_id` BIGINT UNSIGNED NOT NULL,
    `media_id` BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (`post_id`, `media_id`),
    FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`(
	`id` SERIAL PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `media_id` BIGINT UNSIGNED DEFAULT NULL,
    `post_id` BIGINT UNSIGNED DEFAULT NULL,
    `created_at` DATETIME DEFAULT NOW(),

    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	`user_id` SERIAL PRIMARY KEY,
    `gender` CHAR(1),
    `birthday` DATE,
	`photo_id` BIGINT UNSIGNED DEFAULT NULL,
    `created_at` DATETIME DEFAULT NOW(),
    `hometown` VARCHAR(100),

    INDEX (`hometown`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
    	ON UPDATE CASCADE
    	ON DELETE RESTRICT,
    FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
