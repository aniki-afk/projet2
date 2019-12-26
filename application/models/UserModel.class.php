<?php
class UserModel {
  public function addUser($post)
  {
    $database = new Database();
    $hashPassword = $this->hashPassword($post['password']);
    $user = $database->queryOne
    (
      "SELECT Id FROM users WHERE Email = ?", [ $post['email'] ]
    );
    if($user !== false) {
      return 'Email déja existant !';
    } else {
      $database->executeSql
      (
        'INSERT INTO users(FirstName, LastName, Email, Pseudo ,Role, Password, Address, City, Zip, CreationTimestamp)
        VALUES (?, ?, ?, ?, "user", ?, ?, ?, ?, NOW())',[
          $post['firstname'],
          $post['lastname'],
          $post['email'],
          $post['pseudo'],
          $hashPassword,
          $post['address'],
          $post['city'],
          $post['zip']]
        );
        $http = new Http();
        $http->redirectTo('/users/login');
        return null;
      }
    }

    private function verifyPassword($post, $hashPassword){
      return crypt($post, $hashPassword) == $hashPassword;
    }

    private function hashPassword($post){

      $salt = '$2y$11$'.substr(bin2hex(openssl_random_pseudo_bytes(32)), 0, 22);

      return crypt($post, $salt);
    }

    public function logUser($post)
    {
      $database = new Database();

      $login = $database->queryOne
      (
        'SELECT *
        FROM users
        WHERE Email = ? || Pseudo = ?',
        [
        $post['email'], $post['email']]
        );

        if ($login === false) {
          return "Addresse mail ou pseudo introuvable";
        } else {
          if( $login !== false && $this->verifyPassword($post['password'], $login['Password']) == true ) {
            $_SESSION['id'] = $login['Id'];
            $_SESSION['email'] = $login['Email'];
            $_SESSION['pseudo'] = $login['Pseudo'];
            $_SESSION['firstName'] = $login['FirstName'];
            $_SESSION['lastName'] = $login['LastName'];
            $_SESSION['role'] = $login['Role'];
            $_SESSION['address'] = $login['Address'];
            $_SESSION['city'] = $login['City'];
            $_SESSION['zip'] = $login['Zip'];
            return null;
          }
          else{
            return "Mot de passe introuvable";
          }
        }

      }

    }
?>
