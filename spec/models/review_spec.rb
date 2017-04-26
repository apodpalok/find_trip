describe Review do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:author).class_name('User') }
  end

  context 'validations' do
    it 'have a valid factory' do
      expect(build(:review)).to be_valid
    end

    context 'is invalid' do
      it 'without a rating' do
        expect(build(:review, rating: nil)).to_not be_valid
      end

      it 'without a comment' do
        expect(build(:review, comment: nil)).to_not be_valid
      end
    end
  end
end
