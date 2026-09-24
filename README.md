# Project Name

A web-based application built using **HTML, CSS, JavaScript, Node.js, Express.js, and PostgreSQL**.

## 📌 Project Overview

This project consists of a frontend application, a backend REST API, and a PostgreSQL database.

The system allows users to interact with the application through a web interface while the backend handles API requests and communicates with the database.

## 🛠️ Technologies Used

### Frontend

* HTML5
* CSS3
* JavaScript

### Backend

* Node.js
* Express.js

### Database

* PostgreSQL

### Development Tools

* Visual Studio Code
* pgAdmin
* Git & GitHub

## 📁 Project Structure

```text
project/
│
├── frontend/
│   ├── index.html
│   ├── style.css
│   └── script.js
│
├── backend/
│   ├── server.js
│   ├── package.json
│   ├── routes/
│   └── ...
│
├── database.sql
│ 
│
├── .gitignore
└── README.md
```

## ⚙️ Requirements

Before running the project, make sure you have installed:

* Node.js
* PostgreSQL
* pgAdmin
* Git

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone YOUR_REPOSITORY_URL
```

### 2. Navigate to the Project

```bash
cd project
```

### 3. Install Backend Dependencies

```bash
cd backend
npm install
```

### 4. Configure Environment Variables

Create a `.env` file inside the backend folder:

```env
PORT=3000
DB_HOST=localhost
DB_PORT=5432
DB_NAME=your_database_name
DB_USER=your_database_user
DB_PASSWORD=your_database_password
```

> Do not upload the `.env` file to GitHub.

### 5. Create the Database

Create a PostgreSQL database using pgAdmin.

Then execute the SQL file located in:

```text
database/database.sql
```

This will create the required tables and insert the required data.

### 6. Start the Backend

From the `backend` folder:

```bash
npm start
```

Or, if your project uses the development script:

```bash
npm run dev
```

The server should run on:

```text
http://localhost:3000
```

## 🔌 API

The backend provides REST API endpoints for communication between the frontend and database.

Example:

```text
GET    /api/...
POST   /api/...
PUT    /api/...
DELETE /api/...
```

## 🔐 Environment Variables

Sensitive information such as database passwords and secret keys should be stored in `.env`.

Example:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=your_database_name
DB_USER=your_database_user
DB_PASSWORD=your_database_password
```

The `.env` file should never be committed to GitHub.

## 🗄️ Database

The project uses **PostgreSQL**.

The database backup/schema is included in:

```text
database.sql
```

You can restore the database using pgAdmin.

## 👨‍💻 Development

To contribute or modify the project:

1. Clone the repository.
2. Install the required dependencies.
3. Configure the `.env` file.
4. Set up the PostgreSQL database.
5. Start the backend server.
6. Open the frontend application.

## 📄 License

This project is developed for educational and graduation project purposes.
