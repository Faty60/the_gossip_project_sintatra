require 'bundler'
Bundler.require # elles appellent le bundler et permettent de lire le Gemfile. 

$:.unshift File.expand_path("./../lib", __FILE__) # commande qui dit de prendre en compte tous les fichiers dans le dossier lib
require 'controller'

run ApplicationController # lance l'application