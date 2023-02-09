class SurveyListModel {
  List<Survey>? survey;

  SurveyListModel({this.survey});

  SurveyListModel.fromJson(Map<String, dynamic> json) {
    if (json['survey'] != null) {
      survey = <Survey>[];
      json['survey'].forEach((v) {
        survey!.add(new Survey.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.survey != null) {
      data['survey'] = this.survey!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Survey {
  String? name;
  int? count;
  int? id;

  Survey({this.name, this.count, this.id});

  Survey.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = json['count'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['count'] = this.count;
    data['id'] = this.id;
    return data;
  }
}
