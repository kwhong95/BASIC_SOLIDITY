## Modifier(함수 제어자)

- 특정 기능을 미리 정의해서 여러 함수에 적용 가능
→ 함수 로직에 제한을 주는 역할
- **PURE** : 적용 시, 함수 밖에서 선언된 변수를 pure가 적용된 함수 내부로 가져오지 못함
  - 순수하게 함수 내부에서 정의된 변수
  - 매개 변수만 함수 내부에서 선언 가능
- **VIEW** : **스마트 컨트랙트** 내부만 접근 / 호출 가능
  - pure보다 느슨
  - 외부 함수 읽기 가능
  - 읽은 변수값을 함수 내부에서 변경 불가

```sol
funciton myBlock() pubilc pure {
  // 함수 로직
}
```

### 반환 
- 함수를 반환하는 타입은 `returns`라는 키워드를 통해 명시적으로 드러남
```sol
contract Basic {
  uint private number = 0;

  function numberPlus() internal {
    number ++; // numberPlus 함수가 internal로 선언
  }
}

contract Basic2 is Basic {
  uint private number2 = 0;
  
  function numberP() public returns (string) {
    number2 ++;
    // numberPlus 함수가 internal로 선언되었기 때문에
    // 자식 컨트랙트에서 호출 가능
    numberPlus();
  }
}
```