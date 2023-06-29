<?php

namespace App\Controller;

use App\Entity\Carts;
use App\Entity\Products;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{

    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

   /**
     * @Route("/", name="app_home")
     */
    public function productsHome(): Response
    {
        $productsHome = $this->entityManager->getRepository(Products::class)->findBy([], ['id' => 'ASC'], 6);
        // dd($productsHome);
        return $this->render('home/index.html.twig', [
            'productsHome' => $productsHome
        ]);
    }
}
