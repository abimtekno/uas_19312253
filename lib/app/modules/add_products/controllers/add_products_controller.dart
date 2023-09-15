import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController cNPM;
  late TextEditingController cNAMA;
  late TextEditingController cALAMAT;
  @override
  void onInit() {
    cNPM = TextEditingController();
    cNAMA = TextEditingController();
    cALAMAT = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNPM.dispose();
    cNAMA.dispose();
    cALAMAT.dispose();
    super.onClose();
  }

  void addProduct(
    String npm,
    String nama,
    String alamat,
  ) async {
    CollectionReference products = firestore.collection("mahasiswa_19312253");
    try {
      products.add({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Data berhasil diinput!",
          onConfirm: () {
            cNPM.clear();
            cNAMA.clear();
            cALAMAT.clear();
            Get.back();
            Get.back();
          });
    } catch (e) {
      print(e);
    }
  }
}
