import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class AdvancedTile {
  final String title;
  final List<AdvancedTile> tiles;
  bool isExpanded;

  AdvancedTile({
    required this.title,
    this.tiles = const [],
    this.isExpanded = false,
  });
}
