<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Products;

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
        return $this->render('cart/index.html.twig', [
            'cart' => $cart->getFull()
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
     * @Route("/cart/delete/{id}", name="delete_to_cart")
     */
    public function delete(Cart $cart, $id)
    {
        $cart->delete($id);
        return $this->redirectToRoute('app_cart');
    }

    /**
     * @Route("/cart/decrease/{id}", name="decrease_to_cart")
     */
    public function decrease(Cart $cart, $id)
    {
        $cart->decrease($id);
        return $this->redirectToRoute('app_cart');
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
