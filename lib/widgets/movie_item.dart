import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.imageUrl, width: 50, height: 70, fit: BoxFit.cover),
      title: Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(movie.description, style: TextStyle(color: Colors.grey)),
      trailing: IconButton(
        icon: Icon(Icons.play_arrow),
        onPressed: () {},
      ),
    );
  }
}
