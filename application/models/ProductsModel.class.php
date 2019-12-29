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

  }
  ?>
