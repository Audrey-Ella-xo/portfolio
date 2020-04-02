# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

TxtRotate = (el, toRotate, period) ->
  @toRotate = toRotate
  @el = el
  @loopNum = 0
  @period = parseInt(period, 10) or 2000
  @txt = ''
  @tick()
  @isDeleting = false
  return

TxtRotate::tick = ->
  i = @loopNum % @toRotate.length
  fullTxt = @toRotate[i]
  if @isDeleting
    @txt = fullTxt.substring(0, @txt.length - 1)
  else
    @txt = fullTxt.substring(0, @txt.length + 1)
  @el.innerHTML = '<span class="wrap">' + @txt + '</span>'
  that = this
  delta = 300 - (Math.random() * 100)
  if @isDeleting
    delta /= 2
  if !@isDeleting and @txt == fullTxt
    delta = @period
    @isDeleting = true
  else if @isDeleting and @txt == ''
    @isDeleting = false
    @loopNum++
    delta = 500
  setTimeout (->
    that.tick()
    return
  ), delta
  return

window.onload = ->
  elements = document.getElementsByClassName('txt-rotate')
  i = 0
  while i < elements.length
    toRotate = elements[i].getAttribute('data-rotate')
    period = elements[i].getAttribute('data-period')
    if toRotate
      new TxtRotate(elements[i], JSON.parse(toRotate), period)
    i++
  # INJECT CSS
  css = document.createElement('style')
  css.type = 'text/css'
  css.innerHTML = '.txt-rotate > .wrap { border-right: 0.08em solid #666 }'
  document.body.appendChild css
  return
