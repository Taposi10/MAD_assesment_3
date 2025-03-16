import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TextField with a placeholder
            TextField(
              decoration: InputDecoration(
                hintText: 'Placeholder',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            SizedBox(height: 20),
            // Display images with smaller sizes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/pikachu.jpg', width: 50, height: 50), // Smaller image
                SizedBox(width: 10),
                Image.asset('assets/images/pikachu.jpg', width: 50, height: 50), // Smaller image
              ],
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/pikachu.jpg', width: 50, height: 50), // Smaller image
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2()),
                );
              },
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Slider with specified values
            Slider(
              value: _sliderValue,
              min: -75,
              max: 275,
              divisions: 14,
              label: _sliderValue.toStringAsFixed(0),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            // Display the slider value
            Text(
              'Slider Value: ${_sliderValue.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Display only one image below the slider
            Image.asset('assets/images/pikachu.jpg', width: 50, height: 50), // One image
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page3()),
                );
              },
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<String> items = []; // List to store items
  TextEditingController _controller = TextEditingController(); // Controller for TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3 - CRUD Operations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField to add items
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter item name',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            SizedBox(height: 10),
            // Button to add item
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_controller.text.isNotEmpty) {
                    items.add(_controller.text); // Add item to the list
                    _controller.clear(); // Clear the input field
                  }
                });
              },
              child: Text('Add Item'),
            ),
            SizedBox(height: 20),
            // ListView to display the items
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset('assets/images/pikachu.jpg', width: 30, height: 30), // Image next to each item
                    title: Text(items[index]), // Display the text item
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          items.removeAt(index); // Remove item from the list
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // Image displayed at the bottom after the list
            Image.asset('assets/images/pikachu.jpg', width: 50, height: 50), // Image at the bottom of the list
          ],
        ),
      ),
    );
  }
}
