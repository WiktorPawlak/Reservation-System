CREATE TABLE MOVIES (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration TIME NOT NULL
);

CREATE TABLE SCREENINGS (
     id BIGINT AUTO_INCREMENT PRIMARY KEY,
     movie_id BIGINT NOT NULL,
     room_id BIGINT NOT NULL,
     date TIMESTAMP NOT NULL
);

CREATE TABLE ROOMS (
    id BIGINT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE SEATS (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    row_number INT NOT NULL,
    seat_number INT NOT NULL,
    room_id BIGINT NOT NULL
);

CREATE TABLE BOOKED_SEAT (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    seat_id BIGINT NOT NULL,
    screening_id BIGINT NOT NULL
);

CREATE TABLE RESERVATIONS (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    screening_id BIGINT NOT NULL,
    name VARCHAR(400) NOT NULL,
    surname VARCHAR(400) NOT NULL,
    expiration_time TIMESTAMP NOT NULL
);

CREATE TABLE TICKETS (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    reservation_id BIGINT NOT NULL,
    seat_id BIGINT NOT NULL,
    type ENUM ('ADULT', 'STUDENT', 'CHILD') NOT NULL DEFAULT 'ADULT'
);

ALTER TABLE SCREENINGS
    ADD CONSTRAINT screening_movie_id_fk
        FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE SCREENINGS
    ADD CONSTRAINT screening_room_id_fk
        FOREIGN KEY (room_id) REFERENCES rooms(id);

ALTER TABLE SEATS
    ADD CONSTRAINT seat_room_id_fk
        FOREIGN KEY (room_id) REFERENCES rooms(id);

ALTER TABLE RESERVATIONS
    ADD CONSTRAINT reservation_screening_id_fk
        FOREIGN KEY (screening_id) REFERENCES screenings(id);

ALTER TABLE TICKETS
    ADD CONSTRAINT ticket_reservation_id_fk
        FOREIGN KEY (reservation_id) REFERENCES  RESERVATIONS(id);
ALTER TABLE TICKETS
    ADD CONSTRAINT ticket_seat_id_fk
        FOREIGN KEY (seat_id) REFERENCES  SEATS(id);

ALTER TABLE BOOKED_SEAT
    ADD CONSTRAINT bookedseat_seat_id_fk
        FOREIGN KEY (seat_id) REFERENCES SEATS(id);
ALTER TABLE BOOKED_SEAT
    ADD CONSTRAINT bookedseat_screening_id_fk
        FOREIGN KEY (screening_id) REFERENCES screenings(id);
