<?php

namespace App\DataFixtures;

use App\Entity\Section;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;


class SectionFixtures extends Fixture 
{
    private $counter = 1;

    public function load(ObjectManager $manager): void
    {
        $customsection = $this->createCustomsection('HTML et CSS', null, $manager);
        $customsection = $this->createCustomsection('PHP', null, $manager);
        $customsection = $this->createCustomsection('Symfony', null, $manager);
        
        $manager->flush();
    }

    public function createCustomsection(string $name, Section $parent = null, ObjectManager $manager)
    {
        $customsection = new Section();
        $customsection->setName($name);
        $customsection->setParent($parent);
        $manager->persist($customsection);

        $this->addReference('sect-'.$this->counter, $customsection);
        $this->counter++;

        return $customsection;

    }
    
}
