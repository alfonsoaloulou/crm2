<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Produit
 *
 * @ORM\Table(name="produit")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProduitRepository")
 */
class Produit
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
     * @ORM\Column(name="ref", type="string", length=255, unique=true, nullable=true)
     */
    private $ref;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=255)
     */
    private $nom;

    /**
     * @var float
     *
     * @ORM\Column(name="PrixUnit", type="float")
     */
    private $prixUnit;

    /**
     * @var string
     *
     * @ORM\Column(name="Description", type="string", length=255)
     */
    private $description;

    /**
     *
     * @ORM\ManyToMany(targetEntity="Devis", inversedBy="produits")
     * @ORM\JoinTable(name="devis_produit")
     */
    private $deviss;


    public function __construct() {
        $this->deviss = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     *
     * @ORM\ManyToMany(targetEntity="Facture", inversedBy="produits")
     * @ORM\JoinTable(name="facture_produit")
     */
    private $factures;

    /**
     *
     * @ORM\ManyToMany(targetEntity="Commande", inversedBy="produits")
     * @ORM\JoinTable(name="commande_produit")
     */
    private $commandes;


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
     * Set ref
     *
     * @param string $ref
     *
     * @return Produit
     */
    public function setRef($ref)
    {
        $this->ref = $ref;

        return $this;
    }

    /**
     * Get ref
     *
     * @return string
     */
    public function getRef()
    {
        return $this->ref;
    }

    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return Produit
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
     * Set prixUnit
     *
     * @param string $prixUnit
     *
     * @return Produit
     */
    public function setPrixUnit($prixUnit)
    {
        $this->prixUnit = $prixUnit;

        return $this;
    }

    /**
     * Get prixUnit
     *
     * @return string
     */
    public function getPrixUnit()
    {
        return $this->prixUnit;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Produit
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
     * Add deviss
     *
     * @param \AppBundle\Entity\Devis $deviss
     *
     * @return Produit
     */
    public function addDeviss(\AppBundle\Entity\Devis $deviss)
    {
        $this->deviss[] = $deviss;

        return $this;
    }

    /**
     * Remove deviss
     *
     * @param \AppBundle\Entity\Devis $deviss
     */
    public function removeDeviss(\AppBundle\Entity\Devis $deviss)
    {
        $this->deviss->removeElement($deviss);
    }

    /**
     * Get deviss
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getDeviss()
    {
        return $this->deviss;
    }

    /**
     * Add facture
     *
     * @param \AppBundle\Entity\Facture $facture
     *
     * @return Produit
     */
    public function addFacture(\AppBundle\Entity\Facture $facture)
    {
        $this->factures[] = $facture;

        return $this;
    }

    /**
     * Remove facture
     *
     * @param \AppBundle\Entity\Facture $facture
     */
    public function removeFacture(\AppBundle\Entity\Facture $facture)
    {
        $this->factures->removeElement($facture);
    }

    /**
     * Get factures
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getFactures()
    {
        return $this->factures;
    }

    /**
     * Add commande
     *
     * @param \AppBundle\Entity\Commande $commande
     *
     * @return Produit
     */
    public function addCommande(\AppBundle\Entity\Commande $commande)
    {
        $this->commandes[] = $commande;

        return $this;
    }

    /**
     * Remove commande
     *
     * @param \AppBundle\Entity\Commande $commande
     */
    public function removeCommande(\AppBundle\Entity\Commande $commande)
    {
        $this->commandes->removeElement($commande);
    }

    /**
     * Get commandes
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCommandes()
    {
        return $this->commandes;
    }
}
