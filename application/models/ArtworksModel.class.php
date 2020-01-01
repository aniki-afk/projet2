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
      $sql = 'SELECT artworks.Id, artworks.Image, Image_Cover, Url, Name
      FROM artworks
      WHERE Name LIKE "%"?"%" || Url LIKE "%"?"%"
      ORDER BY Name';
      return $database->query($sql, [$post, $post]);
    }

    public function displayEps($get)
    {
      $database = new Database();
      $sql = 'SELECT streaming.Id, Caption, Status,
      artworks.Id AS ArtworkId, artworks.Image, Image_Cover, Url
      FROM streaming
      INNER JOIN artworks ON artworks.Id = streaming.Artworks_Id
      WHERE Url LIKE "%"?"%"
      ORDER BY Caption';
      return $database->query($sql, [$get]);
    }


    public function getAllEpisodes()
    {
      $database = new Database();
      $sql = 'SELECT streaming.Id, Artworks_Id, Caption, Description, Video, CreationTimestamp,
      artworks.Id AS ArtworkId, artworks.Image, Image_Cover, Url
      FROM streaming
      INNER JOIN artworks ON artworks.Id = streaming.Artworks_Id';
      return $database->query($sql, []);
    }

    public function getAllEpisodesByArtworksId($id)
    {
      $database = new Database();
      $sql = 'SELECT streaming.Id, Status, Artworks_Id, Caption, Video, CreationTimestamp,
      artworks.Id AS ArtworkId, artworks.Image, Image_Cover, Url
      FROM streaming
      INNER JOIN artworks ON artworks.Id = streaming.Artworks_Id
      WHERE Artworks_Id = ?
      ORDER BY Caption';
      return $database->query($sql, [$id]);
    }

    public function getOneEpisode($status, $art)
    {
      $database = new Database();
      $sql = 'SELECT streaming.Id, Status, Artworks_Id, Caption, Description, Video, CreationTimestamp,
      artworks.Id AS ArtworkId, artworks.Image, Image_Cover, Url
      FROM streaming
      INNER JOIN artworks ON artworks.Id = streaming.Artworks_Id
      WHERE Status = ? && artworks.Id = ?';
      return $database->queryOne($sql, [$status, $art]);
    }

    public function updateVideo($post, $files)
    {
      $database = new Database();
      if (empty($files["vid_pics"]["name"])) {
        $database->executeSql('UPDATE streaming
        SET Artworks_Id = ?, Caption = ?, Status = ?, Description = ?
        WHERE Id = ?', [
        $post['artworksId'],
        $post["caption"],
        $post["status"],
        $post["description"],
        $post['vidId']]
        );
      } else {
        $database->executeSql('UPDATE products
          SET Artworks_Id = ?, Caption = ?, Status = ?, Description = ?, Video
          WHERE Id = ?', [
          $post['artworksId'],
          $post["caption"],
          $post["status"],
          $post["description"],
          $file["product_pics"]["name"],
          $post['vidId']]
        );
      }
      $http = new HTTP();
      $http->moveUploadedFile("vid_pics", "../../../streaming_vids");
      $http->redirectTo("/users/admin");
    }

    public function addVideo($post, $file)
    {
      $database = new Database();
      $database->executeSql("INSERT INTO streaming (Caption, Video, Artworks_Id,  Description, Status, CreationTimestamp)
      VALUES (?, ?, ?, ?, ?, NOW())", [
        $post["caption"],
        $file["vid_pics"]["name"],
        $post['artworksId'],
        $post["description"],
        $post['status']
      ]);
      $http = new HTTP();
      $http->moveUploadedFile("vid_pics", "../../../streaming_vids");
      $http->redirectTo("/users/admin");
      exit();
    }

    public function suppVideo($id)
    {
      $database = new Database();
      $database->executeSql('DELETE FROM streaming WHERE Id = ?',
      [$id]);
    }



  }
  ?>
