class TransactionModel {
  TransactionModel({
    this.hash,
    this.doubleSpend,
    required this.ver,
    required this.vinSz,
    required this.voutSz,
    required this.size,
    required this.weight,
    required this.fee,
    required this.lockTime,
    required this.txIndex,
    required this.time,
    required this.blockIndex,
    required this.blockHeight,
  });

  String? hash;
  int ver = 0;
  int vinSz = 0;
  int voutSz = 0;
  int size = 0;
  int weight = 0;
  int fee = 0;
  int lockTime = 0;
  int txIndex = 0;
  bool? doubleSpend;
  int time = 0;
  int blockIndex = 0;
  int blockHeight = 0;

  TransactionModel.fromJson(Map<String, dynamic> json) {
    hash = json["hash"];
    ver = json["ver"];
    vinSz = json["vin_sz"];
    voutSz = json["vout_sz"];
    size = json["size"];
    weight = json["weight"];
    fee = json["fee"];
    lockTime = json["lock_time"];
    txIndex = json["tx_index"];
    doubleSpend = json["double_spend"];
    time = json["time"];
    blockIndex = json["block_index"];
    blockHeight = json["block_height"];
  }

  Map<String, dynamic> toJson() => {
        "hash": hash,
        "ver": ver,
        "vin_sz": vinSz,
        "vout_sz": voutSz,
        "size": size,
        "weight": weight,
        "fee": fee,
        "lock_time": lockTime,
        "tx_index": txIndex,
        "double_spend": doubleSpend,
        "time": time,
        "block_index": blockIndex,
        "block_height": blockHeight,
      };
}
