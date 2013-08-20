cd www/min
:: Using /b in the copy command removes the end of file character from generated file
copy *.js "compiled/app.min.js" /b
:: PAUSE