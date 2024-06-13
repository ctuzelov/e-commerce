CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    email  VARCHAR(255) NOT NULL UNIQUE,
    pass_hash VARCHAR(255) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_email ON users(email);