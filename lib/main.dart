import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:libelulas/models/admin_users_manager.dart';
import 'package:libelulas/models/cart_manager.dart';
import 'package:libelulas/models/home_manager.dart';
import 'package:libelulas/models/product.dart';
import 'package:libelulas/models/product_manager.dart';
import 'package:libelulas/models/user_manager.dart';
import 'package:libelulas/screens/base/base_screen.dart';
import 'package:libelulas/screens/edit_product/edit_product_screen.dart';
import 'package:libelulas/screens/login/login_screen.dart';
import 'package:libelulas/screens/product/product_screen.dart';
import 'package:libelulas/screens/signup/signup_screen.dart';
import 'package:libelulas/screens/cart/cart_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ), //ChangeNotifierProvider
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
            cartManager!..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
          create: (_) => AdminUsersManager(),
          lazy: false,
          update: (_, userManager, adminUsersManager) =>
            adminUsersManager!..updateUser(userManager),
        ) //ChangeNotifierProxyProvider
      ],
      child: MaterialApp(
        title: 'Loja Libélula',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Color.fromRGBO(193, 162, 214, 0.961),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                builder:   (_) => LoginScreen()
              ); //material page route
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignUpScreen()
              ); //material page route
            case '/product':
              return MaterialPageRoute(
                builder: (_) => ProductScreen(
                  settings.arguments as Product
                ) //product screens
              ); //material page route
            case '/cart':
              return MaterialPageRoute(
                builder: (_) => CartScreen()
              ); //material page route
            case '/edit_product':
              return MaterialPageRoute(
                  builder: (_) => EditProductScreen(settings.arguments as Product)
              );
            case '/base':
            default:
              return MaterialPageRoute(
              builder: (_) => BaseScreen()
            ); //material page route
          }
        },
      ),
    );
  }
}
