import 'package:contact/main.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  List l1 = [
    "Aniruddh",
    "Utsav",
    "Hardik",
    "Mihir",
    "Sahil",
    "Parth",
    "Milan",
  ];
  List l2 = [
    "9874561230",
    "9974561230",
    "8529637014",
    "7869501234",
    "8788965520",
    "6688779911",
    "9876541235",
  ];

  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();

  bool theme = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add New Number"),
                  content: SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(hintText: "Enter Name"),
                          controller: txtname,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: "Enter Number"),
                          keyboardType: TextInputType.number,
                          controller: txtnumber,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            setState(
                                  () {
                                l1.add(txtname.text);
                                l2.add(txtnumber.text);
                                txtname = TextEditingController();
                                txtnumber= TextEditingController();
                              },
                            );
                            Navigator.pop(context);
                          },
                          child: Text("ADD"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add_call),
        ),
        appBar: AppBar(
          title: Text("CONTACT LIST"),
          leading: Icon(Icons.menu),
          actions: [
            Switch(
              value: theme,
              onChanged: (value) {
                setState(() {
                  theme = value;
                });
                streamController.add(theme);
              },
              activeTrackColor: Colors.black,
              activeColor: Colors.white,
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: l1.length,
          itemBuilder: (context, index) {
            return InkWell(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Delete This Contact ?"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  l1.removeAt(index);
                                  Navigator.pop(context);
                                });
                              },
                              child: Text("DELETE"),
                              style: ElevatedButton.styleFrom(primary: Colors.red),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text("CANCEL")),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: ExpansionTile(
                leading: Icon(
                  Icons.contact_page,
                  color: Colors.blue,
                ),
                title: Text(
                  "${l1[index]}",
                  style: Theme.of(context).textTheme.headline1,
                ),
                subtitle: Text("${l2[index]}"),
                children: [
                  SizedBox(
                    width: 500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await launchUrl(
                              Uri.parse("tel: +91${l2[index]}"),
                            );
                          },
                          icon: Icon(Icons.call, color: Colors.green),
                        ),
                        IconButton(
                            onPressed: () async {
                              await launchUrl(
                                Uri.parse("sms: +91${l2[index]}"),
                              );
                            },
                            icon: Icon(Icons.message, color: Colors.blue)),
                        IconButton(
                          onPressed: () async {
                            await launchUrl(
                              Uri.parse("https://pub.dev/packages/share"),
                            );
                          },
                          icon: Icon(Icons.link, color: Colors.purple),
                        ),
                        IconButton(
                          onPressed: () async {
                            await Share.share("${l1[index]},${l2[index]}");
                          },
                          icon: Icon(Icons.share, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
