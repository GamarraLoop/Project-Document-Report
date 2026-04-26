workspace "Gamarra Loop / ReciTex" "Plataforma de economía circular para el aprovechamiento de residuos textiles del emporio comercial de Gamarra (Lima)." {

    !identifiers hierarchical

    model {

        # ----------------------------------------------------------
        # Personas — actores humanos
        # ----------------------------------------------------------

        confeccionista = person "Confeccionista" "Operario o dueño de un taller textil del emporio Gamarra que genera retazos sobrantes y publica lotes para su recolección desde la app móvil." "Usuario final"

        artesano = person "Artesano / Recolector" "Microemprendedor que reutiliza retazos textiles como insumo productivo. Consulta el catálogo geolocalizado, reserva lotes y coordina el recojo." "Usuario final"

        # ----------------------------------------------------------
        # Sistema in-scope
        # ----------------------------------------------------------

        gamarraLoop = softwareSystem "Gamarra Loop" "Plataforma compuesta por una aplicación móvil (Flutter), una landing page (HTML/CSS/JS) y un conjunto de servicios REST (Spring Boot) que conecta a Confeccionistas con Artesanos para la circularidad de residuos textiles." {
            tags "In Scope"

            # ------------------------------------------------------
            # Containers — vista C4 nivel 2 (4.3.3)
            # ------------------------------------------------------

            mobileApp = container "Mobile App" "Aplicación móvil multiplataforma para Confeccionistas y Artesanos. Captura foto y ubicación GPS del lote, consume el catálogo geolocalizado, gestiona reservas y recibe notificaciones push del recojo." "Flutter (FlutterFlow) / Dart" {
                tags "Mobile"
            }

            landingPage = container "Landing Page" "Sitio estático informativo del proyecto Gamarra Loop / ReciTex. Presenta la propuesta de valor a Confeccionistas, Artesanos y stakeholders externos. No realiza llamadas al backend." "HTML5 / CSS3 / JavaScript" {
                tags "Web"
            }

            api = container "API REST" "Backend monolítico modular que expone endpoints REST autenticados con JWT. Internamente se organiza en 7 bounded contexts (User Profile, Lot Publication, Textile Classification, Reservation, Pickup and Delivery, Expiration, Notification — ver Capítulo V) bajo el patrón Hexagonal Port + Adapter decidido en la sección 4.1.4." "Spring Boot / Java 21" {
                tags "API"
            }
        }

        # ----------------------------------------------------------
        # Sistemas externos — proveedores cloud y SaaS
        # ----------------------------------------------------------

        group "Sistemas externos" {

            cloudVision = softwareSystem "Google Cloud Vision" "Servicio gestionado de Google que clasifica automáticamente imágenes de textiles y devuelve etiquetas y niveles de confianza sobre el material y color del lote." {
                tags "External" "GCP"
            }

            firebaseAuth = softwareSystem "Firebase Authentication" "Servicio gestionado de Google que emite y valida JWT anónimos para identificar a Confeccionistas y Artesanos sin gestión de contraseñas." {
                tags "External" "GCP"
            }

            gcs = softwareSystem "Google Cloud Storage" "Servicio gestionado de Google para almacenar imágenes originales y miniaturas (thumbnails) de los lotes publicados por los Confeccionistas." {
                tags "External" "GCP"
            }

            pubsub = softwareSystem "Google Cloud Pub/Sub" "Servicio gestionado de Google de mensajería asíncrona para desacoplar la publicación de lotes de la clasificación con IA y de las notificaciones." {
                tags "External" "GCP"
            }

            supabase = softwareSystem "Supabase Postgres" "Servicio gestionado externo (no GCP) que provee PostgreSQL con la extensión PostGIS para consultas geoespaciales por proximidad." {
                tags "External" "Database"
            }

            googleMaps = softwareSystem "Google Maps Platform" "Servicio gestionado de Google que provee renderizado de mapas, geocoding inverso y referencias geográficas para localizar lotes y rutas de recojo." {
                tags "External" "GCP"
            }

            fcm = softwareSystem "Firebase Cloud Messaging" "Servicio gestionado de Google para entregar notificaciones push a los dispositivos móviles de Confeccionistas y Artesanos." {
                tags "External" "GCP"
            }

        }

        # ----------------------------------------------------------
        # Relaciones — usuarios → sistema
        # ----------------------------------------------------------

        confeccionista -> gamarraLoop "Publica lotes de retazos textiles capturando foto, ubicación GPS y referencias del taller"
        artesano -> gamarraLoop "Consulta el catálogo geolocalizado, reserva lotes y confirma recojos"

        # ----------------------------------------------------------
        # Relaciones — sistema → integraciones externas
        # ----------------------------------------------------------

        gamarraLoop -> cloudVision "Solicita clasificación automática del material y color del lote" "REST/JSON sobre HTTPS"
        gamarraLoop -> firebaseAuth "Valida tokens JWT anónimos del usuario" "JWKS sobre HTTPS"
        gamarraLoop -> gcs "Persiste imágenes originales y miniaturas comprimidas" "REST sobre HTTPS + Signed URLs"
        gamarraLoop -> pubsub "Publica y consume eventos de dominio (lote.publicado, clasificacion.solicitada, lote.reservado, lote.expirado)" "Pub/Sub API sobre HTTPS"
        gamarraLoop -> supabase "Persiste y consulta agregados (lotes, usuarios, reservas) con índices PostGIS para orden por proximidad" "JDBC sobre TLS"
        gamarraLoop -> googleMaps "Renderiza mapas, obtiene geocoding inverso y referencias geográficas" "Maps JavaScript API + tiles"
        gamarraLoop -> fcm "Envía notificaciones push (publicación exitosa, reserva confirmada, lote por expirar)" "FCM API sobre HTTPS"

        # ----------------------------------------------------------
        # Relaciones a nivel container — vista C4 nivel 2 (4.3.3)
        # ----------------------------------------------------------

        confeccionista -> gamarraLoop.mobileApp "Publica lotes textiles capturando foto, ubicación GPS y referencias del taller"
        confeccionista -> gamarraLoop.landingPage "Consulta información institucional del proyecto"
        artesano -> gamarraLoop.mobileApp "Consulta el catálogo geolocalizado de lotes, reserva y confirma recojos"
        artesano -> gamarraLoop.landingPage "Consulta información institucional del proyecto"

        gamarraLoop.mobileApp -> gamarraLoop.api "Consume endpoints REST autenticados con JWT" "JSON sobre HTTPS"

        gamarraLoop.mobileApp -> firebaseAuth "Inicia sesión anónima y obtiene JWT del dispositivo" "Firebase SDK sobre HTTPS"
        gamarraLoop.mobileApp -> googleMaps "Renderiza mapas y obtiene geocoding inverso en el cliente" "Maps SDK + tiles"
        gamarraLoop.mobileApp -> fcm "Registra token de dispositivo y recibe notificaciones push" "FCM SDK sobre HTTPS"

        gamarraLoop.api -> firebaseAuth "Valida tokens JWT entrantes mediante JWKS" "JWKS sobre HTTPS"
        gamarraLoop.api -> cloudVision "Solicita clasificación automática del material y color del lote (vía Anti-Corruption Layer)" "REST/JSON sobre HTTPS"
        gamarraLoop.api -> gcs "Persiste imágenes originales y miniaturas comprimidas" "REST sobre HTTPS"
        gamarraLoop.api -> pubsub "Publica y consume eventos de dominio (lote.publicado, clasificacion.solicitada, lote.reservado, lote.expirado)" "Pub/Sub API sobre HTTPS"
        gamarraLoop.api -> supabase "Persiste y consulta agregados (lotes, usuarios, reservas) con índices PostGIS para orden por proximidad" "JDBC sobre TLS"
        gamarraLoop.api -> fcm "Envía notificaciones push a dispositivos registrados" "FCM API sobre HTTPS"

        # ----------------------------------------------------------
        # Deployment Environment — Production (4.3.4)
        # ----------------------------------------------------------

        deploymentEnvironment "Production" {

            productionMobileDevice = deploymentNode "Dispositivo móvil del usuario" "Smartphone Android o iOS de Confeccionistas y Artesanos donde corre nativamente la aplicación Flutter." "Android 8+ / iOS 14+" {
                productionMobileApp = containerInstance gamarraLoop.mobileApp
            }

            productionGitHubPages = deploymentNode "GitHub Pages" "Servicio de hospedaje estático de GitHub que sirve sitios públicos asociados a un repositorio. Free tier permanente, deploy automático desde branch." "CDN global de GitHub" {
                tags "External"
                productionLandingPage = containerInstance gamarraLoop.landingPage
            }

            productionGcp = deploymentNode "Google Cloud Platform" "Proveedor cloud principal donde corre el backend de Gamarra Loop y los servicios gestionados de IA, mensajería, almacenamiento y autenticación." "Región us-central1" {
                tags "GCP"

                productionCloudRun = deploymentNode "Cloud Run" "Servicio gestionado de contenedores stateless con escalado automático a cero instancias durante períodos de inactividad. Free tier permanente de 2M requests/mes." "Cloud Run" {
                    productionApi = containerInstance gamarraLoop.api
                }

                productionCloudVision = softwareSystemInstance cloudVision
                productionFirebaseAuth = softwareSystemInstance firebaseAuth
                productionGcs = softwareSystemInstance gcs
                productionPubsub = softwareSystemInstance pubsub
                productionGoogleMaps = softwareSystemInstance googleMaps
                productionFcm = softwareSystemInstance fcm
            }

            productionSupabase = deploymentNode "Supabase Cloud" "Proveedor cloud externo a GCP que provee PostgreSQL gestionado con extensión PostGIS habilitable. Free tier permanente sin límite temporal." "Región us-east-1" {
                tags "External"
                productionSupabaseInstance = softwareSystemInstance supabase
            }

        }

    }

    views {

        # ==========================================================
        # 4.3.1 — System Landscape (vista organizacional, sin integraciones técnicas)
        # ==========================================================
        systemLandscape "SystemLandscape" "Vista de paisaje organizacional del ecosistema de Gamarra Loop dentro del emporio comercial de Gamarra. Muestra al sistema y a sus dos segmentos objetivo, omitiendo deliberadamente los sistemas externos técnicos para enfocar la mirada humana del producto." {
            include confeccionista artesano gamarraLoop
            autolayout tb
        }

        # ==========================================================
        # 4.3.2 — System Context (C4 Level 1, vista técnica completa)
        # ==========================================================
        systemContext gamarraLoop "SystemContext" "Vista de contexto C4 (nivel 1) del sistema Gamarra Loop, sus usuarios primarios y los sistemas externos con los que se integra técnicamente." {
            include *
            autolayout tb
        }

        # ==========================================================
        # 4.3.3 — Container (C4 Level 2)
        # ==========================================================
        container gamarraLoop "Containers" "Vista de containers C4 (nivel 2) del sistema Gamarra Loop. Muestra las cajas ejecutables que componen la solución (Mobile App, Landing Page, API REST), sus relaciones internas y las integraciones con sistemas externos. La API REST es un monolito modular cuyos 7 bounded contexts internos se detallan a nivel de componentes en el Capítulo V." {
            include *
            autolayout tb
        }

        # ==========================================================
        # 4.3.4 — Deployment (Production)
        # ==========================================================
        deployment gamarraLoop "Production" "DeploymentProduction" "Vista de deployment C4 del sistema Gamarra Loop en su entorno de producción. La API REST se despliega como contenedor stateless en Google Cloud Run, la landing page estática en GitHub Pages y la aplicación móvil corre nativa en los dispositivos de los usuarios. La persistencia transaccional vive en Supabase Postgres (servicio gestionado externo a GCP)." {
            include *
            autolayout tb
        }

        # ==========================================================
        # Estilos
        # ==========================================================
        styles {
            element "Person" {
                shape Person
                background #08427B
                color #ffffff
            }
            element "Usuario final" {
                background #08427B
                color #ffffff
            }
            element "Staff interno" {
                background #1168bd
                color #ffffff
            }
            element "Stakeholder externo" {
                background #6c757d
                color #ffffff
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "In Scope" {
                background #1168bd
                color #ffffff
            }
            element "External" {
                background #999999
                color #ffffff
            }
            element "GCP" {
                background #4285f4
                color #ffffff
            }
            element "Database" {
                background #3ECF8E
                color #ffffff
                shape Cylinder
            }
            element "Mobile" {
                background #1168bd
                color #ffffff
                shape MobileDevicePortrait
            }
            element "Web" {
                background #1168bd
                color #ffffff
                shape WebBrowser
            }
            element "API" {
                background #1168bd
                color #ffffff
                shape Hexagon
            }
        }
    }

    configuration {
        scope softwaresystem
    }
}
