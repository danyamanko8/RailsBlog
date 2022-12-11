# frozen_string_literal: true

class Articles::Operations::Update < BaseOperation
  def call
    mutate_record_call!
  end

  private

  def form_class
    Articles::Forms::Base
  end
end