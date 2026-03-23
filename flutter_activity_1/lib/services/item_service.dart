import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/item_model.dart';

class ItemService {
  static Future<List<Item>> loadItems() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/beans.json');

    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    return jsonMap.values
        .map((json) => Item.fromJson(json))
        .toList();
  }
}