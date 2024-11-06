// doctor_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/models/doctor_model.dart';
import '../../domain/repositories/doctor_repository.dart';

abstract class DoctorEvent {}

class LoadDoctorEvent extends DoctorEvent {}

class DoctorState {
  final List<DoctorModel> doctors;
  DoctorState(this.doctors);
}

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository repository;

  DoctorBloc(this.repository) : super(DoctorState([])) {
    on<LoadDoctorEvent>((event, emit) async {
      final doctors = await repository.fetchDoctors();
      emit(DoctorState(doctors));
    });
  }
}
