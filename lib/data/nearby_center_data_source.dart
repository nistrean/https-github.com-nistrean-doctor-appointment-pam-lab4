import 'package:flutter/services.dart';
import 'dart:convert';
import '../domain/models/nearby_centers_model.dart';
import '../domain/repositories/nearby_center_repository.dart';

class NearbyCenterDataSource implements NearbyCenterRepository {
  @override
  Future<List<NearbyCenterModel>> fetchNearbyCenters() async {
    final data = await rootBundle.loadString('assets/v1.json');
    final jsonData = jsonDecode(data);
    return (jsonData['nearby_centers'] as List)
        .map((item) => NearbyCenterModel.fromJson(item))
        .toList();
  }
}