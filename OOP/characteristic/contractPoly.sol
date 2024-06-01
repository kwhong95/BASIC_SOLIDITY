// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Developer {
    function getName() public pure virtual returns (string memory) {
        return "All Developer";
    }
}

contract BlockChainDeveloper is Developer {

    function getName() public pure override returns (string memory) {
        return "Blockchain Developer";
    }
} 

contract WebDeveloper is Developer {
    
    function getName() public pure override returns (string memory) {
        return "Web Developer";
    }
} 

contract DeveloperSet {
    Developer public blockchain = new BlockChainDeveloper();
    Developer public web = new WebDeveloper();
    
    function getAllNames() public view returns (string memory, string memory) {
        return (blockchain.getName(), web.getName());
    }

    function whatIsTheName(Developer _developer) public pure returns(string memory) {
        return (_developer.getName());
    }
}