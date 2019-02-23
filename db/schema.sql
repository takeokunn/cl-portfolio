CREATE DATABASE IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `portfolio` . `contacts` (
       `id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
       `name` VARCHAR(255),
       `email` VARCHAR(255),
       `text` TEXT,
       `created_at` timestamp not null default current_timestamp,
       `updated_at` timestamp not null default current_timestamp on update current_timestamp
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
