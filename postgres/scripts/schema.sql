DROP DATABASE IF EXISTS test_db;
CREATE DATABASE test_db;

CREATE USER dima WITH ENCRYPTED PASSWORD 'dima';
GRANT ALL PRIVILEGES ON DATABASE test_db TO dima;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO dima;

---------------------------------------------------------------
---------------------------------------------------------------

CREATE OR REPLACE FUNCTION on_update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

---------------------------------------------------------------
---------------------------------------------------------------

DROP TABLE IF EXISTS test_table CASCADE;
CREATE TABLE test_table
(
    record_id       INT GENERATED ALWAYS AS IDENTITY,
    record_value    TEXT NOT NULL,
    create_at       TIMESTAMPTZ DEFAULT now() NOT NULL,
    updated_at      TIMESTAMPTZ DEFAULT now() NOT NULL,

    PRIMARY KEY(record_id)
);

-- trigger (updated_at)
CREATE TRIGGER trigger_test_table_updated_at
    BEFORE UPDATE
    ON test_table
    FOR EACH ROW
    EXECUTE PROCEDURE on_update_updated_at();