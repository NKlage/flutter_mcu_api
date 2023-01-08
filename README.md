<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Encapsulates the Marvel REST API for easy integration with your Flutter App

## Features

- simple authentication, the TS value is calculated in the Interceptor based on the API keys
- All endpoints including their relations are managed in endpoint objects
- Query parameters can be easily passed as a map
- All existing image variations are available as an enumeration

## Getting started

First of all you need the API keys, you can get them on the [developer](https://developer.marvel.com) page.
Please note and consider the terms of use of the Marvel API.

## Usage

### 

### Get a list of characters
```dart
    // prepare
    MarvelApi api = MarvelApi(
        publicApiKey: 'YOUR PUBLIC API KEY',
        privateApiKey: 'YOUR PRIVATE API KEY'
    );
    ...

    // get hte the first 20 characters
    final ApiResponse<CharacterDataContainer> response = await api.characters.fetch();
    
    // get the next 20 characters with query parameter
    final ApiResponse<CharacterDataContainer> response = await api.characters.fetch(args: { 'offset': 20 });

    // get a character based on the Id
    final ApiResponse<CharacterDataContainer> response = await api.characters.fetch(id: 4711);

```

### Get Relations from Character
```dart 
    // get a comic list by character
    final ApiResponse<CharacterDataContainer> response = await api.characters.comics(4711);

    // get a event list from character
    final ApiResponse<CharacterDataContainer> response = await api.characters.events(4711);
    
    ...
```
The available relations are mapped in the respective endpoints.

### get image variation

```dart
    final imageUrl = response.thumbnail?.getImageVariant(ImageSizes.standard_large);
```

## Additional information
It's worth taking a look at the API How-Tos and the Interactive Documentation of the Marvel API.

## TODO

- [x] get characters 
- [x] get comics 
- [x] get creators 
- [x] get events 
- [x] get series 
- [x] get stories 
- [x] add example
- [x] check for null in fromJson methods
- [ ] complete this readme
- [ ] changelog for release
- [ ] add license
