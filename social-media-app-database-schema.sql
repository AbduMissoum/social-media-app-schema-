CREATE TABLE `Users` (
  `id` int PRIMARY KEY,
  `username` varchar(255) UNIQUE,
  `passowrd` varchar(255),
  `email` varchar(255),
  `created_at` timestamp DEFAULT now(),
  `status` varchar(255) DEFAULT 'active'
);

CREATE TABLE `Accounts` (
  `id` int,
  `caption` varchar(255),
  `location` varchar(255)
);

CREATE TABLE `Photos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `image_link` varchar(255) NOT NULL,
  `user_id` int,
  `created_at` timestamp default now()
);

CREATE TABLE `Posts` (
  `id` int PRIMARY KEY,
  `author_id` int,
  `image_id` int,
  `post_text` varchar(255),
  `created_at` timestamp DEFAULT now()
);

CREATE TABLE `Comments` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `comment_text` varchar(255) NOT NULL,
  `author_id` int,
  `post_id` int,
  `created_at` timestamp DEFAULT now()
);

CREATE TABLE `Likes` (
  `author_id` int,
  `post_id` int,
  PRIMARY KEY (`author_id`, `post_id`)
);

CREATE TABLE `Followers` (
  `follower_id` int,
  `user_id` int,
  `created_at` timestamp DEFAULT now(),
  PRIMARY KEY (`follower_id`, `user_id`)
  , CHECK ('follower_id'!='user_id')
);

CREATE TABLE `Tags` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `Tags_posts` (
  `tag_id` int,
  `post_id` int
);



ALTER TABLE `Accounts` ADD FOREIGN KEY (`id`) REFERENCES `Users` (`id`);

ALTER TABLE `Photos` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Posts` ADD FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Posts` ADD FOREIGN KEY (`image_id`) REFERENCES `Photos` (`id`);

ALTER TABLE `Comments` ADD FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Comments` ADD FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`);

ALTER TABLE `Likes` ADD FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Likes` ADD FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`);

ALTER TABLE `Followers` ADD FOREIGN KEY (`follower_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Followers` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Tags_posts` ADD FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`id`);

ALTER TABLE `Tags_posts` ADD FOREIGN KEY (`post_id`) REFERENCES `Posts` (`id`);

ALTER TABLE `Photos` ADD FOREIGN KEY (`created_at`) REFERENCES `Photos` (`image_link`);
