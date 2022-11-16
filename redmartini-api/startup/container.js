const { 
    createContainer, 
    asClass, 
    asValue , 
    asFunction} = require('awilix');

//config
const config = require("../config");
const app = require(".");

//services
const {
    UserService,
    ProductService
} = require('../services');

//controllers
const {
    UserController,
    ProductController
} = require('../controllers');

//routes
const Routes =  require('../routes');
const {
    UserRoutes,
    ProductRoutes
} = require("../routes/index.routes");

//models
const {
    User,
    Product
} = require('../models');

//repositories
const {
    UserRepository,
    ProductRepository
} = require('../repositories');

const container = createContainer();

container
.register({
    app: asClass(app).singleton(),
    router: asFunction(Routes).singleton(),
    config: asValue(config),
})
.register({
    UserService: asClass(UserService).singleton(),
    ProductService: asClass(ProductService).singleton()
})
.register({
    UserController: asClass(UserController.bind(UserController)).singleton(),
    ProductController: asClass(ProductController.bind(ProductController)).singleton()
})
.register({
    UserRoutes: asFunction(UserRoutes).singleton(),
    ProductRoutes: asFunction(ProductRoutes).singleton()
}).register({
    User: asValue(User),
    Product: asValue(Product),
}).register({
    UserRepository: asClass(UserRepository).singleton(),
    ProductRepository: asClass(ProductRepository).singleton()
});
module.exports = container;