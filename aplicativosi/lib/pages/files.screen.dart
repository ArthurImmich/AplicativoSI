import 'package:aplicativosi/blocs/files.bloc.dart';
import 'package:flutter/material.dart';
import 'package:aplicativosi/models/file.model.dart';

class SIFiles extends StatefulWidget {
  const SIFiles({Key? key}) : super(key: key);

  @override
  State<SIFiles> createState() => _SIFilesState();
}

class _SIFilesState extends State<SIFiles> {
  late Future<List<SIFile>> _files;
  late final SIFilesBloc _filesBloc;

  @override
  void initState() {
    super.initState();
    _filesBloc = SIFilesBloc();
    _filesBloc.fetchPlaces();
    _files = _filesBloc.blocStream.toList();
  }

  @override
  void dispose() {
    _filesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arquivos"),
      ),
      body: FutureBuilder(
        future: _files,
        builder: (context, AsyncSnapshot<List<SIFile>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                snapshot.data![index].checkFile();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    title: Text(
                      snapshot.data![index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(snapshot.data![index].description),
                    trailing: IconButton(
                      icon: Icon(
                        snapshot.data![index].downloaded
                            ? Icons.file_present_outlined
                            : Icons.download_for_offline,
                        size: 24,
                      ),
                      onPressed: () {
                        snapshot.data![index].downloaded
                            ? snapshot.data![index].openFile()
                            : snapshot.data![index].downloadFile();
                      },
                    ),
                    tileColor: const Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
