#This is Inception.
##This Project is about to learn Administration knowledge: Docker + containers.

###Here we try to connect Mariadb, nginx and Wordpress, by configuring config files, using containers and docker-compose to build them and save data by using mount-volume.

###Requirement:
- It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers.
- Your containers have to restart in case of a crash.
- In your WordPress database, there must be two users, one of them being the administrator. The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).

##Bonus list:
...
- Add redis for wordpress cache
- add ftp-server pointing to wp-volume (I also made securer through ssl)
- create a static file (https://localhost:443/qdo.html)
- Add adminer (https://localhost:443/adminer.php)
- 1 Service as i want, and i think it's usefull => Add wps-hide-login. New default login page is now localhost/?login. Meaning: prevent bruteforce on the login page, we can change the login page all the time.
<!-- localhost/?login will be the default login page. We are allow to change it as we want in the setting part of admin account. 
Reason: preventing brute forcing / spam -->

<!-- This is the result of the first time of 3.5 months ago -->
##Score: 125 / 125

<!-- At 42, if you put it into Virtual machine, make sure to not choose gnorme and debian desktop env or it will take your too much resources that ftp-server took too long to response -> doesn't work -->

  <!-- lxde xfce4 lightdm firefox-esr are light package to still be able run firefox-->

# Ressources

- [What is Docker? How Does it Work?](https://devopscube.com/what-is-docker/)<br>
- [Cgroups, namespaces, and beyond: what are containers made from?](https://www.youtube.com/watch?v=sK5i-N34im8&ab_channel=Docker)<br>
- [Containers vs. Virtual Machines](https://blogs.umass.edu/Techbytes/2018/10/09/what-is-docker-and-how-does-it-work/)<br>
- [Docker Tutorial for Beginners](https://www.youtube.com/watch?v=zJ6WbK9zFpI&ab_channel=KodeKloud)<br>
- [Explaining Docker Networking Concepts](https://ostechnix.com/explaining-docker-networking-concepts/)<br>
- [ Dockerfile tutorial by example - basics and best practices](https://takacsmark.com/dockerfile-tutorial-by-example-dockerfile-best-practices-2018)
- [Docker networking is CRAZY!!!](https://www.youtube.com/watch?v=bKFMS5C4CG0&ab_channel=NetworkChuck)<br>
- [How To Communicate Between Docker Containers](https://www.tutorialworks.com/container-networking/)<br>
 - [WordPress Deployment with NGINX, PHP-FPM and MariaDB using Docker Compose](https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a)
 - [How To Configure Nginx to use TLS 1.2 / 1.3 only](https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/)
 - [How To Install MariaDB](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04)
 -  [How to install WordPress Using wp-cli](https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html)
 - [Learn CGI and FastCGI](https://www.howtoforge.com/install-adminer-database-management-tool-on-debian-10/)
 - [How To Set Up vsftpd](https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-20-04)
 - [install adminer](https://www.howtoforge.com/install-adminer-database-management-tool-on-debian-10/)
 - Redis and wps-hide-login: Kind plugin, read code to know -.-
