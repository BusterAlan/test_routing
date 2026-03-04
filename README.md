# test_routing

Aplicación Flutter de ejemplo que demuestra el uso de **auto_route** para la gestión de rutas y navegación, incluyendo integración con un paquete local (`package_a`) que encapsula sus propias rutas.

---

## 📋 Objetivo

Este proyecto forma parte de una práctica de la materia **Programación para Aplicaciones Móviles**, enfocada en el uso de librerías y paquetes de terceros. En este caso se demuestra el aspecto de **Navigation** utilizando el paquete `auto_route`.

---

## 📦 Dependencias principales

| Paquete | Versión | Propósito |
|---|---|---|
| `auto_route` | ^11.1.0 | Gestión declarativa de rutas |
| `equatable` | ^2.0.8 | Comparación de entidades por valor |
| `package_a` | local (`../package_a`) | Paquete local con rutas encapsuladas |

**Dev dependencies:**
- `auto_route_generator` — Generador de código para las rutas
- `build_runner` — Ejecuta la generación de código

---

## 🗂️ Estructura del proyecto

```
lib/
├── entities/
│   └── weather_entity.dart       # Entidad de dominio (WeatherEntity, Condition)
├── mock/
│   └── mock_entries.dart         # Datos de prueba (Monterrey, Seattle, Quito)
├── pages/
│   ├── login_page.dart           # Pantalla de inicio de sesión
│   ├── weather_page.dart         # Pantalla de clima con entity como parámetro
│   ├── account_balance_page.dart # Tab: Account
│   ├── cable_page.dart           # Tab: Cable
│   ├── umbrella_page.dart        # Tab: Umbrella → navega a package_a
│   ├── on_device_training_page.dart # Tab: Device
│   └── navigation/
│       └── dashboard_page.dart   # Shell con BottomNavigationBar + AutoTabsRouter
└── router/
    ├── app_router.dart           # Definición de rutas (@AutoRouterConfig)
    └── app_router.gr.dart        # GENERADO — no editar manualmente
```

---

## 🧭 Arquitectura de navegación

### Router principal

```dart
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: "/"),
    AutoRoute(
      page: DashboardRoute.page,
      path: "/dashboard",
      children: [
        AutoRoute(page: AccountBalanceRoute.page, path: "account", initial: true),
        AutoRoute(page: CableRoute.page, path: "cable"),
        AutoRoute(page: UmbrellaRoute.page, path: "umbrella"),
        AutoRoute(page: OnDeviceTrainingRoute.page, path: "device"),
      ],
    ),
    AutoRoute(page: WeatherRoute.page, path: "/weather"),
    ...PackageARouter().routes,   // ← Rutas del paquete local
  ];
}
```

### Flujo de navegación

```
LoginPage (/)
    │
    └─► DashboardPage (/dashboard)  ← AutoTabsRouter.tabBar
            ├── AccountBalancePage (/account) [initial]
            │       └─► WeatherPage (/weather) [con WeatherEntity]
            ├── CablePage (/cable)
            ├── UmbrellaPage (/umbrella)
            │       └─► HomePage [de package_a]
            │               └─► DetailPage [de package_a]
            └── OnDeviceTrainingPage (/device)
```

---

## ⭐ Características destacadas de auto_route

### 1. Paso de parámetros con type-safety

`auto_route` genera automáticamente una clase `Args` para cada ruta que recibe parámetros, eliminando el uso inseguro de `Map<String, dynamic>`:

```dart
// Definición de la página
@RoutePage()
class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.entity});
  final WeatherEntity entity;
  // ...
}

// Navegación con tipo seguro — el compilador verifica que 'entity' sea provisto
context.router.push(WeatherRoute(entity: MockEntries.rainyCase));
```

El generador produce `WeatherRouteArgs` con `==` y `hashCode`, gracias a `equatable` en `WeatherEntity`.

### 2. Rutas anidadas con AutoTabsRouter

El `DashboardPage` usa `AutoTabsRouter.tabBar` para manejar tabs con navegación propia por cada branch:

```dart
@RoutePage()
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AutoTabsRouter.tabBar(
    routes: [
      AccountBalanceRoute(),
      CableRoute(),
      UmbrellaRoute(),
      OnDeviceTrainingRoute(),
    ],
    builder: (context, child, tabController) {
      final tabsRouter = AutoTabsRouter.of(context);
      return Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          // ...
        ),
      );
    },
  );
}
```

### 3. Integración de rutas de paquetes externos

Las rutas definidas en `package_a` se integran directamente en el router principal con spread:

```dart
...PackageARouter().routes,
```

Esto permite modularizar la navegación entre paquetes sin acoplar el router principal a los detalles internos de `package_a`.

---

## 🚀 Cómo ejecutar

### 1. Generar código de rutas

Tras cualquier cambio en páginas anotadas con `@RoutePage()` o en `app_router.dart`, regenera el archivo `.gr.dart`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

O en modo watch durante el desarrollo:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 2. Ejecutar la app

```bash
flutter pub get
flutter run
```

---

## 📱 Pantallas

| Pantalla | Ruta | Descripción |
|---|---|---|
| Login | `/` | Formulario de usuario y contraseña |
| Dashboard | `/dashboard` | Shell con 4 tabs en la barra inferior |
| Account Balance | `/dashboard/account` | Tab inicial, navega a WeatherPage |
| Cable | `/dashboard/cable` | Tab simple |
| Umbrella | `/dashboard/umbrella` | Tab que navega a `package_a` |
| On Device Training | `/dashboard/device` | Tab simple |
| Weather | `/weather` | Muestra datos de clima recibidos como parámetro |
| Home (pkg_a) | `/home` | Primera pantalla de `package_a` |
| Detail (pkg_a) | `/detail` | Segunda pantalla de `package_a` |

---

## 🔗 Relación con package_a

Este proyecto depende de `package_a` como paquete local en `../package_a`. La dependencia se declara en `pubspec.yaml`:

```yaml
dependencies:
  package_a:
    path: ../package_a
```

Ver el README de [package_a](https://github.com/BusterAlan/package_a/tree/auto_route_navigation) para más detalles sobre cómo encapsula sus propias rutas.