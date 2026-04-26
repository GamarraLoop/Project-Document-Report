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
        }

        # ----------------------------------------------------------
        # Sistemas externos — proveedores cloud y SaaS
        # ----------------------------------------------------------

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

    }

    views {

        # ==========================================================
        # 4.3.1 — System Landscape (vista organizacional, sin integraciones técnicas)
        # ==========================================================
        systemLandscape "SystemLandscape" "Vista de paisaje organizacional del ecosistema de Gamarra Loop dentro del emporio comercial de Gamarra. Muestra al sistema y a sus dos segmentos objetivo, omitiendo deliberadamente los sistemas externos técnicos para enfocar la mirada humana del producto." {
            include confeccionista artesano gamarraLoop
            autolayout lr
        }

        # ==========================================================
        # 4.3.2 — System Context (C4 Level 1, vista técnica completa)
        # ==========================================================
        systemContext gamarraLoop "SystemContext" "Vista de contexto C4 (nivel 1) del sistema Gamarra Loop, sus usuarios primarios y los sistemas externos con los que se integra técnicamente." {
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
        }
    }

    configuration {
        scope softwaresystem
    }
}
