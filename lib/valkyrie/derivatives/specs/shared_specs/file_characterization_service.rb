# frozen_string_literal: true

RSpec.shared_examples 'a Valkyrie::Derivatives::FileCharacterizationService' do
  before do
    raise 'valid_file_set must be set with `let(:valid_file_set)`' unless
      defined? valid_file_set
    raise 'persister must be set with `let(:persister)`' unless
      defined? persister
    raise 'file_characterization_service must be set with `let(:file_characterization_service)`' unless
      defined? file_characterization_service
  end

  let(:file_set) { valid_file_set }
  subject { file_characterization_service.new(file_set: file_set, persister: persister) }

  it { is_expected.to respond_to(:characterize).with(0).arguments }
  it 'returns a file set' do
    expect(subject.characterize).to be_a(FileSet)
  end

  describe '#valid?' do
    context 'when given a file_set it handles' do
      let(:file_set) { valid_file_set }
      it { is_expected.to be_valid }
    end
  end

  it 'takes a file_set and a persister as arguments' do
    obj = file_characterization_service.new(file_set: file_set, persister: persister)
    expect(obj.file_set).to eq valid_file_set
    expect(obj.persister).to eq persister
  end
end
