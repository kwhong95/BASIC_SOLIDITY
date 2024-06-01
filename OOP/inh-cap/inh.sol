// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Student {
    string public schoolName = "The University of Solidity";
}

contract HighSchoolStudent is Student {
    function changeSchoolName() public {
        schoolName = "The University of Blockchain";
    }

    function getSchoolName() public view returns (string memory) {
        return schoolName;
    }
}