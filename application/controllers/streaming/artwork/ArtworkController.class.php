<?php

class ArtworkController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $artworks = $artworkModel->getAllArtworks();
      $streamings = $artworkModel->displayEps($_GET['name']);
      return[
        "streamings"=>$streamings,
        "artworks"=>$artworks
      ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {



    }
}
?>
