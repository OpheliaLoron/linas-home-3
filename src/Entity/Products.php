<?php

namespace App\Entity;

use App\Repository\ProductsRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ProductsRepository::class)
 */
class Products
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Categories::class)
     */
    private $category;

    /**
     * @ORM\Column(type="string", length=25)
     */
    private $name;

    /**
     * @ORM\Column(type="float")
     */
    private $unit_price;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $description;

    /**
     * @ORM\Column(type="integer")
     */
    private $available_stock;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $photo_1;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $photo_2;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $photo_3;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $photo_4;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $alt_1;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $alt_2;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $alt_3;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $alt_4;

   

    /**
     * @ORM\ManyToOne(targetEntity=Carts::class)
     */
    private $cart;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCategory(): ?Categories
    {
        return $this->category;
    }

    public function setCategory(?Categories $category): self
    {
        $this->category = $category;

        return $this;
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

    public function getUnitPrice(): ?float
    {
        return $this->unit_price;
    }

    public function setUnitPrice(float $unit_price): self
    {
        $this->unit_price = $unit_price;

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

    public function getAvailableStock(): ?int
    {
        return $this->available_stock;
    }

    public function setAvailableStock(int $available_stock): self
    {
        $this->available_stock = $available_stock;

        return $this;
    }

    public function getPhoto1(): ?string
    {
        return $this->photo_1;
    }

    public function setPhoto1(string $photo_1): self
    {
        $this->photo_1 = $photo_1;

        return $this;
    }

    public function getPhoto2(): ?string
    {
        return $this->photo_2;
    }

    public function setPhoto2(string $photo_2): self
    {
        $this->photo_2 = $photo_2;

        return $this;
    }

    public function getPhoto3(): ?string
    {
        return $this->photo_3;
    }

    public function setPhoto3(?string $photo_3): self
    {
        $this->photo_3 = $photo_3;

        return $this;
    }

    public function getPhoto4(): ?string
    {
        return $this->photo_4;
    }

    public function setPhoto4(?string $photo_4): self
    {
        $this->photo_4 = $photo_4;

        return $this;
    }

    public function getAlt1(): ?string
    {
        return $this->alt_1;
    }

    public function setAlt1(string $alt_1): self
    {
        $this->alt_1 = $alt_1;

        return $this;
    }

    public function getAlt2(): ?string
    {
        return $this->alt_2;
    }

    public function setAlt2(string $alt_2): self
    {
        $this->alt_2 = $alt_2;

        return $this;
    }

    public function getAlt3(): ?string
    {
        return $this->alt_3;
    }

    public function setAlt3(?string $alt_3): self
    {
        $this->alt_3 = $alt_3;

        return $this;
    }

    public function getAlt4(): ?string
    {
        return $this->alt_4;
    }

    public function setAlt4(?string $alt_4): self
    {
        $this->alt_4 = $alt_4;

        return $this;
    }

    public function getShoppingcart(): ?ShoppingCarts
    {
        return $this->shoppingcart;
    }

    public function setShoppingcart(?ShoppingCarts $shoppingcart): self
    {
        $this->shoppingcart = $shoppingcart;

        return $this;
    }

    public function getCart(): ?Carts
    {
        return $this->cart;
    }

    public function setCart(?Carts $cart): self
    {
        $this->cart = $cart;

        return $this;
    }
}
