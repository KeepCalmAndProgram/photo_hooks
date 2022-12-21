import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_hooks/bloc/photo_bloc.dart';
import 'package:photo_hooks/configuration/app_colors.dart';
import 'package:photo_hooks/database/photo_service.dart';
import 'package:photo_hooks/model/photo_model.dart';
import 'package:photo_hooks/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(PhotoModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => PhotoService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PhotoBloc(RepositoryProvider.of<PhotoService>(context))
                  ..add(RegisterEvent()),
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
      ),
    );
  }
}
