const productModel = require('./products');
const providerModel = require('./providers');
const categoryModel = require('./categories');
const productProvidersModel = require('./product-providers');

//categroy with product
categoryModel.hasMany(productModel, {foreignKey: 'category_id'});
productModel.belongsTo(categoryModel, {as:'products', foreignKey: 'category_id'});

// product with products-providers
productModel.hasMany(productProvidersModel, {as: "providers",  foreignKey: 'product_id'});
productProvidersModel.belongsTo(productModel, {as:"products",  foreignKey: 'product_id'});