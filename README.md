# EASY BLOCKCHAIN

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* 1) You must install on your pc ruby(in my case it's a ruby  2.4.2p198):

     * gem 'sinatra', (gem install sinatra)

     * gem 'colorize',(gem install colorize)

     * gem 'faraday'(gem install faraday)

* 2) The page with json objects will be generate by program itself.

* 3) You must open a terminal and go to the directory with project.
    Write in terminal: ruby blockchain.rb

* 4) Open a new window in terminal and call ruby console.
    You must simply write : irb.
    After in console write: load 'client.rb'
    After that you can write methods for this blockchain:
     list
     validate
     add_block(user, value) . Example: add_block("Yaroslav", "1000000")

* 5) In the terminal window where was opened 'ruby blockchain.rb' you will be see response of the methods that you entered in other window.
    And new blocks will be generate in blocks.json that is in project folder.

* 6) If you did some changes in ruby code, please restart ruby console and repeat step no. 4     
