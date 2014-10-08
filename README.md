# About Sozogo
We all have unique skills and personalites, something unmatchable, unshakable, something that makes us.. well, us. Here, we are seeking to create an opportunity for everyone to use their skills to make this world a better and brighter place for everyone. [Get involved today!](get_involved.md)

The following instructions will automatically download and provision a virtual machine for you to begin hacking on Sozogo.

##Getting Started

Shoutout to the [Discorse getting started page](https://github.com/discourse/discourse/blob/master/docs/VAGRANT.md) for providing a solid template for this page

1. Install Git: http://git-scm.com/downloads (or GitHub for Windows if you want a GUI)
2. Install VirtualBox: https://www.virtualbox.org/wiki/Downloads
3. Install Vagrant: http://www.vagrantup.com/ (We require Vagrant 1.1.2+ or later)
4. Open a terminal
5. Clone the project: git clone https://github.com/jahbrewski/sozogo.git
6. Enter the project directory: cd sozogo

##Using Vagrant

When you're ready to start working, boot the VM:

```
vagrant up
```

Vagrant will prompt you for your admin password. This is so it can mount your local files inside the VM for an easy workflow.

(The first time you do this, it will take a while as it downloads the VM image and installs it. Go grab a coffee.)

**Note to Linux users**: Your Sozogo directory cannot be on an ecryptfs mount or you will receive an error: exportfs: /home/your/path/to/sozogo does not support NFS export

**Note to OSX/Linux users**: Vagrant will mount your local files via an NFS share. Therefore, make sure that NFS is installed or else you'll receive the error message:

```
Mounting NFS shared folders failed. This is most often caused by the NFS
client software not being installed on the guest machine. Please verify
that the NFS client software is properly installed, and consult any resources
specific to the linux distro you're using for more information on how to
do this.
```
For example, on Ubuntu, you can install NFS support by installing nfs-kernel-server with apt-get install.

Once the machine has booted up, you can shell into it by typing:

```
vagrant ssh
```
The sozogo code is found in the /vagrant directory in the image.

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
In a few seconds, rails will start serving pages. To access them, open a web browser to http://localhost:4000 - if it all worked you should see sozogo. Congratulations, you are ready to start working!

You can now edit files on your local file system, using your favorite text editor or IDE. When you reload your web browser, it should have the latest changes.

