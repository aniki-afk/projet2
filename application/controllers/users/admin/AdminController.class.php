<?php
class AdminController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
      if(empty($_SESSION) == true || $_SESSION['role'] !== "admin" ) {
          $http->redirectTo('/');
      }


       $userModel = new UserModel();

       $users = $userModel->getAllUsers();
       $artworkModel = new ArtworksModel();
       $artworks = $artworkModel->getAllArtworks();


       return [
         "artworks"=>$artworks,
         'users'=>$users
       ];


    }

    public function httpPostMethod(Http $http, array $formFields)
    {


    }
}
