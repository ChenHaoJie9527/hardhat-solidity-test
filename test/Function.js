const { expect } = require("chai");

describe("Function returns", async () => {
  const Func = await ethers.getContractFactory("FunctionReturns");
  const func = await Func.deploy();
  expect(func).not.to.be.null;

  const res = await func?.returnMany();
  expect(res).to.be.have.length(3);
  expect(res).to.be.equal([1, false, 1]);
});
