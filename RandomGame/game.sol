// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Random {
    event paidAddress(address indexed sender, uint256 payment); // 참여자의 주소와 참여비
    event winnerAddress(address indexed winner); // 당첨자의 주소

    modifier onlyOwner() // 운영자만 실행 가능한 함수 (modifier = 함수 제한)
    {
        require(msg.sender == owner, "Ownable: caller is not the owner"); // 특정 modifier를 걸어 운영자 권한 배포 소유 가능
        _; // 조건적 경고
    }

    // 주소 종복 인지 - 두번째 mapping 주소 입력 값을 판단(true/false)
    // true - 이미 참여중, false - 아직 미참여 > 참여 가능 = 중복 참여 방지 mapping
    // 첫 번째 mapping은 게임 회차 _ 우승자 등장 시 게임 회차 증가 > 첫 번째 매핑값 초기화 > 두 번째 매핑값도 초기화
    // 이전 게임 참여자 주소 판단은 다시 false로 변경 - 게임 참여 가능
    mapping (uint256 => mapping (address => bool)) public paidAddressList;  

    address public owner; // 랜덤 게임의 운영자 주소
    uint private winnerNumber = 0; // 우승자, 회차마다 무작위 난수값 설정
    string private key1;  // 난수 발생 요소
    uint private key2; // 난수 발생 요소

    uint public round = 1; // 라운드 변경 시 paidAddressList 초기화
    uint public playNumber = 0; // 현재 참여자의 n번째 수

    constructor(string memory _key1, uint _key2) 
    {
        owner = msg.sender; // Random Contract의 주소 = 운영자의 주소
        key1 = _key1;
        key2 = _key2;
        winnerNumber = randomNumber(); // 무작위 값 설정(1-10)
    }

    receive() external payable  // recieve 함수 
    {
        require(msg.value == 10**16, "Must be 0.01 ether."); // 1ether = 10^18 | 0.01ether = 10^16 (비용 판단)
        require(paidAddressList[round][msg.sender] == false, "Must be first time."); // (중복 참여 여부 판단)
        paidAddressList[round][msg.sender] = true; // 게임 참여자 
        ++playNumber; // 현재 참여자 주소 값 확인, 참여 후에 1을 증가

        if (playNumber == winnerNumber)  // 현재 실행 숫자와 우승 숫자가 같은지 판별, if-else
        {
            // Random SC(스마트 컨트랙트)에 누적된 참가비 msg.sender(우승자) 주소에 전달
            (bool success,) = msg.sender.call{ value: address(this).balance }(""); 
            require(success, "Failed");
            playNumber = 0; // 초기화
            ++round; // 다음 라운드로 리라운딩
            winnerNumber = randomNumber(); 
            emit winnerAddress(msg.sender); // 우승자
        } 
        else 
        {
            emit paidAddress(msg.sender, msg.value); // 게임 참여자
        }
    }

    function randomNumber()
    private
    view 
    returns(uint)
    {
        uint num = uint(keccak256(abi.encode(key1))) + key2 + (block.timestamp) + (block.number);
        return (num - (num / 10) * 10) + 1;
    }

    function setSecretKey(string memory _key1, uint _key2)
    public 
    onlyOwner()
    {
        key1 = _key1;
        key2 = _key2;
    }
    
    function getSecretKey()
    public 
    view
    onlyOwner()
    returns(string memory _key1, uint _key2)
    {
        return (key1, key2);
    }

    function getWinnerNumber()
    public 
    view
    onlyOwner()
    returns(uint256)
    {
        return winnerNumber;
    }

    function getRound()
    public 
    view
    returns(uint256)
    {
        return round;
    }

    function getBalance()
    public
    view
    returns(uint256)
    {
        return address(this).balance;
    }
} 