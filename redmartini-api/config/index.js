'use strict';

if(process.env.NODE_ENV !== "production" || process.env.NODE_ENV == "production"){
    require('dotenv').config({path: '.env'});
}

module.exports = {
    PORT: process.env.PORT,
    MONGO_URI: process.env.MONGO_URI,
    MONGO_TEST: process.env.MONGO_TEST,
    SECRET: process.env.SECRET,
    CACHE_KEY: process.env.CACHE_KEY,
}