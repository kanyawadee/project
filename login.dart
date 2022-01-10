
import 'package:flutter/material.dart'; 

class LoginAlert extends StatelessWidget {
  const LoginAlert({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(  
        appBar: AppBar( 
          actions: <Widget>[ 
            IconButton(icon: const Icon(Icons.account_box), 
            onPressed: (){ 
              
              showDialog(context: context, 
               builder: (BuildContext context){ 
                 return  Center(
                 child: Card( 
                   child: SizedBox( 
                     width: 450,
                     height: 459,
                     child: Stack(  
                      children:<Widget> [ 
                        Container( 
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.topCenter,
                          child: Title(color: Colors.black,
                           child: const Text(
                             'LogIn',
                             textAlign: TextAlign.center,
                             )
                             ),
                        ),
                        Container( 
                          padding: const EdgeInsets.all(8.0),
                          child:const LoginScreen(),
                        ),
                      ],
                     ),
                   ),
              
                   
                 ), 
                 );
               }              
               );               
            },
            ),
          ],
          
        ),
        
      ),
    );
   
  }
} 


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [ 
        username(),
        password(),
        Container( 
          padding: const EdgeInsets.all(8.0),
          child: loginbotton(context) 
          
        ) , 
        Container( 
          padding: const EdgeInsets.all(8.0), 
          child: detail(context),
        )

        
        

      ],
        
    );
  }
} 

Widget username(){ 
  return TextFormField(
    decoration: const InputDecoration(  
      labelText: 'username'
    ), 

  );
} 
Widget password(){ 
  return TextFormField(
    decoration: const InputDecoration(  
      labelText: 'password'
    ), 

  );
}  
 
Widget loginbotton(BuildContext context){ 
  return Center(
     
    child: ElevatedButton(
      
      onPressed: (){ 
       
          Navigator.pop(context);
        
      },
      
      child: const Text('Login'),
    ),
  );

} 
Widget detail(BuildContext context){ 
  return TextButton(
     
    onPressed: () { 
      Navigator.pop(context);
       },  
      
   
    child:Padding(
      
      padding: const EdgeInsets.all(8.0), 
      
      child: Container( 
        alignment: Alignment.bottomLeft,
        child: const Text('Registered?'),
      )
    ),
    
    
  );

} 


