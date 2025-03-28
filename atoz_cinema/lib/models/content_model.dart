import 'package:flutter/material.dart';

class Content {
  final String name;
  final String imageUrl;
  final String titleImageUrl;
  final String description;
  final Color color;

  const Content({
    required this.name,
    required this.imageUrl,
    required this.titleImageUrl,
    required this.description,
    required this.color,
  });
}
