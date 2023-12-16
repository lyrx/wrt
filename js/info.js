require('dotenv').config();
const ethers = require('ethers');

async function getBalance() {

    const privateKey = process.env.PRIVATE_KEY; // Private key from environment variable
    const providerUrl = process.env.ETHEREUM_MAINNET; // RPC provider URL from environment variable

    const provider = new ethers.JsonRpcProvider(providerUrl);
    const networkName =  (await provider.getNetwork()).name
    const wallet = new ethers.Wallet(privateKey, provider);
    const balance = await provider.getBalance(wallet.address);

    console.log(`Balance '${networkName}': ${ethers.formatEther(balance)} ETH`);
}

getBalance().catch(console.error);
