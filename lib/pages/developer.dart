import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_finder/main.dart';

class DevContact extends StatelessWidget {
  const DevContact({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer Contact",
        style:  GoogleFonts.sedgwickAve(
    textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
  ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            ContactUs(
            cardColor: Colors.white,
            textColor: Colors.indigo,
            logo: NetworkImage('https://i.ibb.co/qWPRjxB/Mujahidul-Islam-PP-SIZE-College-Dress-1.jpg'),
            email: 'mdshawn0898@gmail.com',
            companyName: 'Mujahidul Islam',
            companyColor: Colors.indigo,
            dividerThickness: 2,
            phoneNumber: '+880-19203-9105',
            website: 'https://misitzone.xyz',
            githubUserName: 'mdshawn',
            facebookHandle: 'md.shawn.101', 
            taglineColor: Colors.indigo,),
          ],
        ),
      ),

            bottomNavigationBar: BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(icon: Icon(Icons.help), onPressed: () {}),
        Spacer(),
        
      ],
    ),
  ),
  floatingActionButton:
      FloatingActionButton(child: Icon(Icons.home), onPressed: () {
        Get.back();
      }),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );  
    
  }
}