import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Views/customeWidgets/custom_appbar.dart';

class AboutDoctor extends StatefulWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  State<AboutDoctor> createState() => _AboutDoctorState();
}

class _AboutDoctorState extends State<AboutDoctor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize:Size.fromHeight(50),
            child: CustomAppBar(title: "Dr Jenny Wilson",),
          ),
        ),
      ),
    );
  }
}
