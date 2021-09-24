import 'package:flutter/material.dart';

import 'contact_data.dart';

class ContactsPage extends StatelessWidget {
  Drawer buildDrawer(BuildContext context) {
    var header = DrawerHeader(
        child: Container(
      child: Text("Pemro Mobile A"),
    ));

    ListTile buildNavItem(var icon, String label, String route) {
      return ListTile(
        leading: Icon(icon),
        title: Text(label),
        onTap: () {},
      );
    }

    var navList = [
      header,
      buildNavItem(Icons.star, "Gilang Ramadhana A - 192410102066", "/"),
    ];

    ListView listView = ListView(children: navList);

    return Drawer(child: listView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0Xff5c5d93),
          title: Text("Kontak"),
        ),
        drawer: buildDrawer(context),
        body: Container(
          child: ContactList(kContacts),
        ));
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> _contacts;

  ContactList(this._contacts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: _contacts.length,
      itemBuilder: _buildContacts,
    );
  }

  Widget _buildContacts(context, index) {
    return ContactItem(_contacts[index]);
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem(this.contact);

  final Contact contact;

  Widget _buildTiles(BuildContext context, Contact contact) {
    return ListTile(
        title: Text(contact.fullName),
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade800,
          child: Text(contact.fullName[0]),
        ),
        subtitle: Column(
          children: [Text(contact.email), Text(contact.phone)],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, contact);
  }
}
