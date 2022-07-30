// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:four/controller/homecontroller.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController hc = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 16),
        child: Column(
          children: [
            //form
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                  child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 1, child: imageUploadComponent(hc)),
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 4,
                            right: 8,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: hc.productNameController,
                                  decoration: InputDecoration(
                                    hintText: 'Product Name',
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none),
                                    contentPadding: EdgeInsets.only(
                                      left: 4,
                                      right: 4,
                                      top: 2,
                                      bottom: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 4),
                                      child: TextField(
                                        controller: hc.priceController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey.shade200,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide.none),
                                          hintText: 'Price',
                                          contentPadding: EdgeInsets.only(
                                            left: 4,
                                            right: 4,
                                            top: 2,
                                            bottom: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 4),
                                      child: TextField(
                                        controller: hc.qtyController,
                                        decoration: InputDecoration(
                                          hintText: 'Qty.',
                                          filled: true,
                                          fillColor: Colors.grey.shade200,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide.none),
                                          contentPadding: EdgeInsets.only(
                                            left: 4,
                                            right: 4,
                                            top: 2,
                                            bottom: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              InkWell(
                                onTap: hc.submitProduct,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(child: Text('ADD')),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )),
            ),
            //list
            Expanded(
              child: PaginateFirestore(
                  itemBuilder:
                      (BuildContext context, documentSnapshot, int index) {
                    Map data = documentSnapshot[index].data() as Map;
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(data['name']),
                    );
                  },
                  query: hc.queryFx(),
                  itemBuilderType: PaginateBuilderType.listView),
            )
          ],
        ),
      ),
    );
  }

  Widget imageUploadComponent(HomeController hc) {
    return InkWell(
      onTap: hc.loadPicker,
      child: Container(
        color: Colors.white,
        child: Obx(() {
          return CachedNetworkImage(imageUrl: hc.url.value);
        }),
      ),
    );
  }
}
