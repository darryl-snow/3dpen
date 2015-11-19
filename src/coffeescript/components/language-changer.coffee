class LanguageChanger

	constructor: (el) ->

		@el =
			select: el
			options: el.querySelectorAll "option"

		@currentLanguage = if window.location.href.indexOf("en") is -1 then "chinese" else "english"

		console.log @currentLanguage

		@disableCurrentLanguageOption()

		@addEventListeners()

	disableCurrentLanguageOption: ->

		englishOption = @el.select.querySelectorAll("[value='en-gb']")[0]
		chineseOption = @el.select.querySelectorAll("[value='zh-cn']")[0]

		if @currentLanguage is "english"

			@el.select.removeChild englishOption

		else

			@el.select.removeChild chineseOption

	addEventListeners: ->

		@el.select.addEventListener "change", ->

			if @options[@selectedIndex].value isnt ""

				if @options[@selectedIndex].value is "zh-cn"

					window.location.href = "/" + @options[@selectedIndex].value.substr -2

				else

					window.location.href = "/" + @options[@selectedIndex].value.substr 0, 2


module.exports = do ->

	languageChangers = document.querySelectorAll ".js-language-changer"

	if languageChangers.length isnt 0

		for languageChanger in languageChangers

			new LanguageChanger languageChanger