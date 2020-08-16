class ZQuote {
  String event;
  String quote;

  ZQuote(this.event, this.quote);

  static ZQuote getZQuoteFromJSON(dynamic json) {
    String event = json['event'];
    String quote = json['quote'];

    return ZQuote(event, quote);
  }
}
