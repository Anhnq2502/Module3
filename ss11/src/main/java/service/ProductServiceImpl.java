package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepositoryImpl;

import java.util.ArrayList;
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
    public void update(int productId, Product product) {
        repository.update(productId, product);
    }

    @Override
    public void delete(int productId) {
        repository.delete(productId);
    }

    @Override
    public Product display(int productId) {
        return null;
    }

    @Override
    public void search(int productId) {

    }

}
