

function PaginationMiddleware (req, res, next) {
    let page = +req.query.page || 1;
    let elementPerPage = +process.env.ELEMENTS_PER_PAGE || 25;

    req.pagination = {
        "skip": elementPerPage * (page),
        "limit": elementPerPage
    }

    next()
}
module.exports = PaginationMiddleware

