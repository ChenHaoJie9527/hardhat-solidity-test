const hre = require("hardhat");

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = currentTimestampInSeconds + 60;

  const lockedAmount = hre.ethers.parseEther("0.001");
  const ggbContract = await hre.ethers.getContractFactory("GGB");
  const ggb = await ggbContract.deploy();
  const ggbTarget = await ggb.waitForDeployment();
  console.log(
    `Lock with ${hre.ethers.formatEther(
      lockedAmount
    )}ETH and unlock timestamp ${unlockTime} deployed to ${ggbTarget.target}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
