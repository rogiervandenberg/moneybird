require "spec_helper"

describe Moneybird::Resource::SalesInvoice do
  let(:client) { faked_client }

  let(:sales_invoice) { Moneybird::Resource::SalesInvoice.build(hash_response(:sales_invoices).first.merge('notes' => [hash_response(:note)])) }

  it "has a contact" do
    sales_invoice.contact.must_be_instance_of Moneybird::Resource::Contact
  end

  it "has details" do
    sales_invoice.details.first.must_be_instance_of Moneybird::Resource::Invoice::Details
  end

  it "has notes" do
    sales_invoice.notes.first.must_be_instance_of Moneybird::Resource::Generic::Note
  end
end
