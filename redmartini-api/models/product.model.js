'use strict';

const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const uniqueValidator = require('mongoose-unique-validator');

const ProductSchema = Schema(
    {
        name: {
            type: String,
            required: true,
            unique: true
        },
        description: {
            type: String
        },
        price: {
            type: Number,
            required: true,
            trim: true
        },
        quantity: {
            type: Number,
            required: true,
            trim: true,
            default: 0
        },
        img: {
            type: String,
            required: true,
            trim: true
        }
    },
    { timestamps: { createdAt: true, updatedAt: true } }
);

ProductSchema.plugin(uniqueValidator);
module.exports = mongoose.model('product', ProductSchema)