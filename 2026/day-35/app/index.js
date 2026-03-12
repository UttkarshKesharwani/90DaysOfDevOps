const express = require("express");
const { Client } = require("pg");
const redis = require("redis");

const app = express();

const dbHost = process.env.DB_HOST;
const redisHost = process.env.REDIS_HOST;

app.get("/", async (req, res) => {

  let dbStatus = "not connected";
  let redisStatus = "not connected";

  try {
    const client = new Client({
      host: dbHost,
      user: "postgres",
      password: "postgres",
      database: "appdb"
    });

    await client.connect();
    dbStatus = "connected";
    await client.end();

  } catch (err) {
    dbStatus = "failed";
  }

  try {
    const redisClient = redis.createClient({
      url: `redis://${redisHost}:6379`
    });

    await redisClient.connect();
    await redisClient.set("msg", "Hello Redis");
    redisStatus = await redisClient.get("msg");
    await redisClient.quit();

  } catch (err) {
    redisStatus = "failed";
  }

  res.send(`
    <h1>Node.js App Running</h1>
    <p>Database: ${dbStatus}</p>
    <p>Redis: ${redisStatus}</p>
  `);

});

app.listen(3000, () => {
  console.log("Server running on port 3000");
  console.log(dbHost,redisHost);
});