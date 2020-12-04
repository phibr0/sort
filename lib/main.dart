import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insertion Sort',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textController;
  List<int> items = [];
  List<int> sortedItems = [];

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insertion Sort'),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.separated(
              padding: EdgeInsets.all(12),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.green, Colors.greenAccent],
                        ),
                      ),
                    ),
                    height: ((items[index] + 1) * 5).toDouble(),
                    width: 12,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 5,
                );
              },
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Number of items',
                    border: OutlineInputBorder(),
                  ),
                ),
                height: 50,
                width: 200,
              ),
              OutlineButton(
                onPressed: () {
                  items.clear();
                  sortedItems.clear();
                  for (int i = 0; i < int.tryParse(_textController.text); i++) {
                    items.add(i);
                  }
                  setState(() {});
                },
                child: Text(
                  'Create/Reload',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              OutlineButton(
                onPressed: () {
                  setState(() {
                    items.shuffle();
                  });
                },
                child: Text(
                  'Shuffle',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              OutlineButton(
                child: Text(
                  'Sort',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () async {
                  for (int j = 1; j < items.length; j++) {
                    int key = items[j];

                    int i = j - 1;

                    while (i >= 0 && items[i] > key) {
                      items[i + 1] = items[i];
                      i = i - 1;
                      items[i + 1] = key;
                      await Future.delayed(const Duration(milliseconds: 25),
                          () => setState(() {}));
                    }
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
