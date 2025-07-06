//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'bloc/disorder_bloc.dart';
// import 'bloc/disorder_event.dart';
// import 'screens/home_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => DisorderBloc()..add(LoadDisordersEvent(context)),
//       child: MaterialApp(
//         title: 'Recovery Guide',
//         theme: ThemeData(
//           primaryColor: const Color(0xff457B9D),
//           colorScheme: ColorScheme.fromSeed(
//             seedColor: const Color(0xff457B9D),
//             secondary: const Color(0xffF0E5CF),
//           ),
//           scaffoldBackgroundColor: const Color(0xffF0E5CF),
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Color(0xff457B9D),
//             foregroundColor: Colors.white,
//             elevation: 4,
//           ),
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xff457B9D),
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//             ),
//           ),
//           cardTheme: CardThemeData( // تم تعديل هذا الجزء
//             elevation: 6,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             color: Colors.white,
//           ),
//           textTheme: const TextTheme(
//             headlineMedium: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Color(0xff457B9D),
//             ),
//             bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
//             labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ),
//         home: const HomeScreen(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/disorder_bloc.dart';
import 'bloc/disorder_event.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => BlocProvider(
        create: (context) => DisorderBloc()..add(LoadDisordersEvent(context)),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      title: 'Recovery Guide',
      theme: ThemeData(
        primaryColor: const Color(0xff457B9D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff457B9D),
          secondary: const Color(0xffF0E5CF),
        ),
        scaffoldBackgroundColor: const Color(0xffF0E5CF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff457B9D),
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff457B9D),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        cardTheme:  CardThemeData( // تم تعديل هذا الجزء
          elevation: 6,
          shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
           ),     color: Colors.white,
         ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff457B9D),
          ),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}