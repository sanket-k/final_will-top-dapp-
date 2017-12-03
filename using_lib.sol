/*
   Simple Alarm clock.

   This contract will be called back automatically 2 years after its birth
*/
pragma solidity ^0.4.11;

import "dev.oraclize.it/api.sol";

contract Alarm is usingOraclize {
    function Alarm() {
       oraclize_query(1*year, "URL", "");
    }

    function __callback(bytes32 myid, string result) constant returns(string) {
        if (msg.sender != oraclize_cbAddress()) throw;
        return("this is alarm clock example");
    }
}
