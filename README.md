E-commerce Database Management System
Overview

This project implements a relational database for a simple E-commerce store using MySQL. It is designed to manage customers, products, orders, and product categories efficiently, demonstrating relational database principles and normalization.

Features

Customers: Stores customer details with unique email constraints.

Products: Tracks products, stock levels, and prices.

Orders & OrderItems: Manages orders and purchased items (One-to-Many relationship).

Categories & ProductCategories: Organizes products into categories (Many-to-Many relationship).

Constraints: Primary keys, foreign keys, NOT NULL, UNIQUE, and cascading deletes ensure data integrity.

Usage

Create the database by running the SQL script EcommerceDB.sql.

The script includes:

CREATE DATABASE and USE statements

Table creation with all constraints

Sample data inserts for testing

Use standard SQL queries to interact with the database (SELECT, INSERT, UPDATE, DELETE).

Schema Relationships

One-to-Many: Customers → Orders, Orders → OrderItems

Many-to-Many: Products ↔ Categories via ProductCategories
