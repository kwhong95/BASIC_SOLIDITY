// 지역 변수

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
// View 상태 변수를 수정하지 않고 상태 변수를 읽을 때 사용

contract MyStorage {
    
      // 선언을 표시하는 함수 정의
    // 지역 변수의 범위
    function getResult() public pure returns(uint) {

      //지역변수 변수 초기화
      uint local_var1 = 1;
      uint local_var2 = 2;
      uint result = local_var1 + local_var2;

      // 지역 변수에 접근     
      return result;
    }
}

// Pure 상태를 수정하거나 상태 변수를 읽지(엑세스)하지 않을 때 사용해야 한다.
// 일반적으로 입력 매개변수를 기반으로 작업을 수행