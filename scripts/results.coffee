#Gets variables from url query and parses them into individual variables
getQueryVariable = (variable) ->
    query = window.location.search.substring(1)
    vars = query.split("&")
    `for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=")
            if(pair[0] == variable) {return pair[1]}
    }`
    return(NaN)

#Sets the value for each bar div
setBarValue = (name, value) ->
    innerel = document.getElementById(name)
    outerel = document.getElementById("bar-" + name)
    outerel.style.width = value + "%"
    innerel.innerHTML = value + "%"
    if value < 20
        innerel.style.display = "none"
    else
        innerel.style.display = "block"

#Jumps to submit page with url query
submit = () ->
    window.location.href = "submitter.html?" \
    + window.location.search.substring(1)

#Sets the label for each axis
setLabel = (val,ary) ->
    if val > 100
        return ""
    else if val > 95 
        return ary[0]
    else if val > 85
        return ary[1]
    else if val > 75
        return ary[2]
    else if val > 65
        return ary[3]
    else if val > 55
        return ary[4]
    else if val >= 45
        return ary[5]
    else if val >= 35 
        return ary[6]
    else if val >= 25
        return ary[7]
    else if val >= 15
        return ary[8]
    else if val >= 5 
        return ary[9]
    else if val >= 0 
        return ary[10]
    else
        return ""

#Defines value of each value
sincerity      = getQueryVariable("a")
jannyphobe     = getQueryVariable("b")
veteran        = getQueryVariable("c")
wholesome      = getQueryVariable("d")
horny          = getQueryVariable("e")
active         = getQueryVariable("f")
standard       = getQueryVariable("g")
boring         = getQueryVariable("h")
liked          = getQueryVariable("i")
discriminatory = getQueryVariable("j")
behaving       = getQueryVariable("k")
artist         = getQueryVariable("l")
pleasant       = getQueryVariable("m")
funny          = getQueryVariable("n")
irony          = (100 - sincerity     ).toFixed(1)
jannyphile     = (100 - jannyphobe    ).toFixed(1)
newbie         = (100 - veteran       ).toFixed(1)
edgy           = (100 - wholesome     ).toFixed(1)
antihorny      = (100 - horny         ).toFixed(1)
lurker         = (100 - active        ).toFixed(1)
wacky          = (100 - standard      ).toFixed(1)
schizo         = (100 - boring        ).toFixed(1)
disliked       = (100 - liked         ).toFixed(1)
inclusive      = (100 - discriminatory).toFixed(1)
misbehaving    = (100 - behaving      ).toFixed(1)
community      = (100 - artist        ).toFixed(1)
annoying       = (100 - pleasant      ).toFixed(1)
unfunny        = (100 - funny         ).toFixed(1)
#Detects if short test was taken
length = getQueryVariable("z")
if length is "s"
    short = true
else
    short = false

#Sets bar values for all bars
#Left collumn
setBarValue("sincerity", sincerity)
setBarValue("antymoderacjonizm", jannyphobe)
setBarValue("veteran", veteran)
setBarValue("spokojny", wholesome)
setBarValue("zboczeniec", horny)
setBarValue("aktywny", active)
setBarValue("zwykły", standard)
setBarValue("boring", boring)
setBarValue("lubiany", liked)
setBarValue("rasista", discriminatory)
setBarValue("nieodpowiedzialny", behaving)
setBarValue("artysta", artist)
setBarValue("pleasant", pleasant)
setBarValue("zabawny", funny)
#Right collumn
setBarValue("irony", irony)
setBarValue("promoderacjonizm", jannyphile)
setBarValue("początkujący", newbie)
setBarValue("drażliwy", edgy)
setBarValue("antyseksualny", antihorny)
setBarValue("lurker", lurker)
setBarValue("szalony", wacky)
setBarValue("schizo", schizo)
setBarValue("znienawidzony", disliked)
setBarValue("spokojność", inclusive)
setBarValue("przestrzegalność", misbehaving)
setBarValue("community", community)
setBarValue("annoying", annoying)
setBarValue("unfunny", unfunny)

#Sets label for all axis divs
document.getElementById("seriousposting-label").innerHTML = setLabel(sincerity,     spos_array)
document.getElementById("allegiance-label").innerHTML     = setLabel(jannyphobe,    alle_array)
document.getElementById("experience-label").innerHTML     = setLabel(veteran,       expr_array)
document.getElementById("personality-label").innerHTML    = setLabel(wholesome,     pers_array)
document.getElementById("hornyposting-label").innerHTML   = setLabel(horny,         horn_array)
document.getElementById("fame-label").innerHTML           = setLabel(active,        fame_array)
document.getElementById("shower-label").innerHTML         = setLabel(standard,      shwr_array)
document.getElementById("sanity-label").innerHTML         = setLabel(boring,        sani_array)
document.getElementById("relationship-label").innerHTML   = setLabel(liked,         rela_array)
document.getElementById("fedposting-label").innerHTML     = setLabel(discriminatory,fedp_array)
document.getElementById("actions-label").innerHTML        = setLabel(behaving,      actn_array)
document.getElementById("purpose-label").innerHTML        = setLabel(artist,        purp_array)
document.getElementById("perception-label").innerHTML     = setLabel(pleasant,      perc_array)
document.getElementById("comedy-label").innerHTML         = setLabel(funny,         cmdy_array)

#Finds closest match to this user
thisuser = ""
userdist = Infinity
for user in users
    dist = 0
    dist += Math.pow(Math.abs(user.stats.spos - sincerity), 2)
    dist += Math.pow(Math.abs(user.stats.alle - jannyphobe), 2)
    dist += Math.pow(Math.abs(user.stats.expr - veteran), 2)
    dist += Math.pow(Math.abs(user.stats.pers - wholesome), 2)
    dist += Math.pow(Math.abs(user.stats.horn - horny), 2)
    dist += Math.pow(Math.abs(user.stats.fame - active), 2)
    dist += Math.pow(Math.abs(user.stats.shwr - standard), 2)
    dist += Math.pow(Math.abs(user.stats.sani - boring), 2)
    dist += Math.pow(Math.abs(user.stats.rela - liked), 2)
    dist += Math.pow(Math.abs(user.stats.fedp - discriminatory), 2)
    dist += Math.pow(Math.abs(user.stats.actn - behaving), 2)
    dist += Math.pow(Math.abs(user.stats.purp - artist), 2)
    dist += Math.pow(Math.abs(user.stats.perc - pleasant), 2)
    dist += Math.pow(Math.abs(user.stats.cmdy - funny), 2)
    if dist < userdist
        thisuser = user.name
        userdist = dist
document.getElementById("user-label").innerHTML = thisuser

#Starts canvas element
`window.onload = function(){
    if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
        darkmode = true
    } else {
        darkmode = false
    }
    makeUserCanvas(sincerity,jannyphobe,veteran,wholesome,horny,active,standard,boring,liked,discriminatory,behaving,artist,pleasant,funny,false,short,darkmode,thisuser)
}`