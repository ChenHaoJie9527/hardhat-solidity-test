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
});
