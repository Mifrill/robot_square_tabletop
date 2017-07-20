require 'spec_helper'

describe 'Table Square' do
  let(:table) { Toy::Table::Square.new }

  describe 'place' do
    it 'allows placement' do
      expect(table.place(0, 0)).not_to be_nil
    end

    context 'placement is denied if:' do
      context 'coordinate X' do
        it '< 0' do
          expect(table.place(-1, 0)).to be_nil
        end

        it '> 4' do
          expect(table.place(5, 0)).to be_nil
        end
      end

      context 'coordinate Y' do
        it '< 0' do
          expect(table.place(0, -1)).to be_nil
        end

        it '> 4' do
          expect(table.place(0, 5)).to be_nil
        end
      end
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
