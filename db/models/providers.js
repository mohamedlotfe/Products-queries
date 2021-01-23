const Sequelize = require('sequelize')
const database = require('../db')


const providers = database.define('providers', {
    id: { type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
    name: Sequelize.STRING,

});


module.exports = providers;