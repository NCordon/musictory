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

*Musictory (Musicians directory)* es un sistema de gestión dirigido al público joven
que toque instrumentos. El sistema modela músicos, personas que tocan uno o varios
instrumentos, los grupos en los que participan y
información de contacto, así como bares o eventos que busquen músicos.
Esto facilita poner en contacto a músicos de una determinada ciudad, por ejemplo,
para formar grupos, poder formular peticiones a otros músicos de tocar juntos, o
contratar a músicos para tocar.

## Áreas funcionales

Entre las áreas funcionales a las que pretendemos dar soporte mediante este
sistema de información, podemos citar:

* Gestión de músicos: Permite registrar y consultar un músico con una información
acerca de los instrumentos que toca. También almacena información sobre los bares
o eventos en los que ha tocado un músico, o los músicos con los que alguna vez ha
tocado.

* Gestión de eventos: Permite registrar, consultar y borrar un evento para el que
se precisen músicos, y los músicos que participaron en él, caso de que se trate de
un evento pasado.

* Gestión de bares: Permite registrar, consultar y borrar un bar, así como
adscribirle eventos (que pueden ser periódicos, p.e., concierto todos los
domingos).

* Gestión de grupos y estilos musicales: Permite introducir, actualizar o eliminar
información acerca de un determinado grupo musical, o un estilo de música. Esta
información podrá adscribirse a los gustos musicales de un músico del sistema.

## Usuarios del sistema

Los usuarios del sistema pueden ser tanto músicos, como gestores de bares/pubs o
organizadores de eventos.

# Análisis de requisitos

## Requisitos funcionales

### Funcionalidad "Gestión de músicos"

La gestión de músicos permite registrar perfiles de músicos, con unas características definidas: gustos musicales, instrumento que tocan, experiencia,
otros músicos relacionados (con los que han tocado), participación en eventos, o
experiencia tocando en bares, ciudad a la que pertenecen, datos de contacto,...

Son los propios usuarios los que se registran en el sistema, y pueden actualizar o
borrar información. En caso de introducir algún evento aún no registrado en el sistema como experiencia, se pide introducir información sobre el mismo.

#### Requisitos funcionales

##### RF1: Dar de alta un nuevo músico

* *Actor:* Músico
* *Entrada:* RD1
* *Procesamiento:* Crear el perfil de un nuevo músico, asociado a un identificador
único en el sistema.
* *Salida:* Ninguna

##### RF2: Actualizar un músico

* *Actor:* Músico
* *Entrada:* RD2
* *Procesamiento:* Actualizar el perfil de un músico
* *Salida*: Ninguna

##### RF3: Mostrar los datos de un músico

* *Actor:* Cualquier actor
* *Entrada:* RD3
* *Procesamiento:* Mostrar los datos disponibles sobre el perfil de un músico
* *Salida*: RD4



#### Requisitos de datos

##### RD1: DATOS ALMACENADOS EN \underline{MÚSICO}

* ID Músico
* Nombre [cadena de caracteres]
* Instrumentos [cadena de caracteres]
* Ciudad [cadena de caracteres]
* Eventos en los que ha participado [lista de EVENTOS RDX]
* Bares en los que ha tocado [lista de BARES RDX]
* Datos de contacto(mail o teléfono) [cadena de caracteres]
* Estilos musicales [lista de ESTILOS RDX]
* Grupos musicales [lista de GRUPOS RDX]

##### RD2: DATOS DE ENTRADA PARA ACTUALIZAR \underline{MÚSICO}

* ID Músico
* Nombre [cadena de caracteres]
* Instrumentos [cadena de caracteres]
* Ciudad [cadena de caracteres]
* Eventos en los que ha participado [lista de EVENTOS RDX]
* Bares en los que ha tocado [lista de BARES RDX]
* Datos de contacto(mail o teléfono) [cadena de caracteres]
* Estilos musicales [lista de ESTILOS RDX]
* Grupos musicales [lista de GRUPOS RDX]


##### RD3: DATOS DE ENTRADA PARA MOSTRAR \underline{MÚSICO}

* ID Músico

##### RD4: DATOS DE SALIDA PARA MOSTRAR \underline{MÚSICO}

* ID Músico
* Nombre [cadena de caracteres]
* Instrumentos [cadena de caracteres]
* Ciudad [cadena de caracteres]
* Eventos en los que ha participado [lista de EVENTOS RDX]
* Bares en los que ha tocado [lista de BARES RDX]
* Datos de contacto(mail o teléfono) [cadena de caracteres]
* Estilos musicales [lista de ESTILOS RDX]
* Grupos musicales [lista de GRUPOS RDX]

### Funcionalidad "Gestión de eventos"

La gestión de eventos posibilita almacenar, modificar y/o eliminar información
sobre algún evento musical (p.e. una *jam session*, un concierto, ...)

#### Requisitos funcionales

##### RFX: Dar de alta un nuevo evento

* *Actor:* Cualquiera
* *Entrada:* RDX
* *Procesamiento:* Crear un evento introduciendo la información requerida.
* *Salida:* Ninguna

##### RFX: Actualizar un evento

* *Actor:* Cualquiera
* *Entrada:* RDX
* *Procesamiento:* Actualizar un evento.
* *Salida*: Ninguna

##### RF3: Mostrar los datos de un evento

* *Actor:* Cualquiera
* *Entrada:* RDX
* *Procesamiento:* Mostrar los datos disponibles sobre un determinado evento
* *Salida*: RDX


#### Requisitos de datos

##### RD1: DATOS ALMACENADOS EN \underline{EVENTO}

* ID Evento
* Nombre del evento[cadena de caracteres]
* Ciudad [cadena de caracteres]
* Fecha [fecha]
* Descripción [cadena de caracteres]

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
