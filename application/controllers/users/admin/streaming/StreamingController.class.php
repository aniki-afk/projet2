<?php

class StreamingController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $artworks = $artworkModel->getAllArtworks();
      $streamings = $artworkModel->getAllEpisodes();
      // var_dump($streamings);
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
