import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'view/insert.dart';
import 'view/map.dart';
import 'view/update_restaurant.dart';
import 'vm/database_handler.dart';

class Home extends StatefulWidget {
  final Function(ThemeMode) onchageTheme; // home의 테마모드 갖고오기 설정!!!
  const Home({super.key, required this.onchageTheme});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('내가 경험한 맛집 리스트'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => Insert())!.then((value) => reloadData());
                },
                icon: Icon(Icons.add_outlined))
          ],
        ),
        body: FutureBuilder(
            future: handler.query_restaurant(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: BehindMotion(),
                              children: [
                                SlidableAction(
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: "삭제",
                                    onPressed: (context) {
                                      if (snapshot.data![index].seq != null) {
                                        deleteCard(snapshot.data![index].seq!);
                                      } else {
                                        print(
                                            'snapshot.data![index].seq is null');
                                      }
                                    }),
                              ],
                            ),
                            startActionPane: ActionPane(
                              motion: BehindMotion(),
                              children: [
                                SlidableAction(
                                    backgroundColor: Colors.green,
                                    icon: Icons.edit,
                                    label: "수정",
                                    onPressed: (context) {
                                      Get.to(() => UpdateRestaurant(),
                                              arguments: [
                                            snapshot.data![index].seq!,
                                            snapshot.data![index].name,
                                            snapshot.data![index].phone,
                                            snapshot.data![index].locate,
                                            snapshot.data![index].latitude,
                                            snapshot.data![index].longitude,
                                            snapshot.data![index].memo,
                                            snapshot.data![index].img,
                                          ])!
                                          .then((value) => reloadData());
                                    }),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _searchOnWeb(snapshot.data![index].name);
                              },
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                width: 380,
                                height: 140,
                                child: Card(
                                    child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.memory(
                                        snapshot.data![index].img,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '  ${snapshot.data![index].name}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _makePhoneCall(snapshot
                                                    .data![index].phone);
                                              },
                                              icon: Icon(Icons.phone),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Get.to(() => Map2(),
                                                    arguments: [
                                                      snapshot.data![index].latitude,
                                                      snapshot.data![index].longitude,
                                                      snapshot.data![index].name
                                                    ],);
                                              },
                                              icon:
                                                  Icon(Icons.map_outlined), // 검색 아이콘
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '  ${snapshot.data![index].locate}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          '  ${snapshot.data![index].phone}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          '  ${snapshot.data![index].memo}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  reloadData() {
    setState(() {});
  }

  void deleteCard(int id) async {
    Get.defaultDialog(
        title: '경고',
        middleText: '정말 삭제하시겠습니까?',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              handler.delCard(id);
              Get.back();
              reloadData();
            },
            child: const Text('예'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('아니오'),
          ),
        ]);
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  Future<void> _searchOnWeb(String name) async {
    final Uri searchUri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: 'search',
      queryParameters: {'q': name},
    );
    if (await canLaunchUrl(searchUri)) {
      await launchUrl(searchUri);
    } else {
      throw 'Could not launch $searchUri';
    }
  }
}
