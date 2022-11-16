const BaseService = require('./base.service');
let _productRepository = null;

class ProductService extends BaseService{
    constructor({ProductRepository}){
        super(ProductRepository);
        _productRepository = ProductRepository;
    }

    async getProductByName(productName){
        if(!productName){
            const error = new Error();
            error.status = 400;
            error.message = "product name must be sent";
            throw error;
        }
        const products = await _productRepository.getProductByName(productName);

        if(!products){
            const error = new Error();
            error.status = 404;
            error.message = "the product name does not exist";
            throw error;
        }
        return products; 
    }
}

module.exports = ProductService;