import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';



class MyRegister extends StatefulWidget {
  const MyRegister({ Key? key }) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp( 
      home:Scaffold( 
        appBar:AppBar( 
          title:Text('Register ',style:GoogleFonts.alegreyaSans(textStyle:const TextStyle(fontSize: 50 ) ) , ) ,
        ) , 
        body:const RegisterForm()
      ) , 
      
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Define a key to access the form
  final formkey = GlobalKey<FormState>();
 

  String email = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

 
  void submitForm() {
    final bool? isValid = formkey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(email);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);


    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.blueGrey.shade800,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max ,
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0), 
                      child:Text('Register ',style:GoogleFonts.andada(textStyle:const TextStyle(fontSize: 20 )  ) , ) ,
                      ),
                      TextFormField(
                        decoration:  const InputDecoration(
                          labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return '* Please enter your email address';
                          }
                         
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return '* Please enter a valid email address';
                          }
                       
                          return null;
                        },
                        onChanged: (value) => email = value,
                      ),

                      /// username
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Username'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return '* This field is required';
                          }
                          if (value.trim().length < 5) {
                            return '* Username must be at least 5 characters in length';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),

                      /// Password
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: '*Password',
                          
                          ),
                      
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return '* This field is required';
                          }
                          if (value.trim().length < 8) {
                            return '* Password must be at least 8 characters in length';
                          }
                          // Return null if the entered password is valid
                          return null;
                        },
                        onChanged: (value) => _password = value,
                      ),

                    
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '* This field is required';
                          }

                          if (value != _password) {
                            return '* Confimation password does not match the entered password';
                          }

                          return null;
                        },
                        onChanged: (value) => _confirmPassword = value,
                      ),
                      const SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              onPressed: submitForm,
                              child: Text(
                                'Sign Up',style: GoogleFonts.artifika(),
                                )
                              )
                              )
                    ],
                  )),
            ),
          ),
        ),
      );
  }
} 