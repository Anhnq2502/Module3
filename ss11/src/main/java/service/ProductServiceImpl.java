package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepositoryImpl;


import java.util.List;

public class ProductServiceImpl implements IProductService {
    private IProductRepository repository = new ProductRepositoryImpl();


    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(Product product) {
        repository.save(product);
    }

    @Override
    public Product findById(int productId) {
        return repository.findById(productId);
    }

    @Override
    public void update(Product product) {
        repository.update(product);
    }


    @Override
    public void remove(int productId) {
        repository.remove(productId);
    }

    @Override
    public Product findByName(String productName) {
       return repository.findByName(productName);
    }

}

