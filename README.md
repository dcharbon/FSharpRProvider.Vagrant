FSharpRProvider.Vagrant
=======================

Vagrant scripts for quickly setting up a Linux/Mono environment for testing
or developing of FSharpRProvider.

Setup Prerequisites
===================

* Install [Vagrant](http://www.vagrantup.com/)
* Install Vagrant plugins

  ```
  vagrant plugin install vagrant-librarian-chef
  vagrant plugin install vagrant-omnibus
  ```

* Install [VirtualBox](https://www.virtualbox.org/)
  * Or use VMWare, but you'll need the [VMWare Plugin](https://www.vagrantup.com/vmware)

Getting Started
===============

How it's supposed to work
-------------------------

  ```
  git clone https://github.com/dcharbon/FSharpRProvider.Vagrant.git
  vagrant up
  vagrant ssh
  git clone {your fork of FSharpRProvider}
  cd FSharpRProvider
  ```

Get to work!

What to do if successive `vagrant up` fails?
--------------------------------------------

There is an issue with vagrant-omnibus:
[Issue 88](https://github.com/schisamo/vagrant-omnibus/issues/88)

The workaround is to comment out the line that specifies that the latest chef
should be used for vagrant-omnibus; line 10 of Vagrantfile:

  ```
  # config.omnibus.chef_version = :latest
  ```

Building FSharpRProvider
------------------------

* I don't know, yet.

Credits
=======

Thanks to the authors of
[Nancy.Vagrant](https://github.com/NancyFx/Nancy.Vagrant) for some inspiration
on how to structure this project.

