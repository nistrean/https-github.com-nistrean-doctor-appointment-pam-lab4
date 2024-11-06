import 'package:flutter/services.dart';
import 'dart:convert';
import '../../domain/repositories/banner_repository.dart';
import '../domain/models/banner_model.dart';

class BannerDataSource implements BannerRepository {
  @override
  Future<List<BannerModel>> fetchBanners() async {
    final data = await rootBundle.loadString('assets/v1.json');
    final jsonData = jsonDecode(data);
    return (jsonData['banners'] as List)
        .map((item) => BannerModel.fromJson(item))
        .toList();
  }
}
