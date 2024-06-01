// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract For {
    
    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea", "USA", "Germany", "Japan"];

    function forLoopEvent() public {
        for (uint256 i = 0; i < countryList.length; i++) {
            emit CountryIndexName(i, countryList[i]);
        }
    }
}


// contract While {
//     event CountryIndexName(uint256 indexed _index, string _name);
//     string[] private countryList = ["South Korea", "USA", "Germany", "Japan"];

//     function whileLoopEvent () public {
//         uint256 i = 0;
//         while (i < countryList.length) {
//             emit CountryIndexName(i, countryList[i]);
//             i ++;
//         }
//     }
// }

// contract DoWhile {
//     event CountryIndexName(uint256 indexed _index, string _name);
//     string[] private countryList = ["South Korea", "USA", "Germany", "Japan"];

//     function doWhileLoopEvent () public {
//         uint256 i = 0;
//         do {
//             emit CountryIndexName(i, countryList[i]);
//             i++;
//         } while (i < countryList.length);
//     }
// }