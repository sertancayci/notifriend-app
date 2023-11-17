import 'dart:convert';

import 'package:flutter/material.dart';

class CategoryResponse {
  CategoryResponse({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumbnail,
    required this.status,
    required this.color,
  });

  final int id;
  final String name;
  final String slug;
  final String thumbnail;
  final String status;
  final List<Color> color;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    var colorListJson = json['color'];
    List<Color> convertedColors;

    if (colorListJson is List) {
      // If "color" is already a list, use it directly
      convertedColors = colorListJson.cast<Color>();
    } else if (colorListJson is String) {
      // If "color" is a string, parse it into a list of colors
      List<dynamic> colorList = jsonDecode(colorListJson);
      convertedColors = colorList.map((color) {
        String hexColor = color.replaceAll("#", "");
        int intValue = int.parse(hexColor, radix: 16);
        return Color(intValue);
      }).toList();
    } else {
      // Handle other cases or provide a default value
      convertedColors = [];
    }

    return CategoryResponse(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      thumbnail: json["thumbnail"],
      status: json["status"],
      color: convertedColors,
    );
  }

  // static List<Color> parseColors(List<dynamic> colorList) {
  //   return colorList.map((color) => Color(color)).toList();
  // }
}
