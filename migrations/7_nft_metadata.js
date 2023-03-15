const NFTMetadata = artifacts.require("NFTMetadata")
const { developmentChains } = require("../helper-truffle-config")

module.exports = async function (deployer, network) {
    if (developmentChains.includes(network)) {
        await deployer.deploy(NFTMetadata)
    }
}


