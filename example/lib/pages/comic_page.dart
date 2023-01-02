import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

class ComicPage extends StatefulWidget {
  final MarvelApi marvelApi;
  const ComicPage({Key? key, required this.marvelApi}) : super(key: key);

  @override
  State<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  int offset = 0;
  int limit = 10;

  _ComicPageState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // add queryParams to request
      // see api documentation to find params-> https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
      future: widget.marvelApi.comics.fetch(args: {
        'orderBy': '-modified',
        'limit': limit,
        'offset': offset,
      }),
      builder: (BuildContext ctx,
          AsyncSnapshot<ApiResponse<ComicDataContainer>> snapshot) {
        if (ConnectionState.done == snapshot.connectionState) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Upsi'),
            );
          }
          // return Text('TEST');
          return _comicGrid(context, snapshot.requireData);
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  Widget _comicGrid(
    BuildContext context,
    ApiResponse<ComicDataContainer> comicContainer,
  ) {
    List<Comic> comics = [];

    if (HttpStatus.unauthorized == comicContainer.code) {
      return const Center(
        child: Text('Unauthorized: Check your API Keys!'),
      );
    }

    if (null != comicContainer.data?.results) {
      comics = comicContainer.data!.results!;
    }

    List<Widget> gridItems = comics.map((value) => _comicCard(value)).toList();

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
                'Comics',
                style: textTheme.headlineSmall,
              ),
              Text(
                comicContainer.attributionText ?? '',
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

  Card _comicCard(Comic comic) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (null != comic.thumbnail?.path)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                // get the standard large image
                // see https://developer.marvel.com/documentation/images
                '${comic.thumbnail?.path!}/standard_large.${comic.thumbnail?.extension!}',
                width: 140,
                height: 140,
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          Text(
            comic.title ?? 'unknown',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
