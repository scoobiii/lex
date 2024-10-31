// Nome: deploy.js
// Versão: 1.1
// Data: DATA_AQUI
// Responsabilidade: Script de deploy dos contratos inteligentes
// Assinatura: Zeh Sobrinho (Product Owner), LEX AI (Full Stack AGI DevOps)

const { ethers } = require("hardhat");

async function main() {
    const Governance = await ethers.getContractFactory("Governance");
    const governance = await Governance.deploy();
    console.log("Governance deployed to:", governance.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
