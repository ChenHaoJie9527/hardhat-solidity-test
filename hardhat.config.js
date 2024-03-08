require("@nomicfoundation/hardhat-toolbox");
require("./task/index.js");
require("@nomicfoundation/hardhat-ignition-ethers");

const INFURA_API_KEY = "QB9F1JU8XHR88WU3FRS3MD9XMA2JFHYCTA";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  etherscan: {
    apiKey: INFURA_API_KEY,
  },
  defaultNetwork: "hardhat",
  networks: {
    X1: {
      url: "https://testrpc.x1.tech",
      accounts: [
        "f447e302d27238d6e8445c675b56165604d62287be3cea27247c3db6283b7b79",
      ],
    },
  },
};
