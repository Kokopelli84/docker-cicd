import express from 'express';
import 'dotenv/config';

const app = express();

app.get('/', (req, res) => {
  res.send('OK');
});

app.get('/env', (req, res) => {
  res.send({
    NODE_ENV: process.env.NODE_ENV,
    PORT: process.env.PORT,
  });
});

app.listen(process.env.PORT, () => console.log('Server started on port 5000'));
