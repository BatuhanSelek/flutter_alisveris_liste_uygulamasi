import 'package:flutter/material.dart';
import 'package:flutter_alisveris_liste_uygulamasi/cubit/anasayfa_cubit.dart';
import 'package:flutter_alisveris_liste_uygulamasi/cubit/liste_kayit_cubit.dart';
import 'package:flutter_alisveris_liste_uygulamasi/models/liste.dart';
import 'package:flutter_alisveris_liste_uygulamasi/views/liste_detay.dart';
import 'package:flutter_alisveris_liste_uygulamasi/views/liste_kayit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().UrunYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: aramaYapiliyorMu
            ? TextField(
                decoration: const InputDecoration(
                  hintText: "Ara",
                ),
                onChanged: (aramaSonucu) {
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
              )
            : const Text(
                "Listem",
                style: TextStyle(color: Colors.black),
              ),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                    context.read<AnasayfaCubit>().UrunYukle();
                  },
                  icon: const Icon(Icons.cancel, color: Colors.black),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search, color: Colors.black),
                )
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Liste>>(
        builder: (context, UrunListesi) {
          if (UrunListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: UrunListesi.length,
              itemBuilder: (context, indeks) {
                var urun = UrunListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListeDetay(
                                  name: urun,
                                ))).then((value) {
                      context.read<AnasayfaCubit>().UrunYukle();
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${urun.name}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${urun.miktar}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[200],
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ListeKayit()))
              .then((value) {
            context.read<AnasayfaCubit>().UrunYukle();
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
