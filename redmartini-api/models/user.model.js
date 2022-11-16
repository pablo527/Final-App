const mongoose = require('mongoose');
const { Schema } = mongoose;
const uniqueValidator = require('mongoose-unique-validator');
const { compareSync, hashSync, genSaltSync } = require('bcrypt');

const UserSchema = new Schema(
    {
    username: {
        type: String,
        required: true,
        unique: true,
        trim: true
    },
    firstName: {
        type: String,
        trim: true,
        required: true
    },
    secondName: {
        type: String,
        trim: true
    },
    firstLastName: {
        type: String,
        trim: true,
        required: true
    },
    secondLastName: {
        type: String,
        trim: true
    },
    cellphone: {
        type: String,
        unique: true,
        trim: true,
        required: true
    },
    email: {
        type: String,
        unique: true,
        lowercase: true,
        trim: true,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    birthdate: {
        type: Date,
        required: true,
        trim: true
    },
    city:{
        type: String,
        trim: true,
        required: true
    },
    country:{
        type: String,
        trim: true,
        required: true
    },
    picture: {
        type: String,
        required: true,
        trim: true,
        default: "avatar.png"
    },
    is_active: {
        type: Boolean,
        default: true,
        required: true
    }
},
{ timestamps: { createdAt: true, updatedAt: true } });

UserSchema.methods.toJSON = function(){
    let user = this.toObject();
    delete user.password;
    return user;
}

UserSchema.plugin(uniqueValidator);

UserSchema.methods.comparePasswords = function(password){
    return compareSync(password, this.password);
}

UserSchema.pre("save", async function(next){
    const user = this;
    if(!user.isModified("password")){
        return next();
    }

    const salt = genSaltSync(10);
    const hashedPassword = hashSync(user.password, salt);
    user.password = hashedPassword;
    next();
});

module.exports = mongoose.model("user", UserSchema);
