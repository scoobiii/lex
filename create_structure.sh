#!/bin/bash

# Criando diretórios principais
mkdir -p dao-lex/contracts/governance
mkdir -p dao-lex/contracts/staking
mkdir -p dao-lex/contracts/dex
mkdir -p dao-lex/contracts/nft   # Novo diretório para contratos de NFTs
mkdir -p dao-lex/frontend/public
mkdir -p dao-lex/frontend/src/components
mkdir -p dao-lex/frontend/src/pages
mkdir -p dao-lex/frontend/src/utils
mkdir -p dao-lex/scripts
mkdir -p dao-lex/tests/unit
mkdir -p dao-lex/tests/integration
mkdir -p dao-lex/tests/e2e
mkdir -p dao-lex/docs

# Criando arquivos principais
touch dao-lex/.env
touch dao-lex/package.json
touch dao-lex/hardhat.config.js
touch dao-lex/README.md
touch dao-lex/docs/whitepaper.md
touch dao-lex/scripts/deploy.js

# Preenchendo o package.json com conteúdo básico
cat <<EOL > dao-lex/package.json
{
  "name": "dao-lex",
  "version": "1.0.0",
  "description": "DAO LEX - Stalex Governance",
  "scripts": {
    "test": "npx hardhat test",
    "deploy": "npx hardhat run scripts/deploy.js --network localhost"
  },
  "devDependencies": {
    "hardhat": "^2.6.0",
    "chai": "^4.3.4",
    "ethers": "^5.4.0"
  }
}
EOL

# Preenchendo o hardhat.config.js com configuração básica
cat <<EOL > dao-lex/hardhat.config.js
require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.0",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545"
    }
  }
};
EOL

# Preenchendo o README.md com conteúdo básico
cat <<EOL > dao-lex/README.md
# DAO LEX - Stalex Governance

Este projeto implementa uma DAO (Organização Autônoma Descentralizada) para a governança da cidade de São Paulo, utilizando contratos inteligentes, staking, NFTs e uma DEX integrada.

## Estrutura do Projeto

- **Governance**: Contratos de governança da DAO.
- **Staking**: Contratos para staking de tokens.
- **DEX**: Exchange descentralizada para negociação de tokens.
- **NFT**: Sistema de recompensas em NFTs.

## Como rodar o projeto

1. Instale as dependências:
   \`\`\`
   npm install
   \`\`\`

2. Execute os testes:
   \`\`\`
   npm run test
   \`\`\`

3. Faça o deploy dos contratos:
   \`\`\`
   npm run deploy
   \`\`\`
EOL

# Preenchendo o whitepaper.md com conteúdo básico
cat <<EOL > dao-lex/docs/whitepaper.md
# Whitepaper - DAO LEX

## Visão Geral

A DAO LEX é uma plataforma de governança descentralizada que visa transformar São Paulo em uma cidade 100% inteligente, sustentável e inclusiva. Utilizando tecnologias como blockchain, contratos inteligentes e NFTs, a DAO permite que os cidadãos participem ativamente das decisões que impactam a cidade.

## Componentes Principais

- **Governança descentralizada**: Permite que os cidadãos votem em propostas e participem da gestão da cidade.
- **Recompensas em NFTs**: Os cidadãos que participam ativamente da DAO são recompensados com NFTs exclusivos.
- **DEX**: Uma exchange descentralizada para negociação de tokens da DAO.
EOL

# Preenchendo o deploy.js com um script básico de deploy
cat <<EOL > dao-lex/scripts/deploy.js
async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const Governance = await ethers.getContractFactory("Governance");
  const governance = await Governance.deploy();
  console.log("Governance contract deployed to:", governance.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
EOL

# Criando arquivos de exemplo para contratos
cat <<EOL > dao-lex/contracts/governance/Governance.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Governance {
    // Exemplo básico de contrato de governança
    mapping(address => uint256) public votes;

    function vote(uint256 proposalId) public {
        votes[msg.sender] = proposalId;
    }
}
EOL

cat <<EOL > dao-lex/contracts/staking/Staking.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Staking {
    // Exemplo básico de contrato de staking
    mapping(address => uint256) public stakes;

    function stakeTokens(uint256 amount) public {
        stakes[msg.sender] += amount;
    }
}
EOL

cat <<EOL > dao-lex/contracts/dex/DEX.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DEX {
    // Exemplo básico de contrato de DEX
    mapping(address => uint256) public balances;

    function swapTokens(address tokenA, address tokenB, uint256 amount) public {
        // Lógica de swap de tokens
    }
}
EOL

cat <<EOL > dao-lex/contracts/nft/StalexNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract StalexNFT is ERC721 {
    uint256 public tokenCounter;

    constructor() ERC721("StalexNFT", "STXNFT") {
        tokenCounter = 0;
    }

    function mintNFT(address recipient) public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        tokenCounter++;
        return newTokenId;
    }
}
EOL

# Criando arquivos de exemplo para frontend
cat <<EOL > dao-lex/frontend/src/components/Header.js
import React from 'react';

function Header() {
  return (
    <header>
      <h1>DAO LEX - Stalex Governance</h1>
    </header>
  );
}

export default Header;
EOL

cat <<EOL > dao-lex/frontend/src/pages/Home.js
import React from 'react';

function Home() {
  return (
    <div>
      <h2>Bem-vindo à DAO LEX</h2>
      <p>Participe da governança descentralizada de São Paulo!</p>
    </div>
  );
}

export default Home;
EOL

cat <<EOL > dao-lex/frontend/src/utils/web3.js
import { ethers } from 'ethers';

const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

export const getContract = (address, abi) => {
  return new ethers.Contract(address, abi, signer);
};
EOL

# Criando arquivos de exemplo para testes
cat <<EOL > dao-lex/tests/unit/governance.test.js
const { expect } = require("chai");

describe("Governance Contract", function () {
  it("Should allow users to vote", async function () {
    const Governance = await ethers.getContractFactory("Governance");
    const governance = await Governance.deploy();
    await governance.deployed();

    await governance.vote(1);
    expect(await governance.votes(owner.address)).to.equal(1);
  });
});
EOL

cat <<EOL > dao-lex/tests/integration/staking.test.js
const { expect } = require("chai");

describe("Staking Contract", function () {
  it("Should allow users to stake tokens", async function () {
    const Staking = await ethers.getContractFactory("Staking");
    const staking = await Staking.deploy();
    await staking.deployed();

    await staking.stakeTokens(100);
    expect(await staking.stakes(owner.address)).to.equal(100);
  });
});
EOL

cat <<EOL > dao-lex/tests/e2e/dex.test.js
const { expect } = require("chai");

describe("DEX Contract", function () {
  it("Should allow users to swap tokens", async function () {
    const DEX = await ethers.getContractFactory("DEX");
    const dex = await DEX.deploy();
    await dex.deployed();

    // Simulação de swap de tokens
    await dex.swapTokens(tokenA.address, tokenB.address, 100);
    expect(await dex.balances(owner.address)).to.equal(100);
  });
});
EOL

cat <<EOL > dao-lex/tests/unit/nft.test.js
const { expect } = require("chai");

describe("StalexNFT Contract", function () {
  it("Should mint a new NFT", async function () {
    const StalexNFT = await ethers.getContractFactory("StalexNFT");
    const stalexNFT = await StalexNFT.deploy();
    await stalexNFT.deployed();

    await stalexNFT.mintNFT(owner.address);
    expect(await stalexNFT.tokenCounter()).to.equal(1);
  });
});
EOL

# Mensagem de sucesso
echo "Estrutura de pastas e arquivos criada e preenchida com sucesso!"
