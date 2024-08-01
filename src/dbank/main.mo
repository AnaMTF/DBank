import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Float "mo:base/Float";
import Time "mo:base/Time";

actor DBank { //class in motoko
  stable var currentValue: Float = 300; //orthoganally persistent variable

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  let id = 361283218; //constant

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw (amount: Float){ //update function -  takes a while because it goes by the blockchain
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large, current value < 0");
    }
  };

  public query func checkBalance(): async Float{
      return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeDiff = currentTime - startTime;
    let timeDiffInSec = timeDiff / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeDiffInSec));
    startTime := currentTime;
  };
}