## 이벤트 (Event)

> 스마트 컨트랙트 또는 유저의 특정 상태를
> 출력하여 그 상태를 블록체인에 저장

- 특정 데이터(이벤트 정보)를 EVM 로그에 기록
  즉, 트랜잭션 로그에 전달된 인수가 저장

> 장점
> - 이벤트는 가스 소비 측면에서 데이터를 저장하는 것보다 저렴
>   = 적은 가스비로 데이터 저장 가능
> - 이벤트를 통해 블록체인이 연동된 웹 페이지
>   즉, 프론트엔드와 쉽게 소통 가능
> - 입금 및 이체 작업은 블록체인의 이벤트로 기록

### 이벤트 구현 예시(1)

```sol
event MyBlock(uint result, string name)
```

```sol
contract Event {
  event Log(address indexed sender, string message);
  event AnotherLog();
}
```

### 이벤트 구현 예시 (2)

```sol
Emit MyBlock(10, "add")
```

```sol
event MyBlock(uint result, string indexed name)
```

## 생성자(Constructor)
> 스마트 컨트랙트가 배포될 때 가장 먼저 실행하는 함수

```sol
Constructor() {
  // 함수 로직  
}
```
- 모든 스마트 컨트랙트에 생성자 필수 선언 X
- 선언 시 오직 한 개 생성자만 정의
- 스마트 컨트랙트 배포 시 변수에 특정한 값을 넣어줄 때 활용

### 불변 변수(Immutable)
> 값(데이터)형만 적용 가능

- 불변 변수는 상수(Constant)와 역할이 같다.
- 불변 변수 값은 생성자 내에서 설정 가능
- 상수처럼 한번 입력되면 수정 불가
