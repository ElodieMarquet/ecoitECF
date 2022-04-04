<?php

namespace App\Controller;

use App\Entity\Progression;
use App\Form\ProgressionType;
use App\Repository\ProgressionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/progression')]
class ProgressionController extends AbstractController
{
    #[Route('/', name: 'app_progression_index', methods: ['GET'])]
    public function index(ProgressionRepository $progressionRepository): Response
    {
        return $this->render('progression/index.html.twig', [
            'progressions' => $progressionRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_progression_new', methods: ['GET', 'POST'])]
    public function new(Request $request, ProgressionRepository $progressionRepository): Response
    {
        $progression = new Progression();
        $form = $this->createForm(ProgressionType::class, $progression);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $progressionRepository->add($progression);
            return $this->redirectToRoute('app_progression_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('progression/new.html.twig', [
            'progression' => $progression,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_progression_show', methods: ['GET'])]
    public function show(Progression $progression): Response
    {
        return $this->render('progression/show.html.twig', [
            'progression' => $progression,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_progression_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Progression $progression, ProgressionRepository $progressionRepository): Response
    {
        $form = $this->createForm(ProgressionType::class, $progression);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $progressionRepository->add($progression);
            return $this->redirectToRoute('app_progression_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('progression/edit.html.twig', [
            'progression' => $progression,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_progression_delete', methods: ['POST'])]
    public function delete(Request $request, Progression $progression, ProgressionRepository $progressionRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$progression->getId(), $request->request->get('_token'))) {
            $progressionRepository->remove($progression);
        }

        return $this->redirectToRoute('app_progression_index', [], Response::HTTP_SEE_OTHER);
    }
}
