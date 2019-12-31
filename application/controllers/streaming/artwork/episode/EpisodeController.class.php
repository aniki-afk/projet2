<?php

class EpisodeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $streamings= $artworkModel->getOneEpisode($_GET['id'], $_GET['artworkId']);
      $artworks = $artworkModel->getAllArtworks();
      $episodes = $artworkModel->getAllEpisodesByArtworksId($_GET['artworkId']);

      var_dump($streamings);
      var_dump($episodes);
      return[
        "streamings"=>$streamings,
        "artworks"=>$artworks,
        "episodes"=>$episodes
      ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {



    }
}
?>
