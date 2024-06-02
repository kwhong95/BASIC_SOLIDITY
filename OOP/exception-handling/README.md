## 예외 처리 : Exception Handling

## 오류 발생 함수 : `assert`, `revert`, `require`

- **asset, revert, require**
- 트랜잭션 조건 미부합 시 오류를 발생시켜 외부 접근 제한

> 공통점 : 오류를 발생시켜 트랜잭션을 실패로 만드는 것

### assert (조건)

- **Bool 자료형의 매개변수를 받으며 `false`일시 오류가 발생**
- 불변성 또는 내부적 코드 결함을 확인할 때 사용
- 0.8버전 이상부터는 `assert`는 `revert`를 이용해 오류 발생 및 가시비를 환불
- gas를 다 소비한 후, 특정한 조건에 부합하지 않으면 에러를 발생
- 내부 오류를 테스트하고 불변성을 확인하는데만 사용해야 함
- `panic`이 발생했다면 contract 내부 자체에 문제가 있는 경우

ex) `assert(userBalance <= totalSupply)`

### panic이 발생되는 경우

1. 0x00 : 일반 컴파일러 삽입 패닉에 사용됨
2. 0x01 : assert false로 평가되는 인수로 호출하는 경우
3. 0x11 : 산술 연산으로 인해 블록 외부에서 언더플로 또는 오버플로가 발생하는 경우 `unchecked { ... }`
4. 0x12 : 0으로 나누거나 모듈로하는 경우 (예: 또는) 5/023 % 0
5. 0x21 : 너무 크거나 음수인 값을 열거형으로 변환하는 경우
6. 0x22 : 잘못 인코딩된 스토리지 바이트 배열에 엑세스하는 경우
7. 0x31 : `pop()` 빈 배열을 호출하는 경우
8. bytesNOx32 : 범위를 벗어나거나 음수 인덱스(예: x[i]where 또는) 에서 배열 또는 배열 슬라이스에 엑세스 하는 경우 `i >= x.length i < 0`
9. 0x41 : 너무 많은 메모리를 할당하거나 너무 큰 배열을 만드는 경우
10. 0x51 : 내부 함수 유형의 0으로 초기화된 변수를 호출하는 경우

### revert ("Error Message")

- **revert 명령문**
  사용자 지정 오류를 괄호 없이 직접 인수로 사용
  ex) `CustomError(arg1, arg2);`

- **revert 함수**
  괄호를 사용하고 문자열을 허용한다.
  ex) `revert("description")`
  
> `revert("error(오류 발생 조건)")` - **revert 정의 방법**

- 오류를 발생시킴과 동시에 발생한 오류 설명을 덧붙여 오류 메세지로 출력할 수 있음
- revert의 매개변수에 오류 메세지를 입력할 수 있음
- 조건없이 revert 명령문과 revert 함수를 사용해 에러를 발생시킴
- revert 자체는 언제 오류가 발생하는지 조건을 붙일 수 없으므로 if 조건문과 사용됨
- revert에서 오류 발생 시 gas를 환불 시켜줌
<u>Ex) `if (num <= 10) { revert("num must be more than 10") }`</u>

### require (조건, "Error Message")

- Require은 조건문 if와 revert의 조합
- require의 첫째 매개변수는 오류가 언제 발생하는지 조건을 부여
- require의 둘째 매개변수에는 오류 메세지를 설정
- Require은 오류 발생 시 gas를 환불 시켜줌

> **require 정의 방법**
> `require (false(오류 발생 조건), "error"(오류 메세지))` 

- **opcode(0xfd)를 사용하여 에러조건을 발생시킴**
- 특정한 조건에 부합하지 않으면 에러를 발생시키고, gas를 환불
- 사용자 입력을 확인하는데 사용
- 데이터가 없는 오류나 Error(string) type 오류를 생성

#### Error(string)이 생성되는 경우

1. `require(x)` 에서 `x` 조건이 `false`일 경우
2. `revert()` 또는 `revert("description")`를 사용한 경우
3. 코드가 포함되지 않은 contract를 대상으로 외부 함수를 호출하는 경우
4. contract가 modifier 없이 public 함수를 통해 Ether를 수신하는 경우 payable(생성자 및 대체 함수 포함)
5. contract가 public getter 함수를 통해 Ether를 받는 경우

#### 외부호출(제공된)의 에러데이터가 전달되는 상황
1. `.transfer()`에 실패하는 경우
2. message call을 통해 함수를 호출했지만 제대로 완료되지 않은 경우
  (gas 부족이나 일치하는 함수가 없거나 예외 자체를 발생하는 경우를 말함) call, send,delefate call을 제외한 저수준 작업은 예외를 throw 하지 않지만 call code, static call, false 를 반환하여 실패를 나타냄
3. new 키워드를 사용하여 계약을 생성했는데 개약 생성이 제대로 완료되지 않은 경우

----

## try / catch

- 오류가 발생해도 트랜잭션이 실패하지 않음
- 오류가 발생하면 catch 블록에서 특정 조치를 취하기 가능
- 특정 조치 자유롭게 명시할 수 있어 오류에 유연히 대처 가능

```sol
try this.output5() returns (uint value) {
  return(value, true);
} catch Error (string memory reason) {
  emit ErrorReason(reason);
  return (0, false);
} catch Panic (string memory errorCode) {
  emit ErrorReason2(errorCode);
  return (0, false);
} catch (bytes memory lowLevelData) {
  emit ErrorReason3(lowLevelData);
  return (0, false);
}
```

### 마무리

> - catch Error = revert나 require를 통해서 생성된 에러 용도
> - catch Panic = assert를 통해 생성된 에러가 날 때, catch에 의해 잡힘
> - catch - row level 영역에서 사용