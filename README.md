# Application description

Metabase is the easy, open source way for everyone in your company to ask questions and learn from data. This is a pre-configured installation with openJDK and the open source version of Metabase. All dependencies are solved for you to just go and start using Metabase from your browser in moments.

#### Explore on your own

Easily filter and group your data to find just what you’re looking for, all without ever writing a line of sql or having to wait on a co-worker.

#### See connections

It just takes a click to see individual records and explore connections between your data, so you can move from who, to what effortlessly.

#### Visualize results

Move from your data to beautiful graphs and charts with just a few clicks.

# Getting started information

**Creating a system administrator account**

It is highly recommended that you create an administrator account separate from root.

With your just created droplet, open a terminal on your local and login as root:

```
ssh root@server_ip_address
```

Let's create the user paul:

```
adduser paul
usermod -aG sudo paul
```

For the full reference please check this [DigitalOcean tutorial](<https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart>).

**Using Metabase**

Allow 2 to 5 minutes so that Metabase starts all required services. With less powerful droplets this can be slower, faster droplets will run Metabase almost immediately. This delay only happens when the droplet is created and not afterwards.

From any modern browser such as Firefox, type `server_ip_address:3000` (see your droplet IP at DigitalOcean control panel) on the address bar and then enter with any of the users you created before.

Another option is to access by using an ssh tunnel, with nice benefit of being encrypted. Run this command from the terminal:

```
ssh -f root@134.209.125.2 -L 3000:134.209.125.2:3000 -N
```

And then, from the browser go to `localhost:3000`. The first step with Metabase is to create an administrator for the application, complete the information and add a password that can be the same as the password for system administrator `paul` or a different password.

After this step you'll be ready to connect to databases, invite users and all the possibilities described in [Metabase documentation](<https://www.metabase.com/docs/latest/setting-up-metabase.html>).

**Optional: custom domain and enabled https**

Let's say that you want people from your organization access Metabase from `metabase.ourcompany.us` instead of `server_ip_address:3000`. DigitalOcean tutorials already covered the additional steps to do that by using [Nginx](<https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04>) or [Apache](<https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04>).
