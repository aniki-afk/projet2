<?php
class ArtworksModel {
  public function addArtwork($post)
  {
    $database = new Database();
    $database->executeSql
    (
      'INSERT INTO artworks(Name)
      VALUES (?)',
        $post['name']
      );
      $http = new Http();
      $http->redirectTo('/users/admin');
    }


    public function getAllArtworks() {
      $database = new Database();

      $sql = 'SELECT *
      FROM artworks
      ORDER BY Name';
      // var_dump($database);
      return $database->query($sql, []);

    }

    public function getOneArtwork($get) {
      $database = new Database();
      $sql = 'SELECT *
      FROM artworks
      WHERE Id = ?';
      // var_dump($database);
      return $database->queryOne($sql, [$get]);
    }

    public function search($post)
    {
      $database = new Database();
      $sql = 'SELECT streaming.Id, Caption,
      artworks.Id AS ArtworkId, artworks.Image, Image_Cover, Url
      FROM streaming
      INNER JOIN artworks ON artworks.Id = streaming.Artworks_Id
      WHERE Url LIKE "%"?"%"
      ORDER BY Caption';
      return $database->query($sql, [$post]);
    }


    public function getAllEpisodes()
    {
      $database = new Database();
      $sql = 'SELECT streaming.Id, Artworks_Id, Caption, Video, CreationTimestamp,
      artworks.Id AS ArtworkId, artworks.Image, Image_Cover, Url
      FROM streaming
      INNER JOIN artworks ON artworks.Id = streaming.Artworks_Id';
      return $database->query($sql, [$id]);
    }

    public function getAllEpisodesByArtworksId($id)
    {
      $database = new Database();
      $sql = 'SELECT streaming.Id, Artworks_Id, Caption, Video, CreationTimestamp,
      artworks.Id AS ArtworkId, artworks.Image, Image_Cover, Url
      FROM streaming
      INNER JOIN artworks ON artworks.Id = streaming.Artworks_Id
      WHERE Artworks_Id = ?';
      return $database->query($sql, [$id]);
    }

    public function getOneEpisode($id)
    {
      $database = new Database();
      $sql = 'SELECT streaming.Id, Caption, Video, CreationTimestamp,
      artworks.Id AS ArtworkId, artworks.Image, Image_Cover, Url
      FROM streaming
      INNER JOIN artworks ON artworks.Id = streaming.Artworks_Id
      WHERE streaming.Id = ?';
      return $database->queryOne($sql, [$id]);
    }





  }
  ?>
