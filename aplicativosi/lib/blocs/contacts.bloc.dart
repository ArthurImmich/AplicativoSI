import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/contact.model.dart';
import 'package:aplicativosi/resources/contacts.repository.dart';

class ContactsBloc extends GenericBloc<ContactsRepository, Contact> {
  ContactsBloc() : super(ContactsRepository());
}
