<?php

namespace App\Controller;

use App\Entity\Formation;
use App\Entity\Progression;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class FormationController extends AbstractController
{
    #[Route('/formation/{slug}', name: 'app_detail')]
    public function detail(Formation $forma): Response
    {
        $auteur = $forma->getNomAuteur();
        
        return $this->render('formation/index.html.twig', compact('forma', 'auteur' ));
    }

    #[Route('/formation/{slug}', name: 'app_addprogression', methods:  ['GET', 'POST'])]
    public function addProgression(Formation $forma, EntityManagerInterface $entityManager): Response
    {
        $user = $this->getUser();
        $progression = new Progression();
        $progression->setUser($user);
        $progression->setFormation($forma);
        $entityManager->persist($progression);
        $entityManager->flush();

        
        return $this->render('formation/index.html.twig');
    }
}
