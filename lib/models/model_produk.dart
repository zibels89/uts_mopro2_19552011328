/**
@author Ahmad Fauzy Khamarullah - 19552011328 - TIF RM 19 CID
 */
/// for doc comments
class ModelProduk {
  final int? colorHex;
  final String? gambar;
  final String? namaTipe;
  final num? harga;

  ModelProduk({
    this.colorHex,
    this.gambar,
    this.namaTipe,
    this.harga,
  });

  List<ModelProduk> get listProduct => [
        ModelProduk(
          colorHex: 0xff70b1a1,
          gambar: 'aset/img/mini_7_plus_mint_r.png',
          namaTipe: 'Instax Mini Mint 7+',
          harga: 49.90,
        ),
        ModelProduk(
          colorHex: 0xff77a0c6,
          gambar: 'aset/img/mini_7_plus_blue_r.png',
          namaTipe: 'Instax Mini Blue 7+',
          harga: 50.90,
        ),
        ModelProduk(
          colorHex: 0xffb0463c,
          gambar: 'aset/img/mini_7_plus_choral_r.png',
          namaTipe: 'Instax Mini Choral 7+',
          harga: 51.90,
        ),
        ModelProduk(
          colorHex: 0xfffcf9496,
          gambar: 'aset/img/mini_7_plus_pink_r.png',
          namaTipe: 'Instax Mini Pink 7+',
          harga: 52.90,
        ),
        ModelProduk(
          colorHex: 0xff855f8c,
          gambar: 'aset/img/mini_7_plus_lavender_r.png',
          namaTipe: 'Instax Mini Lavender 7+',
          harga: 53.90,
        ),
      ];
}
