import 'package:flutter/material.dart';
import 'package:flutter_alisveris_liste_uygulamasi/cubit/liste_kayit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListeKayit extends StatefulWidget {
  const ListeKayit({super.key});

  @override
  State<ListeKayit> createState() => _ListeKayitState();
}

class _ListeKayitState extends State<ListeKayit> {
  var tfUrunAd = TextEditingController();
  var tfUrunMiktar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: const Text(
          "Ürün Ekle",
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
                  context
                      .read<ListeKayitCubit>()
                      .kayit(tfUrunAd.text, tfUrunMiktar.text);
                },
                child: const Text(
                  "Kaydet",
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
