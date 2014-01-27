SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: 'control-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :prepend, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :append, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end


# SimpleForm.setup do |config|
#   config.wrappers :default, class: :input,
#     hint_class: :field_with_hint, error_class: :field_with_errors do |b|

#     b.use :html5
#     b.use :placeholder

#     b.optional :maxlength
#     b.optional :pattern
#     b.optional :min_max
#     b.optional :readonly

#     ## Inputs
#     b.use :label_input
#     b.use :hint,  wrap_with: { tag: :span, class: :hint }
#     b.use :error, wrap_with: { tag: :span, class: :error }
#   end

#   config.default_wrapper          = :default
#   config.boolean_style            = :nested
#   config.button_class             = 'btn'
#   config.error_notification_tag   = :div
#   config.error_notification_class = 'alert alert-error'
#   config.label_class              = 'control-label'
#   config.form_class               = 'form-horizontal'
#   config.browser_validations      = false
#   config.input_class              = 'form-control'
# end
