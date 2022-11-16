let _productService = null;

class ProductController {
        constructor({ ProductService }){
            _productService = ProductService;
        }

        async get(req,res){
            const { productId } = req.params;
            const product = await _productService.get(productId);
            return res.send(product);
        }

        async getAll(req,res){
            const { pageSize, pageNum } = req.query;
            const products = await _productService.getAll(pageSize, pageNum);
            return res.send(products);
        }

        async create(req, res){
            const { body } = req;
            const createdProduct = await _productService.create(body);
            return res.status(201).send(createdProduct);
        }

        async getProductByName(req, res){
            const { productName } = req.params;
            const product = await _productService.getProductByName(productName);
            return res.send(product);
        }

        async update(req,res){
            const { body } = req;
            const { productId } = req.params;
            const updatedProduct = await _productService.update(productId, body);
            return res.send(updatedProduct);
        }

        async delete(req,res){
            const { productId } = req.params;
            const deletedProduct = await _productService.delete(productId);
            return res.send(deletedProduct);
        }
}

module.exports = ProductController;