// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

/*
    반복문
    continue : 조건이 맞을 시 다음 반복문으로 이동
    조건에 맞는 i값이 올 경우 이벤트를 건너뛰고
    i 값이 조건에 맞지 않다면 이벤트가 출력되면서 반복
    break : 조건에 맞을 시 반복문 종료
    조건에 맞는 i값이 나온다면 loop 종료 반복문 종료
*/

contract Continue {
    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea", "USA", "Germany", "Japan"];

    function useContinue() public {

        for(uint256 i = 0; i < countryList.length; i++) {
            if (i % 2 == 1) {
                continue;
            }
            emit CountryIndexName(i, countryList[i]);
        }
    }

    function useBreak() public {

        for(uint256 i = 0; i < countryList.length; i++) {
            if (i == 2) {
                break;
            }
            emit CountryIndexName(i, countryList[i]);
        }
    }
}