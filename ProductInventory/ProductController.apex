public class ProductController {

    // Current product
    public Product__c prod {get; set;}

    // Product list
    public List<Product__c> prodList {get; set;}

    // Store selected record Id
    public Id selectedId {get; set;}

    // Constructor
    public ProductController() {

        prod = new Product__c();

        loadProducts();
    }

    // Load records
    public void loadProducts() {

        prodList = [
            SELECT Id,
                   Name,
                   Serial_No__c,
                   Manufacture_Date__c,
                   Expiry_Date__c
            FROM Product__c
            ORDER BY CreatedDate DESC
        ];
    }

    // INSERT
    public void insertProduct() {

        insert prod;

        prod = new Product__c();

        loadProducts();
    }

    // EDIT
    public void editProduct() {

        prod = [
            SELECT Id,
                   Name,
                   Serial_No__c,
                   Manufacture_Date__c,
                   Expiry_Date__c
            FROM Product__c
            WHERE Id = :selectedId
        ];
    }

    // UPDATE
    public void updateProduct() {

        update prod;

        prod = new Product__c();

        loadProducts();
    }

    // DELETE
    public void deleteProduct() {

        Product__c p = [
            SELECT Id
            FROM Product__c
            WHERE Id = :selectedId
        ];

        delete p;

        loadProducts();
    }
}