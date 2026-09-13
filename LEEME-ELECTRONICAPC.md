# ElectrónicaPC Soporte Remoto — RustDesk personalizado

Este es el código fuente completo de **RustDesk** (el programa cliente, el mismo
que se instala en tu PC de soporte y en el PC del cliente), con tres cambios
hechos a medida para ElectrónicaPC.com:

1. **Botón de WhatsApp dentro del propio programa** — arriba a la derecha, junto
   al icono de ajustes, siempre visible. Al pulsarlo abre un chat de WhatsApp
   con el número `+34 628 914 200` y el mensaje ya escrito: *"Hola, solicito
   soporte remoto informático."*
2. **Tu logo** — el icono de la aplicación (barra de tareas, acceso directo,
   ventana), y tu logo completo en la pantalla principal del programa.
3. **Tu nombre de marca** — el programa se llama "ElectrónicaPC Soporte
   Remoto" en el título de la ventana, en las propiedades del archivo .exe, en
   el instalador, en la bandeja del sistema y en las rutas de configuración
   internas.

## Aviso importante: por qué esto no es ya un .exe

Este entorno donde te he preparado el código es un contenedor Linux en la
nube, sin Windows. RustDesk se compila con Flutter + Rust y, para Windows,
**solo se puede compilar en un Windows real** (o en un servidor Windows en la
nube). Por eso no puedo entregarte directamente el `.exe` terminado: te doy el
código ya modificado y un robot de compilación (GitHub Actions) que, en unos
20-40 minutos, lo convierte en el instalador de Windows real, gratis.

**Lo que sí he podido hacer aquí:** escribir el código del botón de WhatsApp
siguiendo exactamente el mismo patrón que usa el resto de la app RustDesk
(comprobado línea por línea contra otros botones ya existentes en el
programa), generar tu icono y tu logo en los formatos correctos, y revisar
cada cambio a mano. **Lo que no he podido hacer:** compilarlo yo mismo para
comprobar que no hay ningún error de sintaxis, porque este entorno no tiene
Flutter instalado ni acceso a los servidores de Google/Flutter para
instalarlo. La primera compilación real ocurre en el paso 3 de abajo, en los
servidores de Windows de GitHub. Si algo fallara ahí (poco probable, pero
posible en un proyecto de este tamaño), dime el error exacto que muestre
GitHub Actions y lo arreglamos.

## Qué necesitas

- Una cuenta gratuita en [GitHub](https://github.com/join) (si no tienes ya
  una).
- Un ordenador con `git` instalado, o simplemente subir los archivos desde la
  web de GitHub (te explico las dos formas).
- Nada de Windows, nada de programar: todo el trabajo pesado lo hace GitHub
  gratis en sus propios servidores.

## Paso 1 — Crear el repositorio en GitHub

1. Entra en [github.com/new](https://github.com/new).
2. Ponle un nombre, por ejemplo `electronicapc-soporte-remoto`.
3. Marca **Public** (así los minutos de compilación de GitHub Actions son
   gratis e ilimitados; si lo pones Private tienes un límite mensual gratuito
   que probablemente te sobra para hacer esto una vez, pero Public es más
   simple).
4. No marques ninguna casilla de "añadir README/licencia". Crea el
   repositorio vacío.

## Paso 2 — Subir este código

**Opción A — con git (recomendada si tienes o puedes instalar git):**

Descomprime el zip que te he dado, abre una terminal dentro de esa carpeta, y
ejecuta (sustituyendo la URL por la de tu repositorio, que GitHub te muestra
en la página del paso 1):

```bash
git init
git add -A
git commit -m "ElectronicaPC Soporte Remoto - RustDesk personalizado"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/electronicapc-soporte-remoto.git
git push -u origin main
```

**Opción B — sin git, solo con el navegador:**

GitHub permite arrastrar archivos, pero tiene un límite de 100MB por archivo
y de unos cientos de archivos a la vez por lo que, con un proyecto de este
tamaño, la Opción A es mucho más fiable. Si de verdad no puedes usar git,
dímelo y te preparo una alternativa (por ejemplo, GitHub Desktop, que tiene
interfaz gráfica y no requiere escribir comandos).

## Paso 3 — Compilar el .exe (gratis, en los servidores de GitHub)

1. En tu repositorio ya en GitHub, entra en la pestaña **Actions**.
2. Verás un flujo de trabajo llamado **"Build ElectronicaPC Soporte Remoto
   (Windows x64)"**. Haz clic en él.
3. Pulsa el botón **"Run workflow"** (a la derecha), deja las opciones por
   defecto, y confirma.
4. Espera. Verás una carrera en marcha con varios pasos; tarda normalmente
   entre 20 y 40 minutos porque compila Rust y Flutter desde cero.
5. Cuando termine con un ✓ verde, entra en esa ejecución y baja hasta
   **"Artifacts"** (al final de la página). Ahí encontrarás
   `rustdesk-unsigned-windows-x86_64`: descárgalo, descomprímelo, y dentro
   está tu programa completo, listo para copiar al PC de soporte y al PC del
   cliente.

Si en vez de eso ves algún paso en rojo, es probablemente en el paso final de
firma de código o de creación de la release (no afecta al programa en sí,
solo a esos extras) — el .exe seguirá estando disponible en "Artifacts" igual
que se describe arriba. Si el propio paso "Build rustdesk" o "flutter build
windows" falla, copia el error y lo revisamos juntos.

## Aviso de Windows SmartScreen

Como el ejecutable no está firmado digitalmente (eso cuesta un certificado de
pago, unos 100-300€/año), la primera vez que alguien lo abra en Windows
puede salir un aviso de "Windows protegió tu PC". Es normal para cualquier
programa nuevo sin firmar, no significa que tenga virus — se resuelve
pulsando "Más información" → "Ejecutar de todas formas". Si en el futuro
quieres evitar ese aviso, la opción es comprar un certificado de firma de
código y añadirlo al flujo de compilación; dímelo si llegado el momento
quieres que te ayude con eso.

## Si quieres cambiar el número de WhatsApp o el mensaje más adelante

Está todo junto, muy fácil de encontrar, en un único archivo:
`flutter/lib/desktop/widgets/whatsapp_button.dart`, en estas dos líneas cerca
del principio:

```dart
static const String phoneNumber = '34628914200';
static const String presetMessage =
    'Hola, solicito soporte remoto informático.';
```

Cambias el número o el texto, guardas, subes el cambio a GitHub (`git add -A
&& git commit -m "cambio whatsapp" && git push`) y vuelves a ejecutar el
workflow del Paso 3.

## Resumen técnico de los archivos cambiados/añadidos

- `flutter/lib/desktop/widgets/whatsapp_button.dart` — **nuevo**: el botón de
  WhatsApp.
- `flutter/lib/desktop/pages/desktop_tab_page.dart` — modificado: engancha el
  botón en la barra de título principal, junto al icono de ajustes.
- `flutter/lib/desktop/widgets/tabbar_widget.dart` — modificado: el texto del
  título de la ventana ahora usa el nombre de marca dinámico en vez de
  "RustDesk" fijo.
- `flutter/assets/whatsapp.svg` — **nuevo**: icono oficial de WhatsApp (marca
  de Font Awesome Free, licencia CC BY 4.0, libre para este uso).
- `flutter/assets/icon.png`, `flutter/assets/logo.png`,
  `flutter/assets/logo_dark.png` — **nuevos**: tu logo, recortado y adaptado
  (el logo_dark lleva una peana clara para que el texto negro se siga viendo
  bien en modo oscuro).
- `flutter/windows/runner/resources/app_icon.ico` — sustituido por tu logo
  (icono multi-resolución de Windows).
- `flutter/windows/runner/Runner.rc` — modificado: nombre de la empresa,
  descripción y nombre del producto que Windows muestra en "Propiedades" del
  .exe.
- `flutter/pubspec.yaml` — modificado: descripción del paquete (cosmético).
- `libs/hbb_common/src/config.rs` — modificado: el nombre de marca por
  defecto de toda la aplicación (`APP_NAME`), de donde beben el título de
  ventana, la bandeja del sistema, las rutas de configuración/logs y el
  esquema de enlace `electronicapc://`.
- `.github/workflows/electronicapc-windows-build.yml` — **nuevo**: una
  versión recortada del flujo de compilación oficial de RustDesk, que
  construye solo Windows x64 (el oficial compila 8+ plataformas a la vez,
  cosa que no necesitas y que tardaría horas).

No se ha tocado nada relacionado con el nombre interno del paquete Dart
(`flutter_hbb`) ni el nombre del `.exe` compilado (sigue siendo internamente
`rustdesk.exe`), porque varios scripts internos de empaquetado (el instalador
MSI y el ejecutable portable) dependen de ese nombre exacto de archivo — el
usuario final nunca ve ese detalle técnico, ya que lo que se muestra en
pantalla, en el título de la ventana y en las propiedades del programa es
"ElectrónicaPC Soporte Remoto" en todos los sitios visibles.
