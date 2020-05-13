
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Elecciones presidenciales en Nicaragua

<!-- badges: start -->

[![R build
status](https://github.com/rrmaximiliano/eleccionesNic/workflows/R-CMD-check/badge.svg)](https://github.com/rrmaximiliano/eleccionesNic/actions)
<!-- badges: end -->

`eleccionesNic` es una base de datos que contiene información sobre las
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
#> -- Attaching packages ------------------------------------------------------------------------ tidyverse 1.3.0 --
#> v ggplot2 3.3.0     v purrr   0.3.4
#> v tibble  3.0.0     v dplyr   0.8.5
#> v tidyr   1.0.2     v stringr 1.4.0
#> v readr   1.3.1     v forcats 0.5.0
#> -- Conflicts --------------------------------------------------------------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
```

Cargar la base:

``` r
library(eleccionesNic)
```

Para ver el tibble que contiene los datos, haga esto:

``` r
nic_elecciones
#> # A tibble: 72 x 35
#>     year departamento municipios   jrv inscritos total_votos total_porcentaje
#>    <int> <fct>             <int> <int>     <int>       <int>            <dbl>
#>  1  1990 Nueva Segov~         11   127     49842       44410            0.891
#>  2  1990 Madriz                9   122     42847       37658            0.879
#>  3  1990 Esteli                6   212     76441       68155            0.892
#>  4  1990 Chinandega           13   333    145519      123366            0.848
#>  5  1990 Leon                 10   374    149131      128948            0.865
#>  6  1990 Managua               7  1096    462771      408987            0.884
#>  7  1990 Masaya                9   252    102294       93797            0.917
#>  8  1990 Carazo                8   190     66627       58341            0.876
#>  9  1990 Granada               4   203     68792       62014            0.902
#> 10  1990 Rivas                10   215     62600       56146            0.897
#> # ... with 62 more rows, and 28 more variables: nulos <int>,
#> #   nulos_porcentaje <dbl>, votos_validos <int>, validos_porcentaje <dbl>,
#> #   uno <int>, psoc <int>, pliun <int>, prt <int>, fsln <int>, map_ml <int>,
#> #   psc <int>, puca <int>, pcdn <int>, mur <int>, al <int>, pcn <int>,
#> #   ccn <int>, pronal <int>, mrs <int>, prn <int>, anc <int>, u <int>,
#> #   pli <int>, uno_96 <int>, plc <int>, ac <int>, aln <int>, otros <int>
```

La base de datos continue las siguientes columnas (variables):

  - year
  - departamento
  - municipios
  - jrv: Junto receptora de votos
  - inscritos
  - total\_votos
  - total\_porcentaje
  - nulos
  - nulos\_porcentaje
  - votos\_validos
  - validos\_porcentaje
  - Partidos políticos
      - uno: Unión Nacional Opositora
      - psoc: Partido Social Cristiano
      - pliun: Partido Liberal Independiente de Unidad Nacional
      - prt: Partido Revolucionario de los Trabajadores
      - fsl: Frente Sandinista de Liberación Nacional
      - map\_ml: Movimiento de Acción Popular Marxista-Leninista
      - psc: Partido Social Conservatismo
      - puca: Partido Unionista Centroamericano
      - pcdn: Partido Comunista de Nicaragua
      - mur: Movimiento de Unidad Revolucionaria
      - al: Alianza Liberal
      - pcn: Partido Conservador de Nicaragua  
      - ccn: Camino Cristiano Nicaragüense
      - pronal: Proyecto Nacional
      - mrs: Movimiento Renovador Sandinista
      - prn: Partido Resistencia Nicaragüense
      - anc: Acción Nacional Conservadora
      - u: Alianza Unidad
      - pli: Partido Liberal Independiente
      - uno\_96: Alianza UNO-96
      - plc: Partido Liberal Constitucionalista
      - ac: Alternativa por el Cambio
      - aln: Alianza Liberal Nicaragüense

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
#>   Rony Rodriguez-Ramirez (2020). eleccionesNic: Elecciones
#>   presidenciales en Nicaragua 1990-2006. R package version 0.0.1.
#>   https://github.com/rrmaximiliano/eleccionesNic
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
