
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS stores (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50)
);



DO $$
BEGIN

    IF current_database() = 'user_data' THEN
        INSERT INTO users (name, email) VALUES
            ('Иван Петров', 'ivan@mail.ru'),
            ('Мария Сидорова', 'maria@mail.ru');
    END IF;


    IF current_database() = 'store_data' THEN
        INSERT INTO stores (name, region) VALUES
            ('Книжный мир', 'Север'),
            ('Читай-город', 'Юг');
    END IF;


    IF current_database() = 'book_data' AND current_setting('port') = '5442' THEN
        INSERT INTO books (book_id, title, author, genre) VALUES
            (1, 'Дюна', 'Герберт', 'Фантастика'),
            (2, '1984', 'Оруэлл', 'Фантастика');
    END IF;


    IF current_database() = 'book_data' AND current_setting('port') = '5443' THEN
        INSERT INTO books (book_id, title, author, genre) VALUES
            (1001, 'Гордость и предубеждение', 'Остен', 'Роман'),
            (1002, 'Три товарища', 'Ремарк', 'Роман');
    END IF;
END $$;