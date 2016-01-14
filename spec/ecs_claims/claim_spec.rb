require 'spec_helper'

RSpec.describe EcsClaims::Claim do
  let(:client) { EcsClaims::Client.new(token: TOKEN, url: URL, rfc: RFC) }

  let(:attributes) do
    {
      Paciente: {
        fichaEmp: '98',
        numEmpresa: '0',
        curp: 'VICTALPPRCV376MNIV',
        numCod: '5',
        nombre: 'TALENS VICENTE ISIDRO'
      },
      Cuenta: {
        numEvento: '1',
        fechaAdm: '2016-01-06T13:37:56',
        fechaAlta: '2016-01-06T13:41:01',
        folioAut: 'EC0000000005',
        total: 0,
        estatus: 'C',
        cedula: '684097',
        medico: 'LUIS ANTONIO TORRES  FACUNDO',
        tipo: 'H'
      },
      listaDx: {}
    }
  end

  describe '#create' do
    context 'with attributes' do
      let(:claim) { EcsClaims::Claim.new(client) }

      it 'creates a claim', :vcr do
        response = claim.create(attributes)

        expect(response.keys).to match_array(['msj', 'url', 'id'])
      end
    end

    context 'without attributes' do
      let(:claim) { EcsClaims::Claim.new(client) }

      it 'returns error msj', :vcr do
        attributes[:Paciente].delete(:curp)

        response = claim.create(attributes)

        expect(response.keys).to match_array(['msj', 'errores'])
      end
    end
  end

  describe '#fetch' do
    let(:claim) { EcsClaims::Claim.new(client) }

    it 'fetches a claim', :vcr do
      response = claim.create(attributes)

      response = claim.fetch(response['id'])

      expect(response.keys).to match_array(['claim', 'Paciente', 'id',
        'folioAut', 'fechaAdm', 'fechaAlta', 'cedula', 'medico', 'tipo',
        'estatus', 'total', 'proveedor', 'numEvento'])
    end
  end
end
