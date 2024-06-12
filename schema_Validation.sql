-- Schema for a Simple Blogging Platform

-- Drop tables if they exist
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

-- Create users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Create posts table
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create comments table
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert demo data into users table
INSERT INTO users (username, email, password) VALUES
('johndoe', 'johndoe@example.com', 'hashed_password_1'),
('janedoe', 'janedoe@example.com', 'hashed_password_2');

-- Insert demo data into categories table
INSERT INTO categories (name) VALUES
('Technology'),
('Lifestyle'),
('Travel'),
('Food');

-- Insert demo data into posts table
INSERT INTO posts (user_id, category_id, title, content) VALUES
(1, 1, 'First Post', 'This is the content of the first post.'),
(2, 2, 'Second Post', 'This is the content of the second post.');

-- Insert demo data into comments table
INSERT INTO comments (post_id, user_id, content) VALUES
(1, 2, 'Great post!'),
(2, 1, 'Thanks for sharing.');
