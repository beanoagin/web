# Welcome to Linguist

The concept of chatroulette has gotten a bad rep over the past few years. Sites like Omegle have made chatroulette almost an adult-only product, creating a world occupied by lonely men on the Internet hungry for affection. That's all about to change. Introducing Linguist, the first ever chatroulette website designed specifically for language learners and those who wish to have a better understanding of the world. Simply head over to [http://linguistic.io](http://linguistic.io), specify which language you know and which one you are learning, and then be connected in seconds to a native speaker to practice with. And that best part of all is, it's free! It's also open-sourced (duh).

## Starting Linguist

To start Linguist, simply `cd` into Linguist's home directory and run the following two commands:

	$ npm install --production
	$ gulp
		
Once the gulp build has finished, fire up any web browser and go to http://localhost:4000. There you have it, a local copy of Linguist! Alternatively, you can install all dependencies (including development dependencies) by just running `npm install`.

## Configuring Nginx

If you wish to run Linguist behind a proxy server, you must add the following two settings to your Nginx configuration in order to deduct user location:

	proxy_set_header X-Real-IP $remote_addr;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	
It is important to note that location reporting will not work on a local installation (at least as far as I know).

## Creating a New Language Pack

Considering the fact that Linguist is designed to accomodate language learners from across the globe, it is essential that the Linguist platform be offered in as many languages as possible. If you would like to contribute to our localization efforts, simply run the following two commands from the document root to generate a new .po file to edit:

```
$ mkdir -p ./locale/templates/LC_MESSAGES/
$ msginit --input=./locale/templates/LC_MESSAGES/messages.pot --output-file=./locale/<LANG>/LC_MESSAGES/messages.po -l <LANG>
```

where `<LANG>` is the two letter language code of the language you are translating into. Please note that if you wish to translate into a specific dialect (such as zh-TW or en-UK), the hyphen between the language and the dialect **must** be replaced with an underscore (_). Otherwise, i18n will not detect the language correctly.

### Resources
GNU gettext utilities must be installed before creating these language packs. The following resources should help you get set up with installing Gettext on your respective operating system: 

**Select Your Operating System**

* [Windows](https://www.nuget.org/packages/Gettext.Tools/)
* [OS X](http://arielvb.readthedocs.org/en/latest/docs/mac/commandline.html#gettext)
* [Linux](https://www.gnu.org/software/gettext/manual/html_node/index.html#SEC_Contents)
