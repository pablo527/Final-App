const { Router } = require('express');
const { AuthMiddleware, ParseIntMiddleware } = require('../middlewares');

module.exports = function({ProductController}){
    const router = Router();

    router.get("/:productId", ProductController.get);
    router.get("", ProductController.getAll);
    router.get("/name/:productName", ProductController.getProductByName);
    router.post("", ProductController.create);
    router.patch("/:productId", ProductController.update);
    router.delete("/:productId", ProductController.delete);
    return router;
}   