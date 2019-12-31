<?php

class EpisodeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $streamings= $artworkModel->getOneEpisode($_GET['id']);
      $artworks = $artworkModel->getAllArtworks();
      $episodes = $artworkModel->getAllEpisodesByArtworksId($_GET['artworkId']);

      var_dump($streamings);
      return[
        "episodes"=>$episodes,
        "streamings"=>$streamings,
        "artworks"=>$artworks
      ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {



    }
}
?>
