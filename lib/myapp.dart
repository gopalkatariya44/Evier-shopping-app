import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './wrapper.dart';
import './screens/screens.dart';
import './theme.dart';
import './resources/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: shrineTheme,
      home: Wrapper(),
      routes: {
        Routes.registerRoute: (context) => RegistrationPage(),
        Routes.accountRoute: (context) => AccountScreen(),
        Routes.sellerProductRoute: (context) => SellerProductScreen(),
        Routes.addProductRoute: (context) => AddProductScreen(),
        Routes.userDetailEdit: (context) => UserDetailEdit(),
        Routes.login: (context) => Login(),
        Routes.recentPrders: (context) => RecentOrders(),
      },
    );
  }
}
