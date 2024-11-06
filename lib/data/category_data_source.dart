import 'package:flutter/services.dart';
import 'dart:convert';
import '../../domain/models/category_model.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryDataSource implements CategoryRepository {
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final data = await rootBundle.loadString('assets/v1.json');
    final jsonData = jsonDecode(data);
    return (jsonData['categories'] as List)
        .map((item) => CategoryModel.fromJson(item))
        .toList();
  }
}
