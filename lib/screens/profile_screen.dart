import 'package:flutter/material.dart';
import '../main.dart';
import '../models/movie_model.dart';
import '../widgets/movie_item.dart';
import '../widgets/subscription_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showWatchHistory = true;

  final List<Movie> watchHistory = [
    Movie(
      title: "VENOM",
      description: "HERE ARE YOURS ME?",
      imageUrl: "https://i.imgur.com/Vd2DkkN.jpg",
    ),
    Movie(
      title: "ROBIN HOOD",
      description: "Action & Drama",
      imageUrl: "https://i.imgur.com/VmEoRSp.jpg",
    ),
  ];

  final List<Movie> downloaded = [
    Movie(
      title: "HERE ARE THE YOUNG MEN",
      description: "Drama Movie",
      imageUrl: "https://i.imgur.com/2yaf2wb.jpg",
    ),
    Movie(
      title: "DUNE",
      description: "Sci-fi Adventure",
      imageUrl: "https://i.imgur.com/A7GH6bl.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi perfil"),
        actions: [
          Switch(
            value: isDark,
            onChanged: (value) {
              MyApp.of(context)?.toggleTheme(value);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/editProfile'),
        child: const Icon(Icons.edit),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Sección superior
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/user.jpg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Cristopher Nolan",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone, size: 16, color: Colors.white70),
                    SizedBox(width: 5),
                    Text("421345321", style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 10),
                    Icon(Icons.email, size: 16, color: Colors.white70),
                    SizedBox(width: 5),
                    Text("Nolan@gmail.com", style: TextStyle(color: Colors.white70)),
                  ],
                )
              ],
            ),
          ),

          // Sección de suscripción
          const SubscriptionCard(),

          // Pestañas inferiores
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => setState(() => showWatchHistory = true),
                child: Text(
                  "Watch History",
                  style: TextStyle(
                    color: showWatchHistory ? Colors.blue : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => showWatchHistory = false),
                child: Text(
                  "Downloaded",
                  style: TextStyle(
                    color: !showWatchHistory ? Colors.blue : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // Lista de películas
          Expanded(
            child: ListView.builder(
              itemCount:
                  showWatchHistory ? watchHistory.length : downloaded.length,
              itemBuilder: (context, index) {
                final movie = showWatchHistory
                    ? watchHistory[index]
                    : downloaded[index];
                return MovieItem(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}
