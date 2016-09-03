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
---

\newcommand{\pk}[1]{\underline{#1}}
\newcommand{\fk}[2]{\qquad FK: {#1} $\longrightarrow$ {#2}}

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

**RF2: Introducir el stock disponible en CD**

* *Actor:* Gestor de *stock*
* *Entrada:* RD2
* *Procesamiento:* Introducir el stock disponible de un álbum en formato CD
* *Salida:* Ninguna

**RF3: Introducir el stock disponible en vinilo**

* *Actor:* Gestor de *stock*
* *Entrada:* RD3
* *Procesamiento:* Introducir el stock disponible de un álbum en formato vinilo
* *Salida:* Ninguna

**RF4: Modificar información asociada a un álbum en el catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* RD1 RD2 RD3
* *Procesamiento:* Modificar la información asociada a un álbum
* *Salida*: Ninguna.

**RF5: Consultar stock de un elemento del catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* Identificador
* *Procesamiento:* Consultar stock disponible sobre un disco.
* *Salida*:
  - RD1
  - RD2
  - RD3

**RF6: Vender CD**

* *Actor:* Gestor de *stock*
* *Entrada:* Identificador de catálogo
* *Procesamiento:* Generar la información asociada a una venta, con fecha de
venta el día actual y disminuir el stock asociado al artículo.
* *Salida*: Ninguna


**RF7: Vender Vinilo**

* *Actor:* Gestor de *stock*
* *Entrada:* Identificador de catálogo
* *Procesamiento:* Generar la información asociada a una venta, con fecha de
venta el día actual y disminuir el stock asociado al artículo.
* *Salida*: Ninguna

**RF8: Listar catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* Ninguna
* *Procesamiento:* Genera un listado de elementos del catálogo
* *Salida*: RD4 para cada elemento

**RF9: Eliminar elemento del catálogo**
* *Actor:* Gestor de *stock*
* *Entrada:* Identificador del catálogo
* *Procesamiento:* Elimina un elemento del catálogo del comercio
* *Salida*: Ninguna


**RF10: Buscar en el catálogo**
* *Actor:* Gestor de *stock*
* *Entrada:* Cadena de caracteres a contrastar con título o grupo
* *Procesamiento:* Genera un listado de elementos del catálogo cuyo título o
grupo coinciden con la cadena de caracteres (o con una parte) introducida.
* *Salida*: RD4 para cada elemento coincidente

### Funcionalidad "Gestión de ventas"

**RF11: Consultar venta**

* *Actor:* Gestor de ventas
* *Entrada:* ID de venta
* *Procesamiento:* Mostrar información referente a una venta realizada
* *Salida*:
  - RD5
  - RD6

**RF12: Cancelar venta**

* *Actor:* Gestor de ventas
* *Entrada:* ID de venta
* *Procesamiento:* Elimina información asociada a una venta
* *Salida*: Ninguna

**RF13: Consultar álbum asociado**

* *Actor:* Gestor de ventas
* *Entrada:* Identificador de venta
* *Procesamiento:* Muestra los datos de stock del álbum vendido
* *Salida*:
  - RD1
  - RD2
  - RD3

**RF14: Modificar venta**

* *Actor:* Gestor de ventas
* *Entrada:* RD8
* *Procesamiento:* Muestra los datos de stock del álbum vendido
* *Salida*: Ninguna


**RF15: Listar histórico de ventas**

* *Actor:* Gestor de *stock*
* *Entrada:* Ninguna
* *Procesamiento:* Genera un listado de ventas
* *Salida*: RD7 para cada elemento


**RF16: Buscar en el histórico de ventas**

* *Actor:* Gestor de ventas
* *Entrada:* Cadena de caracteres a contrastar con título, grupo o fecha de
venta
* *Procesamiento:* Genera un listado de ventas con título o
grupo del álbum asociado coincidentes con la cadena de caracteres (o con una parte) introducida; o bien la fecha(o una parte de ella) coincide con lo
introducido.
* *Salida*: RD7 para cada elemento coincidente

### Funcionalidad "Gestión de pedidos"

**RF17: Realizar pedido**

* *Actor:* Gestor de pedidos
* *Entrada:* RD9
* *Procesamiento:* Generar la información de un pedido
* *Salida*: Ninguna

**RF18: Listar todos los pedidos**

* *Actor:* Gestor de pedidos
* *Entrada:* ID de pedido
* *Procesamiento:* Mostrar información referente a todos los pedidos realizados
* *Salida*: RD9 para cada elemento

**RF19: Listar todos los pedidos recibidos**

* *Actor:* Gestor de pedidos
* *Entrada:* Ninguna
* *Procesamiento:* Mostrar información referente a todos los pedidos recibidos
* *Salida*: RD9 para cada elemento

**RF20: Listar todos los pedidos no recibidos**

* *Actor:* Gestor de pedidos
* *Entrada:* Ninguna
* *Procesamiento:* Mostrar información referente a todos los pedidos no
recibidos
* *Salida*: RD9 para cada elemento


**RF21: Listar todos los pedidos cancelados**

* *Actor:* Gestor de pedidos
* *Entrada:* Ninguna
* *Procesamiento:* Mostrar información referente a todos los pedidos cancelados
* *Salida*: RD9 para cada elemento


**RF22: Cancelar pedido**

* *Actor:* Gestor de pedidos
* *Entrada:* ID de pedido
* *Procesamiento:* Cancelar un pedido, estableciendo una fecha de cancelación
* *Salida*: Ninguna

**RF23: Marcar pedido como recibido**

* *Actor:* Gestor de pedidos
* *Entrada:* ID pedido
* *Procesamiento:* Marcar un pedido como recibido en el comercio, y generar(o
actualizar) la información de *stock* del álbum asociado.
* *Salida*:
  - RD1
  - RD2 o RD3

**RF24: Buscar en el histórico de pedidos**

* *Actor:* Gestor de pedidos
* *Entrada:* Cadena de caracteres a contrastar con título, grupo o fecha de
realización del pedido
* *Procesamiento:* Genera un listado de pedidos con título o
grupo del álbum asociado coincidentes con la cadena de caracteres (o con una parte) introducida; o bien la fecha(o una parte de ella) coincide con lo
introducido.
* *Salida*: RD9 para cada elemento coincidente


## Requisitos de datos
**RD1: Datos almacenados en \underline{CATÁLOGO}**

* ID
* Título (cadena de caracteres)
* Grupo (cadena de caracteres)
* Genero (cadena de caracteres)
* Foto (url)


**RD2: Datos almacenados en \underline{CD}**

* ID del catálogo
* Cantidad de CDs en *stock*(entero)
* Precio


**RD3: Datos almacenados en \underline{VINILO}**

* ID del catálogo
* Cantidad de Vinilos en *stock*(entero)
* Precio

**RD4: Datos de listado de \underline{CATALOGO}**

* Título
* Grupo
* Género

**RD5: Datos de álbum mostrados en \underline{VENTA}**

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
* Observaciones

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

Al dar de alta un álbum en el catálogo, el grupo, título e identificador
no pueden ser vacíos,

**RS2: Nueva venta**

El precio del stock (ya sea CD o Vinilo asociado) no puede ser vacío.


**RS3: Formato de venta**

El formato de venta debe ser o bien CD o Vinilo.

**RS4: Fecha de venta**

La fecha de venta debe ser anterior al día actual

**RS5: Borrado de elemento de catálogo**

Al borrar un elemento del catálogo de la tienda, no puede desaparecer la
facturación asociada.

**RS6: Pedido no recibido**

Un pedido no recibido tendrá únicamente fecha realización.


**RS7: Pedido recibido**

Un pedido tendrá además de fecha de realización, fecha de entrada.


**RS8: Pedido cancelado**

Un pedido cancelado tendrá fecha de realización y fecha de cancelación, pero
no puede tener fecha de entrada. Un pedido cancelado no puede recibirse una
vez cancelado.

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


## Diagrama conceptual completo

## Esquemas de operación y navegación

## Diseño lógico

**Catálogo**(\pk{id}, Titulo, Grupo, Genero, Precio)

**CD**(\pk{id}, Cantidad)

\fk{CD.id}{Catálogo.id}

**Vinilo**(\pk{id}, Cantidad)

\fk{Vinilo.id Disco}{Catálogo.id}

**Pedido**(\pk{id Pedido}, id Catálogo, Cantidad, Formato, Adeudo, Fecha Realización, Fecha
Entrada, Fecha Defecto, Fecha Cancelación, Fecha Finalización, id Proveedor)

\fk{Vinilo.id Catálogo}{Catálogo.id}
<!--
\fk{Vinilo.id Proveedor}{Proveedor.id}

**Proveedor**(\pk{id}, Nombre)
-->

**Venta**(\pk{id Venta}, id Catálogo, Precio, Fecha Venta)


### Disparadores PL/SQL

## Diseño físico
## Descripción de la solución implementada





# Implementación
## Tecnologías usadas
## Guía de instalación

Se ha usado como base de datos local `sqlite3`, que puede instalarse usando:

`sudo apt-get install sqlite3`

Como base de datos de *test* se ha empleado la base de datos proporcionada por
la UGR con SGBD Oracle para efectuar dichas prácticas. Para conectar a dicha base
de datos, es necesario tener instalado localmente el *Instant Client* de Oracle. Se necesitan también las *gemas* de Ruby `ruby-oci8` y `activerecord-oracle_enhanced-adapter`, que pueden instalarse de la siguiente forma:

``sudo gem install ruby-oci8``

``activerecord-oracle_enhanced-adapter``
