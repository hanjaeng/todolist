import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixabay Image Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageSearchScreen(),
    );
  }
}

class ImageSearchScreen extends StatefulWidget {
  @override
  _ImageSearchScreenState createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _images = [];
  final String apiKey = '45466070-5df482b06ca580347f2eada26'; // 여기에서 API 키를 하드코딩합니다.

  Future<void> _searchImages(String query) async {
    final url = 'https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _images = data['hits'];
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixabay Image Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for images',
              ),
              onSubmitted: (value) {
                _searchImages(value);
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                final image = _images[index];
                return Image.network(image['webformatURL']);
              },
            ),
          ),
        ],
      ),
    );
  }
}