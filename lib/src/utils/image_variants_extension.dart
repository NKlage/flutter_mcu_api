import 'package:flutter_marvel_api/src/models.dart' show ImageSummary;
import 'package:flutter_marvel_api/src/utils.dart';

/// Get the Marvel Image Variant
extension ImageVariants on ImageSummary {
  /// Variant from ImageSummary
  String? getImageVariant(ImageSizes variant) {
    if (null == path || null == extension) {
      return null;
    }

    // fullsize image has no variants
    if (ImageSizes.full == variant) {
      return '$path.$extension';
    }

    return '$path/${variant.name}.$extension';
  }
}
