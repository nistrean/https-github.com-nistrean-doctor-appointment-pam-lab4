import 'package:doctor_appointment/domain/models/nearby_centers_model.dart';

abstract class NearbyCenterRepository {
  Future<List<NearbyCenterModel>> fetchNearbyCenters();
}