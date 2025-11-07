class Product {
  final int productKey;
  final String productAlternateKey;
  final int? productSubcategoryKey;
  final String? weightUnitMeasureCode;
  final String? sizeUnitMeasureCode;
  final String englishProductName;
  final String spanishProductName;
  final String frenchProductName;
  final double? standardCost;
  final bool finishedGoodsFlag;
  final String color;
  final int safetyStockLevel;
  final int reorderPoint;
  final double? listPrice;
  final String? size;
  final String sizeRange;
  final double? weight;
  final int daysToManufacture;
  final String? productLine;
  final double? dealerPrice;
  final String? productClass;
  final String? style;
  final String? modelName;

  Product({
    required this.productKey,
    required this.productAlternateKey,
    this.productSubcategoryKey,
    this.weightUnitMeasureCode,
    this.sizeUnitMeasureCode,
    required this.englishProductName,
    required this.spanishProductName,
    required this.frenchProductName,
    this.standardCost,
    required this.finishedGoodsFlag,
    required this.color,
    required this.safetyStockLevel,
    required this.reorderPoint,
    this.listPrice,
    this.size,
    required this.sizeRange,
    this.weight,
    required this.daysToManufacture,
    this.productLine,
    this.dealerPrice,
    this.productClass,
    this.style,
    this.modelName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productKey: json['ProductKey'] as int,
      productAlternateKey: json['ProductAlternateKey'] as String,
      productSubcategoryKey: json['ProductSubcategoryKey'] as int?,
      weightUnitMeasureCode: json['WeightUnitMeasureCode'] as String?,
      sizeUnitMeasureCode: json['SizeUnitMeasureCode'] as String?,
      englishProductName: json['EnglishProductName'] as String,
      spanishProductName: json['SpanishProductName'] as String,
      frenchProductName: json['FrenchProductName'] as String,
      standardCost: json['StandardCost'] as double?,
      finishedGoodsFlag: json['FinishedGoodsFlag'] as bool,
      color: json['Color'] as String,
      safetyStockLevel: json['SafetyStockLevel'] as int,
      reorderPoint: json['ReorderPoint'] as int,
      listPrice: json['ListPrice'] as double?,
      size: json['Size'] as String?,
      sizeRange: json['SizeRange'] as String,
      weight: json['Weight'] as double?,
      daysToManufacture: json['DaysToManufacture'] as int,
      productLine: json['ProductLine'] as String?,
      dealerPrice: json['DealerPrice'] as double?,
      productClass: json['Class'] as String?,
      style: json['Style'] as String?,
      modelName: json['ModelName'] as String?,
    );
  }
}
