import 'package:eduapp/pages/university_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bloc/university_cubit.dart';
import 'model/university_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UniversityAdapter());
  Hive.registerAdapter(UniverResponseAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UniversityCubit(),
      child: MaterialApp(
        title: 'Edu Information',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: UniversityHomePage(),
      ),
    );
  }
}

