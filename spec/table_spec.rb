require 'spec_helper'

describe Toy::Table::Square do
  let(:table) { Toy::Table::Square.new }

  describe 'place' do
    context 'placement is denied ' do
      it 'if coordinate X/Y more 4 or less 0' do
        limit = Toy.config['units'].to_f

        expect(table.place(-1, 0)).to be_nil
        expect(table.place(limit, 0)).to be_nil

        expect(table.place(0, -1)).to be_nil
        expect(table.place(0, limit)).to be_nil
      end
    end

    it 'placement is allowed' do
      expect(table.place(1, 1)).to match_array(x: 1, y: 1)
    end
  end

  describe 'placed?' do
    context 'invalid placement' do
      it 'default' do
        expect(table.placed?).to be false
      end

      it 'returns false' do
        table.place(-1, -1)

        expect(table.placed?).to be false
      end
    end

    it 'after a valid placement returns true' do
      table.place(2, 4)

      expect(table.placed?).to be true
    end
  end

  describe 'position' do
    context 'invalid placement' do
      it 'default' do
        expect(table.position).to be_nil
      end

      it 'returns nil' do
        table.place(-1, -1)

        expect(table.position).to be_nil
      end
    end

    it 'after a valid placement returns the coordinates' do
      table.place(0, 0)

      expect(table.position).to eq(x: 0, y: 0)
    end
  end
end
