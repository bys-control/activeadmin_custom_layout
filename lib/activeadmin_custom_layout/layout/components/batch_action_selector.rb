module BatchActionSelectorPatch

  private

  def build_drop_down
    return if batch_actions_to_display.empty?
    aa_data[:batch_actions] ||= []
    dropdown_menu I18n.t("active_admin.batch_actions.button_label"),
                  class: "batch_actions_selector dropdown_menu",
                  button: { class: "disabled" } do
      batch_actions_to_display.each do |batch_action|
        confirmation_text = render_or_call_method_or_proc_on(self, batch_action.confirm)

        options = {
          :class         => "batch_action",
          "data-action"  => batch_action.sym,
          "data-confirm" => confirmation_text,
          "data-inputs"  => render_in_context(self, batch_action.inputs).to_json
        }

        default_title = render_or_call_method_or_proc_on(self, batch_action.title)
        title = I18n.t("active_admin.batch_actions.labels.#{batch_action.sym}", default: default_title)
        label = I18n.t("active_admin.batch_actions.action_label", title: title)

        item label, "#", options

        aa_data[:batch_actions].push({  
          title: title,
          label: label,
          options: options
        })
      end
    end
  end

end

module ActiveAdmin
  module BatchActions
    class BatchActionSelector < ActiveAdmin::Component
      prepend BatchActionSelectorPatch
    end
  end
end
