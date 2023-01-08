import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mcu_api/flutter_mcu_api.dart';

class SeriesPage extends StatefulWidget {
  final McuApi mcuApi;
  const SeriesPage({Key? key, required this.mcuApi}) : super(key: key);

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  int offset = 0;
  int limit = 10;

  _SeriesPageState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // add queryParams to request
      // see api documentation to find params-> https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
      future: widget.mcuApi.series.fetch(args: {
        'orderBy': '-modified',
        'limit': limit,
        'offset': offset,
      }),
      builder: (BuildContext ctx,
          AsyncSnapshot<ApiResponse<SeriesDataContainer>> snapshot) {
        if (ConnectionState.done == snapshot.connectionState) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Upsi'),
            );
          }
          // return Text('TEST');
          return _seriesGrid(context, snapshot.requireData);
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  Widget _seriesGrid(
    BuildContext context,
    ApiResponse<SeriesDataContainer> seriesContainer,
  ) {
    List<Serie> series = [];

    if (HttpStatus.unauthorized == seriesContainer.code) {
      return const Center(
        child: Text('Unauthorized: Check your API Keys!'),
      );
    }

    if (null != seriesContainer.data?.results) {
      series = seriesContainer.data!.results!;
    }

    List<Widget> gridItems = series.map((value) => _seriesCard(value)).toList();
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
                'Series',
                style: textTheme.headlineSmall,
              ),
              Text(
                seriesContainer.attributionText ?? '',
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

  Card _seriesCard(Serie serie) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (null != serie.thumbnail?.path)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                // get the standard large image
                // see https://developer.marvel.com/documentation/images
                '${serie.thumbnail?.path!}/standard_large.${serie.thumbnail?.extension!}',
                width: 140,
                height: 140,
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          Text(
            serie.title ?? 'unknown',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
