<?php

namespace App\Controller;


use App\Form\SearchFormationType;
use App\Repository\FormationRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CatalogueController extends AbstractController
{
    #[Route('/catalogue', name: 'app_catalogue')]
    public function index(FormationRepository $formationRepository, Request $request): Response
    {
        $forma = $formationRepository->findBy([], ['section' => 'asc']);

        $form = $this->createForm(SearchFormationType::class);

        $search = $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $forma= $formationRepository->search(
                $search->get('mots')->getData(),
                $search->get('section')->getData()
            );
        }
        
        return $this->render('catalogue/index.html.twig', [
            'formations' => $forma,
            'form' => $form->createView()
        ]);
    }
    
    
    
}
