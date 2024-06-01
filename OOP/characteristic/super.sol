// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Student {
    
    string[] internal cources;

    function showCourses() public virtual returns(string[] memory) {
        delete cources;
        cources.push("English");
        cources.push("Music");
        return cources;
    } 
}

contract ArtStudent is Student {

    function showCourses() public override returns(string[] memory) {
        super.showCourses();
        cources.push("Art");
        return cources;
    } 
}