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

  }
  ?>
