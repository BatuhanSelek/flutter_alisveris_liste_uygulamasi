// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_alisveris_liste_uygulamasi/cubit/anasayfa_cubit.dart';
import 'package:flutter_alisveris_liste_uygulamasi/cubit/liste_detay_cubit.dart';

import 'package:flutter_alisveris_liste_uygulamasi/models/liste.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListeDetay extends StatefulWidget {
  Liste name;
  ListeDetay({
    super.key,
    required this.name,
  });

  @override
  State<ListeDetay> createState() => _ListeDetayState();
}

class _ListeDetayState extends State<ListeDetay> {
  var tfUrunAd = TextEditingController();
  var tfUrunMiktar = TextEditingController();

  @override
  void initState() {
    super.initState();
    var urun = widget.name;
    tfUrunAd.text = urun.name;
    tfUrunMiktar.text = urun.miktar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: const Text(
          "Ürün Detay",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfUrunAd,
                decoration: InputDecoration(
                  labelText: "Ürün Ad",
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              TextField(
                controller: tfUrunMiktar,
                decoration: InputDecoration(
                  labelText: "Miktar",
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[800],
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  context.read<ListeDetayCubit>().guncelle(
                      widget.name.name_id, tfUrunAd.text, tfUrunMiktar.text);
                },
                child: const Text(
                  "Güncelle",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[800],
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${widget.name.name} ürünü silinsin mi ?"),
                      action: SnackBarAction(
                        label: 'Evet',
                        onPressed: () {
                          context
                              .read<AnasayfaCubit>()
                              .sil(widget.name.name_id);
                        },
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Sil",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
