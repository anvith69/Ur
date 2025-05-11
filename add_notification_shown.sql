-- Add notification_shown column to orders table
ALTER TABLE `orders` 
ADD COLUMN `notification_shown` TINYINT(1) NOT NULL DEFAULT 0 
COMMENT 'Flag to track if notification has been shown to user';
