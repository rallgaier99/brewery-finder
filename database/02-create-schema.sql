-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS beer;
DROP TABLE IF EXISTS brewery;
DROP TABLE IF EXISTS app_user CASCADE;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  name varchar(32),
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  birthdate varchar(100),
  email_address varchar(100),
  salt varchar(200)
);

CREATE TABLE brewery (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    brewer int NOT NULL,
    hours_of_operation varchar(255),
    phone varchar(20),
    history varchar(500),
    image varchar(255),
    address varchar(255),
    active_status bool,
    CONSTRAINT brewer_to_user_id_fkey FOREIGN KEY(brewer)
                     REFERENCES app_user (id)
);

CREATE TABLE beer (
    id SERIAL PRIMARY KEY,
    brewery_id int,
    name varchar(255) NOT NULL,
    image varchar(255) NOT NULL,
    description varchar(500) NOT NULL,
    abv float NOT NULL,
    beer_type varchar(255) NOT NULL,
    CONSTRAINT beer_to_brewery_id_fkey FOREIGN KEY (brewery_id)
                  REFERENCES brewery(id)
);

COMMIT;