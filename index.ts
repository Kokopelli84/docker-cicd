import express from 'express';

const app = express();

app.get('/', (req, res) => {
  res.send('OK');
});

app.get('/env', (req, res) => {
  res.send(process.env.NODE_ENV);
});

app.listen(5000, () => console.log('Server started on port 5000'));
