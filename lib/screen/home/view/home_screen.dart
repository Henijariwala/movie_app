import 'package:adv_exam/screen/home/provider/home_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TextEditingController txtName =TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().movieCall();
    context.read<HomeProvider>().multiMovie();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies App"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
           Navigator.pushNamed(context, 'bookmark');
          }, icon: const Icon(Icons.bookmark))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              trailing: [
                IconButton(onPressed: () {
                }, icon: const Icon(Icons.search))
              ],
              onSubmitted: (value) {
                providerR!.searchMovie(value);
                providerR!.multiMovie();
              },
              hintText: "Search",
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemCount: providerW!.model!.search!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 250
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments: providerW!
                            .model!.search![index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          border: Border(
                            top: BorderSide(color: Colors.black,strokeAlign: 0.5),
                            bottom: BorderSide(color: Colors.black,strokeAlign: 0.5),
                            left: BorderSide(color: Colors.black,strokeAlign: 0.5),
                            right: BorderSide(color: Colors.black,strokeAlign: 0.5),
                          )
                      ),
                      child: CachedNetworkImage(
                        imageUrl: "${providerW!.model!.search![index].poster}",
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },),
          ),
        ],
      )
    );
  }
}
