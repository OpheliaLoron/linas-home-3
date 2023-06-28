<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Products;
use App\Entity\OrderItems;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Monolog\Handler\SyslogUdp\UdpSocket;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/mon_panier", name="app_cart")
     */
    public function index(Cart $cart)
    {
        $cartComplete = [];

        foreach ($cart->get() as $id => $quantity) {
            $cartComplete[] = [
                'product' => $this->entityManager->getRepository(Products::class)->findOneById($id),
                'quantity' => $quantity
            ];
        }
        
        return $this->render('cart/index.html.twig', [
            'cart' => $cartComplete
        ]);
    }

    /**
     * @Route("/cart/add/{id}", name="add_to_cart")
     */
    public function add(Cart $cart, $id)
    {
        $cart->add($id);
        return $this->redirectToRoute('app_cart');
    }

    /**
     * @Route("/cart/remove", name="remove_my_cart")
     */
    public function remove(Cart $cart)
    {
        $cart->remove();
        return $this->redirectToRoute('app_products');
    }





















    // public function addToCart(Products $product): Response // Utilisez la classe Products pour l'argument
    // {
    //     $cart = $this->getUser()->getShoppingCart(); // Récupérer le panier de l'utilisateur (supposons que vous avez un système d'authentification)

    //     // Ajouter le produit au panier
    //     $cart->addProduct($product);

    //     // Enregistrer les modifications dans la base de données
    //     $entityManager = $this->getDoctrine()->getManager();
    //     $entityManager->persist($cart);
    //     $entityManager->flush();

    //     // Rediriger vers une autre page ou retourner une réponse appropriée
    //     // ...

    //     return new Response('Produit ajouté au panier !');
    // }

}
