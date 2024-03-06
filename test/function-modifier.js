const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("function modifier", () => {
  it("changeOwner: should change owner when called by owner", async () => {
    const FunctionModifier = await ethers.getContractFactory(
      "FunctionModifier"
    );
    const functionModifier = await FunctionModifier.deploy();
    const owner = "0x0000000000000000000000000000000000000001";
    await functionModifier.changeOwner(owner);
    expect(await functionModifier.owner()).to.equal(owner);
  });

  it("changeOwner: should revert if called by non-owner", async () => {
    const FunctionModifier = await ethers.getContractFactory(
      "FunctionModifier"
    );
    const [owner, nonOwner] = await ethers.getSigners();
    const functionModifier = await FunctionModifier.deploy();
    const newOwner = "0x0000000000000000000000000000000000000001";
    await expect(
      functionModifier.connect(nonOwner).changeOwner(newOwner)
    ).to.be.revertedWith("Not owner");
  });
});
