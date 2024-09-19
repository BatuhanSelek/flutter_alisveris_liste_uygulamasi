import 'package:flutter_alisveris_liste_uygulamasi/models/liste.dart';
import 'package:flutter_alisveris_liste_uygulamasi/sqlite/veritabani_yardimcisi.dart';

class ListedaoRepo {
// Ürün Kayıt İşlemlerini Burada Gerçekleştirdik.
  Future<void> UrunKayit(String name, String miktar) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler['name'] = name;
    bilgiler['miktar'] = miktar;
    await db.insert("liste", bilgiler);
  }

// Ürün Güncelleme İşlemlerini Burada Gerçekleştirdik.

  Future<void> UrunGuncelle(int name_id, String name, String miktar) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler['name'] = name;
    bilgiler['miktar'] = miktar;
    await db
        .update("liste", bilgiler, where: "name_id=?", whereArgs: [name_id]);
  }

  // Ürün Silme İşlemini Burada Gerçekleştirdik.

  Future<void> UrunSil(int name_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("liste", where: "name_id=?", whereArgs: [name_id]);
  }

  //-----------------------------------------//

  Future<List<Liste>> UrunGetir() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM liste");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Liste(
          name_id: satir["name_id"],
          name: satir["name"],
          miktar: satir["miktar"]);
    });
  }

  Future<List<Liste>> UrunAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM liste WHERE name LIKE '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Liste(
          name_id: satir["name_id"],
          name: satir["name"],
          miktar: satir["miktar"]);
    });
  }
}
