import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../home/provider/home_provider.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getBookMark();
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookMark"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black,strokeAlign: 0.5),
            bottom: BorderSide(color: Colors.black,strokeAlign: 0.5),
            left: BorderSide(color: Colors.black,strokeAlign: 0.5),
            right: BorderSide(color: Colors.black,strokeAlign: 0.5),
          )
        ),
        child: ListView.builder(
          itemCount: providerW!.nameList.length,
          itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(providerW!.imageList[index]),
            title: Text(providerW!.nameList[index],style: const TextStyle(fontSize: 20),),
            trailing:  IconButton(onPressed: () {
              providerW!.removeBookMark(providerW!.nameList[index], providerW!.imageList[index]);
            }, icon: const Icon(Icons.delete)),
          );
        },),
      ),
    );
  }
}
