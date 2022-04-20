# Bio Maintenance

> Software to keep track of maintenance of medical equipment.

## Set the bundler
The bundler used on the original version is 2.2.21, if any issue is found it is necesary to set the bundler to version 228 with the code bellow

```BASH
heroku buildpacks:set https://github.com/heroku/heroku-buildpack-ruby.git#v228
```


## Deploy to heroku
```BASH
heroku login
git push heroku master:main
```

