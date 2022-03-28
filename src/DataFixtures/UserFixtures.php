<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Faker;


class UserFixtures extends Fixture 
{
    

    public function __construct( private UserPasswordHasherInterface $passwordEncoder)
    {

    }

    public function load(ObjectManager $manager): void
    {
        $admin = new User();
        $admin->setEmail('ecoitgestion@gmail.com');
        $admin->setNom('Dupont');
        $admin->setPrenom('Laure');
        $admin->setPassword(
            $this->passwordEncoder->hashPassword($admin, 'admin')
        );
        $admin->setRoles(['ROLE_ADMIN']);

        $manager->persist($admin);

        $faker = Faker\Factory::create('fr_FR');

        for($usr = 1; $usr <= 5; $usr++){
            $user = new User();
            $user->setEmail($faker->email);
            $user->setNom($faker->lastname);
            $user->setPrenom($faker->firstname);
            $user->setPassword(
                $this->passwordEncoder->hashPassword($user, 'secret')
            );
            $manager->persist($user);
        }

        $faker = Faker\Factory::create('fr_FR');

        for($inst = 1; $inst <= 10; $inst++)
        {
            $NomAuteur = new User();
            $NomAuteur->setEmail($faker->email);
            $NomAuteur->setNom($faker->lastname);
            $NomAuteur->setPrenom($faker->firstname);
            
            $NomAuteur->setPassword(
                $this->passwordEncoder->hashPassword($NomAuteur, 'secret')
            );
            $NomAuteur->setRoles(['ROLE_INSTRUCTEUR']);
            
            $manager->persist($NomAuteur);
            
            $this->addReference('inst-'.$inst, $NomAuteur);
        }

        $manager->flush();
    }

    
}