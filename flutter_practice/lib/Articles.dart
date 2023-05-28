import 'Source.dart';

/// source : {"id":"engadget","name":"Engadget"}
/// author : "Igor Bonifacic"
/// title : "Apple’s free My Photo Stream service will shut down on July 26th"
/// description : "Apple plans to shut down its My Photo Stream service on July 26th, 2023, the company announced on Friday\r\n. The free service has been available since the release of iCloud in 2011. You can use My Photo Stream to upload the last 30 days of images and videos – …"
/// url : "https://www.engadget.com/apples-free-my-photo-stream-service-will-shut-down-on-july-26th-211650923.html"
/// urlToImage : "https://s.yimg.com/uu/api/res/1.2/9dkjc.YlqeAItfXunN9cSg--~B/Zmk9ZmlsbDtoPTYzMDtweW9mZj0wO3c9MTIwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2023-05/31819120-fcd2-11ed-b35f-7c04a4919b07.cf.jpg"
/// publishedAt : "2023-05-27T21:16:50Z"
/// content : "Apple plans to shut down its My Photo Stream service on July 26th, 2023, the company announced on Friday\r\n. The free service has been available since the release of iCloud in 2011. You can use My Pho… [+1758 chars]"

class Articles {
  Articles({
      Source? source, 
      String? author, 
      String? title, 
      String? description, 
      String? url, 
      String? urlToImage, 
      String? publishedAt, 
      String? content,}){
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
}

  Articles.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }

}