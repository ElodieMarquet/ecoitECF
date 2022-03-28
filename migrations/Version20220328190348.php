<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220328190348 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE formation ADD nom_auteur_id INT NOT NULL');
        $this->addSql('ALTER TABLE formation ADD CONSTRAINT FK_404021BFF44A1EA7 FOREIGN KEY (nom_auteur_id) REFERENCES `user` (id)');
        $this->addSql('CREATE INDEX IDX_404021BFF44A1EA7 ON formation (nom_auteur_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE formation DROP FOREIGN KEY FK_404021BFF44A1EA7');
        $this->addSql('DROP INDEX IDX_404021BFF44A1EA7 ON formation');
        $this->addSql('ALTER TABLE formation DROP nom_auteur_id');
    }
}
