class CurrensiesModel {
  String CcyNm_UZ;
  String Nominal;
  String Rate;
  String Date;
  CurrensiesModel({
    required this.CcyNm_UZ,
    required this.Nominal,
    required this.Rate,
    required this.Date,
  });
  
  factory CurrensiesModel.fromJson(Map<String, dynamic> json) =>
      CurrensiesModel(
        CcyNm_UZ: json['CcyNm_UZ'],
        Nominal: json['Nominal'],
        Rate: json['Rate'],
        Date: json['Date'],
      );
}

List<CurrensiesModel> currebsiesFromMap(List list) =>
    List<CurrensiesModel>.from(
        list.map((item) => CurrensiesModel.fromJson(item)));
