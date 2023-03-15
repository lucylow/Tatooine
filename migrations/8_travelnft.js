const TravelNFT = artifacts.require("TravelNFT")
const { developmentChains } = require("../helper-truffle-config")

module.exports = async function (deployer, network) {
    if (developmentChains.includes(network)) {
        await deployer.deploy(TravelNFT)
    }
}


