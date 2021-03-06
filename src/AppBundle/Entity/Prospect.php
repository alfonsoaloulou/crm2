<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Prospect
 *
 * @ORM\Table(name="prospect")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProspectRepository")
 */
class Prospect
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
     * @var string
     *
     * @ORM\Column(name="fonction", type="string", length=255)
     */
    private $fonction;

    /**
     * @var int
     *
     * @ORM\Column(name="tel", type="integer")
     */
    private $tel;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255)
     */
    private $email;

    /**
     * Many Features have One Product.
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Organisation", inversedBy="prospects", cascade={"persist"})
     * @ORM\JoinColumn(name="organisation_id", referencedColumnName="id")
     */
    private $organisation;

    /**
     * Many Features have One Product.
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Campagne", inversedBy="prospects",  cascade={"persist"})
     * @ORM\JoinColumn(name="campagne_id", referencedColumnName="id")
     */
    private $campagne;


    public function __toString()
    {
        return $this->nom ;
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
     * @return Prospect
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
     * Set fonction
     *
     * @param string $fonction
     *
     * @return Prospect
     */
    public function setFonction($fonction)
    {
        $this->fonction = $fonction;

        return $this;
    }

    /**
     * Get fonction
     *
     * @return string
     */
    public function getFonction()
    {
        return $this->fonction;
    }

    /**
     * Set tel
     *
     * @param integer $tel
     *
     * @return Prospect
     */
    public function setTel($tel)
    {
        $this->tel = $tel;

        return $this;
    }

    /**
     * Get tel
     *
     * @return int
     */
    public function getTel()
    {
        return $this->tel;
    }

    /**
     * Set email
     *
     * @param string $email
     *
     * @return Prospect
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Get organisation
     *
     * @return \AppBundle\Entity\Organisation
     */
    public function getOrganisation()
    {
        return $this->organisation;
    }

    /**
     * Set organisation
     *
     * @param \AppBundle\Entity\Organisation $organisation
     *
     * @return Prospect
     */
    public function setOrganisation(\AppBundle\Entity\Organisation $organisation = null)
    {
        $this->organisation = $organisation;

        return $this;
    }

    /**
     * Get campagne
     *
     * @return \AppBundle\Entity\Campagne
     */
    public function getCampagne()
    {
        return $this->campagne;
    }

    /**
     * Set campagne
     *
     * @param \AppBundle\Entity\Campagne $campagne
     *
     * @return Campagne
     */
    public function setCampagne(\AppBundle\Entity\Campagne $campagne = null)
    {
        $this->campagne = $campagne;

        return $this;
    }
}
