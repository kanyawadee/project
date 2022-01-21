

import 'package:flutter/material.dart';

//https://www.pockettactics.com/wp-content/uploads/2021/12/genshin-impact-update-2.4-900x506.jpg

class BGScreen extends StatelessWidget {  

  const BGScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    return Center(  
      child: Expanded(  
        flex: 2, 
        child: Container(  
          decoration:const BoxDecoration( 
            image: DecorationImage(  
              image: NetworkImage('https://www.pockettactics.com/wp-content/uploads/2021/12/genshin-impact-update-2.4-900x506.jpg  '), 
              fit: BoxFit.cover,
            )
          ),
        ),
      ),

   
    );
        
      
    
    
     
     
    
    



  }
}