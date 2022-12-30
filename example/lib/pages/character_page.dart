import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late MarvelApi _marvelApi;
  late Future<ApiResponse<CharacterDataContainer>> _characters;

  final String publicApiKey = const String.fromEnvironment('publicKey');
  final String privateApiKey = const String.fromEnvironment('privateKey');

  _CharacterPageState() {
    _marvelApi = MarvelApi(
      publicApiKey: publicApiKey, // use your own public key
      privateApiKey: privateApiKey, // use your own private key
    );
  }

  @override
  void initState() {
    super.initState();
    // add queryParams to request
    // see api documentation to find params-> https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
    Map<String, dynamic> queryParams = {
      'orderBy': '-modified',
      'limit': 100,
    };
    _characters = _marvelApi.characters.fetch(args: queryParams);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _characters,
      builder: (BuildContext ctx,
          AsyncSnapshot<ApiResponse<CharacterDataContainer>> snapshot) {
        if (ConnectionState.done == snapshot.connectionState) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Upsi'),
            );
          }
          return _characterGrid(context, snapshot.requireData);
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  Widget _characterGrid(
    BuildContext context,
    ApiResponse<CharacterDataContainer> characterContainer,
  ) {
    List<Character> characters = [];

    if (HttpStatus.unauthorized == characterContainer.code) {
      return const Center(
        child: Text('Unauthorized: Check your API Keys!'),
      );
    }

    if (null != characterContainer.data?.results) {
      characters = characterContainer.data!.results!;
    }

    List<Widget> gridItems =
        characters.map((value) => _characterCard(value)).toList();

    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.3)),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            return gridItems[index];
          }),
    );
  }

  Card _characterCard(Character character) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (null != character.thumbnail?.path)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '${character.thumbnail?.path!}/standard_large.${character.thumbnail?.extension!}',
                width: 140,
                height: 140,
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          Text(
            character.name ?? 'unknown',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
