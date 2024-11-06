class DoctorModel {
  final String image;
  final String fullName;
  final String typeOfDoctor;
  final String locationOfCenter;
  final double reviewRate;
  final int reviewsCount;

  DoctorModel({
    required this.image,
    required this.fullName,
    required this.typeOfDoctor,
    required this.locationOfCenter,
    required this.reviewRate,
    required this.reviewsCount,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      image: json['image'] as String,
      fullName: json['full_name'] as String,
      typeOfDoctor: json['type_of_doctor'] as String,
      locationOfCenter: json['location_of_center'] as String,
      reviewRate: (json['review_rate'] as num).toDouble(),
      reviewsCount: json['reviews_count'] as int,
    );
  }
}
