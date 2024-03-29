import 'package:flutter/material.dart';

import '../../domain/bloc_exports.dart';
import '../../presentation/splash/splash_screen.dart';
import '../services/dependency_injection.dart';
import 'router/app_router.dart';
import 'themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc(locator())),
        BlocProvider(create: (context) => SettingsBloc(locator())),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Tasks App',
            theme: AppThemes.appThemeData[AppTheme.lightTheme],
            darkTheme: AppThemes.appThemeData[AppTheme.darkTheme],
            themeMode:
                !state.settings.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            onGenerateRoute: AppRouter().onGenerateRoute,
            initialRoute: SpalshScreen.id,
          );
        },
      ),
    );
  }
}
