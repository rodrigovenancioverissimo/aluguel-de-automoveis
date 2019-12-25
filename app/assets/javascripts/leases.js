function set_person(personId, inputId, previewInputId, previewValue, modalId) {
    jQuery(inputId).val(personId)
    jQuery(previewInputId).val(previewValue)
    jQuery(modalId).modal('hide')
}

function set_automobile(automobileId, inputId, previewInputId, previewValue, modalId) {
    jQuery(inputId).val(automobileId)
    jQuery(previewInputId).val(previewValue)
    jQuery(modalId).modal('hide')
}