<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220413090838 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE formation CHANGE name name VARCHAR(191) NOT NULL, CHANGE image image VARCHAR(191) NOT NULL, CHANGE video video VARCHAR(191) NOT NULL, CHANGE slug slug VARCHAR(191) NOT NULL');
        $this->addSql('ALTER TABLE ressource CHANGE name name VARCHAR(191) NOT NULL');
        $this->addSql('ALTER TABLE section CHANGE name name VARCHAR(191) NOT NULL');
        $this->addSql('ALTER TABLE user CHANGE prenom prenom VARCHAR(191) DEFAULT NULL, CHANGE nom nom VARCHAR(191) NOT NULL, CHANGE photo photo VARCHAR(191) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE formation CHANGE name name VARCHAR(255) NOT NULL, CHANGE image image VARCHAR(255) NOT NULL, CHANGE video video VARCHAR(255) NOT NULL, CHANGE slug slug VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE ressource CHANGE name name VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE section CHANGE name name VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE `user` CHANGE prenom prenom VARCHAR(255) DEFAULT NULL, CHANGE nom nom VARCHAR(255) NOT NULL, CHANGE photo photo VARCHAR(255) DEFAULT NULL');
    }
}
