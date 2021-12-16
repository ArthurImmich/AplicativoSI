import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/file.model.dart';
import 'package:aplicativosi/resources/files.provider.dart';

class SIFilesBloc extends GenericBloc<SIFilesProvider, SIFile> {
  SIFilesBloc() : super(SIFilesProvider());
}
