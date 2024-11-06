import '../domain/models/doctor_model.dart';
import '../domain/repositories/doctor_repository.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class DoctorDataSource implements DoctorRepository {
  @override
  Future<List<DoctorModel>> fetchDoctors() async {
    final data = await rootBundle.loadString('assets/v1.json');
    final jsonData = jsonDecode(data);
    return (jsonData['doctors'] as List)
        .map((item) => DoctorModel.fromJson(item))
        .toList();
  }
}