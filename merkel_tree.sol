// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MerkleTree {
    function verifyTransaction( bytes32[] memory _hashArray, bytes32 _leaf, bytes32 _root, uint index) public pure returns(bool){
        bytes32 hash=_leaf;
        for(uint i; i<_hashArray.length; i++){
            if(index % 2 ==0){
                hash = keccak256(abi.encodePacked(hash,_hashArray[i]));
            }
            else{
                hash = keccak256(abi.encodePacked(_hashArray[i],hash));
            }
            index = index/2;
        }
        return hash == _root;

    }
}
