import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";

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

  public func withdraw (amount: Nat){ //update function -  takes a while because it goes by the blockchain
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large, current value < 0");
    }
  };

  public query func checkBalance(): async Nat{
      return currentValue;
  }

}