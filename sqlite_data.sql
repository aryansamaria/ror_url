BEGIN TRANSACTION;

CREATE TABLE schema_migrations (
    version VARCHAR NOT NULL PRIMARY KEY
);

INSERT INTO schema_migrations VALUES ('20241219060058');
INSERT INTO schema_migrations VALUES ('20241219083729');
INSERT INTO schema_migrations VALUES ('20241219091300');
INSERT INTO schema_migrations VALUES ('20241219094710');
INSERT INTO schema_migrations VALUES ('20241219095032');
INSERT INTO schema_migrations VALUES ('20241222203327');
INSERT INTO schema_migrations VALUES ('20241223123808');

CREATE TABLE ar_internal_metadata (
    key VARCHAR NOT NULL PRIMARY KEY,
    value VARCHAR,
    created_at TIMESTAMP(6) NOT NULL,
    updated_at TIMESTAMP(6) NOT NULL
);

INSERT INTO ar_internal_metadata VALUES ('environment', 'development', '2024-12-19 06:01:16.518474', '2024-12-19 06:01:16.518481');

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR,
    password_digest VARCHAR,
    created_at TIMESTAMP(6) NOT NULL,
    updated_at TIMESTAMP(6) NOT NULL
);

INSERT INTO users VALUES (1, 'aryan', '$2a$12$4cfGxwEx3pZqW3NiOvLiQuIlniavl7nkNuXz6IvIZiDrzyoczOaRe', '2024-12-19 08:34:58.069698', '2024-12-19 08:34:58.069698');
INSERT INTO users VALUES (2, 'abhinav', '$2a$12$d7ZNs3BencGEo1kwbYYCieqfWK2aleuh7uR2F299PaaS2EcqFMvMO', '2024-12-19 18:38:20.482147', '2024-12-19 18:38:20.482147');
INSERT INTO users VALUES (3, 'Badal', '$2a$12$62o0bwcYnJ2YUJZn56qn..yhQdjbdjP2hzNsxuTsHO7PdcivH0khS', '2024-12-19 23:36:15.321969', '2024-12-19 23:36:15.321969');
INSERT INTO users VALUES (4, 'Aakash', '$2a$12$B17q4UR8zdQzrcZTyxxDnOABXSVVX8OSdS13O7UtzF/ibeTaptRqy', '2024-12-19 23:36:15.842818', '2024-12-19 23:36:15.842818');
INSERT INTO users VALUES (5, 'Alice', '$2a$12$vew/eFzcrSCsszGoUatFMuxnEmNPYz9e5W0.cKTSSSv3YtwFGcQqq', '2024-12-19 23:40:33.646479', '2024-12-19 23:40:33.646479');
INSERT INTO users VALUES (6, 'Bob', '$2a$12$nnnrWkJqz2/1sFHQ/6SpGO00kooZa0H7OytdiryVKjc9s.a/1R6WK', '2024-12-19 23:40:34.148394', '2024-12-19 23:40:34.148394');
INSERT INTO users VALUES (7, 'Piyush', '$2a$12$mlzxFVXmZ5Ut6x0glcUhcuTaygbCl5fN.vvR7xmVO1vI2ZL60aZ5W', '2024-12-20 03:08:13.955469', '2024-12-20 03:08:13.955469');
INSERT INTO users VALUES (8, 'joshi', '$2a$12$tN/WCchAuEVbHO6G2U6ic.c18KX8qz7F64QOgAtM/w31W77Yvta9u', '2024-12-20 03:08:14.194146', '2024-12-20 03:08:14.194146');

CREATE TABLE links (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    url VARCHAR,
    description TEXT,
    user_id INTEGER,
    created_at TIMESTAMP(6) NOT NULL,
    updated_at TIMESTAMP(6) NOT NULL,
    points INTEGER DEFAULT 1,
    hot_score FLOAT DEFAULT 0.0,
    content_summary TEXT,
    summary TEXT,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO links VALUES (1, 'ab', 'https://mail.google.com/mail/u/0/#inbox/FMfcgzQXKhQTQCrNPQSfmhRzlTMNqsfj', 'mail link', 1, '2024-12-19 10:08:18.053340', '2024-12-23 13:09:14.652003', 1, 0.0, NULL, 'Gmail is email...');
INSERT INTO links VALUES(2,'link 2','https://www.codementor.io/@danielchinedu/building-a-basic-hacker-news-clone-with-rails-5-4gr4hrbis','codemaster',1,'2024-12-19 14:08:51.623894','2024-12-23 13:10:02.877049',1,0.0,NULL,'Learn how to build sites like Hacker News and reddit with Rails 5');
INSERT INTO links VALUES(3,'New Linkedin','https://www.linkedin.com/','connect and ask',1,'2024-12-20 00:52:49.623142','2024-12-23 13:10:26.852290',1,0.0,NULL,'1 billion members | Manage your professional identity. Build and engage with your professional network. Access knowledge, insights and opportunities.');
INSERT INTO links VALUES(4,'Showcase: My first ror project ','https://github.com/aryansamaria/ror_ecommerce','Its an E-commerce website with CRUD operation',1,'2024-12-20 14:25:10.992639','2024-12-23 13:10:20.707816',1,0.0,NULL,'Contribute to aryansamaria/ror_ecommerce development by creating an account on GitHub.');
INSERT INTO links VALUES(5,'Showcase: a handsign recogination model','https://github.com/aryansamaria/deployment','A cnn model for mute and deaf people',1,'2024-12-20 14:46:42.701404','2024-12-23 13:09:29.717017',1,0.0,NULL,'Contribute to aryansamaria/deployment development by creating an account on GitHub.');
INSERT INTO links VALUES(6,'scrape','https://toscrape.com/','see the summary of this website',1,'2024-12-22 20:40:11.521769','2024-12-23 13:09:50.705232',1,0.0,NULL,'An error occurred: undefined method `[]'' for nil');
INSERT INTO links VALUES(7,'scrape this web','http://www.scrapethissite.com/lessons/sign-up/','nothing to describe',1,'2024-12-23 13:13:27.088605','2024-12-23 20:21:09.579242',1,0.0,NULL,'
Sign Up | Scrape This Site | A public sandbox for learning web scraping
A course to help you');
INSERT INTO links VALUES(8,'xyzz','http://www.scrapethissite.com/','abccc',1,'2024-12-23 13:15:11.793501','2024-12-23 13:15:15.839188',1,0.0,NULL,'A public sandbox for learning web scraping');
INSERT INTO links VALUES(9,'scrape this once','http://Quotes.toscrape.com','the web',1,'2024-12-23 20:26:08.323173','2024-12-23 20:26:17.691077',1,0.0,NULL,'An error occurred: undefined method `[]'' for nil');
INSERT INTO links VALUES(10,'scrape link','http://quotes.toscrape.com/','quotes to scrape',1,'2024-12-23 20:28:29.261908','2024-12-23 20:28:36.434540',1,0.0,NULL,'An error occurred: undefined method `+'' for nil');
INSERT INTO links VALUES(11,'the link','http://quotes.toscrape.com/','asgag',1,'2024-12-23 20:30:00.420687','2024-12-23 20:30:05.191840',1,0.0,NULL,'An error occurred: undefined method `[]'' for nil');
INSERT INTO links VALUES(12,'here is the link','http://quotes.toscrape.com/','wow',1,'2024-12-23 20:30:51.210188','2024-12-23 20:30:55.801124',1,0.0,NULL,'ΓÇ£The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.ΓÇ¥');

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    body TEXT,
    user_id INTEGER,
    link_id INTEGER,
    created_at TIMESTAMP(6) NOT NULL,
    updated_at TIMESTAMP(6) NOT NULL,
    CONSTRAINT fk_user_comment FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT fk_link_comment FOREIGN KEY (link_id) REFERENCES links (id)
);

INSERT INTO comments VALUES (1, 'hey', 1, 1, '2024-12-19 11:34:42.109567', '2024-12-20 03:54:09.220002');
INSERT INTO comments VALUES (2, 'yeah it works', 2, 1, '2024-12-19 22:16:25.797773', '2024-12-19 22:16:25.797773');
INSERT INTO comments VALUES(3,'okkk',1,1,'2024-12-20 00:51:58.584269','2024-12-20 00:51:58.584269');
INSERT INTO comments VALUES(4,'good job!!',1,4,'2024-12-20 14:36:54.866560','2024-12-20 14:36:54.866560');
INSERT INTO comments VALUES(5,'nice',1,4,'2024-12-20 14:37:12.499851','2024-12-20 14:37:12.499851');
INSERT INTO comments VALUES(6,'hryyy',1,9,'2024-12-24 13:54:03.082439','2024-12-24 13:54:03.082439');
INSERT INTO comments VALUES(7,'heyyy',1,11,'2024-12-24 13:54:20.311883','2024-12-24 13:54:20.311883');
FOREIGN KEY ("user_id")
REFERENCES "users" ("id"),
CONSTRAINT "fk_rails_dfa9e52e2d"
FOREIGN KEY ("link_id")
REFERENCES "links" ("id");

INSERT INTO "votes" VALUES(5, 2, 2, 0, 1, '2024-12-19 19:43:59.818864', '2024-12-19 19:43:59.818864');
INSERT INTO "votes" VALUES(6, 2, 1, 1, 0, '2024-12-19 19:44:05.391566', '2024-12-19 19:44:05.391566');
INSERT INTO "votes" VALUES(17, 1, 2, 1, 0, '2024-12-20 12:34:21.382382', '2024-12-20 12:34:21.382382');
INSERT INTO "votes" VALUES(21, 1, 4, 1, 0, '2024-12-20 19:52:04.306687', '2024-12-20 19:52:04.306687');
INSERT INTO "votes" VALUES(22, 1, 1, 1, 0, '2024-12-20 20:24:56.629417', '2024-12-20 20:24:56.629417');
INSERT INTO "votes" VALUES(23, 1, 7, 1, 0, '2024-12-23 13:14:34.818670', '2024-12-23 13:14:34.818670');

DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users', 8);
INSERT INTO "sqlite_sequence" VALUES('links', 12);
INSERT INTO "sqlite_sequence" VALUES('comments', 7);
INSERT INTO "sqlite_sequence" VALUES('votes', 23);

CREATE INDEX "index_links_on_user_id" ON "links" ("user_id");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE INDEX "index_comments_on_link_id" ON "comments" ("link_id");
CREATE INDEX "index_votes_on_user_id" ON "votes" ("user_id");
CREATE INDEX "index_votes_on_link_id" ON "votes" ("link_id");

COMMIT;

