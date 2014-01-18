$ ->

  converter = new Showdown.converter({ extensions: 'github' })

  loadPreview = () ->
    pageBody = $('.page-body')
    text = pageBody.val()

    preview = $('.preview')
    preview.html(converter.makeHtml(text))
    
    height = preview.height()
    if height > 0
      pageBody.css(height: height)




  loadPreview()
  
  $('.page-body').on 'keyup', () ->
    loadPreview()

  $('.flash').delay(5000).fadeOut()
