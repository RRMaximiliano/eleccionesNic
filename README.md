
<!-- README.md is generated from README.Rmd. Please edit that file -->

# eleccionesNic

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/RRMaximiliano/eleccionesNic.svg?branch=master)](https://travis-ci.com/RRMaximiliano/eleccionesNic)
<!-- badges: end -->

`eleccionesNic` es un paquete que contiene información sobre las
elecciones presidenciales en Nicaragua desde el año 1990 al 2006. Cada
fila representa año y departamento.

## Instalación

El paquete `eleccionesNic` contiene datos al nivel de departamento. Los
datos incluyen información del total de votos, votos válidos, juntas
receptoras de votos, partidos políticos, etc.

### Instalar desde GitHub

Puedes instalar la versión beta de `eleccionesNic` desde
[GitHub](https://github.com/rrmaximiliano/eleccionesNic):

``` r
devtools::install_github("rrmaximiliano/eleccionesNic")
```

## Cargando los datos

Los datos se almacenan como un tibble y funcionan mejor con (pero no
requieren estrictamente) las bibliotecas
[tidyverse](http://tidyverse.org/).

``` r
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
#> ✔ ggplot2 3.3.6      ✔ purrr   0.3.4 
#> ✔ tibble  3.1.8      ✔ dplyr   1.0.10
#> ✔ tidyr   1.2.1      ✔ stringr 1.4.1 
#> ✔ readr   2.1.2      ✔ forcats 0.5.2 
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
```

Cargar la base:

``` r
library(eleccionesNic)
```

Para ver el tibble que contiene los datos, haga esto:

``` r
nic_elecciones
#> # A tibble: 72 × 35
#>     year departame…¹ munic…²   jrv inscr…³ total…⁴ total…⁵ nulos nulos…⁶ votos…⁷
#>    <dbl> <chr>         <dbl> <dbl>   <dbl>   <dbl>   <dbl> <dbl>   <dbl>   <dbl>
#>  1  1990 Nueva Sego…      11   127   49842   44410   0.891  3288  0.074    41122
#>  2  1990 Madriz            9   122   42847   37658   0.879  3127  0.083    34531
#>  3  1990 Esteli            6   212   76441   68155   0.892  4134  0.0607   64021
#>  4  1990 Chinandega       13   333  145519  123366   0.848  5732  0.0465  117634
#>  5  1990 Leon             10   374  149131  128948   0.865  5547  0.043   123401
#>  6  1990 Managua           7  1096  462771  408987   0.884 17569  0.043   391418
#>  7  1990 Masaya            9   252  102294   93797   0.917  5537  0.059    88260
#>  8  1990 Carazo            8   190   66627   58341   0.876  3743  0.0642   54598
#>  9  1990 Granada           4   203   68792   62014   0.902  4005  0.0646   58009
#> 10  1990 Rivas            10   215   62600   56146   0.897  2982  0.0531   53164
#> # … with 62 more rows, 25 more variables: validos_porcentaje <dbl>, uno <dbl>,
#> #   psoc <dbl>, pliun <dbl>, prt <dbl>, fsln <dbl>, map_ml <dbl>, psc <dbl>,
#> #   puca <dbl>, pcdn <dbl>, mur <dbl>, al <dbl>, pcn <dbl>, ccn <dbl>,
#> #   pronal <dbl>, mrs <dbl>, prn <dbl>, anc <dbl>, u <dbl>, pli <dbl>,
#> #   uno_96 <dbl>, plc <dbl>, ac <dbl>, aln <dbl>, otros <dbl>, and abbreviated
#> #   variable names ¹​departamento, ²​municipios, ³​inscritos, ⁴​total_votos,
#> #   ⁵​total_porcentaje, ⁶​nulos_porcentaje, ⁷​votos_validos
```

La base de datos continue las siguientes columnas (variables):

-   year
-   departamento
-   municipios
-   jrv: Junto receptora de votos
-   inscritos
-   total_votos
-   total_porcentaje
-   nulos
-   nulos_porcentaje
-   votos_validos
-   validos_porcentaje
-   Partidos políticos
    -   uno: Unión Nacional Opositora
    -   psoc: Partido Social Cristiano
    -   pliun: Partido Liberal Independiente de Unidad Nacional
    -   prt: Partido Revolucionario de los Trabajadores
    -   fsl: Frente Sandinista de Liberación Nacional
    -   map_ml: Movimiento de Acción Popular Marxista-Leninista
    -   psc: Partido Social Conservatismo
    -   puca: Partido Unionista Centroamericano
    -   pcdn: Partido Comunista de Nicaragua
    -   mur: Movimiento de Unidad Revolucionaria
    -   al: Alianza Liberal
    -   pcn: Partido Conservador de Nicaragua  
    -   ccn: Camino Cristiano Nicaragüense
    -   pronal: Proyecto Nacional
    -   mrs: Movimiento Renovador Sandinista
    -   prn: Partido Resistencia Nicaragüense
    -   anc: Acción Nacional Conservadora
    -   u: Alianza Unidad
    -   pli: Partido Liberal Independiente
    -   uno_96: Alianza UNO-96
    -   plc: Partido Liberal Constitucionalista
    -   ac: Alternativa por el Cambio
    -   aln: Alianza Liberal Nicaragüense

## Elecciones 2021

``` r
elecciones2021
#> # A tibble: 3,105 × 9
#>    departamento  municipio      centro_de_…¹   plc  fsln   ccn   aln  apre   pli
#>    <chr>         <chr>          <chr>        <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1 NUEVA SEGOVIA CIUDAD ANTIGUA 001 - CENTR…   158   780    49    43    27    21
#>  2 NUEVA SEGOVIA CIUDAD ANTIGUA 500 - ESCUE…    73   387     1     1     1     0
#>  3 NUEVA SEGOVIA CIUDAD ANTIGUA 503 - ESCUE…   232   838    58    58    32    23
#>  4 NUEVA SEGOVIA DIPILTO        001 - ESCUE…     2   307     1     0     0     0
#>  5 NUEVA SEGOVIA DIPILTO        500 - ESCUE…    98   400    21    24     9     7
#>  6 NUEVA SEGOVIA DIPILTO        501 - ESCUE…    15   246     0     5     1     1
#>  7 NUEVA SEGOVIA DIPILTO        502 - ESCUE…   166   799    34    37    14    25
#>  8 NUEVA SEGOVIA DIPILTO        504 - ESCUE…     4   239     1     1     0     0
#>  9 NUEVA SEGOVIA EL JICARO      001 - DELEG…   135   585    37    33    20    19
#> 10 NUEVA SEGOVIA EL JICARO      002 - INSTI…   203   887    53    56    41    29
#> # … with 3,095 more rows, and abbreviated variable name ¹​centro_de_votacion
elecciones2021 %>% 
    glimpse()
#> Rows: 3,105
#> Columns: 9
#> $ departamento       <chr> "NUEVA SEGOVIA", "NUEVA SEGOVIA", "NUEVA SEGOVIA", …
#> $ municipio          <chr> "CIUDAD ANTIGUA", "CIUDAD ANTIGUA", "CIUDAD ANTIGUA…
#> $ centro_de_votacion <chr> "001 - CENTRO ESCOLAR MONSEÑOR MADRIGAL Y GARCIA", …
#> $ plc                <dbl> 158, 73, 232, 2, 98, 15, 166, 4, 135, 203, 187, 1, …
#> $ fsln               <dbl> 780, 387, 838, 307, 400, 246, 799, 239, 585, 887, 7…
#> $ ccn                <dbl> 49, 1, 58, 1, 21, 0, 34, 1, 37, 53, 40, 0, 26, 4, 0…
#> $ aln                <dbl> 43, 1, 58, 0, 24, 5, 37, 1, 33, 56, 34, 0, 23, 1, 0…
#> $ apre               <dbl> 27, 1, 32, 0, 9, 1, 14, 0, 20, 41, 33, 0, 10, 0, 0,…
#> $ pli                <dbl> 21, 0, 23, 0, 7, 1, 25, 0, 19, 29, 15, 0, 9, 0, 0, …
```

## Caveats

Hay varios caveats en esta base de datos preliminar.

Primero, para las elecciones de 1990 y 1996, la contabilización de votos
se registró como:

1.  Inscritos
2.  Total Votos
3.  Nulos
4.  Votos válidos

En el caso de las elecciones de 2001 y 2006, solo se encuentra
información para las siguientes variables:

1.  Inscritos
2.  Votos válidos

Esto es debido a la forma en que fueron públicados los resultados por
parte del Consejo Supremo Electoral de Nicaragua.

## Comentarios y sugerencias

Para realizar comentarios o sugerencias sobre este paquetes puedes abrir
un issue en este repositorio:
`https://github.com/rrmaximiliano/eleccionesNic/issues`

## Citar el paquete `eleccionesNic`

Para citar el paquete, use lo siguiente:

``` r
citation("eleccionesNic")
#> 
#> To cite package 'eleccionesNic' in publications use:
#> 
#>   Rodriguez-Ramirez R (2020). _eleccionesNic: Elecciones presidenciales
#>   en Nicaragua 1990-2006_. R package version 0.0.1,
#>   <https://github.com/rrmaximiliano/eleccionesNic>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {eleccionesNic: Elecciones presidenciales en Nicaragua 1990-2006},
#>     author = {Rony Rodriguez-Ramirez},
#>     year = {2020},
#>     note = {R package version 0.0.1},
#>     url = {https://github.com/rrmaximiliano/eleccionesNic},
#>   }
```
