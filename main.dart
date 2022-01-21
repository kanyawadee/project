
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Bgscreen/bg.dart';
import 'package:myapp/charatergenshin/chracter.dart';
import 'package:myapp/loginscreen/login.dart';

void main(List<String> args) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp( 
      debugShowCheckedModeBanner: false,
     
      home: Scaffold( 
        body: const BGScreen(),
        appBar: AppBar( 
          title: const Text('Page'),
          actions: [ 
            Wrap( 
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[ 
                Container( 
                  padding: const EdgeInsets.all(8.0),
                  child: characterpage(),
                  
                ),
               homepage()
              ],
            )
          ],
        ),
            drawer:Drawer( 
            child: ListView( 
            children:const <Widget>[ 
              DrawerHeader(decoration: BoxDecoration( 
                color: Colors.amberAccent
              ),
              child: Text('Menu',style: TextStyle(color: Colors.white),), 
              ), 
              ListTile( 
                leading: Icon(Icons.movie),
                title: Text('Movie'),
              )
            ],
          ),
        ),   
            
          
        ), 
         
        
      ); 
    
  }
} 
Widget homepage(){  
  return const LoginAlert();

}  
Widget blackgroud(Color color){ 
  return const BGScreen ();
} 
Widget characterpage(){ 
  return const FirstRoute();
}








 
