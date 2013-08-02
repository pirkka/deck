# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# using z-index (complex and nasty and unfinished)
#
# $ ->
#   $('.member-card').click -> 
#     console.log 'reordering stack'
#     $('.member-card').each (idx, val) -> 
#       current_z = $(val).css('z-order')
#       if (typeof current_z == 'undefined')
#         new_z = idx
#       else
#         new_z = current_z + 1
#       console.log current_z + ' to ' + new_z + ' for ' + $(val).html()
#       $(val).css('z-index', new_z)
#     console.log 'sending clicked to back'
#     $(this).css('z-index', -1)
#     console.log 'sending clicked to back - after: ' + $(this).css('z-index')


# using append and prepend

cards_have_been_clickd = false

delay = (time, fn) ->
  setTimeout fn, time

readjust = ->
  
  rotation = -80 - (Math.floor(Math.random() * 40) + 1) 
  console.log 'moving site title'
  
  $('.card-site-title').transition({'duration': 2000,'rotate': '' + rotation + 'deg', 'margin-top': (Math.floor(Math.random() * 60) + 1) - 30, 'margin-left': (Math.floor(Math.random() * 80) + 1) - 40})

notify_about_clickability = ->
  if !cards_have_been_clickd
    # $('.clickability-notification').fadeIn();

    hide = ->
      delay 2000, hide_clickability_notification
    
    $('.clickability-notification').transition({'duration': 5000, 'top': '20px'}, hide)
    
    delay 15000, notify_about_clickability

hide_clickability_notification = ->
  console.log 'hiding the notification'
  # $('.clickability-notification').fadeOut();
  $('.clickability-notification').transition({'duration': 2000, 'top': '-200px'})

$ ->
  $('.card-site-title').click ->
    cards_have_been_clickd = true
    hide_clickability_notification()
    readjust()
    _gaq.push(['_trackPageview', "card-site-title-click"])
  
  $('.shufflable').click -> 
    cards_have_been_clickd = true
    hide_clickability_notification()
    # console.log('id: ' + this.id)
    #_gaq.push(['_trackPageview', $(this).id])

    # is this the first card in the stack?    
    if $(this).is(':last-child')
      # this is the first card in the stack
      console.log 'throwing the first card to the back of the stack! and rotating it a little'
      $(this).parent().prepend($(this));

      # and now we can still randomize the position of the adjusted card

      $(this).css('transform', 'rotate(' + (Math.floor(Math.random() * 40) + 1) - 20) + ')'
      $(this).css('-ms-transform', 'rotate(' + (Math.floor(Math.random() * 40) + 1) - 20) + ')'
      $(this).css('-webkit-transform', 'rotate(' + (Math.floor(Math.random() * 40) + 1) - 20) + ')'

      $(this).css('margin-top', (Math.floor(Math.random() * 60) + 1) - 30)
      $(this).css('margin-left', (Math.floor(Math.random() * 80) + 1) - 40)
      
      _gaq.push(['_trackPageview', "card-to-back-" + this.id])
    else
      # this is not the first - bring it up!
      console.log 'bringing a card to the top of the stack'
      $(this).parent().append($(this));
      _gaq.push(['_trackPageview', "card-to-front-" + this.id])
      
  readjust()

  delay 10000, notify_about_clickability