import 'package:animation/slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  double position = 0.0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Homme Préhistorique',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Couleur du texte
              fontFamily: 'Roboto', // Police de caractères personnalisée
            ),
          ),
          centerTitle: true,
          backgroundColor:
              Colors.deepPurple, // Couleur de l'arrière-plan de l'AppBar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Transform.translate(
                  offset: Offset(position, position),
                  child: Lottie.asset(
                    'assets/RHH.json',
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Button color
                      textStyle: TextStyle(color: Colors.white), // Text color
                    ),
                    onPressed: () {
                      setState(() {
                        // Move the Lottie animation forward
                        position += 50.0;
                        print(position);
                      });
                    },
                    child: const Text(
                      'Avancer !',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Button color
                      textStyle: TextStyle(color: Colors.white), // Text color
                    ),
                    onPressed: () {
                      setState(() {
                        // Move the Lottie animation backward
                        position -= 50.0;
                      });
                    },
                    child: const Text(
                      'Reculer en arrière !',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button color
                  textStyle: TextStyle(color: Colors.white), // Text color
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SliderScreen()));
                },
                child: const Text(
                  'Go to slider',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
}
