import 'package:flutter/material.dart';
import 'package:flutter_webservices/common/validate.dart';
import 'package:flutter_webservices/http_protocol/request_error.dart';
import 'package:flutter_webservices/models/post_model.dart';
import 'package:flutter_webservices/ui/components/lists/post_list.dart';
import 'package:flutter_webservices/ui/screen/post_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: PostList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostFormScreen(),
            ),
          )
        },
        tooltip: 'Agregar post',
        child: const Icon(Icons.add_circle_rounded),
      ),
    );
  }
}
