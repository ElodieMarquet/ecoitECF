<?php

namespace App\DataFixtures;

use App\Entity\Ressource;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class RessourceFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        $faker = Faker\Factory::create('fr_FR');

        for($img = 1;$img <= 50; $img++){
            $ressource = new Ressource();
            $ressource->setName($faker->image(null, 640, 480));
            $formation = $this->getReference('forma-'.rand(1,10));
            $ressource->setFormation($formation);
            $manager->persist($ressource);
        }
        

        $manager->flush();
    }
    public function getDependencies():array
    {
        return [
            FormationFixtures::class
        ];
    }
}
