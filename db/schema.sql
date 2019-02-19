CREATE DATABASE IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `portfolio` . `contacts` (
       `id` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
       `email` VARCHAR(255),
       `text` TEXT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
