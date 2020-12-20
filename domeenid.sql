CREATE DOMAIN nimetus AS varchar(100) NOT NULL
CHECK(
   VALUE !~ '^[[:space:]]*$'
);

ALTER DOMAIN nimetus
    RENAME CONSTRAINT nimetus_check TO CK_Nimetus;

-- Change domain access rights

revoke usage on domain public.nimetus from public;
