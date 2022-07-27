import 'package:flutter/material.dart';
import 'package:news_api/Model/artical.dart';
import 'package:news_api/service/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('NEWS API'),
      ),
      body: FutureBuilder(
        future: apiService.getArtical(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemBuilder: (BuildContext context, index){
                  return Column(
                    children: [
                      Card(
                        elevation: 15,
                        child: ListTile(
                          title: Text('${snapshot.data![index].title}'),
                          subtitle: Text('${snapshot.data![index].description}'),
                          trailing: Text('${snapshot.data![index].author}'),
                        ),
                      ),
                      Image.network('${snapshot.data![index].urlToImage}')
                    ],
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
