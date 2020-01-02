<?php

class UpdateController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

       if(empty($_SESSION) == true || $_SESSION['role'] !== "admin" ) {
         $http->redirectTo('/');
       }
       $artworkModel = new ArtworksModel();
       $oeuvre = $artworkModel->getOneArtwork($_GET['artworkId']);
       $artworks = $artworkModel->getAllArtworks();


       // var_dump($figurines);
        return [
                 "oeuvre"=>$oeuvre,
                 "artworks"=>$artworks
               ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {
       $artworkModel = new ArtworksModel();
       $artworks = $artworkModel->getAllArtworks();
       $oeuvre = $artworkModel->getOneArtwork($_POST['artworkId']);
       $artworkModel->updateArtwork($_POST, $_FILES);
       // var_dump($_POST);
       // var_dump($_FILES);
       return [
                 "oeuvre"=>$oeuvre,
                 "artworks"=>$artworks,
               ];


    }
}
