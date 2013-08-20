
class videoTransitionEffects
	constructor: (@element) ->
		@cover = @element.children('.video-cover')
		@videoId = @element.data('video-id')
		@expanded = false
		@append = "
			<div class='row' id='title-video-container'>
				<div class='small-12 large-12 columns'>
					<div class='video-centering'>
						<div class='flex-video'>
							<iframe allowfullscreen frameborder='0' src='http://www.youtube.com/embed/#{@videoId}?rel=0&amp;showinfo=0&amp;controls=1&amp;autoplay=1'>
							</iframe>
							<a class='close-video'><img src='./img/close.png' alt='Close' height='32' width='32' /></a>
						</div>
					</div>
				</div>
			</div>"
		@classExpanded = 'cover-expanded'
		@classCollapsed = 'cover-collapsed'
		

	toggle: () ->

		if @expanded
			newOpacity = 1
		else
			newOpacity = 0

		@cover.animate(opacity: newOpacity, 'fast', ()->)

		if not @expanded
			this.switchClass(@classExpanded, @classCollapsed)
			@element.append(@append)
		else
			@element.children('#title-video-container').remove()
			this.switchClass(@classCollapsed, @classExpanded)

		@expanded = !@expanded

	switchClass: (add, remove) ->
			@element.addClass(add)
			@element.removeClass(remove)

# End Class videoTransitionEffects

# Bind video toggling to these elements
video = new videoTransitionEffects $('#android-video')

bindThese = $('.toggle-video')
for item in bindThese
	console.log(item)
	item.onclick = () -> video.toggle()
