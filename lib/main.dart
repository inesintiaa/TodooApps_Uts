import 'package:utsine/auth/loginauth.dart';
import 'package:utsine/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utsine/screens/profile_page.dart';

//Colors
Color blackColor = const Color(0xff0c120c);
Color blueColor = const Color(0xff4285F4);
Color whiteColor = const Color(0xffFDFDFF);
Color iconColor = const Color(0xff565656);
Color outlineColor = const Color(0xffD6D6D6);
Color descriptionColor = const Color(0xff565656);


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is ready

  //status bar & navigation bar colors and themes
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: whiteColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: whiteColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: whiteColor));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginWrapper(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //colors
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          //font family
          fontFamily: "Inter",
          textTheme: const TextTheme(
            //Main heading font style - "Create to-do, Modify to-do"
            displayLarge: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w900,
                color: Color(0xff0c120c)),
            //Subheading font style - "Today, Settings"
            displayMedium: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff0c120c)),
            //Regular app font style - "Set Reminder, Daily, Save, License, ..."
            displaySmall: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Color(0xff0c120c)),
            //box heading font style - "Tell us about your task, Date & Time, Completion status, ..."
            labelSmall: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff565656)),
            //Task list heading font style - "Return Library Book"
            bodyLarge: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff0c120c)),
            //Task list description font style - "Gather overdue library books and return..."
            bodyMedium: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff565656)),
            //Task list icon text font style - "11:30 AM, 26/11/24"
            bodySmall: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Color(0xff565656)),
          )),
    );
  }
}

double verticalPadding(BuildContext context) {
  return MediaQuery.of(context).size.height / 20;
}

double horizontalPadding(BuildContext context) {
  return MediaQuery.of(context).size.width / 20;
}

EdgeInsets textFieldPadding(BuildContext context) {
  // TODO: Convert 25px into respected MediaQuery size
  return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.1,
      vertical: MediaQuery.of(context).size.height * 0.025);
}



class MainPage extends StatefulWidget {
  final String loggedInEmail;
  final VoidCallback onLogout;

  const MainPage(
      {super.key, required this.loggedInEmail, required this.onLogout});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(), // Halaman utama
      ProfilePage(
        email: widget.loggedInEmail,
        onLogout: widget.onLogout, // Panggil fungsi logout dari ProfilePage
      ), // Halaman profil
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
