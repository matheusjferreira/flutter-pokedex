<!-- # pokedex

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

# Pokedex

> ## The Project:

A simple app, which is basically a small pokédex (pokémon dictionary item, from the anime "Pokémon").

* Figma(prototype):
![figma](https://user-images.githubusercontent.com/59848966/169747880-82141878-650f-4ac1-896a-42b7d0e0b124.png)

* Result:
![result](https://user-images.githubusercontent.com/59848966/169372273-19f5b059-88ea-4a7b-b961-27bb290b3d8a.png)

> ## Features:

* MVC architecture;
* modular;
* modular for reactivity;
* dio for api request;
* launch icon;
* launch name;

> ## Arch:

    root
    ....├─ modules
    ........└─ home
    ............├─ controllers
    ................└─ home_controller.dart
    ............├─ models
    ................└─ person_model.dart
    ............├─ pages
    ................└─ home_page.dart
    ............└─ home_module.dart
    ....├─ shared
    ........└─ core
    ............├─ app_fonts.dart
    ............└─ app_palette.dart
    ....├─ app_module.dart
    ....├─ app_widget.dart
    ....└─ main.dart

> ## Endpoint:

api: https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json;

> ## Dependencies:

Flutter version: 3.0.0;<br>
Packages:

    cached_network_image: ^3.2.1
    dio: ^4.0.6
    flutter_modular: ^5.0.2

> ## Framework and Tools:

* figma;
* vs code;
* flutter & dart;
* android emulator;

> ## License:

    MIT License

    Copyright (c) 2022 Matheus Ferreira

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
