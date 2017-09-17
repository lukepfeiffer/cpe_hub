require 'rails_helper'

describe StringHelper do
  context "#is_letter?" do
    it "returns true" do
      expect(described_class.is_letter?("t")).to be true
      expect(described_class.is_letter?("L")).to be true
      expect(described_class.is_letter?("N")).to be true
      expect(described_class.is_letter?("z")).to be true
    end

    it "returns false" do
      expect(described_class.is_letter?("1")).to be false
      expect(described_class.is_letter?("_")).to be false
      expect(described_class.is_letter?("+")).to be false
      expect(described_class.is_letter?("5")).to be false
    end
  end

  context "#is_num?" do
    it "returns true" do
      expect(described_class.is_num?("1")).to be true
      expect(described_class.is_num?("2")).to be true
      expect(described_class.is_num?("3")).to be true
      expect(described_class.is_num?("4")).to be true
    end

    it "returns false" do
      expect(described_class.is_num?("$")).to be false
      expect(described_class.is_num?("_")).to be false
      expect(described_class.is_num?("+")).to be false
      expect(described_class.is_num?("a")).to be false
    end
  end

  context "#num_digits" do
    it "returns correct number" do
      expect(described_class.num_digits("123456789")).to eq(9)
      expect(described_class.num_digits("12ab1b")).to eq(3)
      expect(described_class.num_digits("ab12cd34ef56")).to eq(6)
    end
  end

  context "#num_letters" do
    it "returns correct number" do
      expect(described_class.num_letters("123abc")).to eq(3)
      expect(described_class.num_letters("abcdefgh")).to eq(8)
      expect(described_class.num_letters("123abcdef12ab")).to eq(8)
    end
  end

  context "#is_integer" do
    it 'returns true' do
      expect(described_class.is_num?("1")).to be true
      expect(described_class.is_num?("2")).to be true
      expect(described_class.is_num?("3")).to be true
      expect(described_class.is_num?("4")).to be true
      expect(described_class.is_num?("1.2")).to be true
      expect(described_class.is_num?("6.2")).to be true
    end

    it 'returns false' do
      expect(described_class.is_num?("$")).to be false
      expect(described_class.is_num?("_")).to be false
      expect(described_class.is_num?("+")).to be false
      expect(described_class.is_num?("a")).to be false
    end
  end
end
