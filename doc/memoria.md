---
author:
- Ignacio Cordón Castillo

title: "Musictory: Musicians directory, sistema de información orientado al público"
date: \today
lang: spanish
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
stock almacenado en una tienda.

* Gestión de facturación: Permite registrar, actualizar y cancelar la información
de facturación referente a una venta o un adeudo.

* Gestión de pedidos: Permite registrar, actualizar y borrar un pedido en el
sistema.

## Usuarios del sistema

El usuario del sistema es el gestor de la tienda de música.

# Análisis de requisitos

## Requisitos funcionales
### Funcionalidad "Gestión de stock"

#### RF1: Dar de alta stock de un disco

* *Actor:* Gestor de tienda
* *Entrada:* RD1
* *Procesamiento:* Crear el perfil de un nuevo disco, introduciendo el stock
disponible a mano.
* *Salida:* Ninguna

#### RF1: Modificar stock de un disco

* *Actor:* Gestor de tienda
* *Entrada:* RD2
* *Procesamiento:* Modificar el stock de un disco, incrementándolo o decrementándolo.
* *Salida*: Ninguna.

#### RF1: Consultar stock de un disco

* *Actor:* Gestor de tienda
* *Entrada:* RD2
* *Procesamiento:* Consultar stock disponible sobre un disco.
* *Salida*: Ninguna.


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
### Funcionalidad "Gestión de facturación"

#### RFX: Consultar operación

* *Actor:* Gestor de tienda
* *Entrada:* ID de operación
* *Procesamiento:* Consultar información referente a una venta o pago.
* *Salida:* Ninguna

#### RFX: Modificar operación

* *Actor:* Gestor de tienda
* *Entrada:* ID de operación
* *Procesamiento:* Modificar una operación
* *Salida*: Ninguna

#### RF3: Borrar operación

* *Actor:* Gestor de tienda
* *Entrada:* RDX
* *Procesamiento:* Borrar una tupla referente a una operación
* *Salida*: RDX

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
### Funcionalidad "Gestión de pedido"

#### RFX: Realizar pedido

* *Actor:* Gestor de tienda
* *Entrada:* RDX
* *Procesamiento:* Borrar una tupla referente a una operación
* *Salida*: RDX

#### RFX: Mostrar datos de un pedido

* *Actor:* Gestor de tienda
* *Entrada:* RDX
* *Procesamiento:* Mostrar información referente a un pedido realizado
* *Salida*: Ninguna

#### RFX: Cancelar pedido

* *Actor:* Gestor de tienda
* *Entrada:* RDX
* *Procesamiento:* Cancelar un pedido
* *Salida*: Ninguna

#### RFX: Marcar pedido como recibido

* *Actor:* Gestor de tienda
* *Entrada:* RDX
* *Procesamiento:* Marcar un pedido como efectuado correctamente, y almacenar
la información relativa al stock en la tienda
* *Salida*: Ninguna

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
## Requisitos de datos
### RDX: DATOS ALMACENADOS EN \underline{STOCK}

* ID
* Título
* Año
* Nombre grupo
* CD/Vinilo


##### RDX: DATOS ALMACENADOS EN \underline{OPERACIÓN}

* ID Operación
* ID Artículo
* Cantidad
* Facturación
* Descripción
* Fecha

##### RDX: DATOS ALMACENADOS EN \underline{PEDIDO}

* ID Pedido
* ID Artículo
* Fecha

### Funcionalidad "Gestión de bares"

#### Requisitos funcionales

#### Requisitos de datos


### Funcionalidad "Gestión de grupos musicales"

#### Requisitos funcionales

#### Requisitos de datos


# Diseño

## Diagrama de flujo de datos y esquemas externos

## Diagrama conceptual completo

## Esquemas de operación y navegación

## Diseño lógico

## Diseño físico

## Descripción de la solución implementada
