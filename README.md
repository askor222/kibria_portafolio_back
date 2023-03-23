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
- Formulario de Login: php bin/console make:auth (Opción: Login form authenticator)
- Claves públicas y privadas de jwt: php bin/console lexik:jwt:generate-keypair
- Actualizamos la base de datos: php bin/console doctrine:schema:update --force (2 queries were executed)
- En env. añadimos: MAILER_DSN="smtp://xxxxx:yyyyy@smtp1.s.ipzmarketing.com:587" (Actualizar usuario y contraseña)
- Control de acceso por rol admin en el security.yaml - { path: ^/admin, roles: ROLE_ADMIN }
- En la base de dato en el usuario seleccionado se puede añadir en rol: ["ROLE_ADMIN"] (Por defecto podría añadir un rol en el entity de user)
- En el Registration controller, en la linea 56, cambiar la ruta a home o a la ruta que quieres ir una vez registrado
- En el src/Security/AppCustomAutheticator.php en la linea 50 especificar a dónde quieres llegar una vez realizado el login
- Levantar servidor: symfony server:start -d 


# Rutas de la aplicación:

| URL path                    | Description           | 
| :--------------------------:|:---------------------:|
| /home                    |  Página en blanco|
| /register                    |  Registro de usuarios| 
| /login                       |  Login               |
| /logout                      |  Logout                |
| /admin                      |   Acceso restringido              |

