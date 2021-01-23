
const Sequelize = require('sequelize')
const database = require('../db')
const products = require('./products');
const providers = require('./providers');


const product_providers = database.define('product_providers', {
    product_id: { type: Sequelize.INTEGER, foreignKey: true , primaryKey: true},
    provider_id: { type: Sequelize.INTEGER, foreignKey: true, primaryKey: true },
    price: Sequelize.DECIMAL,
    available: Sequelize.INTEGER
})




module.exports = product_providers;