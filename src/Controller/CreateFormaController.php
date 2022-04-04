<?php

namespace App\Controller;

use App\Entity\Formation;
use App\Form\FormationType;
use App\Repository\FormationRepository;
use Gedmo\Sluggable\Util\Urlizer;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


#[Route('/create/forma')]
class CreateFormaController extends AbstractController
{
    #[Route('/', name: 'app_create_forma_index', methods: ['GET'])]
    public function index(FormationRepository $formationRepository): Response
    {
        return $this->render('create_forma/index.html.twig', [
            'formations' => $formationRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_create_forma_new', methods: ['GET', 'POST'])]
    public function new(Request $request, FormationRepository $formationRepository): Response
    {
        $formation = new Formation();
        $form = $this->createForm(FormationType::class, $formation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $formation->setNomAuteur($this->getUser());
            $formationRepository->add($formation);
            $imagefile = $form['image']->getData();
            $videofile = $form['video']->getData();

                if ($imagefile) {

                    /** @var UploadedFile $uploadedFile */
                    $destination = $this->getParameter('kernel.project_dir').'/public/upload/images';
                    $originalFilename = pathinfo ($imagefile->getClientOriginalName(), PATHINFO_FILENAME);                    
                    $newFilename = Urlizer::urlize($originalFilename).'-'.uniqid().'.'.$imagefile->guessExtension();
                    $uploadedFile->move(
                        $destination,
                        $newFilename,

                    );

                    try {
                        $imagefile->move(
                            $this->getParameter('images_directory'),
                            $newFilename
                        );
                    } catch (FileException $e) {
                        //;
                    }

                    
                    $formation->setImage($newFilename);
                }

                if ($videofile) {

                    /** @var UploadedFile $uploadedFile */
                    $destination = $this->getParameter('kernel.project_dir').'/public/upload/videos';
                    $originalFilename = pathinfo ($videofile->getClientOriginalName(), PATHINFO_FILENAME);                    
                    $newFilename = Urlizer::urlize($originalFilename).'-'.uniqid().'.'.$videofile->guessExtension();
                    $uploadedFile->move(
                        $destination,
                        $newFilename,

                    );

                    try {
                        $videofile->move(
                            $this->getParameter('videos_directory'),
                            $newFilename
                        );
                    } catch (FileException $e) {
                        //;
                    }

                    $formation->setVideo($newFilename);

                }
            return $this->redirectToRoute('app_create_forma_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('create_forma/new.html.twig', [
            'formation' => $formation,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_create_forma_show', methods: ['GET'])]
    public function show(Formation $formation): Response
    {
        return $this->render('create_forma/show.html.twig', [
            'formation' => $formation,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_create_forma_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Formation $formation, FormationRepository $formationRepository): Response
    {
        $form = $this->createForm(FormationType::class, $formation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $formationRepository->add($formation);
            return $this->redirectToRoute('app_create_forma_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('create_forma/edit.html.twig', [
            'formation' => $formation,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_create_forma_delete', methods: ['POST'])]
    public function delete(Request $request, Formation $formation, FormationRepository $formationRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$formation->getId(), $request->request->get('_token'))) {
            $formationRepository->remove($formation);
        }

        return $this->redirectToRoute('app_create_forma_index', [], Response::HTTP_SEE_OTHER);
    }
}
