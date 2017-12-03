/*
                                Final Will and testament (smart contract)
                        1. Whoever deploys the contract becomes the creator,
                        2. The creator has the highest rights, and is able to change/ write the will,
                        3. Anyone is free to view the will, after the pre-set time has passed.
*/

pragma solidity ^0.4.11;

//will to display after a set-time has passed
contract will{
    address creator;                        // to determine the contract deployer
    uint unlockTime;                        // to display the time remaining
    string finalWill;                       // string variable which contains the will

    //constructor with the creator as the contract deployer and a set timer
    function will() public{
        creator = msg.sender;
        unlockTime = 1602504000;
    }

    // modifier to give the creator rights to certain parts of the code(restricted to others)
    modifier onlyCreator(){
        require(msg.sender == creator);
        _;
    }

    // function to create will, open only to the creator
    function createWill(string _string) onlyCreator public{
        finalWill = _string;
    }

    // returns the amount of time, before the will can be displayed
    function getUnlockTime() constant returns(uint){
        return unlockTime;
    }

    // function to display the will after the pre-set time has passed(open to all)
    function displayFinalWill() constant returns(string){
        if(now >= unlockTime)
            return finalWill;
    }
}
