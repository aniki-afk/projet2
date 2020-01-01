<?php

class EpisodeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

      $artworkModel = new ArtworksModel();
      $streamings= $artworkModel->getOneEpisode($_GET['status'], $_GET['artworkId']);
      $artworks = $artworkModel->getAllArtworks();
      $episodes = $artworkModel->getAllEpisodesByArtworksId($_GET['artworkId']);
      $status = $streamings['Status'];
      // var_dump($status);
      // var_dump($streamings);
      // var_dump($episodes);
      return[
        'status'=>$status,
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
