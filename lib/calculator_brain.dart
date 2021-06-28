class CalculatorBrain {
  //should calculate tip and tax breakdown
  //subtotal breakdown
  //give total owed per person

  //later on, will need to create models for person and item to be able to associate items w/ people to be able to do it properly

  CalculatorBrain(
      {required this.sub,
      required this.tax,
      required this.tipPercent,
      required this.people,
      required this.splitType});

  final num sub;
  final num tax;
  final int tipPercent;
  final int people;
  final String splitType;

  num tipTotal = 0;
  String calculateTip() {
    tipTotal = (sub * tipPercent) / 100;
    return "\$" + tipTotal.toStringAsFixed(2);
  }

  String returnTax() {
    return "\$" + tax.toStringAsFixed(2);
  }

  num taxTipPP = 0;
  String taxTipPer() {
    //adjust function to include if/else condition based on splitType
    //if based on %, will need to find the person's % of subtotal value and then taxTipPer for that specific person would be (tipTotal + tax) * percent of sub
    //if even, this current equation is fine
    taxTipPP = (tipTotal + tax) / people;
    return "\$" + taxTipPP.toStringAsFixed(2);
  }

  num itemTotalPP = 0;
  String itemTotalPer() {
    //this is only for an even split; will need to adjust once the model associations are worked out
    itemTotalPP = sub / people;
    return "\$" + itemTotalPP.toStringAsFixed(2);
  }

  String totalPer() {
    num totalPP = taxTipPP + itemTotalPP;
    return "\$" + totalPP.toStringAsFixed(2);
  }

  String totalBill() {
    num totalBill = sub + tax + tipTotal;
    return "\$" + totalBill.toStringAsFixed(2);
  }
}
