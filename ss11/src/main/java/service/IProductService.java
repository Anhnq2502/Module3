package service;

import model.Product;


import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product product);
    Product findById(int productId);
    void update(Product product);
    void remove(int productId);
    Product findByName(String productName);
}
