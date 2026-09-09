import 'package:flutter/material.dart';

class Serchbar extends StatefulWidget {
  const Serchbar({super.key});

  @override
  State<Serchbar> createState() => _SerchbarState();
}

class _SerchbarState extends State<Serchbar> {
  List<String> mobiles = ["realmee", "nokia", "iphone", "samsang", "redimi"];
  final inputController = TextEditingController();
  List<String> filterdList = [];

  @override
  void initState() {
    filterdList = mobiles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SerchBar')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: inputController,
              onChanged: (value) => 
              setState(() {
                filterdList = mobiles.where((item)=>item.toLowerCase().contains(value.toLowerCase())).toList();
              }),
            ),

            Expanded(
              child:
                ListView.builder(
                  itemCount: filterdList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filterdList[index]),
                    );
                  }),
         ) ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
}