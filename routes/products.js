var express = require('express');
var router = express.Router();

const PaginationMiddleware = require('../middleware/pagination')
const productBLL = require('../core/business/manage-products');


/* GET home server. */
router.get('/:category', PaginationMiddleware, async (req, res, next) => {
  let { category } = req.params || "";
  let pagination = req.pagination || 1;

  let { err, products } = await productBLL.getProductsBycategory(category, pagination);

  res.end(JSON.stringify({ success: !err, products }));
});

/* Post set/unset a product as featured inside its category. */
router.post('/change-product-to-category', function (req, res, next) {

});



module.exports = router;
