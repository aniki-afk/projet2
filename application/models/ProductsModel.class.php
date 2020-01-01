<?php
class ProductsModel {

  public function getAllProducts() {
    $database = new Database();

    $sql = 'SELECT *
    FROM products';
    // var_dump($database);
    return $database->query($sql, []);


  }

  public function getOneProduct()
  {
    $database = new Database();
    $sql =
    'SELECT *
    FROM products
    WHERE Id = ?';
    // var_dump($database);
    return $database->queryOne($sql, [$_GET['productId']]);
  }

  public function getAllLines()
  {
    $database = new Database();

    $sql = 'SELECT *
    FROM productline
    ORDER BY ProductLine';
    // var_dump($database);
    return $database->query($sql, []);
  }

  public function getOneLine()
  {
    $database = new Database();
    $sql = 'SELECT *
    FROM products
    INNER JOIN productline ON productline.ProductLine = products.ProductLine
    WHERE products.ProductLine = figurines';
    return $database->queryOne($sql, [$_GET['product']]);
  }

  public function search($post)
  {
    $database = new Database();
    $sql = 'SELECT products.Id, products.Artworks_Id, products.Name, products.Photo, products.ProductLine, products.Description, products.Price
    FROM products
    INNER JOIN artworks ON artworks.Id = products.Artworks_Id
    WHERE artworks.Name LIKE "%"?"%"';
    return $database->query($sql, [$post]);
  }

  public function updateProduct($_post, $_files)
  {
    $database = new Database();
    if (empty($files["product_pics"]["name"])) {
      $database->executeSql('UPDATE products
      SET Name = ?, Artworks_Id = ?, ProductLine = ?, Description = ?, QuantityInStock = ?, BuyPrice = ?, Price = ?
      WHERE Id = ?', [
      $_post["name"],
      $_post['artworksId'],
      $_post["productline"],
      $_post["description"],
      $_post["quantity"],
      $_post["buyPrice"],
      $_post["price"],
      $_post['productId']]
      );
    } else {
      $database->executeSql('UPDATE products
      SET Name = ?, Artworks_Id = ?, Photo = ?, ProductLine = ?, Description = ?, QuantityInStock = ?, BuyPrice = ?, Price = ?
      WHERE Id = ?', [
        $_post["name"],
        $_post['artworksId'],
        $_file["product_pics"]["name"],
        $_post["productline"],
        $_post["description"],
        $_post["quantity"],
        $_post["buyPrice"],
        $_post["price"],
        $_post['productId']]
      );
    }
    $http = new HTTP();
    $http->moveUploadedFile("product_pics", "/ressources/images/products");
    $http->redirectTo("/users/admin");
  }

  public function addProduct($_post, $_file)
  {
    $database = new Database();
    $database->executeSql("INSERT INTO products (Name, Artworks_Id, Photo, ProductLine, Description, QuantityInStock, BuyPrice, Price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [
    $_post["name"],
    $_post['artworksId'],
    $_file["product_pics"]["name"],
    $_post["productline"],
    $_post["description"],
    $_post["quantity"],
    $_post["buyPrice"],
    $_post["price"]
    ]);
    $http = new HTTP();
    $http->moveUploadedFile("product_pics", "/ressources/images/products");
    $http->redirectTo("/users/admin");
    exit();
  }

  public function suppProduct($id)
  {
    $database = new Database();
    $database->executeSql('DELETE FROM products WHERE Id = ?', [$id]);
  }

}
?>
