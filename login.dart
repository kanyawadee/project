



import 'package:flutter/material.dart'; 
class Loginfrom extends StatelessWidget {
  const Loginfrom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
     home: Scaffold(  
      appBar: AppBar(  
        title:  const MystatefulWidget(),
      ),
     ),
      
    );
  }
} 
class MystatefulWidget extends StatelessWidget {
  const MystatefulWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column( 
      children: <Widget>[ 
        Container( 
          alignment: FractionalOffset.topRight,
          child: IconButton( 
            icon: const Icon(Icons.account_box),
            onPressed: (){ 
              showDialog( 
                context: context,
                 
                    builder: (context) => const AlertDialog(
                      alignment: Alignment.center,
                      title: Text('Log In',textAlign: TextAlign.center,),
                
              ), 
                barrierDismissible: false, 
                   );
              
            },
          ),
        )
      ],

        );
      

    
    
     
  } 
   Widget usernameFormField()=> TextFormField( 
          decoration: const InputDecoration(
            labelText: 'Username',  
             
          ),
        );
}
