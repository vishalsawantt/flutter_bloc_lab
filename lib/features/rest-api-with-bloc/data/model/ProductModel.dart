class Productmodel {
  final String id;
  final String productname;
  final String productdecr;
  final String productprice;

  Productmodel({
    required this.id,
    required this.productname,
    required this.productdecr,
    required this.productprice,
  });

  factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      id: json['id'] as String, 
      productname: json['productname'] as String, 
      productdecr: json['productdecr'] as String, 
      productprice: json['productprice'] as String
    );
  }
}