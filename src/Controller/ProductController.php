<?php

namespace App\Controller;

use App\Entity\Products;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/product/{id}", name="app_product")
     */
    public function product($id): Response
    {
        // dd($id);
        $product = $this->entityManager->getRepository(Products::class)->findOneById($id);

        if (!$product) {
            return $this->redirectToRoute('app_products');
        }
        return $this->render('product/product.html.twig', [
            'product' => $product
        ]);
    }

    /**
     * @Route("/products", name="app_products")
     */
    public function products(): Response
    {
        $products = $this->entityManager->getRepository(Products::class)->findAll();
        // dd($products);
        return $this->render('product/products.html.twig', [
            'products' => $products
        ]);
    }
}
