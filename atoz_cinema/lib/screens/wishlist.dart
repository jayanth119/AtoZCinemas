import 'package:flutter/material.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    // final book = Provider.of<BookProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text("BookMark Item"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 69,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    textColor: Colors.white,
                    title: Text("Item $index"),
                    trailing: const Icon(Icons.bookmark),
                    iconColor: Colors.redAccent,
                    hoverColor: Colors.deepPurpleAccent,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
