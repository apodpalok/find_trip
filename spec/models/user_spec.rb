describe User do
  context 'associations' do
    it { should have_many(:cars) }
    it { should have_many(:reviews).dependent(:destroy) }
    it { should have_many(:trip_memberships) }
    it { should have_many(:trips).through(:trip_memberships) }
    it { should have_many(:authored_reviews) }
    it { should have_and_belong_to_many(:trips_as_driver) }
    it { should have_many(:identities).dependent(:destroy) }
  end

  context 'validations' do
    context 'is invalid' do
      it 'without first_name' do
        expect(build(:user, first_name: nil)).to_not be_valid
      end

      it 'without last_name' do
        expect(build(:user, last_name: nil)).to_not be_valid
      end

      it 'without a email' do
        expect(build(:user, email: nil)).to_not be_valid
      end

      it 'without a unique email' do
        should validate_uniqueness_of(:email)
      end

      it 'without a formated email' do
        expect(build(:user, email: '123')).to_not be_valid
      end

      it 'without a password' do
        expect(build(:user, password: nil)).to_not be_valid
      end

      it 'without valid length of password' do
        expect(build(:user, password: '12345')).to_not be_valid
      end
    end
  end

  context 'methods' do
    let(:user) { create(:user) }
    let(:review) { create(:review, user_id: user.id) }

    context '.average_review' do
      it 'with review' do
        user.reviews << review
        expect(user.average_review).to eq(5.0)
      end

      it 'without review' do
        expect(user.average_review).to eq(0.0)
      end
    end

    context '.full_name' do
      it { expect(user.full_name).to eq('Anna Anna') }
    end

    context '.mailboxer_email' do
      it { expect(user.mailboxer_email(user)).to eq(user.email) }
    end

    context '.mailboxer_name' do
      it { expect(user.mailboxer_name).to eq(user.full_name) }
    end

    context '.percent_review(rating)' do
      it 'with rating' do
        user.reviews << review
        expect(user.percent_review(5)).to eq(100)
      end

      it 'without rating' do
        user.reviews << review
        expect(user.percent_review(4)).to eq(0.0)
      end
    end
  end
end
