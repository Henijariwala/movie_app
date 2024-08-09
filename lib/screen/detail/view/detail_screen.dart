import 'package:adv_exam/screen/home/provider/home_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/model/multimovie_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Search l1 = ModalRoute.of(context)!.settings.arguments as Search;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: [
          IconButton(onPressed: () {
            context.read<HomeProvider>().setBookMark(l1.title!, l1.poster!);
          }, icon: Icon(Icons.favorite))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(0.8),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black,strokeAlign: 0.5),
                  right: BorderSide(color: Colors.black,strokeAlign: 0.5),
                  left: BorderSide(color: Colors.black,strokeAlign: 0.5),
                  bottom: BorderSide(color: Colors.black,strokeAlign: 0.5),
                )
              ),
              child: CachedNetworkImage(
                  imageUrl: "${l1.poster}",
                height: 600,
                width: MediaQuery.sizeOf(context).width,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Center(
                child: Text("${l1.title}",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            Center(child: Text("${l1.type}",style: const TextStyle(fontSize: 18),)),
            Center(child: Text("${l1.year}",style: const TextStyle(fontSize: 18),)),
          ],
        ),
      ),
    );
  }
}
