package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {
    private static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Bánh", 5000,"Bánh ngon nhứt nách", "https://cdn.tgdd.vn/Files/2021/08/13/1374896/cong-thuc-lam-banh-con-cua-mem-xop-thom-ngon-bat-bai-202108130846031203.jpg"));
        productList.add(new Product(2, "Kẹo", 2000,"Kẹo ngon bá cháy", "http://hn.check.net.vn/data/product/mainimages/original/product13394.jpg"));
        productList.add(new Product(3, "Nước Fanta", 10000,"Nước ngọt vị cam","https://cdn.tgdd.vn/Products/Images/2443/76453/bhx/nuoc-ngot-fanta-vi-cam-lon-330ml-201812281420358633.jpg"));
        productList.add(new Product(4, "Coca Cola", 10000,"Uống ngon nhứt nách","https://thtmart.com.vn/wp-content/uploads/2021/05/Nuoc-giai-khat-Coca-Cola-lon-330ml-1.jpg"));
        productList.add(new Product(5, "Bò húc", 10000, "Nước tăng lực số 1","https://cf.shopee.vn/file/9b49c5b394dbdefb85a66304a2f16f34"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int productId) {
        return productList.get(productId);
    }

    @Override
    public void update(Product product) {
        productList.add(product);
    }


    @Override
    public void remove(int productId) {
        productList.remove(productId);
    }

    @Override
    public Product findByName(String productName) {
        Product product1 = null;
        for (Product product : productList) {
            if (product.getProductName().equals(productName)) {
                product1 = product;
            }
        }
        return product1;
    }

}
