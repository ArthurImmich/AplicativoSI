import 'package:aplicativosi/blocs/generic.bloc.dart';
import 'package:aplicativosi/models/contact.model.dart';
import 'package:aplicativosi/resources/contacts.provider.dart';

class ContactsBloc extends GenericBloc<ContactsProvider, Contact> {
  ContactsBloc() : super(ContactsProvider());
}
