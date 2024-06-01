## 다형성 (Polymorphism)
> 같은 종류인데,
> 서로 다른 형질이나 형태를 갖는 것을 의미

> 같은 프로그래밍 인자가
> 서로 다른 자료형을 갖는 것

다형성의 타입

- 컴파일 타임 다형성
  - Function Overloading
  - Operator Overloading
- 런타임 다형성
  - Virtial Functions

### 오버로딩 (Overloaing)

> 하나의 함수가 여러개의 매개변수를 다룰 수 있음
> 함수르 유연하게 활용 가능

```sol
function get(uint _param) public pure returns(uint) {
  return _param;
}

function get(bool _param) public pure returns(bool) {
  return _param;
}
```

### 오버라이딩 (Overriding)

> 자식 컨트랙트가 부모 컨트랙트로부터
> 상속 받은 함수를 자신에 맞게 변경하는 것

> 키워드 : `virtual` / `override`

```sol
contract Student {
  function major() public pure virtual (uint) {
    return "Math";
  }
}

contract MusicStudent is Student {
  function major() public override returns (string memory) {
    return "Music";
  }
}
```

### 다중 상속
> 상속의 심화
> 한 개 이상의 부모 컨트랙트를 상속할 때, 다중 상속이라 정의

```sol
contract Kyle is Student, Developer {
}
```
