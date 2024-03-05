const { expect } = require("chai");

describe("Todos", () => {
  it("Should be able to create a new Todos", async () => {
    const Todos = await ethers.getContractFactory("Todos");
    const todos = await Todos.deploy();
    await todos.create("Todos");
    const todo = await todos.get(0);
    expect(todo.text).to.equal("Todos");
  });
  it("Should toggle todo completion status", async () => {
    const Todos = await ethers.getContractFactory("Todos");
    const todos = await Todos.deploy();

    await todos.create("Todo 1");
    await todos.create("Todo 2");
    await todos.toggleCompleted(0);

    const todo = await todos.get(0);
    expect(todo.completed).to.equal(true);
  })
});
