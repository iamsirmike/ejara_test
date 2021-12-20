class BlockModel {
  int? height;
  String? hash;
  int? time;
  int? blockIndex;
  List<int>? txIndexes;

  BlockModel({
    this.height,
    this.hash,
    this.time,
    this.blockIndex,
    this.txIndexes,
  });

  BlockModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    hash = json['hash'];
    time = json['time'];
    blockIndex = json['block_index'];
    txIndexes = json['txIndexes'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['hash'] = this.hash;
    data['time'] = this.time;
    data['block_index'] = this.blockIndex;
    data['txIndexes'] = this.txIndexes;
    return data;
  }
}
