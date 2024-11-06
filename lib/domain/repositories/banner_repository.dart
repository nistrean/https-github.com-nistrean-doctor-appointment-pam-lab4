import '../models/banner_model.dart';

abstract class BannerRepository {
  Future<List<BannerModel>> fetchBanners();
}
