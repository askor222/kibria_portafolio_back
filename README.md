# symfony-token

<img src="https://jorgebenitezlopez.com/github/symfony.jpg">

# Symfony token

Instalación de Symfony, creación de usuarios con validación por email y acceso pr token

# Requisitos

- Symfony CLI: https://symfony.com/download
- PHP: PHP 8.2.3 (cli). Por ejemplo se puede descargar en OSX con: https://formulae.brew.sh/formula/php
- Composer: https://getcomposer.org/download/

# Pasos para la instalación de Symfomy y paquetes

- symfony new symfony-token --version=5.4
- composer require symfony/orm-pack
- composer require symfony/maker-bundle
- composer update
- composer require form validator twig-bundle security-csrf annotations
- composer require symfony/security-bundle
- composer require symfonycasts/verify-email-bundle
- composer require symfony/mailer 
- composer require --dev symfony/profiler-pack 
- composer require "lexik/jwt-authentication-bundle"

# Configuración y creación de entidades

- Modificamos el .env para que genere un sqlite (https://www.sqlite.org/index.html)
- Crear usuario:  php bin/console make:user
- Formulario de registro: php bin/console make:registration-form (Con email to verify the user's)
- Formulario de Login: php bin/console make:auth

