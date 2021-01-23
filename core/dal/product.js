
const categoriesModel = require('../../db/models/categories');
const productModel = require('../../db/models/products');
const prodProvidersModel = require('../../db/models/product-providers');
const Sequelize = require('sequelize');

// get by categry 
// 
module.exports = {
    getAllProductsByCategory: (category, page) => {
        return categoriesModel.findAll({
            where: {
                name: category
            },
            attributes: ["id", "name"],
            group: ['id', 'products.id', 'products.providers.provider_id`'],
            include: [
                {
                    model: productModel,
                    as: 'products',
                    attributes: ['name'],
                    include: [{
                        model: prodProvidersModel,
                        as: "providers",
                        attributes: [[Sequelize.fn("MIN", Sequelize.col("price")), "price"]],
                        // offset:page.skip,
                        // limit:page.limit
                    }]
                }
            ],
            raw: true

        }).then(products => {
            return products
        }).catch(err => {
            console.log(err)
        })

    },

}