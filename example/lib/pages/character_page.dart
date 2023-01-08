import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mcu_api/flutter_mcu_api.dart';

class CharacterPage extends StatefulWidget {
  final McuApi mcuApi;
  const CharacterPage({Key? key, required this.mcuApi}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  int offset = 0;
  int limit = 10;

  _CharacterPageState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // add queryParams to request
      // see api documentation to find params-> https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
      future: widget.mcuApi.characters.fetch(args: {
        'orderBy': '-modified',
        'limit': limit,
        'offset': offset,
      }),
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

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            offset = limit + offset;
          });
        },
        child: Text('next $limit'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 45.0),
          child: Column(
            children: [
              Text(
                'Characters',
                style: textTheme.headlineSmall,
              ),
              Text(
                characterContainer.attributionText ?? '',
                style: textTheme.caption,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: gridItems.length,
                    itemBuilder: (context, index) {
                      return gridItems[index];
                    }),
              ),
            ],
          ),
        ),
      ),
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
                // get the standard large image
                // see https://developer.marvel.com/documentation/images
                character.thumbnail
                        ?.getImageVariant(ImageSizes.standard_large) ??
                    'https://via.placeholder.com/140x140.png?text=Upsi',
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
