require('dotenv').config();
const express = require('express');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();
app.use(cors());
app.use(express.json());

// 3. RDS CONNECTION (update with your credentials)
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

db.connect(err => {
  if (err) throw err;
  console.log('Connected to RDS');
});

// 4. ROUTES

// Get all todos
app.get('/todos', (req, res) => {
  db.query('SELECT * FROM todos', (err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
});

// Add todo
app.post('/todos', (req, res) => {
  const { text } = req.body;
  db.query('INSERT INTO todos (text, completed) VALUES (?, ?)', [text, false], (err, result) => {
    if (err) return res.status(500).send(err);
    res.json({ id: result.insertId, text, completed: false });
  });
});

// Toggle todo
app.put('/todos/:id', (req, res) => {
  const { id } = req.params;
  const { completed } = req.body;
  db.query('UPDATE todos SET completed = ? WHERE id = ?', [completed, id], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Updated');
  });
});

// Delete todo
app.delete('/todos/:id', (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM todos WHERE id = ?', [id], (err) => {
    if (err) return res.status(500).send(err);
    res.send('Deleted');
  });
});

app.listen(5000, () => console.log('Server running on port 5000'));
