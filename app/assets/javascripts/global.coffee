jQuery(document).on 'turbolinks:load', ->
  requirements = $('#requirements')
  count = requirements.find('.count > span')

  recount = -> count.text requirements.find('.nested-fields').size()

  requirements.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)

  requirements.on 'cocoon:after-insert', (e, added_el) ->
    added_el.effect('highlight', {}, 500)
    recount()

  requirements.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)

  requirements.on 'cocoon:after-remove', (e, removed_el) ->
    recount()