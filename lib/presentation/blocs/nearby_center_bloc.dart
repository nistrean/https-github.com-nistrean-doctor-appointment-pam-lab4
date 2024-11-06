import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/nearby_centers_model.dart';
import '../../domain/repositories/nearby_center_repository.dart';

abstract class NearbyCenterEvent {}

class LoadNearbyCenterEvent extends NearbyCenterEvent {}

class NearbyCenterState {
  final List<NearbyCenterModel> nearbyCenters;
  NearbyCenterState(this.nearbyCenters);
}

class NearbyCenterBloc extends Bloc<NearbyCenterEvent, NearbyCenterState> {
  final NearbyCenterRepository repository;

  NearbyCenterBloc(this.repository) : super(NearbyCenterState([])) {
    on<LoadNearbyCenterEvent>((event, emit) async {
      final nearbyCenters = await repository.fetchNearbyCenters();
      emit(NearbyCenterState(nearbyCenters));
    });
  }
}
