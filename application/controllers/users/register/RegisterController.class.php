<?php
class RegisterController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

       $error = null;
       $artworkModel = new ArtworksModel();
       $artworks = $artworkModel->getAllArtworks();
       return [
         'error'=>$error,
         "artworks"=>$artworks
       ];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {
       $userModel = new UserModel();
       $artworkModel = new ArtworksModel();
       $artworks = $artworkModel->getAllArtworks();

       $error = $userModel->addUser($_POST);
       if (array_key_exists('role', $_SESSION) === false) {
         return [
           'error'=>$error,
           "artworks"=>$artworks
         ];
       }


    }
}
