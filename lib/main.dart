import 'package:evier/database/cart.dart';
import 'package:evier/database/favourites.dart';
import 'package:evier/database/orders.dart';
import 'package:evier/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import './myapp.dart';
import './database/database_services.dart';
import './database/productsData.dart';
import './database/user_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA0A04dO-645GkmhnbZQvpvhn5qLODF0aI",
      authDomain: "evier-shopping-system.firebaseapp.com",
      projectId: "evier-shopping-system",
      storageBucket: "evier-shopping-system.appspot.com",
      messagingSenderId: "198875778892",
      appId: "1:198875778892:web:d563b8682f912e08c609e9",
      measurementId: "G-BQB9530LZD",
    ),
  );

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
        StreamProvider<List<ProductsData?>?>.value(
          value: DatabaseServices().products(),
          initialData: null,
        ),
        StreamProvider<UserData?>(
          initialData: UserData.initialData(),
          create: (context) => DatabaseServices().userData(),
          child: HomeScreen(),
        ),
        StreamProvider<List<Favourites?>?>.value(
          value: DatabaseServices().favourites(),
          initialData: null,
        ),
        StreamProvider<List<Cart?>?>.value(
          value: DatabaseServices().cart(),
          initialData: null,
        ),
        StreamProvider<List<Orders?>?>.value(
          value: DatabaseServices().orders(),
          initialData: null,
        ),
      ],
      child: MyApp(),
    );
  }
}
