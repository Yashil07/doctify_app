import 'dart:async';
import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/fontFamily_utils.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({Key? key}) : super(key: key);

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  final Stream < QuerySnapshot > patientsStream =
  FirebaseFirestore.instance.collection ( 'Patients' ) . snapshots ( ) ;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: patientsStream,
        builder :
            ( BuildContext context , AsyncSnapshot <QuerySnapshot> snapshot ) {
              if(snapshot.hasError){
                print("Somthing Wents Wrong");
              }
              if ( snapshot.connectionState == ConnectionState.waiting ){
                return Center (
                    child : CircularProgressIndicator ( ) ,
              ) ; // Center

            }
              final List storedocs= [];
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map a =document.data() as Map<String, dynamic>;
                storedocs.add(a);

              }).toList();
              return SafeArea(
                child: GestureDetector(
                  child: Text("See All",style: FontTextStyle.poppinsS12W5labelColor,),
                  onTap: () {print(storedocs);},),
              );
            }
              ) ;
  }
}
