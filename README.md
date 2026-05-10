
<a name="6."></a>
# Capítulo VI: Solution UX Design

<a name="6.1."></a>
## 6.1. Style Guidelines. 

En este capítulo se presentan los lineamientos de estilo y las herramientas que se emplearán para el diseño del proyecto. Se detallarán los criterios visuales, componentes y recursos que permitirán mantener una identidad a lo largo de la aplicación, así como una experiencia de usuario clara y consistente. Estos lineamientos servirán como base para el desarrollo de las interfaces, asegurando una experiencia confortable para el usuario.

<a name="6.1.1."></a>
### 6.1.1. General Style Guidelines.

**Brand Overview**

En un entorno como Gamarra, donde la producción textil es intensa y constante, la generación de residuos de tela es un problema frecuente que muchas veces no cuenta con una gestión adecuada. Retazos, excedentes y materiales sobrantes suelen ser descartados sin ser aprovechados, a pesar de su potencial para reutilización.
GamarraLoop nace como una solución digital que conecta talleres de confección con artesanos y recolectores, facilitando la reutilización de estos residuos textiles. A través de una aplicación móvil, los talleres pueden publicar sus excedentes de manera rápida, mientras que los usuarios interesados pueden visualizar, filtrar y ubicar estos materiales en tiempo real.
La plataforma integra funcionalidades como geolocalización y clasificación automática de materiales mediante inteligencia artificial, permitiendo mejorar la visibilidad de los recursos disponibles. De esta manera, se busca reducir el desperdicio textil, fomentar la economía circular y generar valor tanto económico como ambiental dentro del ecosistema de Gamarra.

**Brand Name**

El nombre GamarraLoop surge de la combinación de dos conceptos clave. Por un lado, “Gamarra”, que representa el principal emporio textil del Perú y el contexto donde se desarrolla la problemática. Por otro lado, “Loop”, que hace referencia a un ciclo continuo, simbolizando la reutilización de materiales dentro de un modelo de economía circular.

El nombre transmite la idea de cerrar el ciclo de vida de los textiles, evitando que los residuos se conviertan en desecho y, en su lugar, se reintegren al sistema productivo. Además, el uso del término en inglés le da un enfoque moderno, tecnológico y fácil de recordar, alineado con una solución digital innovadora.
A continuación, se presenta el logotipo de GamarraLoop, el cual refleja visualmente el concepto de reutilización textil mediante elementos como hilo, aguja y formas circulares que representan el flujo continuo de materiales dentro de la plataforma.
<img src="./assets/GamarraLoop-logo.jpeg" alt="Logo GamarraLoop" width="591">

**Typography**

La tipografía en GamarraLoop cumple un papel importante en la claridad de la información y en la experiencia de uso dentro de la aplicación. Se ha priorizado el uso de fuentes modernas y altamente legibles, considerando que los usuarios necesitan interactuar de forma rápida y sencilla mientras gestionan o buscan materiales textiles.
La jerarquía tipográfica se organiza en cuatro niveles principales: headings (encabezados) para destacar secciones clave, body (texto) para el contenido general, buttons (botones) para acciones relevantes dentro del sistema y links (enlaces) para la navegación. Esta estructura permite mantener un orden visual claro y consistente en toda la interfaz.
Para el diseño se han seleccionado tipografías que equilibran estética y funcionalidad. Se emplea una fuente con mayor personalidad para títulos y elementos destacados, aportando identidad visual a la aplicación, mientras que para los textos se utiliza una tipografía limpia y fácil de leer, asegurando una correcta comprensión del contenido en distintos dispositivos. Además, el uso de colores como verde oscuro y negro en la tipografía refuerza la identidad del proyecto y mejora el contraste visual.

<img src="./assets/Typograpy.png" alt="Typography" width="301">

**Colors**

La elección de colores en GamarraLoop está orientada a reflejar sostenibilidad, orden y conexión con el entorno textil, alineándose con el enfoque de economía circular del proyecto.

**Color Primario(Beige claro):**

El beige claro se utiliza como color predominante en los fondos de la aplicación. Este color transmite calidez, naturalidad y simplicidad, evocando materiales textiles y generando una experiencia visual más amigable. Además, permite que los demás elementos destaquen sin sobrecargar la interfaz.

**Colores Secundarios(Verde y negro):**

El verde oscuro es el color principal de interacción dentro de la aplicación. Representa sostenibilidad, reutilización y crecimiento, valores clave del proyecto. Se utiliza en botones, encabezados y elementos importantes de la interfaz.

El negro complementa la paleta aportando contraste y elegancia. Se emplea principalmente en textos y algunos elementos estructurales, garantizando una alta legibilidad.

**Colores de texto(Negro y Verde):**

El negro se utiliza para el contenido principal debido a su alta legibilidad sobre fondos claros. Por otro lado, el verde oscuro se emplea en títulos, etiquetas y elementos destacados, reforzando la identidad visual de la plataforma.

<a name="6.1.2."></a> 
### 6.1.2. Web, Mobile & Devices Style Guidelines.

En GamarraLoop se contempla el desarrollo de una aplicación móvil, diseñada para ofrecer una experiencia fluida y accesible en distintos dispositivos. Se prioriza una interacción simple e intuitiva, donde tanto talleres como artesanos puedan utilizar la plataforma sin complicaciones, accediendo rápidamente a funciones clave como la publicación, búsqueda y reserva de lotes de material textil.
En cuanto al diseño, se aplicará el patrón visual en Z, organizando los elementos de manera natural y fácil de seguir. En la parte superior se ubican el logo y las acciones principales, seguidos por opciones de navegación claras, y posteriormente el contenido relevante como los lotes disponibles, filtros y detalles. Esta estructura permite que los usuarios comprendan rápidamente el funcionamiento de la aplicación y ejecuten acciones de forma eficiente.
Para la interfaz, se utilizará una paleta de colores basada en tonos beige claro, verde oscuro y negro, transmitiendo una identidad visual alineada con la sostenibilidad y la reutilización de materiales. Asimismo, se incorporan colores de estado que permiten identificar rápidamente la disponibilidad de los lotes (verde para disponible, amarillo para reservado y rojo para no disponible), facilitando la toma de decisiones dentro de la aplicación.
En relación con el componente tecnológico, la aplicación integrará servicios de clasificación automática de imágenes, permitiendo identificar el tipo de material textil a partir de fotografías. Esta información se mostrará de manera clara dentro de la interfaz, ayudando a los usuarios a evaluar rápidamente los lotes disponibles y mejorando la confiabilidad del sistema.

<a name="6.2."></a> 
## 6.2. Information Architecture.

En esta sección se detallan las decisiones y fundamentos relacionados con la organización del contenido dentro de la aplicación móvil de GamarraLoop. Estas propuestas están orientadas a garantizar que los usuarios, tanto talleres como artesanos, puedan comprender y utilizar las funcionalidades de la plataforma de manera sencilla y sin fricciones.
Las decisiones consideran aspectos clave como la organización de la información, el etiquetado de los elementos, la navegación dentro de la aplicación y los mecanismos de búsqueda y filtrado de lotes. Todo ello con el objetivo de facilitar el acceso a los materiales disponibles, optimizar la interacción entre usuarios y mejorar la experiencia general dentro del sistema.

<a name="6.2.1."></a>
### 6.2.1. Labeling Systems. 

En esta sección se describen los sistemas de etiquetado utilizados en la aplicación móvil de GamarraLoop. El objetivo del etiquetado es facilitar la comprensión del sistema, permitiendo que los usuarios identifiquen rápidamente las funciones disponibles y naveguen de manera intuitiva. Se busca mantener consistencia en los nombres, utilizando términos claros, simples y familiares para los talleres y artesanos.

**Etiquetas de Encabezados (Headings)**

Las etiquetas de encabezado permiten organizar el contenido principal dentro de la aplicación:

-	Inicio (Home): Muestra un resumen de los lotes disponibles y accesos rápidos a las funciones principales.
-	Publicar Lote: Permite a los talleres registrar y publicar nuevos residuos textiles.
-	Explorar Materiales: Sección donde los artesanos pueden visualizar los lotes disponibles.
-	Mis Lotes: Lista de publicaciones realizadas por el usuario (taller).
-	Mis Reservas: Muestra los lotes que el artesano ha reservado.
-	Perfil: Información del usuario y configuración básica de la cuenta.
  
**Etiquetas Textuales (Text Labels)**

Estas etiquetas ayudan a los usuarios a identificar acciones dentro de la aplicación:

-	Publicar (Publish): Acción para registrar un nuevo lote de tela.
-	Tomar Foto (Take Photo): Permite capturar la imagen del material.
-	Reservar (Reserve): Acción para asegurar un lote disponible.
-	Disponible (Available): Indica que el lote puede ser recolectado.
-	Reservado (Reserved): Indica que el lote ya fue apartado por un usuario.
-	Entregado (Delivered): Confirma que el lote ya fue recogido.
-	Buscar (Search): Permite encontrar materiales específicos.
-	Filtrar (Filter): Ayuda a refinar resultados por tipo, color u otros atributos.
-	Ubicación (Location): Muestra el punto de recojo del lote.
-	Confirmar Entrega: Acción del taller para validar la entrega del lote.
-	Confirmar Recepción: Acción del artesano para confirmar que recibió el material.
  
**Etiquetas Icónicas (Iconic Labels)**

Se utilizan íconos para reforzar visualmente las acciones y facilitar la navegación:

-	Cámara: Representa la captura de imágenes del lote.
-	Ubicación (pin): Indica el punto de recojo en el mapa.
-	Caja / paquete: Representa los lotes de material textil.
-	Campana: Notificaciones sobre reservas o cambios de estado.
-	Check: Confirmación de entrega o recepción.
-	Reloj: Indica estado pendiente o en proceso.
-	Indicadores de estado:
  - Verde: lote disponible
  - Amarillo: lote reservado
  -	Rojo: lote no disponible (cancelado o expirado)
  -	Gris: lote entregado
 	
Estas etiquetas se aplican de manera consistente en toda la aplicación móvil, permitiendo que los usuarios reconozcan fácilmente las funciones sin necesidad de aprendizaje previo. Además, el uso de indicadores visuales facilita la interpretación rápida del estado de los lotes, mejorando la eficiencia y la experiencia general dentro de la plataforma.

<a name="6.2.2"></a>
### 6.2.2. Searching Systems.

Los sistemas de búsqueda de GamarraLoop están diseñados para que los usuarios puedan encontrar lotes de material textil de manera rápida e intuitiva dentro de la aplicación móvil. Estos métodos priorizan la simplicidad, la accesibilidad y la relevancia de la información, facilitando la conexión entre talleres y artesanos.
**Búsqueda por texto**

Los usuarios pueden buscar materiales ingresando palabras clave en la barra de búsqueda, como tipo de tela, color o características específicas (por ejemplo, “algodón”, “denim”, “retazos”). Esto permite encontrar lotes de manera directa y reducir el tiempo de exploración.

**Búsqueda por filtros**

La aplicación incorpora opciones de filtrado que permiten refinar los resultados según distintos criterios, como tipo de material, color, estado del lote o cercanía. Esta funcionalidad facilita a los artesanos encontrar materiales que se ajusten a sus necesidades específicas.

**Búsqueda por ubicación**

La plataforma utiliza la ubicación del usuario para mostrar los lotes disponibles más cercanos. Esto resulta clave para optimizar el proceso de recojo, permitiendo a los artesanos identificar rápidamente opciones accesibles dentro de su zona.

**Búsqueda por mapa**

Se incluye un mapa interactivo donde los usuarios pueden visualizar la ubicación de los lotes publicados. A través de indicadores visuales, es posible identificar rápidamente su estado (disponible, reservado, etc.), lo que facilita la toma de decisiones en tiempo real.

Estos métodos se complementan entre sí, ofreciendo una experiencia de búsqueda eficiente y flexible, adaptada a las necesidades tanto de los talleres como de los artesanos dentro del ecosistema de reutilización textil.

<a name="6.2.3."></a> 
### 6.2.3. SEO Tags and Meta Tags. 

Los SEO Tags y Meta Tags permiten que la landing page informativa de GamarraLoop sea fácilmente identificable por los motores de búsqueda, mejorando su visibilidad y facilitando que potenciales usuarios (talleres y artesanos) encuentren la solución. Además, contribuyen a una correcta visualización en distintos dispositivos y a una mejor organización del contenido web.

**Title**

El título define el nombre del proyecto en el navegador y en los resultados de búsqueda:

<title>GamarraLoop - Reutilización de Residuos Textiles</title>

**Description**

Describe de forma breve el propósito de la plataforma, destacando su enfoque en economía circular:

<meta name="description" content="GamarraLoop es una plataforma que conecta talleres textiles con artesanos para reutilizar residuos de tela, promoviendo la economía circular en Gamarra.">

**Keywords y Viewport**

Se incluyen etiquetas que ayudan a posicionar la página y asegurar su correcta adaptación en dispositivos móviles:

<meta name="keywords" content="reciclaje textil, Gamarra, economía circular, reutilización de telas, residuos textiles, artesanos, talleres">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

**Author / Copyright**

Identifica la autoría del contenido y los derechos del proyecto:

<meta name="author" content="Equipo GamarraLoop">

<meta name="copyright" content="GamarraLoop 2026">

Estos elementos permiten mejorar la presencia digital de GamarraLoop y asegurar una correcta indexación en buscadores, facilitando la difusión de la propuesta y el acceso a nuevos usuarios interesados en la reutilización de materiales textiles.

<a name="6.2.4."></a>
### 6.2.4. Navigation Systems. 

El sistema de navegación de GamarraLoop está diseñado para ser claro, intuitivo y consistente dentro de la aplicación móvil. Se busca que tanto talleres como artesanos puedan desplazarse por la plataforma sin dificultad, identificando rápidamente las acciones principales como publicar un lote, explorar materiales, reservar o gestionar sus actividades.
En la aplicación móvil, la navegación se organiza mediante una barra inferior (bottom navigation) que agrupa las funciones más utilizadas, tales como Inicio, Explorar, Publicar, Mis actividades y Perfil. Esta estructura permite a los usuarios moverse rápidamente entre secciones y realizar acciones clave en pocos pasos, reduciendo la complejidad de uso.
Adicionalmente, se emplea navegación contextual dentro de cada sección. Por ejemplo, desde la vista de exploración, el usuario puede acceder al detalle de un lote, visualizar su ubicación y ejecutar acciones como reservar o contactar al taller. Esto mantiene un flujo continuo y lógico durante la interacción.
El uso de iconos, colores e indicadores visuales refuerza la navegación, facilitando la identificación de acciones importantes y estados de los lotes. Los colores de estado (disponible, reservado, etc.) permiten interpretar rápidamente la información sin necesidad de leer en detalle.
Asimismo, la integración de funcionalidades como geolocalización y clasificación automática de materiales se presenta de forma transparente dentro de la navegación, asegurando que el usuario acceda a información relevante en el momento adecuado.
En conjunto, el sistema de navegación está diseñado para ofrecer una experiencia fluida, rápida y sin fricciones, adaptándose a las necesidades de los distintos tipos de usuarios dentro del ecosistema de reutilización textil.

<a name="6.3."></a>
## 6.3. Landing Page UI Design.

En esta sección se presenta la propuesta de UI para el Landing Page de GamarraLoop. La propuesta traduce las decisiones de arquitectura de información descritas en la sección 6.2 (Labeling, Searching, SEO/Meta y Navigation Systems) y los lineamientos visuales definidos en 6.1 (paleta beige/verde oscuro/negro, tipografía con jerarquía de cuatro niveles y componentes basados en Material Design) hacia un layout concreto y navegable.

El objetivo del Landing es comunicar de forma directa la propuesta de valor del modelo de negocio a los tres segmentos objetivo (Confeccionistas de Gamarra, recolectores/artesanos y aliados del ecosistema circular) y conducir a cada uno hacia el call-to-action correspondiente. El recorrido visual prioriza un hero claro con la propuesta de valor, secciones secuenciales de beneficios por segmento, evidencia (modelo de economía circular y bounded contexts del producto), formulario de contacto y footer con enlaces legales e institucionales, de modo que la lectura siga el patrón Z típico de landings de conversión.

Se elabora la propuesta en dos vistas obligatorias: Desktop Web Browser y Mobile Web Browser. Ambas comparten estructura semántica, jerarquía y CTAs, pero ajustan densidad de información, agrupamiento de secciones y patrón de navegación según el dispositivo, siguiendo principios de diseño responsivo y diseño inclusivo (contraste suficiente, áreas táctiles adecuadas, textos escalables y navegación operable por teclado).

<a name="6.3.1."></a>
### 6.3.1. Landing Page Wireframe.

Los wireframes presentan la estructura de bloques, jerarquía y flujo de lectura del Landing Page antes de aplicar color, tipografía final e imágenes. Su objetivo es validar la arquitectura de información, el orden de los contenidos y la ubicación de los call-to-action por segmento.

Herramienta utilizada: Figma. Enlace al archivo de wireframes: https://www.figma.com/design/J1GM7YvXifXyoHeMuIaHdP/Landing-Page?node-id=0-1

**Versión Desktop Web Browser**

<img src="https://raw.githubusercontent.com/GamarraLoop/Project-Document-Report/main/assets/landing-page/landing-page-wireframe-desktop.png" alt="Landing Page Wireframe — Desktop" width="900"/>

El wireframe Desktop organiza el contenido en una retícula amplia que aprovecha el ancho del viewport. La barra de navegación superior fija expone las secciones principales del sitio (Inicio, Cómo funciona, Segmentos, Sobre nosotros, Contacto) y ubica el CTA primario a la derecha, siguiendo el principio de jerarquía visual y consistencia con los patrones convencionales de la web. El hero ocupa el primer pliegue con un encabezado que comunica la propuesta de valor y un CTA dominante; las secciones siguientes presentan los beneficios diferenciados por segmento (Confeccionistas y recolectores) en bloques paralelos, aplicando el principio de proximidad y simetría para facilitar la comparación. El cierre incluye un bloque de evidencia del modelo circular, un formulario de contacto y un footer con enlaces a términos y condiciones, política de privacidad y redes.

La distribución refleja las decisiones de la sección 6.2: las etiquetas de navegación (Labeling Systems) se mantienen breves y orientadas a la acción del visitante; el buscador y los filtros previstos en 6.2.2 quedan reservados para las Web Applications, mientras que el Landing privilegia un recorrido lineal y guiado.

**Versión Mobile Web Browser**

<img src="https://raw.githubusercontent.com/GamarraLoop/Project-Document-Report/main/assets/landing-page/landing-page-wireframe-mobile.png" alt="Landing Page Wireframe — Mobile" width="320"/>

El wireframe Mobile reorganiza el mismo contenido en una columna única. La barra de navegación se reduce a un patrón hamburger menu para liberar espacio del viewport y el CTA primario se mantiene visible en el hero. Las secciones que en Desktop aparecen en paralelo (beneficios por segmento) se apilan verticalmente, preservando el mismo orden de lectura y la misma jerarquía tipográfica. Se aplican principios de diseño inclusivo: tamaños de toque mínimos de 44px para botones y enlaces, contraste adecuado en los placeholders y suficiente espacio en blanco para evitar errores de pulsado.

La consistencia entre ambas versiones garantiza que un visitante que descubra GamarraLoop desde el móvil y luego acceda desde escritorio reconozca la misma estructura, los mismos labels y los mismos puntos de conversión.

<a name="6.3.2."></a>
### 6.3.2. Landing Page Mock-up.

Los mock-ups aplican sobre la estructura validada en los wireframes el Design System definido en 6.1: paleta beige claro como fondo, verde oscuro como color de interacción principal, negro para tipografía y elementos estructurales, jerarquía tipográfica de cuatro niveles (headings, body, buttons, links) y componentes de Material Design. El resultado refleja la identidad visual de GamarraLoop —sostenibilidad, reutilización y conexión con el ecosistema textil— manteniendo la legibilidad y el contraste necesarios para diseño inclusivo.

Herramienta utilizada: Figma. Enlace al archivo de mock-ups: https://www.figma.com/design/J1GM7YvXifXyoHeMuIaHdP/Landing-Page?node-id=1-2

**Versión Desktop Web Browser**

<img src="https://raw.githubusercontent.com/GamarraLoop/Project-Document-Report/main/assets/landing-page/landing-page-mockup-desktop.png" alt="Landing Page Mock-up — Desktop" width="900"/>

En la versión Desktop, los bloques heredados del wireframe se visten con la paleta institucional. El hero incorpora una imagen ilustrativa del contexto Gamarra/textil junto al headline principal y un CTA verde oscuro de alto contraste sobre el fondo beige, dirigido al segmento Confeccionista. Las secciones intermedias presentan los beneficios por segmento con iconografía coherente con el logotipo (hilo, aguja, ciclo) reforzando la asociación de marca, y aplican espaciado generoso para favorecer la legibilidad. Los CTAs secundarios mantienen el mismo color de interacción pero con variantes de jerarquía (botón sólido para acción primaria, botón outline para acción secundaria), siguiendo la guía de componentes establecida en 6.1.

Las decisiones de arquitectura de información se preservan: las etiquetas de los CTAs son específicas por segmento (por ejemplo, "Publicar excedentes" para Confeccionistas y "Explorar lotes disponibles" para recolectores) y redirigen a las vistas correspondientes de las Web Applications o a la sección de descarga de la aplicación móvil, cumpliendo el requisito del enunciado sobre consistencia entre Landing y aplicaciones.

**Versión Mobile Web Browser**

<img src="https://raw.githubusercontent.com/GamarraLoop/Project-Document-Report/main/assets/landing-page/landing-page-mockup-mobile.png" alt="Landing Page Mock-up — Mobile" width="320"/>

La versión Mobile traslada el Design System a la columna única definida en el wireframe. Los CTAs verde oscuro mantienen el mismo tamaño de toque y contraste que en Desktop; la tipografía conserva la jerarquía y se ajusta el tamaño base para garantizar legibilidad en pantallas pequeñas sin necesidad de zoom. El menú hamburger despliega la misma estructura de navegación definida en 6.2.4, y los formularios reducen los campos visibles por fila a uno solo, manteniendo un solo punto de foco a la vez para favorecer la accesibilidad.

En conjunto, los mock-ups Desktop y Mobile evidencian la aplicación del Design System, los principios de diseño visual (jerarquía, contraste, proximidad, consistencia), el diseño inclusivo (contraste de color suficiente, áreas táctiles adecuadas, tipografía escalable, foco visible) y la arquitectura de información definida en 6.2, asegurando una experiencia coherente entre el Landing Page y los demás productos digitales de la solución.
<a name="6.4."></a>
## 6.4. Applications UX/UI Design. 
<a name="6.4.1"></a>
### 6.4.1. Applications Wireframes. 
<a name="6.4.2"></a>
### 6.4.2. Applications Wireflow Diagrams.


<a name="7."></a>

# Conclusiones

<a name="9."></a>

# Referencia bibliográficas

- Ellen MacArthur Foundation. (2017). _A new textiles economy: Redesigning fashion’s future_. https://ellenmacarthurfoundation.org/

- European Environment Agency. (2019). _Textiles in Europe’s circular economy_. https://www.eea.europa.eu/

<a name="10."></a>

# Anexos

