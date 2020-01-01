<?php

class UpdateController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

       if(empty($_SESSION) == true || $_SESSION['role'] !== "admin" ) {
         $http->redirectTo('/');
       }
       $artworkModel = new ArtworksModel();
       $streaming = $artworkModel->getOneEpisode($_GET['streamingId'], $_GET['artworkId']);
       $artworks = $artworkModel->getAllArtworks();


       // var_dump($figurines);
        return [
                 "streaming"=>$streaming,
                 "artworks"=>$artworks
               ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {
       $artworkModel = new ArtworksModel();
       $artworks = $artworkModel->getAllArtworks();
       $streaming = $artworkModel->getOneEpisode($_POST['vidId'], $_POST['artworkId']);
       $artworkModel->updateVideo($_POST, $_FILES);
       return [
                 '$streaming'=>$streaming,
                 "artworks"=>$artworks,
               ];


    }
}
