package model;

public class Product {
    private int productId;
    private String productName;
    private double productPrice;
    private String productDetail;
    private String productImg;

    public Product(int productId, String productName, double productPrice, String productDetail, String productImg) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productDetail = productDetail;
        this.productImg = productImg;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productPrice=" + productPrice +
                ", productDetail='" + productDetail + '\'' +
                ", productImg='" + productImg + '\'' +
                '}';
    }
}
