<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220329104430 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE section DROP FOREIGN KEY FK_2D737AEF727ACA70');
        $this->addSql('DROP INDEX UNIQ_2D737AEF727ACA70 ON section');
        $this->addSql('ALTER TABLE section DROP parent_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE section ADD parent_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE section ADD CONSTRAINT FK_2D737AEF727ACA70 FOREIGN KEY (parent_id) REFERENCES section (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_2D737AEF727ACA70 ON section (parent_id)');
    }
}
