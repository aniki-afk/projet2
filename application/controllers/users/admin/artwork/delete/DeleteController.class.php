<?php
class DeleteController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
      if(empty($_SESSION) == true || $_SESSION['role'] !== "admin" ) {
          $http->redirectTo('/');
      }

       $artworkModel = new ArtworksModel();

       $artworkModel->suppArtwork($_GET['artworkId']);
       $http->redirectTo("/users/admin");


    }

    public function httpPostMethod(Http $http, array $formFields)
    {


    }
}
