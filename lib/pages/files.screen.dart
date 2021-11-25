import 'package:flutter/material.dart';
import 'package:aplicativosi/models/file.model.dart';

class Files extends StatefulWidget {
  const Files({Key? key}) : super(key: key);

  @override
  State<Files> createState() => _FilesState();
}

class _FilesState extends State<Files> {
  @override
  Widget build(BuildContext context) {
    List<File> files = [
      File(
          name: "Modelo trabalhos",
          description: "Modelos para trabalhos academicos",
          downloaded: true),
      File(
        name: "Calendario academico",
        description: "Calendario academico da UFSM-FW",
      ),
      File(
        name: "Documento",
        description: "Um documento",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Arquivos"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(
                    files[i].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(files[i].description),
                  trailing: IconButton(
                    icon: Icon(
                      files[i].downloaded
                          ? Icons.file_present_outlined
                          : Icons.download_for_offline,
                      size: 24,
                    ),
                    onPressed: () {},
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
