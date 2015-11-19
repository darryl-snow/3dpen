module.exports = do ->

	$("a[href*=#]:not([href=#])").click (e) ->

		e.preventDefault()

		if location.pathname.replace(/^\//, "") == @pathname.replace(/^\//, "") and
		location.hostname == @hostname
			target = $(@hash)
			target = if target.length then target else $("[name=" + @hash.slice(1) + "]")
			if target.length
				$("html,body").animate
					scrollTop: target.offset().top
				, 500