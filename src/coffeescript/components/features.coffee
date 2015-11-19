_ = require "lodash"

getPosition = (element) ->

	xPosition = 0
	yPosition = 0

	while element

		xPosition += element.offsetLeft - (element.scrollLeft) + element.clientLeft
		yPosition += element.offsetTop - (element.scrollTop) + element.clientTop
		element = element.offsetParent

	x: xPosition
	y: yPosition

class Features

	constructor: (el) ->

		@el =
			features: el.querySelectorAll(".js-features__feature")
			image: el.querySelectorAll(".js-features__image")[0]
			main: el

		@addEventListeners()

	addEventListeners: ->

		window.addEventListener "scroll", _.debounce @scroll

	scroll: =>

		offset = getPosition(@el.main).y

		if offset >= 0

			@el.image.classList.remove "is-fixed"

		else if offset > (-1 * (@el.main.clientHeight - @el.image.clientHeight - 50))

			@el.image.classList.add "is-fixed"
			@el.image.classList.remove "was-fixed"

		else if offset < 0 and offset <= (-1 * (@el.main.clientHeight - @el.image.clientHeight - 50))

			@el.image.classList.remove "is-fixed"
			@el.image.classList.add "was-fixed"

		if offset <= 100 and offset > (-1 * (@el.main.clientHeight / 4))
			@el.features[0].classList.remove "has-not-been-shown"
			@el.features[0].classList.remove "has-been-shown"
			@el.features[0].classList.add "is-shown"
		else if offset < (-1 * (@el.main.clientHeight / 4))
			@el.features[0].classList.remove "is-shown"
			@el.features[0].classList.remove "has-not-been-shown"
			@el.features[0].classList.add "has-been-shown"
		else if offset >= 100
			@el.features[0].classList.remove "has-been-shown"
			@el.features[0].classList.remove "is-shown"
			@el.features[0].classList.add "has-not-been-shown"

		if offset <= (-1 * (@el.main.clientHeight / 4)) and
		offset > (-1 * (@el.main.clientHeight * 2 / 4))
			@el.features[1].classList.remove "has-not-been-shown"
			@el.features[1].classList.remove "has-been-shown"
			@el.features[1].classList.add "is-shown"
		else if offset < (-1 * (@el.main.clientHeight * 2 / 4))
			@el.features[1].classList.remove "is-shown"
			@el.features[1].classList.remove "has-not-been-shown"
			@el.features[1].classList.add "has-been-shown"
		else if offset >= (-1 * (@el.main.clientHeight / 4))
			@el.features[1].classList.remove "has-been-shown"
			@el.features[1].classList.remove "is-shown"
			@el.features[1].classList.add "has-not-been-shown"

		if offset <= (-1 * (@el.main.clientHeight * 2 / 4)) and
		offset > (-1 * (@el.main.clientHeight * 3 / 4))
			@el.features[2].classList.remove "has-not-been-shown"
			@el.features[2].classList.remove "has-been-shown"
			@el.features[2].classList.add "is-shown"
		else if offset < (-1 * (@el.main.clientHeight * 3 / 4))
			@el.features[2].classList.remove "is-shown"
			@el.features[2].classList.remove "has-not-been-shown"
			@el.features[2].classList.add "has-been-shown"
		else if offset >= (-1 * (@el.main.clientHeight * 2 / 4))
			@el.features[2].classList.remove "has-been-shown"
			@el.features[2].classList.remove "is-shown"
			@el.features[2].classList.add "has-not-been-shown"





module.exports = do ->

	features = document.querySelectorAll ".js-features"

	if features.length isnt 0
		new Features features[0]