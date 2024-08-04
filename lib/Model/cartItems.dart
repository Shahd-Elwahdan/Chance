class CartItem {
  String? name;
  String? img;
  int? count;
  double? Singleprice;
  int? totalprice;
  String? size;

  CartItem(
      {this.name,
      this.img,
      this.count,
      this.Singleprice,
      this.totalprice,
      this.size});
}

List<CartItem>? cartitem = [];
