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
almacenar la información (stock, facturación, pedidos) de una
tienda de discos. Almacena información referente a álbumes, tanto en formato
como vinilo.


## Áreas funcionales

Entre las áreas funcionales a las que pretendemos dar soporte mediante este
sistema de información, podemos citar:

* Gestión de stock: Permite registrar, consultar y borrar información sobre el
*stock* almacenado en una tienda.

* Gestión de ventas: Permite gestionar las ventas realizadas a diario en el
comercio, actualizando el *stock*.

* Gestión de pedidos: Permite realizar, cancelar y marcar la corrección de
pedidos efectuados.

## Usuarios del sistema

Los usuarios del sistema son el gestor de ventas, gestor de *stock* y gestor de
pedidos.

# Análisis de requisitos

## Requisitos funcionales
### Funcionalidad "Gestión de stock"

**RF1: Dar de alta información en el catálogo*

* *Actor:* Gestor de comercio
* *Entrada:* RD1
* *Procesamiento:* Crear el perfil de un nuevo álbum.
* *Salida:* Ninguna

**RF2: Introducir el stock disponible en CD**

* *Actor:* Gestor de *stock*
* *Entrada:* RD2
* *Procesamiento:* Introducir el stock disponible de un álbum en formato CD
* *Salida:* Ninguna

**RF3: Introducir el stock disponible en Vinilo**

* *Actor:* Gestor de *stock*
* *Entrada:* RD3
* *Procesamiento:* Introducir el stock disponible de un álbum en formato Vinilo
* *Salida:* Ninguna

**RF4: Modificar información asociada a un álbum en el catálogo**

* *Actor:* Gestor de *stock*
* *Entrada:* RD1
* *Procesamiento:* Modificar la información asociada a un álbum
* *Salida*: Ninguna.

**RF5: Consultar stock de un disco**

* *Actor:* Gestor de *stock*
* *Entrada:* Identificador
* *Procesamiento:* Consultar stock disponible sobre un disco.
* *Salida*:
  - RD1
  - RD2
  - RD3
  - Histórico de ventas


### Funcionalidad "Gestión de ventas"

**RF6: Realizar venta**

* *Actor:* Gestor de ventas
* *Entrada:* RD4
* *Procesamiento:* Generar la información asociada a una venta, y disminuir el
  stock asociado al artículo.
* *Salida*: Ninguna

**RF7: Mostrar datos de una venta**

* *Actor:* Gestor de ventas
* *Entrada:* ID de venta
* *Procesamiento:* Mostrar información referente a una venta realizada
* *Salida*: RD4

**RF8: Cancelar venta**

* *Actor:* Gestor de ventas
* *Entrada:* ID de venta
* *Procesamiento:* Eliminar una venta
* *Salida*: Ninguna

**RF9: Modificar venta**

* *Actor:* Gestor de ventas
* *Entrada:* RD4
* *Procesamiento:* Modificar los datos asociados a una venta
* *Salida*: Ninguna


### Funcionalidad "Gestión de pedido"

**RF10: Realizar pedido**

* *Actor:* Gestor de pedidos
* *Entrada:* RD5
* *Procesamiento:* Generar la información de un pedido
* *Salida*: Ninguna

**RF11: Mostrar datos de un pedido**

* *Actor:* Gestor de pedidos
* *Entrada:* ID de pedido
* *Procesamiento:* Mostrar información referente a un pedido realizado
* *Salida*: RD5

**RF12: Cancelar pedido**

* *Actor:* Gestor de pedidos
* *Entrada:* ID de pedido
* *Procesamiento:* Cancelar un pedido, estableciendo una fecha de cancelación
* *Salida*: Ninguna

**RF13: Marcar pedido como recibido**

* *Actor:* Gestor de pedidos
* *Entrada:* ID pedido
* *Procesamiento:* Marcar un pedido como recibido en el comercio.
* *Salida*: Ninguna


**RF14: Marcar pedido como correcto**

* *Actor:* Gestor de pedidos
* *Entrada:* ID pedido
* *Procesamiento:* Marcar un pedido como efectuado correctamente, y almacenar
la información relativa al stock en la tienda
* *Salida*: Ninguna


**RF15: Marcar pedido como defectuoso**

* *Actor:* Gestor de pedidos
* *Entrada:* ID pedido
* *Procesamiento:* Marcar un pedido como recibido pero no correcto.
* *Salida*: Ninguna


## Requisitos de datos
**RD1: Datos almacenados en \underline{CATÁLOGO}**

* ID
* Título (cadena de caracteres)
* Grupo (cadena de caracteres)
* Genero (cadena de caracteres)


**RD2: Datos almacenados en \underline{CD}**

* ID del catálogo
* Cantidad de CDs en *stock*(entero)


**RD3: Datos almacenados en \underline{VINILO}**

* ID del catálogo
* Cantidad de Vinilos en *stock*(entero)


**RD4: Datos almacenados en \underline{VENTA}**

* ID Venta
* ID Artículo
* Formato (cadena de caracteres)
* Precio (número real)
* Fecha
<!--* Descripción (cadena de caracteres)-->


**RD5: Datos almacenados en \underline{PEDIDO}**

* ID Pedido
* ID Artículo
* Cantidad (entero)
* Adeudo (número real)
* Fecha realización
* Fecha entrada
* Fecha defecto
* Fecha cancelación
* Fecha finalización
* ID Proveedor

## Restricciones semánticas

**RS1: Catálogo**

Al dar de alta un álbum en el catálogo, el grupo, título y formato (CD/Vinilo)
no pueden ser vacíos, aparte por supuesto del identificador.

<!--
**RS2: Operaciones**

La fecha de ejecución (fecha real de cobro o de pago), debe ser posterior (o
nula, en caso apropiado) a la fecha de facturación.
-->

**RS2: Venta**

ID Artículo, cantidad, precio (precio del artículo vendido) y fecha
no pueden ser vacíos.

**RS3: Pedido**

ID Artículo, cantidad, precio (precio del artículo pedido) y fecha realización
no pueden ser vacíos.

**RS4: Pedido no recibido**

Un pedido no recibido tendrá únicamente fecha realización.

**RS5: Pedido recibido**

Un pedido recibido tendrá fecha realización y fecha de entrada, con fecha
entrada posterior a la fecha de realización.

**RS6: Pedido recibido correctamente**

Un pedido recibido correctamente será un pedido recibido con fecha de
finalización no nula y posterior a la fecha de entrada.

**RS7: Pedido no correcto**

Un pedido recibido pero no correcto cumplirá las restricciones semánticas de
los pedidos recibidos, pero tendrá fecha defecto no nula y posterior a la de
entrada. Fecha defecto podría considerarse como una fecha de reclamación o de
devolución.

**RS8: Pedido cancelado**

Un pedido cancelado tendrá fecha de cancelación no nula, y posterior a la fecha
de realización, pero no tendrá ninguna otra fecha.



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
