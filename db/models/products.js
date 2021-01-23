const Sequelize = require('sequelize')
const database = require('../db')

const categoryModel = require('./categories');

const products = database.define('products', {
    id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
    name: Sequelize.STRING,
    image_uri: Sequelize.STRING,
    category_id: { type: Sequelize.INTEGER, foreignKey: true }
});

module.exports = products;