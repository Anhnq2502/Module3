package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public interface IProductRepository {

    List<Product> findAll();

    void save(Product product);
    Product findById(int productId);
    void update(int productId, Product product);
    void remove(int productId);
    Product findByName(String productName);
}
