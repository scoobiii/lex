// Nome: web3.js
// Versão: 1.1
// Data: DATA_AQUI
// Responsabilidade: Funções para conexão Web3
// Assinatura: Zeh Sobrinho (Product Owner), LEX AI (Full Stack AGI DevOps)

import Web3 from 'web3';

const web3 = new Web3(Web3.givenProvider || 'http://localhost:8545');

export default web3;
