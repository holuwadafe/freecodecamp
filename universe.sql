CREATE DATABASE universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    has_life BOOLEAN NOT NULL,
    galaxy_type VARCHAR(30),
    distance_from_earth NUMERIC,
    age_in_millions_of_years INT
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    moons_count INT,
    distance_from_star NUMERIC,
    star_id INT NOT NULL REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    is_spherical BOOLEAN NOT NULL,
    diameter_in_km INT,
    planet_id INT NOT NULL REFERENCES planet(planet_id)
);

CREATE TABLE black_hole (
    black_hole_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    mass_in_solar_masses NUMERIC NOT NULL,
    has_event_horizon BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, description, has_life, galaxy_type, distance_from_earth, age_in_millions_of_years)
VALUES
    ('Milky Way', 'Our home spiral galaxy', true, 'Spiral', 0, 13600),
    ('Andromeda', 'Nearest major galaxy to the Milky Way', false, 'Spiral', 2500000, 10000),
    ('Triangulum', 'Third-largest galaxy in the Local Group', false, 'Spiral', 3000000, 12000),
    ('Sombrero', 'Galaxy with a bright nucleus and large dust lane', false, 'Spiral', 29000000, 13000),
    ('Centaurus A', 'Prominent dust lane and active galactic nucleus', false, 'Elliptical', 13700000, 11000),
    ('Messier 87', 'Supergiant elliptical galaxy with famous black hole', false, 'Elliptical', 53000000, 13000);

INSERT INTO star (name, description, is_spherical, age_in_millions_of_years, galaxy_id)
VALUES
    ('Sun', 'The star at the center of our Solar System', true, 4600, 1),
    ('Proxima Centauri', 'Closest known star to the Sun', true, 4500, 1),
    ('Sirius', 'Brightest star in the night sky', true, 240, 1),
    ('Betelgeuse', 'Red supergiant in Orion', true, 10, 1),
    ('Rigel', 'Blue supergiant in Orion', true, 8, 1),
    ('Alpha Centauri A', 'Primary component of the closest star system', true, 4500, 1),
    ('Andromeda Star 1', 'A massive star in Andromeda galaxy', true, 500, 2),
    ('M87 Jet Star', 'Star near the famous black hole in M87', true, 1000, 6);

INSERT INTO planet (name, has_life, is_spherical, moons_count, distance_from_star, star_id)
VALUES
    ('Mercury', false, true, 0, 0.39, 1),
    ('Venus', false, true, 0, 0.72, 1),
    ('Earth', true, true, 1, 1.00, 1),
    ('Mars', false, true, 2, 1.52, 1),
    ('Jupiter', false, true, 95, 5.20, 1),
    ('Saturn', false, true, 146, 9.58, 1),
    ('Uranus', false, true, 27, 19.18, 1),
    ('Neptune', false, true, 16, 30.07, 1),
    ('Proxima b', false, true, 0, 0.05, 2),
    ('Proxima c', false, true, 0, 1.49, 2),
    ('TRAPPIST-1d', false, true, 0, 0.02, 2),
    ('Kepler-452b', false, true, 0, 1.05, 6),
    ('HD 209458 b', false, true, 0, 0.05, 3),
    ('51 Pegasi b', false, true, 0, 0.05, 4);

INSERT INTO moon (name, description, is_spherical, diameter_in_km, planet_id)
VALUES
    ('Moon', 'Earth''s only natural satellite', true, 3474, 3),
    ('Phobos', 'Larger moon of Mars', false, 22, 4),
    ('Deimos', 'Smaller moon of Mars', false, 12, 4),
    ('Io', 'Volcanically active moon', true, 3643, 5),
    ('Europa', 'Icy moon with subsurface ocean', true, 3122, 5),
    ('Ganymede', 'Largest moon in the Solar System', true, 5268, 5),
    ('Callisto', 'Heavily cratered moon', true, 4821, 5),
    ('Amalthea', 'Small inner moon of Jupiter', false, 167, 5),
    ('Himalia', 'Irregular moon', false, 170, 5),
    ('Elara', 'Irregular moon', false, 86, 5),
    ('Pasiphae', 'Retrograde irregular moon', false, 58, 5),
    ('Titan', 'Largest moon of Saturn with thick atmosphere', true, 5150, 6),
    ('Rhea', 'Icy moon with possible rings', true, 1528, 6),
    ('Iapetus', 'Two-tone colored moon', true, 1470, 6),
    ('Dione', 'Icy moon with bright wispy terrain', true, 1123, 6),
    ('Tethys', 'Icy moon with huge crater', true, 1062, 6),
    ('Enceladus', 'Geologically active with water plumes', true, 504, 6),
    ('Mimas', 'Moon with enormous Herschel crater', true, 396, 6),
    ('Hyperion', 'Irregularly shaped chaotic rotator', false, 270, 6),
    ('Phoebe', 'Retrograde outer moon', false, 213, 6),
    ('Titania', 'Largest moon of Uranus', true, 1578, 7),
    ('Oberon', 'Outermost large moon of Uranus', true, 1523, 7),
    ('Umbriel', 'Dark heavily cratered moon', true, 1169, 7),
    ('Triton', 'Largest moon of Neptune, geologically active', true, 2707, 8),
    ('Proteus', 'Second-largest moon of Neptune', false, 420, 8);

INSERT INTO black_hole (name, mass_in_solar_masses, has_event_horizon)
VALUES
    ('Sagittarius A*', 4300000, true),
    ('M87 Black Hole', 6500000000, true),
    ('Cygnus X-1', 15, true),
    ('TON 618', 66000000000, true);