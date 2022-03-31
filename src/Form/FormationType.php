<?php

namespace App\Form;

use App\Entity\Formation;
use App\Entity\Section;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class FormationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('image')
            ->add('description')
            ->add('contenu')
            ->add('video')            
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
