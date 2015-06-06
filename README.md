# Welcome to Linguistic

The concept of chatroulette has gotten a bad rep over the past few years. Sites like Omegle have made chatroulette almost an adult-only product, creating a world occupied by lonely men on the Internet hungry for affection. That's all about to change. Introducing Linguistic, the first ever chatroulette website designed specifically for language learners and those who wish to have a better understanding of the world. Simply head over to [http://Linguisticic.io](http://Linguisticic.io), specify which language you know and which one you are learning, and then be connected in seconds to a native speaker to practice with. And that best part of all is, it's free! It's also open-sourced (duh).

## Starting Linguistic

To start Linguistic, first `cd` into Linguistic's home directory and run the following two commands:

    $ npm install --production
    $ gulp

This installs all production libraries for Linguistic and compiles all Javascript and CSS.
Once the gulp build has finished, the UIKit framework dependency must be compiled. To compile UIKit, run the following:

    $ cd ./node_modules/uikit
    $ npm install
    $ gulp -t almost-flat

Finally, fire up any web browser and go to http://localhost:4000 to run Linguistic.

## Configuring Nginx

If you wish to run Linguistic behind a proxy server, you must add the following two settings to your Nginx configuration in order to deduct user location:

    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

It is important to note that location reporting will not work on a local installation (at least as far as I know).

## Localization
### Creating a New Language Pack

Considering the fact that Linguistic is designed to accomodate language learners from across the globe, it is essential that the Linguistic platform be offered in as many languages as possible. If you would like to contribute to our localization efforts, simply run the following command from the root path to generate a new .po file to edit:

    $ ./crlang.sh <LANG>

where `<LANG>` is the language code of the language you are translating into. Please note that if you wish to translate into a specific dialect (such as zh-TW or en-UK), the hyphen between the language and the dialect __must__ be replaced with an underscore (_). Otherwise, i18n will not detect the language correctly.

### Updating a Language Pack

Occasionally, language packs need to be updated as new strings are added to the Linguistic interface. To update the language template and merge new strings into all language packs, run the following in the root directory:

    $ gulp scrape_po

It is recommended that this command be run before making _any_ changes to existing language packs. Once changes to a pack have been made, recompile the JSON representation of these packs by running:

    $ gulp compile_json

### Resources
GNU gettext utilities must be installed before creating these language packs. The following resources should help you get set up with installing Gettext on your respective operating system:

**Select Your Operating System**

* [Windows](https://www.nuget.org/packages/Gettext.Tools/)
* [OS X](http://arielvb.readthedocs.org/en/latest/docs/mac/commandline.html#gettext)
* [Linux](https://www.gnu.org/software/gettext/manual/html_node/index.html#SEC_Contents)
