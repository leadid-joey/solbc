// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//import "openzeppelin-solidity/contracts/math/SafeMath.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/math/SafeMath.sol";

/// @title Multisignature wallet - Allows multiple parties to agree on transactions before execution.
// Code adopted from https://solidity-by-example.org/app/multi-sig-wallet/ 
contract MultiSigWallet {

    // enums
    enum TransactionActions {
        AwaitingSubmission,
        Submitted,
        Confirmed1,
        Confirmed2,
        Executed,
        Revoked
    }

    // vars
    uint256 public submissions;

    struct MultiFlow {
        address toAddress;
        uint256 id;        
        bool submit;
        uint256 submissionId;
        bool confirm1;
        bool confirm2;
        bool execute;
        bool revoke;
    }

    // Function to increment count by 1
    // https://solidity-by-example.org/first-app/
    function add() public {
        submissions += 1;
    }

    //mapping(key => mapping(key2 => value2)) public myMapping;
    mapping(address => mapping(uint => MultiFlow)) public MultiWallTracking;
    
    function addMultiTrackingRecord(
                            address _toAddress,
                            uint _id, 
                            bool  _submit,
                            uint256 _submissionId,
                            bool  _confirm1,
                            bool  _confirm2,
                            bool  _execute,
                            bool  _revoke)
                        public {
                            add();
                            MultiWallTracking[_toAddress][_id] = MultiFlow(
                                                            _toAddress,
                                                            _id,
                                                            _submit,
                                                            _submissionId,
                                                            _confirm1,
                                                            _confirm2,
                                                            _execute,
                                                            _revoke);
    }
}