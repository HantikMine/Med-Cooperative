CREATE TABLE test (

    id SERIAL PRIMARY KEY,

    name VARCHAR(255),

    description TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
