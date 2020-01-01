<?php

class StreamingController
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
      $artworkModel = new ArtworksModel();
      $search = $_POST['search'];
      // var_dump($search);
      $streamings = $artworkModel->search($search);
      return[
        "streamings"=>$streamings
      ];


    }
}
?>
