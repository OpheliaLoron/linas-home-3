<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\OrderDetails;
use App\Entity\Orders;
use App\Form\OrderType;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session;
use Stripe\PaymentMethod;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderController extends AbstractController
{

    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }


    /**
     * @Route("/commande", name="app_order")
     */
    public function index(Cart $cart, Request $request)
    {
        if (!$this->getUser()->getAdresses()->getValues()) {
            return $this->redirectToRoute('app_account_adress_add');
        }

        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser()
        ]);

        return $this->render('order/index.html.twig', [
            'form' => $form->createView(),
            'cart' => $cart->getFull()
        ]);
    }

    /**
     * @Route("/commande/recapitulatif", name="app_order_recap", methods={"POST"})
     */
    public function add(Cart $cart, Request $request)
    {

        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser()
        ]);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // dd($form->getData());
            $date = new \Datetime();
            $carriers = $form->get('carriers')->getData();
            $delivery = $form->get('adresses')->getData();
            $delivery_content = $delivery->getFirstname() . ' ' . $delivery->getLastname();
            $delivery_content .= '<br/>' . $delivery->getPhone();

            if ($delivery->getCompany()) {
                $delivery_content .= '<br/>' . $delivery->getCompany();
            }

            $delivery_content .= '<br/>' . $delivery->getAdress();
            $delivery_content .= '<br/>' . $delivery->getZipcode() . ' ' . $delivery->getCity();
            $delivery_content .= '<br/>' . $delivery->getCountry();
            // dd($delivery_content);

            // Enregitrer ma commadne Order()
            $order = new Orders();
            $order->setUSer($this->getUser());
            $order->setCreatedAt($date);
            $order->setCarrierName($carriers->getName());
            $order->setCarrierPrice($carriers->getPrice());
            $order->setDelivery($delivery_content);
            $order->setIsPaid(0);

            $this->entityManager->persist($order);

            // Enregistrer mes produits OrderDetails()
            foreach ($cart->getFull() as $product) {
                $orderDetails = new OrderDetails();
                $orderDetails->setMyOrder($order);
                $orderDetails->setProduct($product['product']->getName());
                $orderDetails->setQuantity($product['quantity']);
                $orderDetails->setPrice($product['product']->getPrice());
                $orderDetails->setTotal($product['product']->getPrice() * $product['quantity']);
                $this->entityManager->persist($orderDetails);
                // dd($product);
            }

            $this->entityManager->flush();

        //    Stripe::setApiKey($stripeSecretKey);
           
        //    $YOUR_DOMAIN = 'http://127.0.0.1:8000';

        //    Session::create();
           
        //    $checkout_session = Session::create([
        //     // 'payment_method_types' => ['card'],
        //      'line_items' => [[
        //        # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
        //        'price' => '{{PRICE_ID}}',
        //        'quantity' => 1,
        //      ]],
        //      'mode' => 'payment',
        //      'success_url' => $YOUR_DOMAIN . '/success.html',
        //      'cancel_url' => $YOUR_DOMAIN . '/cancel.html',
        //    ]);

        //    dump($checkout_session->url);
        //    dd($checkout_session);
           
        //    header("HTTP/1.1 303 See Other");
        //    header("Location: " . $checkout_session->url);

            return $this->render('order/add.html.twig', [
                'cart' => $cart->getFull(),
                'carrier' => $carriers,
                'delivery' => $delivery_content
            ]);
        }
        return $this->redirectToRoute('app_cart');
    }
}
