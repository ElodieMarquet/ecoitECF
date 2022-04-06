<?php

namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MoncompteController extends AbstractController
{
    #[Route('/moncompte', name: 'app_moncompte')]
    public function details(): Response
    {
        return $this->render('moncompte/index.html.twig');
    }
}
