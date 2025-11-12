
<p align="center">
  Getx Dependencies Binding Annotation Generator
</p>
<p align="center">
  <!-- Pub Version -->
  <a href="https://pub.dev/packages/getx_binding_annotation"><img src="https://img.shields.io/pub/v/getx_binding_annotation?logo=dart" alt="PubVersion"></a>
  <!-- Pub Points} -->
  <a href="https://pub.dev/packages/getx_binding_annotation"><img src="https://img.shields.io/pub/points/getx_binding_annotation?logo=dart" alt="PubPoints"></a>
  <!-- GitHub Repo -->
  <a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation"><img src="https://img.shields.io/badge/repo-Getx_Binding_Annotation-yellowgreen?logo=github" alt="build"></a>
  <!-- GitHub Stars -->
  <a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation"><img src="https://img.shields.io/github/stars/felangel/bloc.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
  <!-- DartDoc -->
  <a href="https://pub.dev/documentation/getx_binding_annotation/latest"><img src="https://img.shields.io/badge/dartdocs-latest-blue.svg" alt="Latest Dartdocs"></a>
</p>
<p align="center">
  <a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation"><img src="https://img.shields.io/badge/Android-black?logo=android" alt="android"></a>
  <a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation"><img src="https://img.shields.io/badge/iOS-black?logo=apple" alt="ios"></a>
  <a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation"><img src="https://img.shields.io/badge/Web-black" alt="ios"></a>
  <a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation"><img src="https://img.shields.io/badge/Linux-black?logo=linux" alt="linux"></a>
  <a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation"><img src="https://img.shields.io/badge/Windows-black" alt="windows"></a>
  <a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation"><img src="https://img.shields.io/badge/MacOS-black?logo=apple" alt="mac-os"></a>

</p>

A Code Generator Plugin to Generate Pages and Dependencies for GetX State Manager base on Annotation.
This package designed to prevent adding dependencies one by one into the lists of the GetX. You can use it for pages or controllers or any other dependencies.

### Contents:
* [Getting Started](#Getting-Started)
* [Usage](#Usage)
* [Options](#Options)
  * [Some Examples](#Some-Examples)
* [Docs](#Docs)
* [About Author](#About-Author)
* [Packages and Dependencies](#Packages-and-Dependencies)
* [Testing](#Testing)

## Getting Started

Add dependencies in the `pubspec.yaml`:
```yaml
dependencies:
  get: ^latest
  getx_binding_annotation: ^latest

dev_dependencies:
  build_runner: ^latest
  getx_binding_annotation_generator: ^latest
```

Get the Changes by:
```shell
flutter pub get
```
or
```shell
dart pub get
```

## Usage

```dart
import 'package:getx_binding_annotation/getx_binding_annotation.dart';
```

Add desired `@Annotation` on top of the desired class and set the desired Options.

Such as:

`HomePage`
```dart
@GetPut.page(isInitial: true)
class HomePage extends GetView<HomePageController> {}
```

`Unknown or Not Found Page`
* Unknown Page must be defined
```dart
@GetPut.page(isUnknown: true)
class UnknownPage extends GetView<HomePageController> {}
```
```dart
@GetPut.controller()
class SettingsController extends GetxController {}
```

then you should run the `build_runner` to generate the codes and creating related file and include all the pages, controllers, components and repositories in one place and prepared to use.
You can use
```shell
dart pub run build_runner build --delete-conflicting-outputs
```

After a successful generation then you would have the new `main.get_put.dart` file in the project root folder `/lib` beside `main.dart`
then you can use the plugin to put variables in suitable places and use them.
```dart
import 'main.get_put.dart';
```

- `GetPutBindings()` : for dependency injection
- `GetPutPages.pages` : will set all pages into GetX
- `GetPutPages.initialRoute.name` : will set the initial route
- `GetPutPages.unknownRoute` : will set the unknown route for undetected routes in the app

Make change in `main` at `'main.dart'`:
```dart
void main() {
  GetPutBindings().dependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// You must set these four functions and variables in your Project
      initialBinding: GetPutBindings(), // Inject all dependencies
      getPages: GetPutPages.pages, // Add all the pages in GetX context
      initialRoute: GetPutPages.initialRoute.name, // Set initial route
      unknownRoute: GetPutPages.unknownRoute, // Set a route for any unknown or undefined route in the app
    );
  }
}
```

### You can check the `/example` for a more complete example, more details and further information.

## Options

You can set some annotations and its Options in the `@Annotation`
Available Options:
- `@GetPut.page()`
  - `as`: Change the Name of the Page in the dependencies and use it as another name.
  - `route`: The plugin will generate a default name based on the page's name, but also, you can set a String for the route and the new route will be used. If the `route` has not been set, the default generate route will use.
  - `isInitial`: You  should set a `initialRoute` for the GetX and the app will start by that page and it's route, so it is mandatory. and you can set your initial page by this flag. The plugin would not throw an exception if you set two or more initial pages, but it will set the first page in the generate pages list that marked as initial page as the default initial route.
  - `isUnknown`: You can set a unknown route for the GetX and the app will show the page by it's route, if there was a change page without valid route. You can set your unknown page by this flag. The plugin would not throw an exception if you set two or more unknown pages, but it will set the first page in the generate pages list that marked as unknown page as the default unknown route.
- `@GetPut.controller()`
    - `as`: Change the Name of the Controller in the dependencies and use it as another name.
- `@GetPut.component()`
    - `as`: Change the Name of the Component in the dependencies and use it as another name.
- `@GetPut.repository()`
    - `as`: Change the Name of Repository in the dependencies and use it as another name.

Some Examples:

`Settings:`
```dart
@GetPut.page()
class SettingsPage extends GetView<SettingsController> {}
```
```dart
@GetPut.controller()
class NotFoundController extends GetxController {}
```

`NotFound:` or `Unknown:`
```dart
@GetPut.page(isUnknown: true)
class NotFoundPage extends GetView<NotFoundController> {}
```
```dart
@GetPut.controller()
class NotFoundController extends GetxController {}
```
`Storage Component:`
```dart
abstract class StorageComponent {}

@GetPut.component(as: StorageComponent)
class StorageComponentImpl {}
```
`Remote DataSource Repository:`
```dart
@GetPut.repository()
class RemoteDataSourceRepository {}
```

## Docs
<a href="https://github.com/reesaam/flutter_getx_dependencies_binding_annotation/tree/main/generator/doc/api"><img src="https://img.shields.io/badge/GitHub-Docs_Repository-important?logo=github" alt="build"></a>

## About Author

### Resam Taghipour
<a href="https://www.resam.site"><img src="https://img.shields.io/badge/Website-resam.site-blue" alt="Pub"></a>
<a href="https://github.com/reesaam"><img src="https://img.shields.io/badge/GitHub-reesaam-black?style=flat&logo=github&link=https%3A%2F%2Fgithub.com%2Freesaam" alt="account"></a>
<a href="https://www.linkedin.com/in/resam"><img src="https://img.shields.io/badge/LinkedIn-resam-blue?logo=linkedin" alt="Pub"></a>
<a><img src="https://img.shields.io/badge/Email-resam@resam.site-important?logo=maildotru" alt="Pub"></a>


## Packages and Dependencies
<a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-red?logo=dart" alt="Pub"></a>
<a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-blue?logo=flutter" alt="Pub"></a>
<a href="https://pub.dev/packages/get"><img src="https://img.shields.io/badge/pub-GetX-blue?logo=dart" alt="Pub"></a>
<a href="https://pub.dev/packages/build_runner"><img src="https://img.shields.io/badge/pub-BuildRunner-red?logo=dart" alt="Pub"></a>
<a href="https://pub.dev/packages/dartdoc"><img src="https://img.shields.io/badge/pub-DartDoc-red?logo=dart" alt="Pub"></a>

## License
This project is licensed under the '**BSD-3-Clause**' License - see the LICENSE for details.

<a href="https://pub.dev/packages/getx_binding_annotation/license"><img src="https://img.shields.io/badge/LICENSE-blue" alt="Pub"></a>