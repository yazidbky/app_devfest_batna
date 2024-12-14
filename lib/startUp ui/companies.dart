import 'package:flutter/material.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  State<CompaniesScreen> createState() => _SalesInvestorScreenState();
}

class _SalesInvestorScreenState extends State<CompaniesScreen> {
  // Sample contact data
  final List<Map<String, String>> contacts = List.generate(
    6,
    (index) => {
      'name': 'Yasser Ben Sghir',
      'email': 'yaser.ben@yahoo.com',
      'image': 'images/Image.png', // Replace with local image path
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: GridView.builder(
          itemCount: contacts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 cards per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75, // Adjust height-to-width ratio
          ),
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ContactCard(
              name: contact['name']!,
              email: contact['email']!,
              imageUrl: contact['image']!,
            );
          },
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const ContactCard({
    Key? key,
    required this.name,
    required this.email,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(8), // Card edges
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image takes full width and fits properly
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Container(
              height: 300, // Set a fixed height for the image
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover, // Makes the image stretch and fit the space
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Contact name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Contact email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              email,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          const Spacer(),
          // Message button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: OutlinedButton.icon(
              onPressed: () {
                // Handle button press
              },
              icon: const Icon(Icons.email, size: 16, color: Colors.blue),
              label: const Text(
                'Message',
                style: TextStyle(color: Colors.blue),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
