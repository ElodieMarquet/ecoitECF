<?php

namespace App\Controller;

use App\Entity\Formation;
use App\Repository\FormationRepository;
use App\Repository\ProgressionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MoncompteController extends AbstractController
{
    #[Route('/moncompte', name: 'app_moncompte')]
    public function details(FormationRepository $formationRepository, ProgressionRepository $progressionRepository): Response
    {
        /** @var User $user */
        $user = $this->getUser();
        return $this->render('moncompte/index.html.twig', [
            'formations' => $formationRepository->countByFormation(),
            'progressions' =>$progressionRepository->findByUser($user->getId()), 
            
        ]);
        
    }

    
}
