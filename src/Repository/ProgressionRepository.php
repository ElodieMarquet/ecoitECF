<?php

namespace App\Repository;

use App\Entity\Progression;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Progression|null find($id, $lockMode = null, $lockVersion = null)
 * @method Progression|null findOneBy(array $criteria, array $orderBy = null)
 * @method Progression[]    findAll()
 * @method Progression[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProgressionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Progression::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(Progression $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(Progression $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    public function countByProgression()
    {
        $query = $this->createQueryBuilder('p');
        

        return (int) $query->select('count(p.user)')->getQuery()->getSingleScalarResult();
    
       
    }
     /**
      * @return Progression[] Returns an array of Progression objects
      */
    
    public function findByUser($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.user = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->getQuery()
            ->getResult()
        ;
    }
    

    
    public function findOneByUserAndFormation($user, $formation): ?Progression
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.user = :val')
            ->andWhere('p.formation = :forma')
            ->setParameter('val', $user)
            ->setParameter('forma', $formation)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    
}
