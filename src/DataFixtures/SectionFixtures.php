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
        $customsection = $this->createCustomsection('HTML et CSS', 1 , $manager);
        $customsection = $this->createCustomsection('PHP', 2 , $manager);
        $customsection = $this->createCustomsection('Symfony', 3 , $manager);
        
        $manager->flush();
    }

    public function createCustomsection(string $name, int $customsectionOder, ObjectManager $manager)
    {
        $customsection = new Section();
        $customsection->setName($name);
        $customsection->setCustomsectionOder($customsectionOder);
        $manager->persist($customsection);

        $this->addReference('sect-'.$this->counter, $customsection);
        $this->counter++;

        return $customsection;

    }
    
}
