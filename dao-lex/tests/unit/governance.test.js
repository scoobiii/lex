// Nome: governance.test.js
// Versão: 1.1
// Data: DATA_AQUI
// Responsabilidade: Testes unitários do contrato de governança
// Assinatura: Zeh Sobrinho (Product Owner), LEX AI (Full Stack AGI DevOps)

const { expect } = require('chai');

describe('Governance Contract', function () {
    it('Deve permitir a criação de uma proposta', async function () {
        const [owner] = await ethers.getSigners();
        const Governance = await ethers.getContractFactory('Governance');
        const governance = await Governance.deploy();

        await governance.createProposal('Proposta de Teste', 'Descrição da Proposta');
        const proposal = await governance.getProposal(0);

        expect(proposal.title).to.equal('Proposta de Teste');
    });
});
