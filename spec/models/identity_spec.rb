describe Identity do
  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    context 'is invalid' do
      it 'without a uid' do
        expect(build(:identity, uid: nil)).to_not be_valid
      end

      it 'without a provider' do
        expect(build(:identity, provider: nil)).to_not be_valid
      end

      it 'with not unique uid' do
        should validate_uniqueness_of(:uid).scoped_to(:provider)
      end
    end
  end
end
