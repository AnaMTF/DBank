import Debug "mo:base/Debug";

actor DBank { //class in motoko
  var currentValue = 300; //variable
  currentValue := 100;

  let id = 361283218; //constant

  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw (amount: Nat){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  }

}