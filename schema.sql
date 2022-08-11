/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
);
ALTER TABLE animals ADD species varchar(100);

CREATE TABLE owners (
    id BIGSERIAL NOT NULL
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE species (
    id BIGSERIAL NOT NULL
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


ALTER TABLE animals 
DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id INTEGER,
ADD CONSTRAINT species_key FOREIGN KEY (species_id) REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INTEGER,
ADD CONSTRAINT owners_key FOREIGN KEY (owner_id) REFERENCES owners(id)
ON DELETE CASCADE;