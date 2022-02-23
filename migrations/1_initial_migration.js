const NFTMint = artifacts.require("CoinracerNFTMint");

module.exports = async function (deployer) {

  await deployer.deploy(NFTMint, "0xfbb4f2f342c6daab63ab85b0226716c4d1e26f36", "0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56");

  const saleInstance = await NFTMint.deployed();

  console.log("NFTMint deployed at:", saleInstance.address);
};
