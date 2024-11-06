import '../models/doctor_model.dart';

abstract class DoctorRepository {
  Future<List<DoctorModel>> fetchDoctors();
}