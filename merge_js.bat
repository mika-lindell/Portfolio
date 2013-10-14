cd www/min
:: Using /b in the copy command removes the end of file character from generated file
copy foundation.min.js + foundation.interchange.min.js + foundation.tooltips.min.js + foundation.topbar.min.js + custom.js  "compiled/app.min.js" /b
:: PAUSE