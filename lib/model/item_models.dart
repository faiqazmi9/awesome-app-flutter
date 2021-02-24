class ItemModels {
  int id;
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModels src;

  ItemModels(
      {this.id,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.src});

  factory ItemModels.formMap(Map<String, dynamic> jsonData) {
    return ItemModels(
        id: jsonData["id"],
        photographer: jsonData["photographer"],
        photographerUrl: jsonData["photographer_url"],
        photographerId: jsonData["photographer_id"],
        src: SrcModels.formMap(jsonData["src"]));
  }
}

class SrcModels {
  String original;
  String small;

  SrcModels({this.original, this.small});

  factory SrcModels.formMap(Map<String, dynamic> jsonData) {
    return SrcModels(original: jsonData["original"], small: jsonData["small"]);
  }
}
