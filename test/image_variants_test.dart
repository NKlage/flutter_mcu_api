import 'package:flutter_mcu_api/flutter_mcu_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should get all image variants from ImageSummary', () {
    final imageSummary = ImageSummary(
        path: 'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d',
        extension: 'jpg');

    expect(imageSummary.getImageVariant(ImageSizes.full),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d.jpg');
    expect(imageSummary.getImageVariant(ImageSizes.detail),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/detail.jpg');

    // Portrait
    expect(imageSummary.getImageVariant(ImageSizes.portrait_small),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/portrait_small.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.portrait_medium),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/portrait_medium.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.portrait_xlarge),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/portrait_xlarge.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.portrait_fantastic),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/portrait_fantastic.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.portrait_uncanny),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/portrait_uncanny.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.portrait_incredible),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/portrait_incredible.jpg');

    // Standard square
    expect(imageSummary.getImageVariant(ImageSizes.standard_small),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/standard_small.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.standard_mediumm),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/standard_mediumm.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.standard_large),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/standard_large.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.standard_xlarge),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/standard_xlarge.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.standard_fantastic),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/standard_fantastic.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.standard_amazing),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/standard_amazing.jpg');

    // Landscape
    expect(imageSummary.getImageVariant(ImageSizes.landscape_small),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/landscape_small.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.landscape_medium),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/landscape_medium.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.landscape_large),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/landscape_large.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.landscape_xlarge),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/landscape_xlarge.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.landscape_amazing),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/landscape_amazing.jpg');

    expect(imageSummary.getImageVariant(ImageSizes.landscape_incredible),
        'http://i.annihil.us/u/prod/marvel/i/mg/c/80/5d93a2fbb917d/landscape_incredible.jpg');
  });
}
