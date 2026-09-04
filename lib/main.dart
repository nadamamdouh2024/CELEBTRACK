import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Data/Requests/ai_chat_request.dart';
import 'Data/Requests/person_details_request.dart';
import 'Data/Requests/person_images_request.dart';
import 'Data/Requests/popular_persons_request.dart';

import 'Presentations/Screens/home_screen.dart';
import 'Presentations/cubitsPopular/popular_cubit.dart';
import 'Presentations/cubitsDetails/details_cubit.dart';
import 'Presentations/cubitsFavorite/favorite_cubit.dart';
import 'Presentations/cubitsChat/chat_cubit.dart';

void main()
   async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
    runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopularCubit(
            PopularPersonsRequest(),
          )..getPopularPersons(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(
            detailsRequest: PersonDetailsRequest(),
            imagesRequest: PersonImagesRequest(),
          ),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit()..getFavorites(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(
            AiChatRequest(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Celeb Track',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF19122C),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}