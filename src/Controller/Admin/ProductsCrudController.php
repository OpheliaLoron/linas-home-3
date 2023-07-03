<?php

namespace App\Controller\Admin;

use App\Entity\Products;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProductsCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Products::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
           TextField::new ('name'),
           SlugField::new ('slug')->setTargetFieldName('name'),
           ImageField::new('photo')
           ->setBasePath('uploads/') // Le dossier où il cherche nos images
           ->setUploadDir('public/uploads') // Pour les images de même nom et la régénération d'un nouveau nom d'image d'une manière aléatoire avec : randomhash()
           ->setUploadedFileNamePattern('[randomhash].[extension]'), // La manière de comment on va encoder nos images
           // ->setRequired(false),
           TextField::new ('alt'),
           TextField::new ('subtitle'),
           TextareaField::new ('description'),
           MoneyField::new ('price')->setCurrency('EUR'),
           AssociationField::new ('category')
        ];
    }
   
}
