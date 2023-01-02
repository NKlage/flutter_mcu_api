import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_marvel_api/flutter_marvel_api.dart';

class CreatorPage extends StatefulWidget {
  final MarvelApi marvelApi;
  const CreatorPage({Key? key, required this.marvelApi}) : super(key: key);

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  int offset = 0;
  int limit = 10;

  _CreatorPageState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // add queryParams to request
      // see api documentation to find params-> https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
      future: widget.marvelApi.creators.fetch(args: {
        'orderBy': '-modified',
        'limit': limit,
        'offset': offset,
      }),
      builder: (BuildContext ctx,
          AsyncSnapshot<ApiResponse<CreatorDataContainer>> snapshot) {
        if (ConnectionState.done == snapshot.connectionState) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Upsi'),
            );
          }
          // return Text('TEST');
          return _creatorGrid(context, snapshot.requireData);
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  Widget _creatorGrid(
    BuildContext context,
    ApiResponse<CreatorDataContainer> creatorContainer,
  ) {
    List<Creator> creators = [];

    if (HttpStatus.unauthorized == creatorContainer.code) {
      return const Center(
        child: Text('Unauthorized: Check your API Keys!'),
      );
    }

    if (null != creatorContainer.data?.results) {
      creators = creatorContainer.data!.results!;
    }

    List<Widget> gridItems =
        creators.map((value) => _creatorCard(value)).toList();
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
                'Creators',
                style: textTheme.headlineSmall,
              ),
              Text(
                creatorContainer.attributionText ?? '',
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

  Card _creatorCard(Creator creator) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (null != creator.thumbnail?.path)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                // get the standard large image
                // see https://developer.marvel.com/documentation/images
                '${creator.thumbnail?.path!}/standard_large.${creator.thumbnail?.extension!}',
                width: 140,
                height: 140,
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          Text(
            creator.fullName ?? 'unknown',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
