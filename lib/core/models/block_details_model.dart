import 'package:crypto_app/core/models/transactions_model.dart';

class BlockDetailsModel {
  BlockDetailsModel({
    this.hash,
    this.ver,
    this.prevBlock,
    this.mrklRoot,
    this.time,
    this.bits,
    this.nextBlock,
    this.fee,
    this.nonce,
    this.nTx,
    this.size,
    this.blockIndex,
    this.mainChain,
    this.height,
    this.weight,
    this.tx,
  });

  String? hash;
  int? ver;
  String? prevBlock;
  String? mrklRoot;
  int? time;
  int? bits;
  List<String>? nextBlock;
  int? fee;
  int? nonce;
  int? nTx;
  int? size;
  int? blockIndex;
  bool? mainChain;
  int? height;
  int? weight;
  List<TransactionModel>? tx;

  BlockDetailsModel.fromJson(Map<String, dynamic> json) {
    hash = json["hash"];
    ver = json["ver"];
    prevBlock = json["prev_block"];
    mrklRoot = json["mrkl_root"];
    time = json["time"];
    bits = json["bits"];
    nextBlock = List<String>.from(json["next_block"].map((x) => x));
    fee = json["fee"];
    nonce = json["nonce"];
    nTx = json["n_tx"];
    size = json["size"];
    blockIndex = json["block_index"];
    mainChain = json["main_chain"];
    height = json["height"];
    weight = json["weight"];
    tx = List<TransactionModel>.from(json["tx"].map((x) => TransactionModel.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "hash": hash,
        "ver": ver,
        "prev_block": prevBlock,
        "mrkl_root": mrklRoot,
        "time": time,
        "bits": bits,
        "next_block": List<dynamic>.from(nextBlock!.map((x) => x)),
        "fee": fee,
        "nonce": nonce,
        "n_tx": nTx,
        "size": size,
        "block_index": blockIndex,
        "main_chain": mainChain,
        "height": height,
        "weight": weight,
        "tx": List<dynamic>.from(tx!.map((x) => x.toJson())),
      };
}

