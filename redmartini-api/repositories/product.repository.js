const BaseRepository = require('./base.repository');
let _product = null;

class ProductRepository extends BaseRepository{

    constructor({ Product }){
        super(Product);
        _product = Product;
    }

    async getProductByName(productName){
        return await _product.find({ 'name': new RegExp(productName, "i")});
    }
}

module.exports = ProductRepository;