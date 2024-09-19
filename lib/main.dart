import 'package:flutter/material.dart';
import 'package:flutter_alisveris_liste_uygulamasi/cubit/anasayfa_cubit.dart';
import 'package:flutter_alisveris_liste_uygulamasi/cubit/liste_detay_cubit.dart';
import 'package:flutter_alisveris_liste_uygulamasi/cubit/liste_kayit_cubit.dart';
import 'package:flutter_alisveris_liste_uygulamasi/views/anasayfa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ListeDetayCubit()),
        BlocProvider(create: (context) => ListeKayitCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Alışveriş Listem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
