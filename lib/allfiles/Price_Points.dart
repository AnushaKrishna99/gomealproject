import 'dart:ui';
import 'package:collection/collection.dart';

class PricePoint {
  final double x;
  final double y;
  PricePoint({
    required this.x,
    required this.y,
});
  List<PricePoint> get pricePoints {
    final data = <double>[2,4,6,4,7,8,12,10];
    return data
        .mapIndexed(
        ((index, element)=> PricePoint(x: index.toDouble(), y: element)))
        .toList();

  }
}