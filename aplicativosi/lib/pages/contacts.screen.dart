import 'package:flutter/material.dart';
import 'package:aplicativosi/models/contact.model.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = [
      Contact(
        name: "John Lennon",
        email: "john.lennon@gmail.com",
      ),
      Contact(
        name: "Julius Caesar",
        email: "caesar.julius@bol.com",
      ),
      Contact(
        name: "Ronaldinho Gaucho",
        email: "ron4ldogaucho@outlook.com",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                  title: Text(
                    contacts[i].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(contacts[i].email),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
