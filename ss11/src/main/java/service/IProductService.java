package service;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int productId);

    void update(int productId, Product product);

    void delete(int productId);

    Product display(int productId);

    void search(int productId);

}
