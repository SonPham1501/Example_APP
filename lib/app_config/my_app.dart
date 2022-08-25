import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/config/palette.dart';
import '../injection.dart';
import '../routes/router/app_router.dart';

// class AppInitalFutureData {
//   RemoteMessage? remoteMessage;
//   PendingDynamicLinkData? initialLink;
//   AppInitalFutureData({
//     this.remoteMessage,
//     this.initialLink,
//   });
// }

// Future<AppInitalFutureData> initializeApp() async {
//   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//   //     statusBarColor: Colors.transparent,
//   //     statusBarIconBrightness: Brightness.dark));

//   final PendingDynamicLinkData? initialLink =
//       await getIt<FirebaseDynamicLinkService>().initialize();

//   final remoteMessage = await getIt<FirebaseMessagingService>().initialize();

//   return new AppInitalFutureData(
//     initialLink: initialLink,
//     remoteMessage: remoteMessage,
//   );
// }

// class App extends StatelessWidget {
//  // final Future<AppInitalFutureData> _initialization = initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initialization,
//       builder: (context, AsyncSnapshot<AppInitalFutureData> snapshot) {
//         if (snapshot.hasError) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               body: Center(
//                 child: Text('Lỗi khởi tạo:' + snapshot.error.toString()),
//               ),
//             ),
//           );
//         }

//         if (((snapshot.connectionState == ConnectionState.active) ||
//                 (snapshot.connectionState == ConnectionState.done)) &&
//             (snapshot.data != null)) {
//           return MyApp(
//             initalData: snapshot.data!,
//           );
//         }
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: SplashScreen(),
//         );
//       },
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//  // final AppInitalFutureData initalData;

//   const MyApp({
//     Key? key,
//    // required this.initalData,
//   }) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends MyAppState {
//   @override
//   void initState() {
//     // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//     //   if (widget.onReady != null) widget.onReady!();
//     // });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // FirebaseDynamicLinkService.onLinkStream?.cancel();
//     // FirebaseMessagingService.remoteMessageStream?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MyAppController(
//       controller: authController,
//       initalLink: widget.initalData.initialLink,
//       initalMessage: widget.initalData.remoteMessage,
//       child:
//     );
//   }
// }

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YoFun',
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   const Locale('vi'),
      // ],
      theme: ThemeData(
        // Define the default brightness and colors.
        dividerTheme: DividerTheme.of(context)
            .copyWith(color: AppColors.text300, thickness: 1),
        primaryColor: Colors.white,

        // accentColor: Palette.secondColor,
        textTheme: const TextTheme(
          caption: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          headline1: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Palette.textBlack,
            fontSize: 16.0,
          ),
          subtitle1: TextStyle(
            color: Palette.subTextColor,
            fontSize: 12,
          ),
          bodyText2: TextStyle(
            color: Palette.textBlack,
            fontSize: 16.0,
          ),
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: TextStyle(
            fontSize: 16,
          ),
          iconTheme: IconThemeData(
            color: Palette.subTextColor,
          ),
          backgroundColor: Colors.white,
        ),
      ),
      navigatorKey: appRouter.navigatorKey,
      initialRoute: AppRouter.initalRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
