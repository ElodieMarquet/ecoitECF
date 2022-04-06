<?php

namespace App\Controller;

use App\Entity\Formation;
use App\Entity\Progression;
use App\Repository\FormationRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class FormationController extends AbstractController
{
    #[Security("is_granted('ROLE_USER')", statusCode: 404)]
    #[Route('/formation/{slug}', name: 'app_detail')]
    public function detail(Formation $forma): Response
    {
        $auteur = $forma->getNomAuteur();
        
        return $this->render('formation/index.html.twig', compact('forma', 'auteur' ));
    }

    #[Security("is_granted('ROLE_USER')", statusCode: 404)]
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

    #[Route('/accueil', name: 'app_index', methods: ['GET'])]
    public function index(FormationRepository $formationRepository): Response
    {
        
        return $this->render('index/index.html.twig', [
            'formations' => $formationRepository->findLastFormation(), 
            
        ]);
    }
}
