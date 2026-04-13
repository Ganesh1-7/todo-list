# 📝 Full Stack To-Do App

A modern full-stack To-Do application built with **React, Node.js, MySQL (AWS RDS), Docker, and AWS EC2**.


---

## 🚀 Features

* ✅ Add new tasks
* ✅ Mark tasks as completed
* ✅ Delete tasks
* 🔄 Data persistence using AWS RDS
* ☁️ Deployed on AWS EC2
* 🐳 Dockerized frontend

---

## 🏗️ Architecture

```text
React (Frontend - Docker)
        ↓
Node.js (Backend - EC2)
        ↓
MySQL (AWS RDS)
```

---

## 📸 Screenshots

### 🏠 Home UI

![Home](./screenshots/home.png)

---

### ➕ Add Task

![Add Task](./screenshots/add-task.png)

---

### ✅ Mark as Completed

![Completed](./screenshots/completed.png)

---

### 🗑 Delete Task

![Delete](./screenshots/delete.png)


---

### ⚙️ Backend Running on EC2

Node.js server connected to AWS RDS.

![Backend](./screenshots/backend.png)

---

## 🔐 Environment Variables

### Backend (`backend/.env`)

```env
DB_HOST=your-rds-endpoint
DB_USER=your-username
DB_PASSWORD=your-password
DB_NAME=todo_db
```

---

### Frontend (`frontend/.env`)

```env
REACT_APP_API_URL=http://your-ec2-ip:5000
```

---

## 🛠️ Setup Instructions

### 1️⃣ Clone Repository

```bash
git clone https://github.com/your-username/todo-app.git
cd todo-app
```

---

### 2️⃣ Backend Setup

```bash
cd backend
node server.js
```

---

### 🐳 Run Frontend with Docker

```bash
docker build -t todo-frontend .
docker run -p 3000:3000 \
-e REACT_APP_API_URL=http://your-ec2-ip:5000 \
todo-frontend
```

---

## 🌐 API Endpoints

| Method | Endpoint     | Description   |
| ------ | ------------ | ------------- |
| GET    | `/todos`     | Get all todos |
| POST   | `/todos`     | Add todo      |
| PUT    | `/todos/:id` | Update todo   |
| DELETE | `/todos/:id` | Delete todo   |

---

## ⚠️ Common Issues

### Failed to fetch

* Check API URL
* Ensure backend is running
* Verify EC2 ports are open

### MySQL connection error

* Verify `.env` credentials
* Check RDS security group

---

## 👨‍💻 Author

**Ganesh**
