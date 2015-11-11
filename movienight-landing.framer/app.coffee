Framer.Device.background.backgroundColor = "green"
Framer.Device.background.backgroundColor = "#CFCFF5"

Framer.DeviceView.Devices["custom"] =
	"deviceType": "desktop"
	"screenWidth": 1440
	"screenHeight": 900
	"deviceImage": ""
	"deviceImageWidth": 2284
	"deviceImageHeight": 1662

# Set custom device
Framer.Device.deviceType = "custom"


# Set background
bg = new BackgroundLayer backgroundColor: "gray"
bg.bringToFront()

# Set cursor to pointer
document.body.style.cursor = "auto"

# This imports all the layers for "landing" into landingLayers
sketch = Framer.Importer.load "imported/landing"





# Objects
loginButton = sketch.loginButton
haze = sketch.haze
loginFields = sketch.loginFields
createFields = sketch.createFields
emailL = sketch.emailL
passwordL = sketch.passwordL
loginSmall = sketch.loginSmall
createLink = sketch.createLink

createSmall = sketch.createSmall
emailC = sketch.emailC
passwordC = sketch.passwordC
password2C = sketch.password2C
loginLink = sketch.loginLink
firstName = sketch.firstName
lastName = sketch.lastName

# Starting Properties
haze.opacity = 0
loginFields.opacity = 0
createFields.opacity = 0

signUp = sketch.signUp

# Arrays
loginArray = [emailL, passwordL, loginSmall, createLink]
createArray = [emailC, passwordC, password2C, firstName, lastName, createSmall, loginLink]

movieNight = sketch.movie_night
c2a = sketch.c2a

titleArray = [movieNight, c2a, signUp]
titleArray.reverse()

delayIncrement = .05
reverseDelayIncrement = .02
fieldAnimationTime = .4

movieNight.opacity = 0
c2a.opacity = 0
signUp.opacity = 0

illoParallax = 6
illoTime = .9
	
kids = sketch.Kids

kidsX = kids.x
kids.x -= illoParallax

background = sketch.Background

backgroundX = background.x 
background.x += illoParallax

underline = sketch.underline
typing = sketch.typing
j = sketch.j
d = sketch.d
iLetter = sketch.i
l = sketch.l
atSymbol = sketch.atSymbol

typing.opacity = 0
j.opacity = 0
d.opacity = 0
iLetter.opacity = 0
l.opacity = 0
atSymbol.opacity = 0

hazeFade = new Animation
	layer: haze,
	properties:
		opacity:1,
	time: .9




touchCircle = new Layer
	width: 20
	height: 20
	borderRadius: 40
	backgroundColor: 'white'
	opacity: 0
	
circleExpand = new Animation
	layer: touchCircle
	properties: 
		scale: 6
		opacity: 0
	curve: 'ease-out'
	time: .15

touch = (xPos, yPos)->
	touchCircle.x = xPos
	touchCircle.y = yPos
	touchCircle.opacity = 1
	circleExpand.start()
	circleExpand.on "end", ->
		touchCircle.scale = 1




		
		
		





sceneEnters = ->
	kids.animate
		properties: 
			x: kidsX
		time: illoTime
		curve: 'ease-out'
	
	background.animate
		properties: 
			x: backgroundX
		time: illoTime
		curve: 'ease-out'


titleEnters = ->
	i = 0
	for item in titleArray
		do (item) ->
			item.animate
				properties:
					opacity: 1
				time: 1.3
		i++
	


titleExits = ->
	hazeFade.start()
	
	i = 0
	for item in titleArray
		do (item) ->
			item.animate
				properties:
					opacity: 0
					y: item.y - 10
				time: .2
				delay:  i * .05
			i++



signUpEnters = ->
	loginFields.opacity = 0
	createFields.opacity = 1
	
	i = 0
	for field in createArray
		do (field) ->
			
			fieldEndY = field.y
			
			field.opacity = 0
			field.y = field.y + 10
			
			fieldAnimation = new Animation
				layer: field,
				properties: {opacity:1, y: fieldEndY},
				time: fieldAnimationTime,
				delay: delayIncrement * i
			fieldAnimation.on Events.AnimationEnd, ->
				field.y = fieldEndY
				
			fieldAnimation.start()
			i++



			
typingEmail = ->
	underline.opacity = 0
	typing.opacity = 1
	
	
	Utils.delay .5, ->
		j.opacity = 1
		
		Utils.delay .2, ->
			d.opacity = 1
			
			Utils.delay .3, ->
				iLetter.opacity = 1
				
				Utils.delay .2, ->
					l.opacity = 1
					
					Utils.delay .6, ->
						atSymbol.opacity = 1


			

signUpEnters = ->
	loginFields.opacity = 0
	createFields.opacity = 1
	
	i = 0
	for field in createArray
		do (field) ->
			
			fieldEndY = field.y
			
			field.opacity = 0
			field.y = field.y + 10
			
			fieldAnimation = new Animation
				layer: field,
				properties: {opacity:1, y: fieldEndY},
				time: fieldAnimationTime,
				delay: delayIncrement * i
			fieldAnimation.on Events.AnimationEnd, ->
				field.y = fieldEndY
				
			fieldAnimation.start()
			i++











# Story Controller
Utils.delay .8, ->
	sceneEnters()
	
	
	Utils.delay .3, -> 
		titleEnters()
		
		
		Utils.delay 2, ->
			titleExits()
			
			touch(715, 500)
			
			
			Utils.delay .5, ->
				signUpEnters()
				
				
				Utils.delay 1, ->
					typingEmail()
					
					touch(655, 225)
			



















# createClickedReverse = ->
# 	i = 0
# 	for field in createArray.reverse()
# 		do (field) ->
# 			
# 			fieldEndY = field.y
# 			
# 			fieldAnimation = new Animation
# 				layer: field,
# 				properties: {opacity:0, y:field.y-10},
# 				time: fieldAnimationTime,
# 				delay: reverseDelayIncrement * i
# 			fieldAnimation.on Events.AnimationEnd, ->
# 				field.y = fieldEndY
# 				
# 			fieldAnimation.start()
# 			i++


# loginClickedReverse = ->
# 	i = 0
# 	for field in loginArray.reverse()
# 		do (field) ->
# 			
# 			fieldEndY = field.y
# 			
# 			fieldAnimation = new Animation
# 				layer: field,
# 				properties: {opacity:0, y:field.y-10},
# 				time: fieldAnimationTime,
# 				delay: reverseDelayIncrement * i
# 			fieldAnimation.on Events.AnimationEnd, ->
# 				field.y = fieldEndY
# 				
# 			fieldAnimation.start()
# 			i++



