DROP TABLE bookings;

CREATE TABLE bookings (
  id SERIAL8 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  check_in DATE,
  nights INT2 not null,
  breakfast BOOLEAN,
  type VARCHAR(255) not null
);