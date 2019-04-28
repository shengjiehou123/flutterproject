

class NewsModle{
  Map game_info;
  String content;
  String acontent;

  NewsModle(this.game_info,this.content,this.acontent);

  NewsModle.fromJson(Map json){
     game_info = json['game_info'];
     content = json['content'];
     acontent = json['acontent'];
 }
}




