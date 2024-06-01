// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct
        // - calling in like a function
        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({ text: _text, completed: false }));

        // 빈 구조체를 초기화 후 업데이트
        Todo memory todo;
        todo.text = _text;
        // todo.completed initailized to false

        todos.push(todo);
    }

    // Solidity는 자동으로 '할 일'을 위한 getter를 생성한다
    // 이 기능은 실제로 필요하지 않음
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint _index, string calldata _text) public  {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function todoCompleted(uint _index) public  {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

}