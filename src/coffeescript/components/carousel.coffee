require "slick-carousel"

class Carousel

	constructor: (el) ->

		$(el).slick
			autoplay: true
			autoplaySpeed: 3500
			arrows: false
			cssEase: "ease-in-out"
			dots: false


module.exports = do ->

	carousels = document.querySelectorAll ".js-carousel"

	if carousels.length isnt 0

		for carousel in carousels

			new Carousel carousel