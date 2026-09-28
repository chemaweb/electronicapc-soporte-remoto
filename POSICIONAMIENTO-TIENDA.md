# Plan de posicionamiento gratuito — ELECTRONICAPC.COM

Objetivo: conseguir visitas de clientes con intención de compra y convertirlas
en ventas, **sin gastar dinero en publicidad**. Solo tiempo.

> Cómo se ha hecho este diagnóstico: desde el entorno donde trabajo no se
> puede abrir electronicapc.com directamente (la red lo bloquea), así que el
> diagnóstico sale de lo que Google y otros buscadores tienen indexado de la
> tienda. Todo lo que marco como "comprobar" hay que verificarlo tú en la
> web real.

---

## 1. Diagnóstico rápido (lo que ven hoy los buscadores)

| Qué se ve | Problema | Prioridad |
|---|---|---|
| `electronicapc.com/36-electronica` aparece en buscadores como **"500 Server Error"** | Google indexa una página rota: mala imagen y posicionamiento perdido | 🔴 Alta |
| Conviven URLs antiguas (`/62-servidores`, `/index.php`, `http://…`) con las nuevas (`/categoria/altavoces/`, `/smartphones-telefonos/`, `/guia/…`) | Contenido duplicado y la autoridad de las URLs viejas se pierde si no se redirige | 🔴 Alta |
| Títulos con la marca escrita de dos formas: "ELECTRONICAPC.COM" y "ElectronicaPC", y títulos genéricos como "tienda de informática online." en `/descubre/padelpoint` | Menos clics desde Google y páginas que compiten entre sí | 🟠 Media |
| Unos 25.000 productos, casi seguro con las descripciones del proveedor | Google ve el mismo texto en cientos de tiendas → posicionan las grandes (PcComponentes, Amazon) | 🟠 Media |
| Casi ninguna reseña pública (Facebook: 2; directorios: 0). La competencia local (p. ej. Erson Electrónica, La Roda) tiene 4,8★ | Sin reseñas no sales en el mapa ni generas confianza | 🔴 Alta |
| Ya tienes guías (`/guia/mejores-portatiles-estudiantes-2026/`) | ✅ Buen punto de partida: hay que hacer más y enlazarlas a las categorías | — |
| Tienes un servicio que las grandes tiendas no tienen: **soporte remoto + WhatsApp** | Es tu mejor argumento de venta y casi no se aprovecha para el SEO | 🟢 Oportunidad |

---

## 2. Semana 1 — Arreglos técnicos (gratis, se hacen una vez)

1. **Google Search Console** (search.google.com/search-console): da de alta el
   dominio y envía el sitemap (`/sitemap.xml` o el que genere tu plataforma).
   Revisa *Páginas → No indexadas* y *Errores de servidor (5xx)*.
2. **Bing Webmaster Tools**: impórtalo desde Search Console en un clic (así
   cubres también Bing, DuckDuckGo y Copilot).
3. **Redirecciones 301** de todas las URLs antiguas a sus equivalentes nuevas:
   - `/36-electronica` → la categoría nueva de electrónica.
   - `/62-servidores` → la categoría nueva de servidores.
   - `/index.php` → `/`.
   - `http://` y `www.` → `https://electronicapc.com/` (una sola versión).
   Search Console → *Páginas* te da la lista completa de URLs viejas.
4. **Unifica los títulos de página** con el formato
   `Qué es + palabra clave | ElectronicaPC`, por ejemplo:
   - Portada: `Tienda de informática online con soporte técnico | ElectronicaPC`
   - Categoría: `Comprar portátiles baratos con envío en 24/48 h | ElectronicaPC`
   Meta descripción con los beneficios: *IVA incluido, envío en 24/48 h,
   Bizum/PayPal, asesoramiento por WhatsApp*.
5. **Revisa páginas sueltas** como `/descubre/padelpoint`: si no aportan nada,
   quítalas del índice (`noindex`) o redirígelas.
6. **No indexes los filtros ni las ordenaciones** (`?orden=`, `?precio=`,
   combinaciones de filtros): mira que lleven `canonical` a la categoría.
7. **Datos estructurados**: comprueba con search.google.com/test/rich-results
   que cada ficha de producto lleva el marcado `Product` con precio,
   disponibilidad, marca y **GTIN/EAN**, y que la portada lleva el marcado
   `Organization`/`LocalBusiness` con dirección y teléfono. La mayoría de
   plataformas (PrestaShop, WooCommerce) lo hacen con un módulo gratuito.
8. **Velocidad**: pasa la portada, una categoría y un producto por
   pagespeed.web.dev y arregla lo que salga en rojo (imágenes en WebP, lazy
   load, quitar módulos que no uses).

---

## 3. Semana 2 — Los canales gratis con más compradores

### 3.1 Google Merchant Center: listados gratuitos (lo más importante)

Con 25.000 productos, **este es el canal gratuito que más ventas trae**.
Google muestra gratis tus productos en la pestaña *Shopping*, en *Imágenes* y
en bloques de productos de la búsqueda normal, sin pagar por clic.

1. Crea la cuenta en merchants.google.com y verifica el dominio.
2. Envía el feed de productos: tu plataforma lo genera con un módulo
   (PrestaShop: "Google Merchant Center"; WooCommerce: "Google Listings &
   Ads"). Lo imprescindible: **GTIN/EAN**, precio con IVA, stock, envío
   (solo península) y política de devoluciones.
3. Rellena envío y devoluciones en la propia cuenta: Google sube los
   productos que ofrecen envío rápido y devoluciones claras.
4. Repítelo en **Microsoft Merchant Center** (Bing Shopping), también gratis.

### 3.2 Perfil de Empresa de Google (Google Maps)

Para "tienda informática La Roda", "reparación ordenadores Albacete",
"soporte informático remoto":

- Categoría principal: *Tienda de informática*. Secundarias: *Servicio de
  reparación de ordenadores*, *Tienda de electrónica*, *Tienda de móviles*.
- Horario, fotos reales del local y del equipo, enlace a la web y botón de
  WhatsApp.
- Publica 1 novedad a la semana (oferta, producto, consejo).
- Añade los servicios: *Soporte remoto*, *Configuración de equipos*,
  *Montaje de PC*.
- Repite lo mismo en **Bing Places** y en **Apple Business Connect**
  (Apple Maps), también gratis.

### 3.3 Reseñas (el cuello de botella actual)

Pasar de 2 reseñas a 30-50 es lo que más mejora el mapa y la conversión.

- Consigue el enlace corto de reseña en tu Perfil de Empresa
  (*Pedir reseñas*).
- Mándalo **por WhatsApp 3-5 días después de cada entrega** y al acabar
  cada sesión de soporte remoto:
  > "Hola, soy Chema de ElectronicaPC. ¿Llegó todo bien? Si te hemos
  > ayudado, nos harías un favor enorme dejando tu opinión aquí: [enlace].
  > ¡Gracias!"
- Mételo también en el email de confirmación de envío y en un papel dentro
  del paquete (con un código QR).
- Contesta a **todas** las reseñas, también a las malas.
- No regales nada a cambio de reseñas: va contra las normas de Google.

### 3.4 Directorios locales (citas NAP)

Mismo nombre, dirección y teléfono **exactamente igual** en todos:
Páginas Amarillas, Cylex, Firmania, empresasespanolas.net, QDQ, Infobel,
Hotfrog. Tú ya sales en algunos de ellos; entra, reclama la ficha y
complétala con la web y el horario.

---

## 4. Semanas 3-12 — Contenido que atrae compradores

Las grandes tiendas te ganan en "comprar portátil HP". Tú puedes ganar en
**búsquedas largas con intención de compra**, donde ellas no escriben nada.

### 4.1 Guías de compra (2 al mes)

Sigue con el formato de `/guia/`. Cada guía:
- Responde a una duda real ("¿qué portátil compro para…?").
- Recomienda 3-6 productos **que tengas en stock**, con enlace a la ficha.
- Enlaza a la categoría correspondiente.
- Termina con: *"¿Dudas? Te asesoramos por WhatsApp antes de comprar."*

Ideas por las que compiten pocas tiendas:
- Mejor portátil para trabajar desde casa por menos de 600 €
- Qué ordenador comprar a una persona mayor (y cómo se lo configuramos)
- Router WiFi para casa grande o casa de pueblo: qué elegir
- Qué tablet comprar a un niño en 2026
- Portátil para autónomos: factura electrónica, VeriFactu y copias de
  seguridad
- Móvil Xiaomi vs Samsung por menos de 300 €
- Impresora para casa que gaste poca tinta

**Cómo sacar más ideas gratis:** escribe el inicio de una búsqueda en Google
y apunta lo que autocompleta y la sección *"Otras preguntas de los
usuarios"*. Y en Search Console → *Rendimiento*, mira las consultas en las
que sales en la **posición 8-20**: son las que con una guía o un texto mejor
suben a la primera página.

### 4.2 Categorías con texto propio

Las 20-30 categorías que más venden deberían tener 150-300 palabras propias
arriba o abajo del listado: para quién es cada tipo de producto, qué mirar
al comprar y preguntas frecuentes. Empieza por portátiles, smartphones,
monitores, routers e impresoras.

### 4.3 Fichas de producto

No hace falta reescribir las 25.000. Mira en *Informes → Productos más
vendidos* los **50-100 productos que más venden** o que más margen dejan y
escribe para cada uno un párrafo propio ("Para quién es", "Lo mejor", "Ojo
con…") además de la descripción del proveedor.

### 4.4 Tu ventaja: el soporte remoto

Tienes el programa **ElectrónicaPC Soporte Remoto** (el de este
repositorio), con botón de WhatsApp incluido. Úsalo como gancho:

- **Página de servicio** `/soporte-informatico-remoto/`: qué resuelves, cómo
  funciona, precio o tarifa, botón de descarga del programa y botón de
  WhatsApp. Sirve para buscar clientes en toda España ("soporte informático
  remoto", "técnico informático a distancia", "asistencia informática
  online").
- **Argumento de venta en cada ficha y en el carrito**: *"Compra aquí y te lo
  dejamos configurado por soporte remoto"*. Eso no lo ofrece PcComponentes y
  justifica una pequeña diferencia de precio.
- Cada cliente que instala el programa tiene tu WhatsApp siempre a mano →
  vuelve a comprarte.

---

## 5. Redes y canales directos (30 min al día como máximo)

- **WhatsApp Business**: sube el catálogo de productos estrella, usa los
  *Estados* para ofertas diarias y etiqueta los chats (*Presupuesto*,
  *Pedido*, *Postventa*). Es tu mejor canal para convertir.
- **Grupos y páginas locales de Facebook** (La Roda, Albacete, Villarrobledo,
  Tarazona…): comparte consejos útiles y ofertas de vez en cuando, sin
  mandar spam.
- **YouTube Shorts / TikTok / Reels**: vídeos de 30 s grabados con el móvil
  ("unboxing", "portátil de 400 € vs de 800 €", "así configuramos un PC por
  soporte remoto"). En la descripción, enlace a la ficha del producto.
- **Google Discover / noticias**: cuando publiques una guía, compártela ese
  mismo día en tus redes para que Google la descubra antes.

---

## 6. Conversión: que las visitas acaben comprando

Checklist rápido (casi todo son ajustes de tu plataforma):

- [ ] Botón de WhatsApp visible en ficha de producto y carrito ("¿Dudas con
      este producto?").
- [ ] Reseñas de Google visibles en la portada (widget gratuito).
- [ ] Coste y plazo de envío visibles **en la ficha**, antes del carrito.
- [ ] Devoluciones explicadas en una línea en la ficha ("14 días para
      devolverlo").
- [ ] Compra como invitado (sin obligar a registrarse).
- [ ] Email de carrito abandonado (módulo gratuito en PrestaShop/WooCommerce).
- [ ] Fotos de "mi tienda física en La Roda": la gente compra antes a quien
      ve que existe de verdad.
- [ ] Destacar en la cabecera: *Envío 24/48 h · IVA incluido · Bizum ·
      Soporte por WhatsApp*.

---

## 7. Medir (una vez al mes, 20 minutos)

Herramientas gratis: **Search Console**, **Google Analytics 4**, **Merchant
Center** y el panel de **Perfil de Empresa**.

| Indicador | Dónde se mira | Objetivo a 90 días |
|---|---|---|
| Clics orgánicos al mes | Search Console → Rendimiento | +50 % |
| Clics de listados gratuitos | Merchant Center → Rendimiento | De 0 a crecimiento constante |
| Reseñas en Google | Perfil de Empresa | 30+ con una media de 4,5★ o más |
| Llamadas y clics en "Cómo llegar" | Perfil de Empresa → Rendimiento | En aumento |
| Tasa de conversión | GA4 → Monetización | 1-2 % (lo normal en electrónica) |
| Errores 5xx y páginas no indexadas | Search Console → Páginas | 0 errores 5xx |

Para saber de dónde vienen las ventas de WhatsApp y de las redes, añade
parámetros UTM a los enlaces que compartes, por ejemplo:
`https://electronicapc.com/guia/…?utm_source=whatsapp&utm_medium=estado&utm_campaign=ofertas`.

---

## 8. Calendario resumido

| Semana | Tareas |
|---|---|
| 1 | Search Console + Bing, redirecciones 301, títulos, datos estructurados, velocidad |
| 2 | Merchant Center (Google + Microsoft), Perfil de Empresa, empezar a pedir reseñas |
| 3 | Página de soporte remoto + directorios locales |
| 4-12 | 2 guías al mes · 5 categorías con texto a la semana · 10 fichas top a la semana · pedir reseña en cada venta · 3 vídeos cortos a la semana |
| Cada mes | Revisar los indicadores y reforzar lo que funcione |

**Si solo puedes hacer tres cosas:** (1) arreglar los errores y
redirecciones en Search Console, (2) activar los listados gratuitos de
Merchant Center y (3) pedir una reseña de Google después de cada venta.
