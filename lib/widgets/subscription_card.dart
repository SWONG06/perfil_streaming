import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("1 Year of Unlimited Moviez", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("USD 50.00 / 1 Year", style: TextStyle(color: Colors.green)),
            Text("Expired on 05/08/2025", style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
