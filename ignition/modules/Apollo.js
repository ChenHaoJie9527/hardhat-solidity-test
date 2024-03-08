const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("Apollo", (m) => {
  const apollo = m.contract("ZombieFeeding", ["Saturn V"]);

  m.call(apollo, "launch", []);

  return { apollo };
});
