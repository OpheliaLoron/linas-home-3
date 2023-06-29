<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class AccountController extends AbstractController
{
    /**
     * @Route("/account", name="app_account")
     */
    public function index(): Response
    {
        $user = $this->getUser();
        if ($user) {
            return $this->render('account/account.html.twig', []);
        } else {
            return $this->redirectToRoute('app_login');
        }
    }

    /**
     * @Route("/logout", name="app_logout")
     */
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }

    /**
     * @Route("/compte", name="account")
     */
    public function account(Security $security): Response
    {
        $user = $security->getUser();
        $roles = $user ? $user->getRole() : [];

        return $this->render('account.html.twig', [
            'role' => $role,
        ]);
    }
}
