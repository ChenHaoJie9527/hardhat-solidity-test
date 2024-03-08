const hre = require("hardhat");

async function main() {
  const ggbContract = await hre.ethers.getContractFactory("GGB");
  const ggb = await ggbContract.deploy();
  await ggb.waitForDeployment();
  console.log("GGB deployed to:", ggb.address);
}

main().catch(() => {
  console.error(error);
  process.exitCode = 1;
});
