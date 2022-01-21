
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center( 
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
        ),
      );
    
  }
}   
Future<List> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
 
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
Widget _buildRow(String dataRow) {
  return ListTile(
    title: Text(
      dataRow,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  late Future<List> futureAlbum;
 
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        
        appBar: AppBar( 
          
          title: const Text('Fetch Data Example'), 
          actions:<Widget > [  
            ElevatedButton( 
              child:const Text('Open Route') ,  
              onPressed:(){ 
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const NextPage(),), 
                 );
              } ,
              )

          ],   
        ),
        body: Stack(  
          children:<Widget > [ 
            Container( 
          
              padding:const EdgeInsets.all(8.0), 
           child: FutureBuilder(
            future: futureAlbum,
            builder: (context,AsyncSnapshot<List > snapshot) {
               
               if (snapshot.hasData) {
                return 
                ListView.builder(   
                  shrinkWrap: false,
                
                  itemCount: snapshot.data!.length,//สร้าง Widget ListView
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, i) {
                     
                      var snapshot2 = snapshot;
                      return Card( 
                        child: SizedBox( 
                          child:Stack(  
                            children: [ 
                              Container(  
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile( 
                                  title: _buildRow(snapshot2.data![i][ "id"].toString()) , 
                                  subtitle: _buildRow(snapshot2.data![i]["title"].toString()) ,   
                                ), 
                              )
                            ],
                          ) 
                      ),
                      );
                    }  
                    
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            
              // รูป Spiner ขณะรอโหลดข้อมูล
              return const CircularProgressIndicator();
            },

        ), 
        )
          ],
        ) ,
      ), 
      
    );
  }
}  
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}



class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Isolate Demo';

    return const MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}