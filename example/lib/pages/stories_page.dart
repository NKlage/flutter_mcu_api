import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mcu_api/flutter_mcu_api.dart';

class StoriesPage extends StatefulWidget {
  final McuApi mcuApi;
  const StoriesPage({Key? key, required this.mcuApi}) : super(key: key);

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  int offset = 0;
  int limit = 10;

  _StoriesPageState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // add queryParams to request
      // see api documentation to find params-> https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
      future: widget.mcuApi.stories.fetch(args: {
        'orderBy': '-modified',
        'limit': limit,
        'offset': offset,
      }),
      builder: (BuildContext ctx,
          AsyncSnapshot<ApiResponse<StoryDataContainer>> snapshot) {
        if (ConnectionState.done == snapshot.connectionState) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Upsi'),
            );
          }
          // return Text('TEST');
          return _storiesGrid(context, snapshot.requireData);
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  Widget _storiesGrid(
    BuildContext context,
    ApiResponse<StoryDataContainer> storiesContainer,
  ) {
    List<Story> stories = [];

    if (HttpStatus.unauthorized == storiesContainer.code) {
      return const Center(
        child: Text('Unauthorized: Check your API Keys!'),
      );
    }

    if (null != storiesContainer.data?.results) {
      stories = storiesContainer.data!.results!;
    }

    List<Widget> gridItems =
        stories.map((value) => _storiesCard(value)).toList();

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
                'Stories',
                style: textTheme.headlineSmall,
              ),
              Text(
                storiesContainer.attributionText ?? '',
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

  Card _storiesCard(Story story) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (null != story.thumbnail?.path)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                // get the standard large image
                // see https://developer.marvel.com/documentation/images
                '${story.thumbnail?.path!}/standard_large.${story.thumbnail?.extension!}',
                width: 140,
                height: 140,
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          Text(
            story.originalIssue?.name ?? 'unknown',
            textAlign: TextAlign.center,
          ),
          Text(
            story.title ?? 'unknown',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
