<?php

namespace App\Controller;

use App\Entity\OrderItems;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ShoppingCartController extends AbstractController
{
    /**
     * @Route("/shopping_cart", name="app_shopping_cart")
     */
    public function index(): Response
    {
        return $this->render('shopping_cart/index.html.twig', [
            'controller_name' => 'ShoppingCartController',
        ]);
    }
    public function addToCart(Request $request): Response
    {
        // Récupérer les données du produit et de la quantité depuis la requête
        $productId = $request->request->get('product_id');
        $quantity = $request->request->get('quantity');

        // Récupérer l'utilisateur actuellement connecté (ou autrement selon votre logique d'authentification)
        $user = $this->getUser();

        // Récupérer le produit à partir de l'ID
        $product = $this->getDoctrine()->getRepository(Products::class)->find($productId);

        // Créer un nouvel élément de panier
        $cartItem = new OrderItems();
        $cartItem->setUser($user);
        $cartItem->setProduct($product);
        $cartItem->setQuantity($quantity);

        // Enregistrer l'élément de panier dans la base de données
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($cartItem);
        $entityManager->flush();

        // Rediriger vers une autre page ou renvoyer une réponse appropriée
        return $this->redirectToRoute('cart_view');
    }

    public function removeFromCart(Request $request): Response
    {
        // Récupérer l'ID de l'élément de panier à supprimer depuis la requête
        $cartItemId = $request->request->get('cart_item_id');

        // Récupérer l'élément de panier à partir de l'ID
        $cartItem = $this->getDoctrine()->getRepository(OrderItems::class)->find($cartItemId);

        // Vérifier si l'élément de panier existe
        if ($cartItem) {
            // Supprimer l'élément de panier de la base de données
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($cartItem);
            $entityManager->flush();
        }

        // Rediriger vers une autre page ou renvoyer une réponse appropriée
        return $this->redirectToRoute('cart_view');
    }

    // Autres actions du panier (mise à jour de la quantité, affichage du panier, etc.)
}


