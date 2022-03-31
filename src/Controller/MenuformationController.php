<?php

namespace App\Controller;

use App\Entity\Section;
use App\Entity\Formation;
use App\Repository\SectionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MenuformationController extends AbstractController
{
    #[Route('/menuformation', name: 'app_menuformation')]
    public function index(SectionRepository $sectionRepository): Response
    {
        return $this->render('menuformation.html.twig', [
            'section' => $sectionRepository->findBy([], ['customsectionOder' => 'asc'])
        ]);
    }
    
    public function list(Section $customsection): Response
    {
        $formations = $customsection->getFormations();

        return $this->render('menuformation.html.twig', compact('customsection', 'formations'));
    }
}
