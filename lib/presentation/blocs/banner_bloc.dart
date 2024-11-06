import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/banner_model.dart';
import '../../domain/repositories/banner_repository.dart';

abstract class BannerEvent {}

class LoadBannersEvent extends BannerEvent {}

class ChangePageEvent extends BannerEvent {
  final int pageIndex;

  ChangePageEvent(this.pageIndex);
}

class BannerState {
  final List<BannerModel> banners;
  final int currentPageIndex;

  BannerState(this.banners, {this.currentPageIndex = 0});
}

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  BannerBloc(this.bannerRepository) : super(BannerState([])) {
    on<LoadBannersEvent>((event, emit) async {
      try {
        final banners = await bannerRepository.fetchBanners();
        emit(BannerState(banners));
      } catch (e) {
        emit(BannerState([]));
      }
    });

    on<ChangePageEvent>((event, emit) {
      emit(BannerState(state.banners, currentPageIndex: event.pageIndex));
    });
  }
}
