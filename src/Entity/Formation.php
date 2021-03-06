<?php

namespace App\Entity;

use App\Repository\FormationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;


    

#[ORM\Entity(repositoryClass: FormationRepository::class)]
#[ORM\Table(name: "formation")]
#[ORM\Index(
    columns:["name","description"],
    name:"search_idx",
    flags:["fulltext"]
)]

class Formation
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 191)]
    private $name;

    #[ORM\Column(type: 'string', length: 191)]
    private $image;

    #[ORM\Column(type: 'string', length: 140)]
    private $description;

    #[ORM\Column(type: 'text')]
    private $contenu;

    #[ORM\Column(type: 'string', length: 191)]
    private $video;

    #[ORM\Column(type: 'datetime_immutable', options: ['default' =>'CURRENT_TIMESTAMP'])]
    private $created_at;

    #[ORM\ManyToOne(targetEntity: Section::class, inversedBy: 'formations')]
    #[ORM\JoinColumn(nullable: false)]
    private $section;

    #[ORM\OneToMany(mappedBy: 'formation', targetEntity: Ressource::class, cascade: ['persist', 'remove'], orphanRemoval: true)]
    private $ressources;

    #[ORM\Column(type: 'string', length: 191, unique : true)]
    #[Gedmo\Slug(fields: ['name'])]    
    private $slug;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'formations')]
    #[ORM\JoinColumn(nullable: false)]
    private $NomAuteur;

    #[ORM\OneToMany(mappedBy: 'formation', targetEntity: Progression::class, orphanRemoval: true)]
    private $progressions;

    public function getSlug(): ?string
    {
        return $this->slug;
    }
 

    public function __construct()
    {
        $this->ressources = new ArrayCollection();
        $this->created_at = new \DateTimeImmutable();
        $this->progressions = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getContenu(): ?string
    {
        return $this->contenu;
    }

    public function setContenu(string $contenu): self
    {
        $this->contenu = $contenu;

        return $this;
    }

    public function getVideo(): ?string
    {
        return $this->video;
    }

    public function setVideo(string $video): self
    {
        $this->video = $video;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getSection(): ?Section
    {
        return $this->section;
    }

    public function setSection(?Section $section): self
    {
        $this->section = $section;

        return $this;
    }

    /**
     * @return Collection<int, Ressource>
     */
    public function getRessources(): Collection
    {
        return $this->ressources;
    }

    public function addRessource(Ressource $ressource): self
    {
        if (!$this->ressources->contains($ressource)) {
            $this->ressources[] = $ressource;
            $ressource->setFormation($this);
        }

        return $this;
    }

    public function removeRessource(Ressource $ressource): self
    {
        if ($this->ressources->removeElement($ressource)) {
            // set the owning side to null (unless already changed)
            if ($ressource->getFormation() === $this) {
                $ressource->setFormation(null);
            }
        }

        return $this;
    }

    public function getNomAuteur(): ?User
    {
        return $this->NomAuteur;
    }

    public function setNomAuteur(?User $NomAuteur): self
    {
        $this->NomAuteur = $NomAuteur;

        return $this;
    }

    /**
     * @return Collection<int, Progression>
     */
    public function getProgressions(): Collection
    {
        return $this->progressions;
    }

    public function addProgression(Progression $progression): self
    {
        if (!$this->progressions->contains($progression)) {
            $this->progressions[] = $progression;
            $progression->setFormation($this);
        }

        return $this;
    }

    public function removeProgression(Progression $progression): self
    {
        if ($this->progressions->removeElement($progression)) {
            // set the owning side to null (unless already changed)
            if ($progression->getFormation() === $this) {
                $progression->setFormation(null);
            }
        }

        return $this;
    }
}
