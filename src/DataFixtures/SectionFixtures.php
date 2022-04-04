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
        $customsection = $this->createCustomsection('HTML et CSS', $manager);
        $customsection = $this->createCustomsection('PHP', $manager);
        $customsection = $this->createCustomsection('Symfony', $manager);
        
        $manager->flush();
    }

    public function createCustomsection(string $name, ObjectManager $manager)
    {
        $customsection = new Section();
        $customsection->setName($name);        
        $manager->persist($customsection);

        $this->addReference('sect-'.$this->counter, $customsection);
        $this->counter++;

        return $customsection;

    }
    
}
