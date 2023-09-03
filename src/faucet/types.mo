module {

  // ===== DIP20 TOKEN INTERFACE =====
  // DIP20キャニスターが使用している型
  public type TxReceipt = {
    #Ok : Nat;
    #Err : {
      #InsufficientAllowance;
      #InsufficientBalance;
      #ErrorOperationStyle;
      #Unauthorized;
      #LedgerTrap;
      #ErrorTo;
      #Other : Text;
      #BlockUsed;
      #AmountTooSmall;
    };
  };

  // DIP20キャニスターからコールしたい関数
  public type DIPInterface = actor {
    balanceOf : (who : Principal) -> async Nat;
    transfer : (to : Principal, value : Nat) -> async TxReceipt;
  };

  // ===== FAUCET =====
  // faucetキャニスターが使用する型
  public type FaucetReceipt = {
    #Ok : Nat;
    #Err : {
      #AlreadyGiven;
      #FaucetFailure;
      #InsufficientToken;
    };
  };
};