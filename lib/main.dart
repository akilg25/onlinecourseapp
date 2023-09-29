import 'package:flutter/material.dart';

void main() {
  runApp(const CourseCatalogApp());
}

class CourseCatalogApp extends StatelessWidget {
  const CourseCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CourseCatalogScreen(),
    );
  }
}

class CourseCatalogScreen extends StatelessWidget {
  const CourseCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Course Catalog',textAlign: TextAlign.center,),centerTitle: true,
      ),
      body: Container(
        color: Colors.black87, // Background color
        child: ListView(
          children: [
            CourseCard(
              name: 'Salsa Dancing',
              description: 'Get your groove on with salsa dancing lessons.',
              price: '99',
              rating: '4.5',
              image: 'assets/salsa dancing.jpg',
            ),
            CourseCard(
              name: 'Candle Making',
              description: 'Create your own scented candles and explore aromatherapy',
              price: '79',
              rating: '4.2',
              image: 'assets/candle.jpg',
            ),
            CourseCard(
            name: 'Martial Arts',
            description: 'Explore martial arts disciplines like karate, judo, or taekwondo.',
            price: '80',
            rating: '4.7',
            image: 'assets/martial arts.jpg')
            
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CourseCard extends StatelessWidget {
  String name;
  String description;
  String price;
  String rating;
  String image;

  CourseCard({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailsScreen(
              name: name,
              description: description,
              price: price,
              rating: rating,
              image: image,
            ),
          ),
        );
      },
      child: Card(
      color: Colors.white,
      margin: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Image.asset(
            image,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String rating;
  final String image;

  CourseDetailsScreen({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Course Details',textAlign: TextAlign.center,),centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.center
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(fontSize: 15.0,color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Price: $price',
              style: const TextStyle(fontSize: 30.0,color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                Text(
                  ' $rating',
                  style: const TextStyle(fontSize: 30.0,color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}