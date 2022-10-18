import 'package:flutter/material.dart';
import 'package:photo_hooks/configuration/app_colors.dart';

import 'package:photo_hooks/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_hooks/bloc/photo_bloc.dart';

void main() async {
  //await Hive.initFlutter();
  //Hive.registerAdapter(PictureAdapter());
  //await Hive.openBox('todos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhotoBloc()..add(LoadPhotoCounter()),
        ),
      ],
      child: MaterialApp(
        title: 'Photos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.appBarColor,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: AppColors.secondaryColor),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.secondaryColor),
            ),
          ),
        ),
        home: const HomeScreen(title: 'Gallery'),
      ),
    );
  }
}
