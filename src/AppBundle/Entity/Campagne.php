<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Campagne
 *
 * @ORM\Table(name="campagne")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CampagneRepository")
 */
class Campagne
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=255)
     */
    private $nom;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="date")
     */
    private $date;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=255)
     */
    private $description;

    /**
     *
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\Prospect", mappedBy="campagne", cascade={"persist"})
     */
    private $prospects;



    public function __construct() {
        $this->prospects = new ArrayCollection();
    }

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return Campagne
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return Campagne
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Campagne
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Add prospect
     *
     * @param \AppBundle\Entity\Prospect $prospect
     *
     * @return Campagne
     */
    public function addProspect(\AppBundle\Entity\Prospect $prospect)
    {
        $prospect->setCampagne($this);
        $this->prospects[] = $prospect;

        return $this;
    }

    /**
     * Remove prospect
     *
     * @param \AppBundle\Entity\Prospect $prospect
     */
    public function removeProspect(\AppBundle\Entity\Prospect $prospect)
    {
        $this->prospects->removeElement($prospect);
    }

    /**
     * Get prospects
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProspects()
    {
        return $this->prospects;
    }
}
