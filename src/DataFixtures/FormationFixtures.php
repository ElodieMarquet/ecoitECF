<?php

namespace App\DataFixtures;

use App\Entity\Formation;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\String\Slugger\SluggerInterface;
use Faker;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class FormationFixtures extends Fixture implements DependentFixtureInterface
{
    public function __construct(private SluggerInterface $slugger){}

    public function load(ObjectManager $manager): void
    {
        $faker = Faker\Factory::create('fr_FR');

        for($forma = 1; $forma <= 10; $forma++){
            $formation = new Formation();
            $formation->setName($faker->text(15));
            $formation->setImage($faker->image(null, 640, 480));
            $formation->setDescription($faker->text(120));
            $formation->setSlug($this->slugger->slug($formation->getName())->lower());
            $formation->setContenu($faker->paragraph(10));
            $formation->setVideo($faker->image(null, 640, 480));
                       
            $this->setReference('forma-'.$forma, $formation);
            $customsection = $this->getReference('sect-'.rand(1, 3));
            $formation->setSection($customsection);

            
            $formation->setNomAuteur($this->getReference('inst-'.$forma));
           
            $manager->persist($formation);

        }
        $manager->flush();
    }
    public function getDependencies():array
    {
        return [
            SectionFixtures::class,
            UserFixtures::class
        ];
    }
}
