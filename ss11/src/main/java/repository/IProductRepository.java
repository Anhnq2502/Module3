package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public interface IProductRepository {

    List<Product> findAll();

    void save(Product product);

    Product findById(int productId);

    void update(int productId, Product product);

    void delete(int productId);

    Product display(int productId);

    void search(int productId);
}
