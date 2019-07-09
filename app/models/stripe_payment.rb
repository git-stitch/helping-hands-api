class StripePayment
  Stripe.api_key = ''

  def make_reocurring_payment(info, customer)
    charge = Stripe::Charge.create({
      amount: info[:amount],
      currency:'usd',
      customer: customer[:id],
      description: "Donation to #{info[:organization_name]} Organization at HelpingHands.com",
    })
  end

  def make_payment(info, token) 
    charge = Stripe::Charge.create({
      amount: info[:amount],
      currency:'usd',
      source: token,
      description: "Donation to #{info[:organization_name]} Organization at HelpingHands.com",
    })
  end

  def create_customer(user)
    Stripe::Customer.create({
      email:user[:email],
      name:user[:name],
      source: 'tok_visa',
      description:"#{user[:email]}'s HelpingHands user account."
    })
  end

  def create_customer_card(user)
    Stripe::Customer.create_source(
      user[:pay_id],
      {
        source: {
          object: 'card',
          number: user[:card_number],
          exp_month: user[:exp_month],
          exp_year: user[:exp_year],
          cvc: user[:cvc],
          currency: user[:currency],
          name: user[:full_name],
          address_zip: user[:zip]
        }
      }
    )
  end

  def get_customer(user)
    Stripe::Customer.retrieve(user[:pay_id])
  end

  def update_customer(user)
    Stripe::Customer.update(
      user[:pay_id], 
      {
        source: user[:card_source]
      }
    )
  end

  def delete_customer(user)
    Stripe::Customer.delete(user.id)
  end

  def create_session

  end

end

