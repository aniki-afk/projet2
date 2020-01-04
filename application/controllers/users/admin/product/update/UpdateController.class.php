<?php

class UpdateController
{
  public function httpGetMethod(Http $http, array $queryFields)
  {

    if(empty($_SESSION) == true || $_SESSION['role'] !== "admin" ) {
      $http->redirectTo('/');
    }
    $artworkModel = new ArtworksModel();
    $productsModel = new ProductsModel();
    $artworks = $artworkModel->getAllArtworks();
    $lines = $productsModel->getAllLines();
    $product = $productsModel->getOneProduct();


    // var_dump($figurines);
    return [
      'product'=>$product,
      "artworks"=>$artworks,
      'lines'=>$lines
    ];

  }

  public function httpPostMethod(Http $http, array $formFields)
  {
    $artworkModel = new ArtworksModel();
    $productsModel = new ProductsModel();
    $artworks = $artworkModel->getAllArtworks();
    $lines = $productsModel->getAllLines();
    $productsModel->updateProduct($_POST, $_FILES);
    return [
      'product'=>$product,
      "artworks"=>$artworks,
      'lines'=>$lines
    ];


  }
}
