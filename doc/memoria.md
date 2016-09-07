---
author:
- Ignacio Cordón Castillo

title: "Musictory: Music directory, sistema de información orientado a la gestión de *stock* discográfico"
lang: spanish
date: \today
papersize: A4

# Especifica que queremos un índice
toc-title: "Índice de contenidos"
toc: true
toc-depth: 2

# Paquetes a usar en la compilación de latex
header-includes:
  - \usepackage{graphicx}
  - \usepackage{verbatim}
---

\newcommand{\pk}[1]{\underline{#1}}
\newcommand{\fk}[2]{\qquad FK: {#1} $\longrightarrow$ {#2}}
\newcommand{\ck}[1]{\qquad CK: {#1}}

\newcommand{\imgn}[2]{
  \begin{center}
    \includegraphics[width=#1\textwidth]{#2}
  \end{center}
}

\newpage

# Descripción

*Musictory (Music directory)* es un sistema de información orientado a
almacenar la información (stock, ventas, pedidos) de una
tienda de discos. Almacena información referente a álbumes, tanto en formato CD como vinilo, el histórico y gestión de ventas, así como una gestion de los
pedidos, que pueden hacerse tanto sobre elementos preexistentes en *stock*, como sobre elementos que aún no forman parte del catálogo.


## Áreas funcionales

Entre las áreas funcionales a las que pretendemos dar soporte mediante este
sistema de información, podemos citar:

* Gestión de stock: Permite registrar, consultar y borrar información sobre el
*stock* almacenado en una tienda, así como efectuar una venta o pedido sobre un
elemento del catálogo.

* Gestión de ventas: Permite gestionar las ventas realizadas a diario en el
comercio.

* Gestión de pedidos: Permite realizar, cancelar y marcar la corrección de
pedidos efectuados.

## Usuarios del sistema

Los usuarios del sistema serán el gestor de ventas, gestor de *stock* y gestor de pedidos.

# Análisis de requisitos

## Requisitos funcionales
### Funcionalidad "Gestión de stock"

**RF1: Dar de alta información en el catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* RD1
* *Procesamiento:* Crear el perfil de un nuevo álbum.
* *Salida:* Ninguna

**RF2: Modificar información asociada a un álbum en el catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* RD1 RD2 RD3
* *Procesamiento:* Modificar la información asociada a un álbum
* *Salida*: Ninguna.

**RF3: Consultar stock de un elemento del catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* Identificador
* *Procesamiento:* Consultar stock disponible sobre un disco.
* *Salida*:
  - RD1
  - RD2
  - RD3

**RF4: Vender CD**

* *Actor:* Gestor de *stock*
* *Entrada:* Identificador de catálogo
* *Procesamiento:* Generar la información asociada a una venta de CD, con fecha
de venta el día actual y disminuir el stock asociado al artículo.
* *Salida*: Ninguna


**RF5: Vender Vinilo**

* *Actor:* Gestor de *stock*
* *Entrada:* Identificador de catálogo
* *Procesamiento:* Generar la información asociada a una venta de vinilo, con
fecha de venta el día actual y disminuir el stock asociado al artículo.
* *Salida*: Ninguna

**RF6: Listar catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* Ninguna
* *Procesamiento:* Genera un listado de elementos del catálogo
* *Salida*: RD4 para cada elemento

**RF7: Eliminar elemento del catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* Identificador del catálogo
* *Procesamiento:* Elimina un elemento del catálogo del comercio
* *Salida*: Ninguna


**RF8: Buscar en el catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* Cadena de caracteres a contrastar con título o grupo
* *Procesamiento:* Genera un listado de elementos del catálogo cuyo título o
grupo coinciden con la cadena de caracteres (o con una parte) introducida.
* *Salida*: RD4 para cada elemento coincidente

**RF9: Realizar pedido sobre elemento del catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* RD9
* *Procesamiento:* Genera un pedido para un elemento del catálogo con sus datos.
* *Salida*: Ninguna

### Funcionalidad "Gestión de ventas"

**RF10: Consultar venta**

* *Actor:* Gestor de ventas
* *Entrada:* ID de venta
* *Procesamiento:* Mostrar información referente a una venta realizada
* *Salida*:
  - RD5
  - RD6

**RF11: Cancelar venta**

* *Actor:* Gestor de ventas
* *Entrada:* ID de venta
* *Procesamiento:* Elimina información asociada a una venta
* *Salida*: Ninguna

**RF12: Consultar álbum asociado**

* *Actor:* Gestor de ventas
* *Entrada:* Identificador de venta
* *Procesamiento:* Muestra los datos de stock del álbum vendido
* *Salida*:
  - RD1
  - RD2
  - RD3

**RF13: Modificar venta**

* *Actor:* Gestor de ventas
* *Entrada:* RD8
* *Procesamiento:* Modifica los datos de una venta
* *Salida*: Ninguna


**RF14: Listar histórico de ventas**

* *Actor:* Gestor de *stock*
* *Entrada:* Ninguna
* *Procesamiento:* Genera el listado de ventas de todo el sistema
* *Salida*: RD7 para cada elemento


**RF15: Buscar en el histórico de ventas**

* *Actor:* Gestor de ventas
* *Entrada:* Cadena de caracteres a contrastar con título, grupo o fecha de
venta
* *Procesamiento:* Genera un listado de ventas con título o
grupo del álbum asociado coincidentes con la cadena de caracteres (o con una parte) introducida; o bien la fecha(o una parte de ella) coincidente con lo
introducido.
* *Salida*: RD7 para cada elemento coincidente

### Funcionalidad "Gestión de pedidos"

**RF16: Realizar pedido**

* *Actor:* Gestor de pedidos
* *Entrada:* RD9
* *Procesamiento:* Generar la información de un pedido
* *Salida*: Ninguna

**RF17: Listar todos los pedidos**

* *Actor:* Gestor de pedidos
* *Entrada:* ID de pedido
* *Procesamiento:* Mostrar información referente a todos los pedidos realizados
ordenados por fecha de realización
* *Salida*: RD9 para cada elemento

**RF18: Listar todos los pedidos recibidos**

* *Actor:* Gestor de pedidos
* *Entrada:* Ninguna
* *Procesamiento:* Mostrar información referente a todos los pedidos recibidos
ordenados por fecha de entrada
* *Salida*: RD9 para cada elemento

**RF19: Listar todos los pedidos no recibidos**

* *Actor:* Gestor de pedidos
* *Entrada:* Ninguna
* *Procesamiento:* Mostrar información referente a todos los pedidos no
recibidos ordenados por fecha de realización
* *Salida*: RD9 para cada elemento


**RF20: Listar todos los pedidos cancelados**

* *Actor:* Gestor de pedidos
* *Entrada:* Ninguna
* *Procesamiento:* Mostrar información referente a todos los pedidos cancelados
ordenados por fecha de cancelación
* *Salida*: RD9 para cada elemento


**RF21: Cancelar pedido**

* *Actor:* Gestor de pedidos
* *Entrada:* ID de pedido
* *Procesamiento:* Cancelar un pedido, estableciendo una fecha de cancelación
* *Salida*: Ninguna

**RF22: Marcar pedido como recibido**

* *Actor:* Gestor de pedidos
* *Entrada:* ID pedido
* *Procesamiento:* Marcar un pedido como recibido en el comercio, y generar(o
actualizar) la información de *stock* del álbum asociado.
* *Salida*: Ninguna

**RF23: Buscar en el histórico de pedidos**

* *Actor:* Gestor de pedidos
* *Entrada:* Cadena de caracteres a contrastar con título, grupo o fecha de
realización del pedido
* *Procesamiento:* Genera un listado de pedidos con título o
grupo del álbum asociado coincidentes con la cadena de caracteres (o con una
parte) introducida; o bien la fecha de realización(o una parte de ella)
coincidente con lointroducido.
* *Salida*: RD9 para cada elemento coincidente


## Requisitos de datos
**RD1: Datos almacenados en \underline{CATÁLOGO}**

* ID
* Título (cadena de caracteres)
* Grupo (cadena de caracteres)
* Género (cadena de caracteres)
* Portada


**RD2: Datos almacenados en \underline{CD}**

* ID del CD
* ID del catálogo
* Cantidad de CDs en *stock*(entero)
* Precio


**RD3: Datos almacenados en \underline{VINILO}**

* ID del Vinilo
* ID del catálogo
* Cantidad de Vinilos en *stock*(entero)
* Precio

**RD4: Datos de listado de \underline{CATALOGO}**

* Título
* Grupo
* Género

**RD5: Datos de catálogo mostrados en \underline{VENTA}**

* Título
* Grupo

**RD6: Datos almacenados en \underline{VENTA}**

* ID Venta
* ID Artículo
* Formato (cadena de caracteres)
* Precio (número real)
* Fecha venta
* Observaciones (cadena de caracteres)

**RD7: Datos de listado en \underline{VENTA}**

* Formato (cadena de caracteres)
* Precio (número real)
* Fecha venta

**RD8: Datos modificables en \underline{VENTA}**

* Fecha venta
* Observaciones (cadena de caracteres)

**RD9: Datos almacenados en \underline{PEDIDO}**

* ID Pedido
* Título (cadena de caracteres)
* Grupo (cadena de caracteres)
* Cantidad (entero)
* Formato (cadena de caracteres)
* Fecha Realización
* Fecha Entrada
* Fecha Cancelación

## Restricciones semánticas

**RS1: Nuevo álbum en catálogo**

Al dar de alta un álbum en el catálogo, el stock tanto en CD como en Vinilo por
defecto debe ser 0.

**RS2: Unicidad de título y grupo**

Al dar de alta un álbum en el catálogo, el par (grupo, título) debe ser único en
el sistema y no vacío.

**RS3: Nueva venta**

El precio del stock (ya sea CD o Vinilo asociado) no puede ser vacío al efectuar
una venta.

**RS4: Formato de venta**

El formato de venta debe ser o bien CD(0) o Vinilo(1)

**RS5: Fecha de venta**

La fecha de venta debe ser anterior al día actual

**RS6: Borrado de elemento de catálogo**

Un elemento del catálogo con facturación asociada no puede eliminarse

**RS7: Pedido no recibido**

Un pedido no recibido tendrá únicamente fecha realización.


**RS8: Pedido recibido**

Un pedido tendrá además de fecha de realización, fecha de entrada. Un pedido
recibido no puede cancelarse una vez recibido, es decir, no puede tener fecha de
cancelación si ya tiene fecha de entrada

**RS9: Pedido cancelado**

Un pedido cancelado tendrá fecha de realización y fecha de cancelación, pero
no puede tener fecha de entrada. Esto hace que un pedido cancelado no pueda
recibirse.


**RS10: Nuevo pedido**

Un pedido nuevo no puede tener título, grupo, cantidad o formato vacíos. La
fecha de realización debe establecerse en la actual.

**RS11: Actualizar Stock en pedido recibido**

Si un disco ya existe en catálogo por título y grupo en base de datos, se
actualiza su stock al recibir un pedido. Caso opuesto, se crea en catálogo.

# Diseño

## Diagrama de flujo de datos y esquemas externos

### Armazón

#### Armazón de caja negra

\imgn{1.1}{./diagramas/caja_negra.png}

#### Armazón F

\imgn{1.1}{./diagramas/armazon_F.png}

#### Esquemas externos armazón F

\imgn{0.9}{./diagramas/externos_F.png}

#### Armazón D

\imgn{0.4}{./diagramas/armazon_D.png}

### Primer refinamiento

#### Refinamiento parcial del proceso 1

\imgn{0.9}{./diagramas/gestion_stock.png}

#### Refinamiento parcial del proceso 2

\imgn{0.9}{./diagramas/gestion_ventas.png}

#### Refinamiento parcial del proceso 3

\imgn{0.9}{./diagramas/gestion_pedidos.png}

#### Plano de refinamiento F de primer nivel

\imgn{1.1}{./diagramas/plano_ref_F.png}

#### Esquemas externos del plano de refinamiento F

\imgn{1.1}{./diagramas/externos_ref_F.png}

## Diagrama conceptual completo

### Unión de los esquemas externos


\imgn{1.1}{./diagramas/externos_union.png}

### Diagrama resultante

\imgn{1.1}{./diagramas/diagrama_final.png}

## Operaciones de datos

### O1: Alta de un pedido

Se da de alta un pedido con un título de disco, un grupo y un formato

### O2: Cancelación de una venta

Se elimina la información de una venta de base de datos

### O3: Listado de ventas

Se efectúa un listado con el título y el grupo del álbum asociados a una venta,
el formato físico de la venta, el precio y la fecha de la operación.

### O4: Modificación de stock CD

Permite modificar el stock CD asociado a un elemento del catálogo

## Esquemas de operación y navegación

### O1: Alta de un pedido

\imgn{0.4}{./diagramas/op_alta_pedido.png}

\imgn{0.4}{./diagramas/nav_alta_pedido.png}

### O2: Cancelación de una venta

\imgn{0.3}{./diagramas/op_cancelacion_venta.png}

\imgn{0.3}{./diagramas/nav_cancelacion_venta.png}

### O3: Listado de ventas

\imgn{0.8}{./diagramas/op_listado_ventas.png}

\imgn{0.8}{./diagramas/nav_listado_ventas.png}

### O4: Modificación de stock CD  

\imgn{0.8}{./diagramas/op_modificacion_stock.png}

\imgn{0.8}{./diagramas/nav_modificacion_stock.png}

## Diseño lógico

**Catálogo**(\pk{id}, Título, Grupo, Género, Portada url)

\ck{Título, Grupo}

**CD**(\pk{id}, id Catálogo, Cantidad, Precio)

\fk{CD.id Catálogo}{Catálogo.id}

**Vinilo**(\pk{id}, id Catálogo, Cantidad, Precio)

\fk{Vinilo.id Catálogo}{Catálogo.id}

**Venta**(\pk{id Venta}, id Catálogo, Precio, FechaVenta, Formato, Observaciones)

\fk{Vinilo.id Catálogo}{Catálogo.id}

**Pedido**(\pk{id Pedido}, Cantidad, Formato, Fecha
Realización, Fecha Entrada, Fecha Cancelación, Título, Grupo)

## Diseño físico

### Sentencias DDL

Las sentencias DDL para el SGBD Oracle han sido:

\verbatiminput{../app/db/structure.sql}

### Disparadores PL/SQL

Se crean dos *triggers* PL/SQL:

* \texttt{TR\_ZERO\_STOCK}: Crea un stock por defecto de CD con cantidad 0 y otro
Vinilo con cantidad 0 cuando introducimos un elemento nuevo en el catálogo.
Preserva RS1. [^1]

[^1]: \texttt{CD\_SEQ} y \texttt{VINILO\_SEQ} son dos secuencias creadas empezando
en 10000 para asignar el ID a estas tablas.

* \texttt{TR\_PRESERVE\_CATALOGO}: Genera una excepción si intentamos borrar un
elemento del catálogo que tenga asociada alguna venta. Preserva RS6.

\verbatiminput{../app/db/triggers.sql}


# Descripción de la solución implementada
## Tecnologías usadas

* Ruby on Rails 5
* SGBD de desarrollo: SQLite3
* SGBD de explotación: Oracle

## Guía de instalación

Se ha usado como base de datos local `sqlite3`, que puede instalarse usando:

~~~
  sudo apt-get install sqlite3
~~~

Como base de datos de explotación, para defensa del trabajo, se ha
empleado la base de datos proporcionada por
la UGR con SGBD Oracle para efectuar dichas prácticas. Para conectar a
dicha base de datos, será necesario tener instalado localmente el
*Instant Client* de Oracle. Se necesitan también las *gemas* de Ruby
`ruby-oci8` y `activerecord-oracle_enhanced-adapter`.

En el archivo `Gemfile` aparecen detalladas las dependencias que usa la
aplicación.

Es necesario tener instalado `Ruby`, lo cual puede hacerse desde Ubuntu usando:

~~~
  sudo apt-get install ruby2.3
~~~

y la *gema* `bundler`:

~~~
  gem install bundler
~~~

Una vez hecho esto, basta ir a la carpeta `app` y ejecutar:

~~~
  ./bin/setup
~~~

que se encargará de instalar todas las dependencias necesarias y
preparar la base de datos.

Supondremos en lo que sigue que nos encontramos en la carpeta `app`
(dentro de la cual debe haber otra carpeta `app` a su vez).

Una vez hecho esto, se puede levantar el servidor haciendo:

~~~
  ./bin/rails server
~~~

que hará que `Rails` escuche en `localhost`, normalmente a través del
puerto 3000. Podemos acceder a la aplicación por tanto en cualquier navegador
a través de [http://localhost:3000](http://localhost:3000)

## Arquitectura

La aplicación usa Modelo-Vista-Controlador para servir páginas.

Los siguientes modelos se han creado en la carpeta `app/models`:

~~~
  catalogo.rb -> Catalogo
  cd.rb -> Cd
  vinilo.rb -> Vinilo
  venta.rb -> Venta
  pedido.rb -> Pedido
~~~

Los modelos se encargan de efectuar la comunicación con la base de
datos y comprobar las restricciones semánticas y de integridad
de los datos que queremos insertar o actualizar.

A cada modelo le corresponde un controlador, que a través de una ruta
con cabecera HTTP y según la configuración de entrada que poseamos en
el archivo `config/routes.rb` sirve las páginas de la aplicación
empleando un método de la clase correspondiente. Los siguientes
controladores pueden encontrarse en la carpeta `app/controllers`:

~~~
  catalogos_controller.rb -> CatalogosController
  cds_controller.rb -> CdsController
  vinilos_controller.rb -> VinilosController
  ventas_controller.rb -> VentasController
  pedidos_controller.rb -> PedidosController
~~~

Las vistas son las páginas que se sirven según la ruta que solicitemos
al servidor y el método del controlador que tenga asociado. Pueden
encontrase en la carpeta `app/views`. Podemos encontrar las siguientes subcarpetas ahí:

~~~
  catalogos
  cds
  vinilos
  ventas
  pedidos
~~~

Los archivos `html.erb` de una carpeta, a saber `files`, usarán como
plantilla `app/views/layouts/files.html.erb` y como hojas de estilo
las disponibles en `app/assets/stylesheets/`, aunque no deben ser
necesariamente las homónimas.
