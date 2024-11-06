import 'package:doctor_appointment/data/doctor_data_source.dart';
import 'package:doctor_appointment/data/nearby_center_data_source.dart';
import 'package:doctor_appointment/presentation/blocs/banner_bloc.dart';
import 'package:doctor_appointment/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/category_data_source.dart';
import 'presentation/blocs/category_bloc.dart';
import 'data/banner_data_source.dart';
import 'presentation/blocs/doctor_bloc.dart';
import 'presentation/blocs/nearby_center_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BannerBloc>(
          create: (context) =>
          BannerBloc(BannerDataSource())..add(LoadBannersEvent()),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(CategoryDataSource())
            ..add(LoadCategoryEvent()),
        ),
        BlocProvider<DoctorBloc>(
          create: (context) =>
          DoctorBloc(DoctorDataSource())..add(LoadDoctorEvent()),
        ),
        BlocProvider<NearbyCenterBloc>(
          create: (context) =>
          NearbyCenterBloc(NearbyCenterDataSource())..add(LoadNearbyCenterEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Doctor Appointment App',
        home: HomePage(),
      ),
    );
  }
}
