// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public list;

    // 初始化结构体的 3 种方法
    function create(string calldata text) public {
        // 1.像函数一样调用，通过参数传值
        list.push(Todo(text, false));
        // 通过传递key-value对象形式参数传值
        list.push(Todo({text: text, completed: false}));
        // 初始化一个空结构，然后更新它
        Todo memory todo;
        todo.text = text;
        todo.completed = false;
        list.push(todo);
    }

    // Solidity 自动为 "todos "创建了一个 getter，因此
    // 你实际上并不需要这个函数。
    function get(
        uint index
    ) public view returns (string memory text, bool completed) {
        Todo storage todo = list[index];
        return (todo.text, todo.completed);
    }

    // 更新指定的text
    function updateText(uint index, string calldata text) public {
        Todo storage newTodo = list[index];
        newTodo.text = text;
    }

    // 切换 completed
    function toggleCompleted(uint index) public {
        require(index < list.length, "Index out of range");
        list[index].completed = !list[index].completed;
        emit TodoCompletedToggled(index, list[index].completed);
    }

    event TodoCompletedToggled(uint index, bool completed);
}
