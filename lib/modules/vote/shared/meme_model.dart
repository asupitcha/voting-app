class ResponseBody {
  bool success;
  Data data;

  ResponseBody({this.success, this.data});

  ResponseBody.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Meme> memes;

  Data({this.memes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['memes'] != null) {
      memes = new List<Meme>();
      json['memes'].forEach((v) {
        memes.add(new Meme.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.memes != null) {
      data['memes'] = this.memes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meme {
  String id;
  String name;
  String url;
  int width;
  int height;
  int boxCount;
  int count;

  Meme({
    this.id,
    this.name,
    this.url,
    this.width,
    this.height,
    this.boxCount,
  });

  Meme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    boxCount = json['box_count'];
    count = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['box_count'] = this.boxCount;
    return data;
  }
}
