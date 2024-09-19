import 'package:flutter_alisveris_liste_uygulamasi/models/liste.dart';
import 'package:flutter_alisveris_liste_uygulamasi/repository/listedao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Liste>> {
  AnasayfaCubit() : super(<Liste>[]);

  var lrepo = ListedaoRepo();

  Future<void> UrunYukle() async {
    var liste = await lrepo.UrunGetir();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await lrepo.UrunAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int name_id) async {
    await lrepo.UrunSil(name_id);
    await UrunYukle();
  }
}
