<?php

namespace App\Form;

use App\Entity\Formation;
use App\Entity\Section;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\File;

class FormationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('image', FileType::class, [
                'label' => 'Image au format jpeg ou png',
                'mapped' =>false,
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
            ->add('description')
            ->add('contenu')
            ->add('video', FileType::class, [
                'label' => 'Video au format mp4',
                'mapped' =>false,
                'required' => true,
                'constraints' => [
                    new File([
                        'mimeTypes' => [
                            'video/mp4'                            
                        ],
                        'mimeTypesMessage' => 'Veuillez télécharcher une video valide'
                    ])
                ],

            ])            
            ->add('slug')
            ->add('section', EntityType::class, [
                'class' => Section::class,
                'allow_extra_fields' => true,
                'label' => 'Section',
                'expanded' =>false ,
                'multiple'=> false,
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
