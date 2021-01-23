const Sequelize = require('sequelize')
const database = require('../db')

const productModel = require('./products')

const categories = database.define('categories', {
    id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
    name: Sequelize.STRING,
    parent_id: Sequelize.INTEGER
});

module.exports = categories;