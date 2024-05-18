import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
      Product(
        "Pixel",
        "Pixel is the most featureful phone ever",
        800,
        "pixel.png",
      ),
    );
    items.add(
      Product(
        "Laptop",
        "Laptop is the most productive development tool",
        2000,
        "laptop.png",
      ),
    );
    items.add(
      Product(
        "Tablet",
        "Tablet is the most useful device ever for meetings",
        1500,
        "tablet.png",
      ),
    );
    items.add(
      Product(
        "Pendrive",
        "Pendrive is the stylish phone ever",
        100,
        "pendrive.png",
      ),
    );
    items.add(
      Product(
        "Floppy Drive",
        "Floppy Drive is the stylish phone ever",
        20,
        "floppy.png",
      ),
    );
    items.add(
      Product(
        "iPhone",
        "iPhone is the stylist phone ever",
        1000,
        "iphone.png",
      ),
    );
    return items;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product Navigation Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Navigation")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({Key? key, required this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("assets/appimages/" + this.item.image),
                  Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(this.item.description),
                  Text("Price: " + this.item.price.toString()),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RatingBox(),
            ),
          ),
        ],
      ),
    );
  }
}



class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: _rating >= 1 ? Icon(Icons.star, size: _size) : Icon(Icons.star_border, size: _size),
          color: Colors.red[500],
          onPressed: () => _setRating(1),
          iconSize: _size,
        ),
        IconButton(
          icon: _rating >= 2 ? Icon(Icons.star, size: _size) : Icon(Icons.star_border, size: _size),
          color: Colors.red[500],
          onPressed: () => _setRating(2),
          iconSize: _size,
        ),
        IconButton(
          icon: _rating >= 3 ? Icon(Icons.star, size: _size) : Icon(Icons.star_border, size: _size),
          color: Colors.red[500],
          onPressed: () => _setRating(3),
          iconSize: _size,
        ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/appimages/" + this.item.image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.item.description),
                    Text("Price: " + this.item.price.toString()),
                    RatingBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
