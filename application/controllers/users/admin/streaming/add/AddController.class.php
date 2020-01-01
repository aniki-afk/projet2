<?php

class AddController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

       if(empty($_SESSION) == true || $_SESSION['role'] !== "admin" ) {
         $http->redirectTo('/');
       }
       $artworkModel = new ArtworksModel();
       $artworks = $artworkModel->getAllArtworks();


       // var_dump($figurines);
        return [
                 "artworks"=>$artworks
               ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {
       $artworkModel = new ArtworksModel();
       $artworks = $artworkModel->getAllArtworks();
       $artworkModel->addVideo($_POST, $_FILES);

       var_dump($_POST);
       var_dump($_FILES);
       return [
                 "artworks"=>$artworks,
               ];


    }
}
