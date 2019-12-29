<?php

class ProductsController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $productsModel = new ProductsModel();
      $artworks = $artworkModel->getAllArtworks();
      $products = $productsModel->getAllProducts();
      return[
        "artworks"=>$artworks,
        'products'=>$products
      ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {



    }
}
?>
