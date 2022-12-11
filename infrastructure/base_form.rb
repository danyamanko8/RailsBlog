# frozen_string_literal: true

class BaseForm < Readymade::Form
  # private

  def record_presence_validation
    errors.add(:record, 'cannot be blank') if record.blank?
  end
  attr_reader :siblings_forms

  def validate_siblings(*siblings_forms)
    siblings_forms.compact.all?(&:validate) || sync_siblings_errors(siblings_forms)
  end

  def build_siblings_forms
    @siblings_forms = siblings_forms_list
  end

  def siblings_forms_list
    []
  end

  def validate
    super && validate_nested(*nested_forms) && validate_siblings(*siblings_forms)
  end

  def sync_siblings_errors(siblings_forms)
    sync_nested_errors(siblings_forms)

    false
  end

  def _destroy?
    params.try(:[], :_destroy).present?
  end
end
