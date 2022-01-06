import 'package:flutter/material.dart'; 
import 'loginscreen/login.dart';
void main(List<String> args) {
  runApp(const Myapp());
} 
class Myapp extends StatelessWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
         
        scaffoldBackgroundColor: Colors.white 
        
      ),  
      home: const LoginAlert(),
     
       
    );
  }
}