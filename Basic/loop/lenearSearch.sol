// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Search {
    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea", "USA", "Germany", "Japan"];

    // 문자열 - string 솔리디티 내에서 비교불가
    // 문자열 > 바이트화 (이진수) > keccak256 해시화
    // 해쉬 특성상 값이 서로 같고 다름을 쉽게 파악 가능
    // keccak256의 파라미터는 bytes32 데이터 유형이기에 기존 스트링을 바이트화 시켜 keccak256 해시화
    function lenearSearch (string memory _search) 
        public 
        view 
        returns(uint256, string memory)
    {

        for (uint i = 0; i < countryList.length; i++) {
            if (keccak256(bytes(countryList[i])) == keccak256(bytes(_search))) {
                return (i, countryList[i]);
            }
        }

        return (0, "Nothing");
    }
}