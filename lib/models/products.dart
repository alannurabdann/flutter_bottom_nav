class products {
  bool? selected;
  String? kodePLU, hargaNormal, hargaPromo, hargaSatuan;

  products(String? plu, String? price, String? discount, String? unit, bool? selected){
    this.kodePLU = plu;
    this.hargaNormal = price;
    this.hargaPromo = discount;
    this.hargaSatuan = unit;
    this.selected = selected;
  }
}