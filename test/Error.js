const { expect } = require("chai");

describe("Error", () => {
  it("testRequire: should revert if value is not greater than 10", async () => {
    const Error = await ethers.getContractFactory("Error");
    const error = await Error.deploy();

    expect(error).not.to.be.null;
    await expect(error.testRequire(5)).to.be.revertedWith(
      "Input must be greater than 10"
    );
  });

  it("testRequire: should revert if value is not greater than 10", async () => {
    const Error = await ethers.getContractFactory("Error");
    const error = await Error.deploy();

    expect(error).not.to.be.null;
    await expect(error.testRequire(11)).to.not.be.reverted;
  });
  it('testRevent: should revert if value is not greater than 10', async () => {
    const Error = await ethers.getContractFactory("Error");
    const error = await Error.deploy();

    await expect(error.testRequire(5)).to.be.revertedWith('Input must be greater than 10');
  })
  it('testRevent: should revert if value is not greater than 10', async () => {
    const Error = await ethers.getContractFactory("Error");
    const error = await Error.deploy();
    await expect(error.testRevent(15)).to.not.be.reverted;
  })
  it("testAssert: should revert if numValue is not equal to 0", async function () {
    const Error = await ethers.getContractFactory("Error");
    const error = await Error.deploy();

    error.setNumValue(1);

    await expect(error.testAssert()).to.be.reverted;
  });
  it("testCustomErrorMessage: should revert with custom error message if balance is insufficient", async function () {
    const Error = await ethers.getContractFactory("Error");
    const error = await Error.deploy();

    // Simulate insufficient balance by passing a large amount
    await expect(error.testCustomErrorMessage(1000000)).to.be.revertedWith("InsufficientBalance");
  });
});
