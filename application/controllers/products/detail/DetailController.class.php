<?php

class DetailController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $productsModel = new ProductsModel();
      $artworks = $artworkModel->getAllArtworks();
      $product = $productsModel->getOneProduct();
      return[
        "artworks"=>$artworks,
        "product"=>$product
      ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {



    }
}
?>
