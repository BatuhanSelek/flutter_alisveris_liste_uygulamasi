import 'package:flutter_alisveris_liste_uygulamasi/repository/listedao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListeKayitCubit extends Cubit<void> {
  ListeKayitCubit() : super(0);

  var Lrepo = ListedaoRepo();

  Future<void> kayit(String name, String miktar) async {
    await Lrepo.UrunKayit(name, miktar);
  }
}
