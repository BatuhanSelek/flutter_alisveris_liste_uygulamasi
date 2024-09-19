import 'package:flutter_alisveris_liste_uygulamasi/repository/listedao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListeDetayCubit extends Cubit<void> {
  ListeDetayCubit() : super(0);

  var lrepo = ListedaoRepo();

  Future<void> guncelle(int name_id, String name, String miktar) async {
    await lrepo.UrunGuncelle(name_id, name, miktar);
  }
}
