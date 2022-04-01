<?php

namespace App\Controller;

use App\Entity\Section;
use App\Repository\SectionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CatalogueController extends AbstractController
{
    #[Route('/catalogue', name: 'app_catalogue')]
    public function index(SectionRepository $sectionRepository): Response
    {
        return $this->render('catalogue/index.html.twig', [
            'section' => $sectionRepository->findBy([], ['id' => 'asc'])
        ]);
    }
    
    public function list(Section $customsection): Response
    {
        $formations = $customsection->getFormations();

        return $this->render('catalogue/index.html.twig', compact('customsection', 'formations'));
    }
}
