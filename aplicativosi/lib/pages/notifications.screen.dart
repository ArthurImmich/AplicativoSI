import 'package:flutter/material.dart';
import 'package:aplicativosi/models/notification.model.dart' as Model;

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Model.Notification> notifications = [
      Model.Notification(
        title: "Eventos da semana!",
        body:
            "Carlos alunos, é com prazer que anunciamos o lorem ipsun sacra lorem sei la semanal Carlos alunos, é com prazer que anunciamos o lorem ipsun sacra lorem sei la semanal Carlos alunos, é com prazer que anunciamos o lorem ipsun sacra lorem sei la semanal Carlos alunos, é com prazer que anunciamos o lorem ipsun sacra lorem sei la semanal Carlos alunos, é com prazer que anunciamos o lorem ipsun sacra lorem sei la semanal Carlos alunos, é com prazer que anunciamos o lorem ipsun sacra lorem sei la semanal ",
        time: DateTime.now(),
      ),
      Model.Notification(
        title: "Julius Caesar",
        body: "caesar.julius@bol.com",
        time: DateTime.now(),
      ),
      Model.Notification(
        title: "Ronaldinho Gaucho",
        body: "ron4ldogaucho@outlook.com",
        time: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Notificações"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              itemCount: notifications.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    title: Text(
                      notifications[i].title +
                          "\n" +
                          notifications[i].time.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(notifications[i].body),
                    tileColor: const Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
