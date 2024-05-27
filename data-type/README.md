## 자료형 (Data Type)

**변수에 들어갈 값의 종류**
솔리디티에 변수를 선언하기 위해선 자료형도 필히 명시해야 한다.

#### 값 타입 (Value) - 상태 변수
값이 할당되거나 함수 인자로 활용되면 해당 값 자체가 복사

#### 참조 타입 (Reference) - 배열 [] array, 매핑, 구조체 struct
참조 타입은 현재 해당하는 값의 주소만 복사 (데이터를 어디에 저장할지 명시해야 한다.)

**밸류형 (Value Type)**

- 변수에 값(Value)을 저장

**실수형 (fixed point number)**

- fixed 또는 ufixed : 부호가 있는 실수 또는 부호가 없는 실수

| 데이터 타입 | 설명 |
| :---: | --- |
| bool | - true, false 값  |
| address | - 이더리움 거래에서 사용되는 주소 (포인터 X, 다른 언어에는 없는 개념) <br> address public addr = 0x914...; |
| bytes | - (1 ~ 32 까지), 바이트 크기 명시 가능 <br> bytes4 public bt4 = 0x12345678; <br> bytes public bts = "STRING"; |
| int | - 부호 있는 정수, int8이면 $-2^7$ ~ $2^7 -1$ 까지 범위 <br> int8 public num1 = 8; <br> int256 public negativeNum = -2; <br> int8 public numErr = 256; // 오류 발생 (범위 초과) |
| uint | - 부호 없는 정수, uint8이면 $0$ ~ $2^8 - 1$ 까지의 범위 <br> uint256 public num2 = 1334; |
| string | - UTF-8 인코딩 문자열 <br> string constant public str = "Hello World"; |
| enum | - 열거형 <br> enum _selection {ROCK, SCISSOR, PAPER}; |


### 바이트(bytes)와 주소(address)

- **고정 크기 바이트 배열 활용이 좋음**
- **바이트 타입 (값)**
  - 고정 크기 바이트 배열  = 값 타입 (사용 바이트 미리 지정)
    ex. bytes1 ~ bytes32
  - 동적 크기 바이트 배열 = 참조 타입 (사용 바이트 미리 지정 X)
    ex. bytes, 32bytes까지 저장 가능

- **솔리디티는 주소형 타입(address)이 존재함**
  **= 계정 주소(byte20_고정크기 바이트), 맴버 변수 및 함수 제공**

| 데이터 타입 | 설명 |
| :---: | --- |
| bytes <br> 바이트 타입| (1 ~ 32까지), 바이트 크기 명시 가능 (고정 크기 바이트 배열 / 동적 크기 바이트 배열) <br> bytes4 public bt4 = 0x12345678; <br> bytes public bts = "STRING"; |
| address <br> 주소 타입 | - 이더리움 거래에서 사용되는 주소, 계정 주소를 나타냄 <br> (bytes20, 포인터 X, 다른 언어에는 없는 개념) <br> address public addr = 0x9134CCE52...; |


### 문자열 타입(STRING) <u>UTF-8 인코딩</u>

- **문자열 타입은 배열 타입이다. (바이트처럼 값 타입이 X)**
- **string : string 형을 쓸 때는 " "를 붙여서 사용**
- **동적 키가 바이트 배열처럼 문자열은 동적 크기 UTF-8로 인코딩된 배열**
  UTF-8의 크기가 동적 크기 바이트 배열의 최대 크기인 bytes32보다 크다.

```sol
bytes msg1 = "Hello World";
string msg2 = "Hello World";
```

| 데이터 타입 | 설명 |
| :---: | --- |
| string | - 문자열은 동적 크기 UTF-8로 인코딩된 배열 <br> string constant public str = "Hello Solidity!"; |


#### UTF-8 

- **유니코드 문자를 컴퓨터 데이터로 저장하거나 불러올 때 사용하는 인코딩, 디코딩 방식**
  문자 데이터 1바이트를 8비트로 저장

> 예를 들어 "가" 라는 글자를 UTF-8 방식으로 컴퓨터 파일로 저장하면 실제 파일에는 b"\xea\xn\b0\x80"이라는 값이 저장된다.
  이를 다시 소프트웨어로 불러오면 "가"라는 글자가 보여진다.


### 정수 타입 (Integer) <u>int와 uint</u>

- **정수형의 목적은 가격, 몸무게, 토큰의 아이디와 같이 숫자로 된 정보를 표현하기 위함이다.**
- **정수형 타입은 int와 uint 존재**
  int (SIGNED INTEGERS) 자료형 : 음수, 양수 모두 포함하는 정수.
  uint (UNSIGNED INTEGERS) 자료형 : 양수인 정수만 가능.

| 데이터 타입 | 설명 |
| :---: | --- |
| int <br> (정수 타입) | - 부호 있는 정수, int8이면 $2^7$ ~ $2^7 - 1$ (-128 ~ 127) 까지 범위 |
| uint | - 부호 없는 정수, uint8이면 $0$ ~ $2^8 - 1$(0 ~ 255)까지 범위 |

```sol
int8 public num1 = 8;
int256 public negativeNum = -2;
int 8 public numErr = 256; // 오류 발생! (범위 초과)

uint256 public num2 = 1334;
```

### 실수 타입 (fixed point number)
- fixed 또는 ufixed : 부호가 있는 실수 또는 부호가 없는 실수
  ex. UFixed256 x 18 : 18개의 소수점을 가진 10진수 고정 소수점 유형

  - UFixed256x18.wrap
  - FixedMath.toUFixed256x18
  - UFixed258x18.wrap
  - UFixed256x18
  - toFixed256x18
  - UFixed256x18

### 비트와 바이트

> 1 바이트(글자) 
  = 8비트(8개의 비트를 묶은게 바이트)


- **Sha256?**
  SHA256 해시 결과 값의 크기가 256bit (32바이트 가능)
- **Unit256? (정수만 가능. $0$ ~ $2^{256 - 1}$ 범위)**
  최소값은 0
  최대값은 $2^{256 -1}$
- **Int256? ($-2^{255}$ ~ $2^{255-1}$ 범위)**
  최소값은 $-2^{255}$
  최대값은 $2^{255 - 1}$


### 불리언 타입 (Booleans)

- **State Variables (상태 변수)** : 컨트랙트 메모리에 영원히 저장됨
- **bool로 표기** : 불리언은 참과 거짓을 출력하는 '논리 자료형'
  특정 조건에 발생하는 행동 통제 사용한다.
  주로 비교 연산자 및 논리 연산자와 함께 사용한다.

```sol
contract Contract {
  bool myVariables;
}
```
```sol
contract Contract {
  bool public myVariables = true;
}
```

| 데이터 타입 | 설명 |
| :---: | --- |
| bool <br> (특정 조건에서 발생하는 행동 통제 시 사용) | - true, false 값 |

```sol
bool public flag1 = true;
bool public flag2 = 8 < 5; // flag2 에는 false 값 저장
bool public flag3 = (true || false) && !(true || false); // flag3에는 true 값 저장
```

**연산자**
- `!` (논리 부정)
- `&&` (논리 AND, "and")
- `||` (논리 OR, "or")
- `==` (같음)
- `!=` (같지 않음)


### 이넘(Enum)

- **Enum 형은 clean code를 쓰도록 도와준다.**
- **1개 이상의 객체 필요.** ```enum State { Created, Locked, Inactive };```

```sol
if (player.movement == 0) {
  // player is moving up
}
else if (player.movement == 1) {
  // player is moving left
}
```

```sol
enum Directions = { Up, Left, Down, Right }
if (player.movement == Directions.UP) { ... }
else if (player.movement === Directions.Left) { ... }
```

| 데이터 타입 | 설명 |
| :---: | --- |
| enum | - 열거형 |