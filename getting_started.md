##Getting Started

The following instructions will automatically download and provision a virtual machine for you to begin hacking on Sozogo. We use Vagrant, an awesome, open-source, piece of software for provisioning virtual machines to manage our develpment environments.

Shoutout to the [Discorse getting started page](https://github.com/discourse/discourse/blob/master/docs/VAGRANT.md) for providing a solid template for this page

1. Install Vagrant: http://www.vagrantup.com/
2. Open a terminal
3. Clone the project: `git clone https://github.com/sozogo/sozogo.git`
4. Enter the project directory: cd sozogo
5. Initialize your vagrant box: `vagrant init thoughtbot/ubuntu-14-04-server-with-laptop`

##Using Vagrant

When you're ready to start working, boot the VM:

```
vagrant up
```

Vagrant will prompt you for your admin password. This is so it can mount your local files inside the VM for an easy workflow.

(The first time you do this, it will take a while as it downloads the VM image and installs it. Go grab a coffee.)

```
vagrant ssh
```
The sozogo code is found in the /vagrant directory in the image :
```
cd /vagrant
```

Note to Windows users: You cannot run ```vagrant ssh``` from a cmd prompt; you'll receive the error message:

```
`vagrant ssh` isn't available on the Windows platform. You are still able
to SSH into the virtual machine if you get a Windows SSH client (such as
PuTTY). The authentication information is shown below:

Host: 127.0.0.1
Port: 2222
Username: vagrant
Private key: C:/Users/Your Name/.vagrant.d/insecure_private_key
```
At this point, you will want to get an SSH client, and use it to connect to your Vagrant VM instead. We recommend PuTTY:

**[PuTTY Download Link](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)**

You may use this client to connect to the VM by using ```vagrant/vagrant``` as your username/password, or by [using PuTTYGen to import the insecure_private_key file](http://jason.sharonandjason.com/key_based_putty_logins_mini_how_to.htm)  (mentioned above) into a PuTTY profile to quickly access your VM.

###Keeping your VM up to date

Now you're in a virtual machine is almost ready to start developing. It's a good idea to perform the following instructions *every time* you pull from master to ensure your environment is still up to date.

```
cd /vagrant
bundle install
bundle exec rake db:migrate
```

###Starting Rails

Once your VM is up to date, you can start a rails instance using the following command from the /vagrant directory:

```
bundle exec rails s
```
In a few seconds, rails will start serving pages. To access them, open a web browser to http://localhost:3000 - if it all worked you should see sozogo. Congratulations, you are ready to start working!

You can now edit files on your local file system, using your favorite text editor or IDE. When you reload your web browser, it should have the latest changes.
