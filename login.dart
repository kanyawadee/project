
import 'package:flutter/material.dart';
import '/loginscreen/Register.dart';


class LoginAlert extends StatelessWidget {
  const LoginAlert({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: const Icon(Icons.account_box), 
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
                          padding: const EdgeInsets.all(35.0),
                          alignment: Alignment.topCenter,
                          child: Title(color: Colors.black,
                           child: const Text(
                             'LogIn',
                             textAlign: TextAlign.center,
                             )
                             ),
                        ),
                        Container( 
                          padding: const EdgeInsets.all(45.0),
                          child:const MylonginForm(),
                        ),
                      ],
                     ),
                   ),
                 ), 
                 );
               }              
               );               
            },
            );
  }
} 


class MylonginForm extends StatefulWidget {
  const MylonginForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MylonginForm> {
 bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
  
    return Form( 
      child:Column( 
        children:<Widget> [ 
          Padding( 
            padding:const EdgeInsets.all(8.0), 
            child: TextFormField( 
              decoration:const InputDecoration( 
                labelText: 'Username ',
                icon: Icon(Icons.ac_unit),
              ),
            ),
          ), 
       Padding(
        padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: _isObscure,
            decoration: InputDecoration(
                labelText: 'Password', 
                icon: const Icon(Icons.password),
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    })),  
          ) ,
       ),
          Padding( 
            padding: const EdgeInsets.all(8),  
            child:Center(
               child: ElevatedButton(
                 onPressed: (){ 
                   Navigator.pop(context);
                   },
                   child: const Text('Login'),
                   ),
                   ) ,
          ), 
          Padding(
            padding: const EdgeInsets.all(8.0), 
            child:TextButton(
              onPressed: () { 
               Navigator.push( 
                  context, MaterialPageRoute( 
                    builder: (context) => const MyRegister ()), );

                },  
                child:Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container( 
                      alignment: Alignment.bottomLeft,
                      child: const Text('Registered?'), 
                       ) 

                     ),
                    ) ,
           ),
         ],
        )
     );
   }
 }





