<?php

namespace App\Form;

use App\Entity\Formation;
use App\Entity\Ressource;
use App\Entity\Section;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\File;

class FormationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class)
            ->add('image', FileType::class, array('data_class' => null), [
                'label' => 'Image au format jpeg ou png',
                'mapped' =>true,
                'required' => true,
                'constraints' => [
                    new File([
                        'maxSize' => '1024k',
                        'mimeTypes' => [
                            'image/jpeg',
                            'image/png',
                        ],
                        'mimeTypesMessage' => 'Veuillez télécharcher une image valide'
                    ])
                ],

            ])
            ->add('description', TextType::class)
            ->add('contenu', TextareaType::class)
            ->add('video', TextType::class, [
                'label' => 'lien video',
                            
            ])            
            ->add('section', EntityType::class, [
                'class' => Section::class,
                'allow_extra_fields' => true,
                'label' => 'Section',
                'expanded' =>false ,
                'multiple'=> false,
            ])
            ->add('ressources', TextType::class, [
                'mapped' => false,
                'required' => false
            ])

        ;
    }
    
    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Formation::class,
        ]);
    }
    
}
