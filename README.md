# OpTime

Este proyecto es un punto de partida para la aplicacion de OpTime.

## Requisitos previos

Antes de comenzar, asegúrate de tener instaladas las siguientes herramientas:

- **Flutter SDK**: [Instalación de Flutter](https://docs.flutter.dev/get-started/install)
- **Dart SDK**: Se incluye con Flutter, pero asegúrate de tener la última versión compatible.
- **Android Studio** o **Visual Studio Code**: IDEs recomendados para desarrollo Flutter.
- **Git**: Para el control de versiones.
- **Dispositivos emuladores o físicos**: Configura un emulador de Android o iOS, o usa un dispositivo físico conectado.

## Versiones requeridas

Es importante que todos los desarrolladores utilicen las mismas versiones de las herramientas para evitar conflictos.

- **Flutter SDK**: `>=3.0.0`
- **Dart**: `>=2.17.0`
- **Android Studio**: `>=2021.1`
- **Xcode** (si desarrollas para iOS): `>=13.0`

Puedes verificar la versión de Flutter ejecutando:

```bash
flutter --version

## Configuración del proyecto

Clona el repositorio:
- git clone <url-del-repositorio>
- cd OpTime

Instala las dependencias de Flutter:
- flutter pub get

Verifica que todo esté configurado correctamente:
- flutter doctor

## Buenas Prácticas de Git

Cada desarrollador debe crear su propia rama antes de trabajar en una nueva funcionalidad o corrección de errores. Usa las siguientes convenciones de nombres para las ramas:

Funcionalidades nuevas: feature/nombre-funcionalidad
Correcciones de errores: bugfix/nombre-del-bug

*Para crear una nueva rama*
- git checkout -b feature/nombre-funcionalidad

*Hacer commits regularmente*
Es importante hacer commits pequeños y frecuentes con descripciones claras de los cambios. Sigue esta convención para los mensajes de commit:
feat: Implementa nueva funcionalidad de login
fix: Corrige error en el widget de inicio

- git add .
- git commit -m "Descripción clara del cambio"

 ## Actualizar la rama main antes de trabajar
Antes de comenzar a trabajar, asegúrate de que tu rama esté actualizada con los últimos cambios en main:
- git checkout main
- git pull origin main
- git checkout feature/nombre-funcionalidad
- git rebase main
Esto evitará conflictos al fusionar tu trabajo más adelante.

## Subir tu rama al repositorio remoto
Cuando hayas terminado tu trabajo, sube tu rama al repositorio remoto:
- git push origin feature/nombre-funcionalidad


Este `README.md` incluye las instrucciones y buenas prácticas necesarias para trabajar en **OpTime**. Asegura una configuración adecuada del entorno de desarrollo, un flujo de trabajo de Git organizado y procedimientos para pruebas y despliegue.
