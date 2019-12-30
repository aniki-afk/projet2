<?php

class EpisodeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $streamings= $artworkModel->getOneEpisode($_GET['id']);
      $artworks = $artworkModel->getAllArtworks();

      var_dump($streamings);
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
