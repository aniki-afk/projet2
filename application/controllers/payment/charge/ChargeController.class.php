<?php

class ChargeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP GET
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
    	 */
       if(empty($_SESSION) == true) {
         $http->redirectTo('/');
       }


    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
       var_dump($_POST);
       $orders = json_decode($_POST['orders']);
       var_dump($orders);


       $totalAmount = 0;


       $figurineModel = new FigurineModel();

       foreach($orders as $order) {
           $figurine = $figurineModel->getFigurine($order->id);

           $order->safePrice = $figurine['SalePrice'];
           $totalAmount += ($order->safePrice*$order->quantity);
       }

       var_dump($orders);
       var_dump($totalAmount);
       $errorMessage = null;

       try {
         \Stripe\Stripe::setApiKey('sk_test_Dxcqjz8VWJZ0TSbg6ZtyWhx100iMEAz6SA');

         $POST = filter_var_array($_POST, FILTER_SANITIZE_STRING);


         $token = $_POST['stripeToken'];


         $customer = \Stripe\Customer::create(array(
         	"email" => $_SESSION['email'],
         	"source" => $token
         ));

         $charge = \Stripe\Charge::create(array(
         	"amount" => $totalAmount * 100,
         	"currency" => "eur",
         	"description"=>"Commande ok",
         	"customer" => $customer->id
         ));

         $orderModel = new OrderModel();
         // $orderModel->saveOrder($orders, $_SESSION['id'], $totalAmount);

         $number = $orderModel->saveOrder($orders, $_SESSION['id'], $totalAmount);
         $http->redirectTo("/payment/charge/sucess?tid='.$charge->id.'&product='.$charge->decription.'&order='.$number");
       } catch (Exception $error) {
            $errorMessage = "Le paiement a échoué";
            if($error->httpStatus == 402) {
                $errorMessage = "Votre carte a malheureusement été refusé merci de tester une autre carte";
            } else {
                $errorMessage = "le paiement a échoué a malheureusement échoué, merci de tester ultérieurment";
            }

            return ['errorMessage' => $errorMessage];
        }




}
}
