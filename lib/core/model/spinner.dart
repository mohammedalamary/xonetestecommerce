class Spinner{
  final String? nameAr;
  final String? nameEnglish;
  var id;
  final String? code;

  Spinner( {this.nameAr,this.nameEnglish, this.id,this.code, });


Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};

  // data['SRVC_CODE'] = id;
  // data['SERVICE_A_NAME'] = nameAr;
  return data;
}

}


