const express = require('express');
require("express-async-errors");
const cors = require('cors');
const helmet = require('helmet');
const compression = require('compression');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const {NotFoundMiddleware, ErrorMiddleware} = require('../middlewares');

module.exports = function({
    UserRoutes,
    ProductRoutes
  }){

    const router = express.Router();
    const apiRoutes = express.Router();

    apiRoutes
    .use(logger('dev'))
    .use(express.json())
    .use(cors())
    .use(helmet())
    .use(cookieParser())
    .use(compression())
    .use(express.static('public'));
 
    apiRoutes.use("/user", UserRoutes);
    apiRoutes.use("/product", ProductRoutes);

    router.use("/v1/api", apiRoutes);
    router.use(NotFoundMiddleware);
    router.use(ErrorMiddleware);

    return router;
}