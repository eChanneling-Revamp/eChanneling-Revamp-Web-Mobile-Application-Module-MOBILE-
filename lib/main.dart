import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'screen/sign_in_page.dart';
import 'screen/home/home_page.dart';
import 'screen/find_doctors/find_doctors_page.dart';
import 'screen/Appointments/my_appointments_page.dart';
import 'screen/profile/profile_page.dart';
import 'screen/advance_search/advance_search_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eChanneling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppAppBarStyles.appBarTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppButtonStyles.primaryButton,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: AppButtonStyles.secondaryButton,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
            borderSide: const BorderSide(color: AppColors.borderLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
            borderSide: const BorderSide(color: AppColors.borderLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        textTheme: const TextTheme(
          headlineLarge: AppTextStyles.headingLarge,
          headlineMedium: AppTextStyles.headingMedium,
          headlineSmall: AppTextStyles.headingSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelLarge: AppTextStyles.button,
        ),
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => const SignInPage(),

        '/home': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map?;
          return HomePage(
            userName: args?['userName'] ?? 'User',
            isPremium: args?['isPremium'] ?? false,
          );
        },
        '/find_doctors': (context) => const FindDoctorsPage(),
        '/appointments': (context) => const MyAppointmentsPage(),
        '/profile': (context) => const ProfilePage(),
        '/advance_search': (context) => const AdvanceSearchPage(),
      },
    );
  }
}