<?php

class SearchController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $productsModel = new ProductsModel();
      $artworks = $artworkModel->getAllArtworks();
      $products = $productsModel->getAllProducts();
      $lines = $productsModel->getAllLines();
      return[
        "artworks"=>$artworks,
        'products'=>$products,
        'lines'=>$lines
      ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {
      $artworkModel = new ArtworksModel();
      $productsModel = new ProductsModel();
      $artworks = $artworkModel->getAllArtworks();
      $products = $productsModel->getAllProducts();
      $lines = $productsModel->getAllLines();
      $results = $productsModel->search($_POST['search']);
      $search = $_POST['search'];
      return[
        'search'=>$search,
        'results'=>$results,
        "artworks"=>$artworks,
        'products'=>$products,
        'lines'=>$lines
      ];


    }
}
?>
