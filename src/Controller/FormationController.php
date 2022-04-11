<?php

namespace App\Controller;

use App\Entity\Formation;
use App\Entity\Progression;
use App\Repository\FormationRepository;
use App\Repository\ProgressionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class FormationController extends AbstractController
{
    #[Security("is_granted('ROLE_USER')", statusCode: 404)]
    #[Route('/formation/{slug}', name: 'app_detail')]
    public function detail(Formation $forma, ProgressionRepository $progressionRepository): Response
    {
        /** @var User $user */
        $user = $this->getUser();
       
        return $this->render('formation/index.html.twig', [
            'forma' => $forma,
            'progressions' =>$progressionRepository->findOneByUserAndFormation($user, $forma),
        ]);
    }

    #[Security("is_granted('ROLE_USER')", statusCode: 404)]
    #[Route('/formation/progression/{id}', name: 'app_addprogression', methods:  ['GET', 'POST'])]
    public function addProgression(Formation $forma, $id, EntityManagerInterface $entityManager, FormationRepository $formationRepository): Response
    {
        $user = $this->getUser();
        $progression = new Progression();
        $progression->setUser($user);
        $progression->setFormation($formationRepository->find($id));
        $entityManager->persist($progression);
        $entityManager->flush();

        
        return $this->render('formation/index.html.twig',[
            'forma' => $forma,]);
    }

    #[Security("is_granted('ROLE_USER')", statusCode: 404)]
    #[Route('/formation/removeprogression/{id}', name: 'app_removeprogression', methods:  ['GET', 'POST'])]
    public function removeProgression(Formation $forma, Request $request, ProgressionRepository $progressionRepository): Response
    {
        $user = $this->getUser();
        $progression = $progressionRepository->findOneByUserAndFormation($user, $forma); 
        $progressionRepository->remove($progression);
        

        return $this->render('formation/index.html.twig',[
            'forma' => $forma,]);
    }

    #[Route('/', name: 'app_index', methods: ['GET'])]
    public function index(FormationRepository $formationRepository): Response
    {
        
        return $this->render('index/index.html.twig', [
            'formations' => $formationRepository->findLastFormation(), 
            
        ]);
    }
}
