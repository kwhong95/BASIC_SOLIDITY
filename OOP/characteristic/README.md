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


---

## 추상화 (Abstraciton)

> 만들고자 하는 여러개 스마트 컨트랙트의
> 공통 함수를 묶어 이름을 명시하는 것

- 객체지향 언어의 특성
- 추상화

> **솔리디티 추상화 표현법**
> 1) 추상 스마트 컨트랙트
> 2) 인터페이스 정의

> UML : Unified Modeling Language

### System 추상 컨트랙트
> 기존 스마트 컨트랙트와 다른점

'abstract' 키워드 추상 컨트랙트 작성 시 필수 명시

```sol
abstract contract System {
  uint public version;
  function versionCheck() public virtual;

  contract Computer is System {
    function versionCheck() public override {
      version = 3;
    }
  }
}
```

## 인터페이스(Interface)

- 스마트 계약에서 인터페이스는 뼈대며 기반
- 계약 기능과 계약을 트리거하는 방법을 정의
- 결론은 외부에서 변수를 직접 접근은 불가능

### 인터페이스 제한사항
- 인터페이스끼리 상속할 수 없음, 컨트랙트와 상속해야 함
- 완전히 구현된 함수를 정의할 수 없음, 구현되지 않은 함수를 명시해야 함
- 함수의 가시성 지정자는 `external`이어야 함
- 인터페이스는 생성자를 정의할 수 없음
- 상태를 변수를 정의할 수 없음
- 모디파이어를 정의할 수 없음

```sol
interface ICounter {
  function decrement() external;
  function increment() external;
}
```

### ABI interface (Application Binary interface)

- 스마트 컨트랙트의 정보
- ABI가 배포된 스마트 컨트랙트 주소로 배포된 스마트 컨트랙트와 상호작용 가능
- 인터페이스는 ABI와 아무런 정보 손실 없이 변환 가능