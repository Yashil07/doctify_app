import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Utils/color_utils.dart';
import 'package:project/Views/Auth/reset_password_screen.dart';
import 'package:project/Views/Auth/successfully_changed.dart';
import 'package:project/Views/home/home_screen.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/image_utils.dart';
import '../Profile/profile_setting_screen.dart';
import 'my_appointment_history_screen.dart';



class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Color mainColor = const Color(0xFF2631C1);
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          HomePage(),
          Appointment_History(),
          ChatPage(),
          ProfileSetting(),
        ],
        items: _navBarsItems(),
        //navBarStyle: NavBarStyle.style15,
        navBarStyle: NavBarStyle.style9,
        //navBarStyle: NavBarStyle.style7,
        //navBarStyle: NavBarStyle.style10,
        //navBarStyle: NavBarStyle.style12,
        //navBarStyle: NavBarStyle.style13,
        //navBarStyle: NavBarStyle.style3,
        // navBarStyle: NavBarStyle.style6,

      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: ColorUtils.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,

      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.calendar_today),
        title: ("Appointment"),
        activeColorPrimary: ColorUtils.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.list_bullet),
        title: ("History"),
        activeColorPrimary: ColorUtils.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: ColorUtils.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HomeScreen(),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Appointment_History(),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProfileSetting(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/profile.json'),
    );
  }
}
