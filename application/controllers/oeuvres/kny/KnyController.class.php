<?php

class KnyController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
      $artworkModel = new ArtworksModel();
      $artworks = $artworkModel->getAllArtworks();
      return[
        "artworks"=>$artworks
      ];


    }

    public function httpPostMethod(Http $http, array $formFields)
    {



    }
}
?>
