class videoTransitionEffects
	constructor: (@videoId) ->
		@container = $("#container-#{@videoId}")
		@cover = $("#cover-#{@videoId}")
		@button = $("#button-#{@videoId}")

		@appendTo = $("#append-#{@videoId}")
		@appendSrc = "<iframe allowfullscreen frameborder='0' src='http://www.youtube.com/embed/#{@videoId}?rel=0&amp;showinfo=0&amp;controls=1&amp;autoplay=1'>"

		@expanded = false

		@classExpanded = 'cover-expanded'
		@classCollapsed = 'cover-collapsed'

	toggle: ()->

		if @expanded
			newOpacity = 1
		else
			newOpacity = 0

		@cover.animate(opacity: newOpacity, 'fast')

		if @expanded
			@switchClass(@classCollapsed, @classExpanded)
			@button.removeClass('secondary')
			@button.text('Watch the video')
			@appendTo.empty()
		else
			@appendTo.append(@appendSrc)
			@switchClass(@classExpanded, @classCollapsed)
			@button.addClass('secondary')
			@button.text('Hide the video')
			
		@expanded = !@expanded

		$('html,body').animate({scrollTop: $("#anchor-#{@videoId}").offset().top},'fast');

	switchClass: (add, remove) ->

		@container.addClass(add)
		@container.removeClass(remove)

# End Class videoTransitionEffects

# Bind video toggling to these elements
video = new videoTransitionEffects 'KWU_2DXhRhc'
$('.toggle-video-KWU_2DXhRhc').click(()-> video.toggle())

