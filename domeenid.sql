CREATE DOMAIN nimetus AS varchar(100) NOT NULL
CHECK(
   VALUE !~ '^[[:space:]]*$'
);