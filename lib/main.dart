import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController inputController = TextEditingController();
  List<String> patternLines = [];

  void pattern() {
    int n = int.tryParse(inputController.text) ?? 0;
    List<String> temp = [];

    for (int row = 1; row <= n; row++) {
      String line = "";
      for (int col = 1; col <= row; col++) {
        line += "0 ";
      }
      temp.add(line.trim());
    }

    setState(() {
      patternLines = temp;
    });

    inputController.clear(); // Clear the input field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pattern App")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: inputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter a number",
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: pattern,
                child: Text("Show"),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: patternLines
                          .map((line) => Text(
                        line,
                        style: TextStyle(fontSize: 18),
                      ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
