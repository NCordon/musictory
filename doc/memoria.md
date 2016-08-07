---
author:
- Ignacio Cordón Castillo

title: "Musictory: Musicians directory, sistema de información orientado al público"
lang: spanish
date: \today
papersize: A4

# Especifica que queremos un índice
toc-title: "Índice de contenidos"
toc: true
toc-depth: 2
---

\newpage

# Descripción

*Musictory (Music directory)* es un sistema de información orientado a
almacenar la información (stock, facturación, pedidos) de una
tienda de discos.

## Áreas funcionales

Entre las áreas funcionales a las que pretendemos dar soporte mediante este
sistema de información, podemos citar:

* Gestión de stock: Permite registrar, consultar y borrar información sobre el
*stock* almacenado en una tienda.

* Gestión de facturación: Permite registrar, actualizar y cancelar la información de facturación referente a una venta o un adeudo.

* Gestión de ventas: Permite registrar, actualizar y borrar un pedido en el
sistema.

* Gestión de pedidos: Permite registrar, actualizar y borrar un pedido en el
sistema.

## Usuarios del sistema

El usuario del sistema es el gestor de la tienda de música.

# Análisis de requisitos

## Requisitos funcionales
### Funcionalidad "Gestión de stock"

**RF1: Dar de alta stock de un disco**

* *Actor:* Gestor de pedidos
* *Entrada:* RD1
* *Procesamiento:* Crear el perfil de un nuevo disco, introduciendo el stock
disponible a mano.
* *Salida:* Ninguna

**RF2: Modificar stock de un disco**

* *Actor:* Gestor de tienda
* *Entrada:* RD1
* *Procesamiento:* Modificar el stock de un disco, incrementándolo o decrementándolo.
* *Salida*: Ninguna.

**RF3: Consultar stock de un disco**

* *Actor:* Gestor de tienda
* *Entrada:* Identificador
* *Procesamiento:* Consultar stock disponible sobre un disco.
* *Salida*:
  - RD1
  - Histórico de ventas

### Funcionalidad "Gestión de facturación"

**RF4: Consultar operación**

* *Actor:* Gestor de tienda
* *Entrada:* ID de operación
* *Procesamiento:* Consultar información referente a una venta o pago.
* *Salida:* RD2

**RF5: Modificar operación**

* *Actor:* Gestor de tienda
* *Entrada:* RD2
* *Procesamiento:* Modificar los datos asoaciados una operación
* *Salida*: Ninguna

**RF6: Borrar operación**

* *Actor:* Gestor de tienda
* *Entrada:* ID de operación
* *Procesamiento:* Borrar una tupla referente a una operación de la facturación
  de la tienda
* *Salida*: Ninguna


### Funcionalidad "Gestión de ventas"

**RF7: Realizar venta**

* *Actor:* Gestor de tienda
* *Entrada:* RD3
* *Procesamiento:* Generar la información asociada a una venta, y disminuir el
  stock asociado al artículo.
* *Salida*: Ninguna

**RF8: Mostrar datos de una venta**

* *Actor:* Gestor de tienda
* *Entrada:* ID de venta
* *Procesamiento:* Mostrar información referente a una venta realizada
* *Salida*: RD3

**RF9: Cancelar venta**

* *Actor:* Gestor de tienda
* *Entrada:* ID de venta
* *Procesamiento:* Eliminar una venta
* *Salida*: Ninguna


### Funcionalidad "Gestión de pedido"

**RF10: Realizar pedido**

* *Actor:* Gestor de tienda
* *Entrada:* RD4
* *Procesamiento:* Generar la información de un pedido
* *Salida*: Ninguna

**RF11: Mostrar datos de un pedido**

* *Actor:* Gestor de tienda
* *Entrada:* ID de pedido
* *Procesamiento:* Mostrar información referente a un pedido realizado
* *Salida*: RD4

**RF12: Cancelar pedido**

* *Actor:* Gestor de tienda
* *Entrada:* ID de pedido
* *Procesamiento:* Cancelar un pedido, estableciendo una fecha de cancelación
* *Salida*: Ninguna

**RF13: Marcar pedido como recibido**

* *Actor:* Gestor de tienda
* *Entrada:* ID pedido
* *Procesamiento:* Marcar un pedido como efectuado correctamente, y almacenar
la información relativa al stock en la tienda
* *Salida*: Ninguna


## Requisitos de datos
**RD1: Datos almacenados en \underline{PRODUCTO}**

* ID
* Título (cadena de caracteres)
* Grupo (cadena de caracteres)
* CD/Vinilo
* Sección

**RD2: Datos almacenados en \underline{OPERACIÓN}**

* ID Operación
* ID Artículo
* Cantidad (entero)
* Facturación (número real)
* Descripción (cadena de caracteres)
* Fecha facturación
* Fecha ejecución


**RD3: Datos almacenados en \underline{VENTA}**

* ID Venta
* ID Artículo
* Cantidad
* Precio
* Fecha


**RD4: Datos almacenados en \underline{PEDIDO}**

* ID Pedido
* ID Artículo
* Cantidad
* Adeudo
* Fecha realización
* Fecha entrada
* Fecha defecto
* Fecha cancelación
* Fecha finalización
* Proveedor

## Restricciones semánticas

**RS1: Producto**

Al dar de alta un producto, el grupo, título y formato (CD/Vinilo) no pueden ser vacíos, aparte por supuesto del identificador.

**RS2: Operaciones**

La fecha de ejecución (fecha real de cobro o de pago), debe ser posterior (o
nula, en caso apropiado) a la fecha de facturación.

**RS3: Venta**

ID Artículo, cantidad, precio (precio del artículo vendido) y fecha
no pueden ser vacíos.

**RS4: Pedido**

ID Artículo, cantidad, precio (precio del artículo pedido) y fecha realización
no pueden ser vacíos.

**RS5: Pedido no recibido**

Un pedido no recibido tendrá únicamente fecha realización.

**RS6: Pedido recibido**

Un pedido recibido tendrá fecha realización y fecha de entrada, con fecha
entrada posterior a la fecha de realización.

**RS7: Pedido recibido correctamente**

Un pedido recibido correctamente será un pedido recibido con fecha de
finalización no nula y posterior a la fecha de entrada.

**RS8: Pedido no correcto**

Un pedido recibido pero no correcto cumplirá las restricciones semánticas de
los pedidos recibidos, pero tendrá fecha defecto no nula y posterior a la de
entrada. Fecha defecto podría considerarse como una fecha de reclamación o de
devolución.

**RS9: Pedido cancelado**

Un pedido cancelado tendrá fecha de cancelación no nula, y posterior a la fecha
de realización, pero no tendrá ninguna otra fecha.



# Diseño

## Diagrama de flujo de datos y esquemas externos
## Diagrama conceptual completo
## Esquemas de operación y navegación
## Diseño lógico

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
