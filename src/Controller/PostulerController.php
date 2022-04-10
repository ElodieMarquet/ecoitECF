<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\PostulerType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class PostulerController extends AbstractController
{
    #[Route('/postuler', name: 'postuler')]
    public function index(Request $request, MailerInterface $mailer): Response
    {
        $form=$this->createForm(PostulerType::class);
        $form->handleRequest($request);

        if( $form->isSubmitted() && $form->isValid()) {

            $contactFormData = $form->getData();

            $message = (new Email())
                ->from($contactFormData['email'])
                ->to('ecoitgestion@gmail.com')
                ->subject('vous avez reçu une candidature')
                ->text('Sender :'.$contactFormData['email'].\PHP_EOL.$contactFormData['nom'].' '.$contactFormData['prenom'].\PHP_EOL.$contactFormData['message'],'text/plain');

            $mailer->send($message);

            $this->addFlash('success', 'Votre message a été envoyé');
            
            return $this->redirectToRoute('app_index');
        }
        return $this->render('postuler/postuler.html.twig', [
            'form'=> $form->createView()
        ]);
    }
    
}
