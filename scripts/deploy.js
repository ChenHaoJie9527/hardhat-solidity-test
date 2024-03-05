// 我们在此明确要求使用 Hardhat 运行环境。这是可选的
// 但对于通过 `node <script>` 以独立方式运行脚本非常有用。
//
// 你也可以使用 `npx hardhat run <script>` 运行脚本。如果这样做，Hardhat
// 会编译你的合约，将 Hardhat 运行时环境的成员添加到
// 全局作用域，并执行脚本。
const hre = require("hardhat");

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = currentTimestampInSeconds + 60;

  const lockedAmount = hre.ethers.parseEther("0.001");

  const lock = await hre.ethers.deployContract("Lock", [unlockTime], {
    value: lockedAmount,
  });

  await lock.waitForDeployment();

  console.log(
    `Lock with ${ethers.formatEther(
      lockedAmount
    )}ETH and unlock timestamp ${unlockTime} deployed to ${lock.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
