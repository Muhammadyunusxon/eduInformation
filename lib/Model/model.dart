class Info{
  List<dynamic>? domains;
  final List<String>? webPages;
  String? alphaTwoCode, country,name;
  dynamic stateProvince;
  Info({this.domains, this.webPages, this.alphaTwoCode, this.country,this.name,this.stateProvince});

  factory Info.convertJson(Map data){
    List<String> pages =[];
    data['web_pages'].forEach((e)=>
      pages.add(e)
    );
    return Info(
        domains: data['domains'],
        webPages: pages,
        alphaTwoCode: data['alpha_two_code'],
        country: data['country'],
        name: data['name'],
        stateProvince: data['state-province']);
  }

}