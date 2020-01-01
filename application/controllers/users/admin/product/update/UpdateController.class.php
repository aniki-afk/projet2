<?php

class UpdateController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP GET
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
    	 */
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
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
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
