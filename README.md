# Reminder App using Firebase Notification Flutter
# [![Flutter logo][]][flutter.dev]

[![Build Status - Cirrus][]][Build status]
[![Discord badge][]][Discord instructions]
[![Twitter handle][]][Twitter badge]
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/5631/badge)](https://bestpractices.coreinfrastructure.org/projects/5631)

Flutter is Google's SDK for crafting beautiful, fast user experiences for
mobile, web, and desktop from a single codebase. Flutter works with existing
code, is used by developers and organizations around the world, and is free and
open source.

## Documentation

* [Install Flutter](https://flutter.dev/get-started/)
* [Flutter documentation](https://flutter.dev/docs)
* [Development wiki](https://github.com/flutter/flutter/wiki)
* [Contributing to Flutter](https://github.com/flutter/flutter/blob/master/CONTRIBUTING.md)

For announcements about new releases, follow the
[flutter-announce@googlegroups.com](https://groups.google.com/forum/#!forum/flutter-announce)
mailing list. Our documentation also tracks [breaking
changes](https://flutter.dev/docs/release/breaking-changes) across releases.

## Terms of service

The Flutter tool may occasionally download resources from Google servers. By
downloading or using the Flutter SDK you agree to the Google Terms of Service:
https://policies.google.com/terms

For example, when installed from GitHub (as opposed to from a prepackaged
archive), the Flutter tool will download the Dart SDK from Google servers
immediately when first run, as it is used to execute the `flutter` tool itself.
This will also occur when Flutter is upgraded (e.g. by running the `flutter
upgrade` command).

## About Flutter

We think Flutter will help you create beautiful, fast apps, with a productive,
extensible and open development model, whether you're targeting iOS or Android,
web, Windows, macOS, Linux or embedding it as the UI toolkit for a platform of
your choice.

### Beautiful user experiences

We want to enable designers to deliver their full creative vision without being
forced to water it down due to limitations of the underlying framework.
Flutter's [layered architecture] gives you control over every pixel on the
screen and its powerful compositing capabilities let you overlay and animate
graphics, video, text, and controls without limitation. Flutter includes a full
[set of widgets][widget catalog] that deliver pixel-perfect experiences whether
you're building for iOS ([Cupertino]) or Android ([Material]), along with
support for customizing or creating entirely new visual components.

<p align="center"><img src="https://github.com/flutter/website/blob/main/src/assets/images/docs/homepage/reflectly-hero-600px.png?raw=true" alt="Reflectly hero image"></p>

### Fast results

Flutter is fast. It's powered by the same hardware-accelerated 2D graphics
library that underpins Chrome and Android: [Skia]. We architected Flutter to
support glitch-free, jank-free graphics at the native speed of your device.
Flutter code is powered by the world-class [Dart platform], which enables
compilation to 32-bit and 64-bit ARM machine code for iOS and Android, as well
as JavaScript for the web and Intel x64 for desktop devices.

<p align="center"><img src="https://github.com/flutter/website/blob/main/src/assets/images/docs/homepage/dart-diagram-small.png?raw=true" alt="Dart diagram"></p>

### Productive development

Flutter offers stateful hot reload, allowing you to make changes to your code
and see the results instantly without restarting your app or losing its state.

[![Hot reload animation][]][Hot reload]

### Extensible and open model

Flutter works with any development tool (or none at all), and also includes
editor plug-ins for both [Visual Studio Code] and [IntelliJ / Android Studio].
Flutter provides [tens of thousands of packages][Flutter packages] to speed your
development, regardless of your target platform. And accessing other native code
is easy, with support for both [FFI] and [platform-specific APIs][platform
channels].

Flutter is a fully open-source project, and we welcome contributions.
Information on how to get started can be found in our
[contributor guide](CONTRIBUTING.md).

[Flutter logo]: https://github.com/flutter/website/blob/archived-master/src/_assets/image/flutter-lockup-bg.jpg?raw=true
[flutter.dev]: https://flutter.dev
[Build Status - Cirrus]: https://api.cirrus-ci.com/github/flutter/flutter.svg
[Build status]: https://cirrus-ci.com/github/flutter/flutter/master
[Discord instructions]: https://github.com/flutter/flutter/wiki/Chat
[Discord badge]: https://img.shields.io/discord/608014603317936148
[Twitter handle]: https://img.shields.io/twitter/follow/flutterdev.svg?style=social&label=Follow
[Twitter badge]: https://twitter.com/intent/follow?screen_name=flutterdev
[layered architecture]: https://flutter.dev/docs/resources/inside-flutter
[architectural overview]: https://docs.flutter.dev/resources/architectural-overview
[widget catalog]: https://flutter.dev/widgets/
[Cupertino]: https://docs.flutter.dev/development/ui/widgets/cupertino
[Material]: https://docs.flutter.dev/development/ui/widgets/material
[Skia]: https://skia.org/
[Dart platform]: https://dart.dev/
[Hot reload animation]: https://github.com/flutter/website/blob/main/src/assets/images/docs/tools/android-studio/hot-reload.gif?raw=true
[Hot reload]: https://docs.flutter.dev/development/tools/hot-reload
[Visual Studio Code]: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
[IntelliJ / Android Studio]: https://plugins.jetbrains.com/plugin/9212-flutter
[Flutter packages]: https://pub.dev/flutter
[FFI]: https://flutter.dev/docs/development/platform-integration/c-interop
[platform channels]: https://flutter.dev/docs/development/platform-integration/platform-channels
[interop example]: https://github.com/flutter/flutter/tree/master/examples/platform_channel
