const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const app = express();

app.use(express.json());
app.use(cors());

const PORT = process.env.PORT || 3000;
const MONGO_URI = process.env.MONGO_URI;

mongoose.connect(MONGO_URI)
.then(()=>console.log("MongoDB Connected"))
.catch(err=>console.log(err));

const UserSchema = new mongoose.Schema({
    name: String,
    email: String
});

const User = mongoose.model("User", UserSchema);

app.get("/api/users", async (req,res)=>{
    const users = await User.find();
    res.json(users);
});

app.post("/api/users", async (req,res)=>{
    const user = new User(req.body);
    await user.save();
    res.json(user);
});

app.delete("/api/users/:id", async (req,res)=>{
    await User.findByIdAndDelete(req.params.id);
    res.json({message:"User deleted"});
});

app.listen(PORT, ()=>{
    console.log(`Server running on port ${PORT}`);
});