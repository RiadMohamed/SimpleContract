pragma solidity >=0.4.21 <0.7.0;
contract SimpleContract {
    // A simple contract that will return the specified amount of money the user requests if it has enough balance.
    // Otherwise, it will return 0.
    uint _currentBalance;
    constructor(uint initialBalance) public {
        _currentBalance = initialBalance;
    }
    
    function _checkFunds(uint requestedAmount) private view returns (bool) {
        return (requestedAmount < _currentBalance);
    }
    
    function requestAmount(uint requestedAmount) public returns (uint) {
        if (_checkFunds(requestedAmount)) {
            _currentBalance -= requestedAmount;
            return requestedAmount;
        } else {
            return 0;
        }
    }
}