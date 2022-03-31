<?php

namespace App\Controller;

use App\Entity\Formation;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class FormationController extends AbstractController
{
    #[Route('/{slug}', name: 'app_detail')]
    public function detail(Formation $forma): Response
    {
        $auteur = $forma->getNomAuteur();
        
        return $this->render('formation/index.html.twig', compact('forma', 'auteur' ));
    }
}
