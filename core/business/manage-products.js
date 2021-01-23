const categries = require("../../db/models/categories");
const product = require("../dal/product");

const productsDAL = require('../dal/product');

module.exports = {

    getProductsBycategory: async (category, page) => {
        try {
            let products = await productsDAL.getAllProductsByCategory(category, page)
            return ({ error: false, products })

        } catch (error) {
            console.log({ error, products: [] });
            return error
        }
    }
}
