sudo dpkg -i debs/openssh-client_1%3a5.3p1-3ubuntu6_i386.deb
sudo dpkg -i debs/openssh-server_1%3a5.3p1-3ubuntu6_i386.deb
sudo dpkg -i debs/mysql-common_5.1.41-3ubuntu12.10_all.deb
sudo dpkg -i debs/libnet-daemon-perl_0.43-1_all.deb
sudo dpkg -i debs/libplrpc-perl_0.2020-2_all.deb
sudo dpkg -i debs/libdbi-perl_1.609-1build1_i386.deb
sudo dpkg -i debs/libmysqlclient16_5.1.41-3ubuntu12.10_i386.deb
sudo dpkg -i debs/libdbd-mysql-perl_4.012-1ubuntu1_i386.deb
sudo dpkg -i debs/mysql-client-core-5.1_5.1.41-3ubuntu12.10_i386.deb
sudo dpkg -i debs/mysql-client-5.1_5.1.41-3ubuntu12.10_i386.deb
sudo dpkg -i debs/mysql-server-core-5.1_5.1.41-3ubuntu12.10_i386.deb
sudo dpkg -i debs/mysql-server-5.1_5.1.41-3ubuntu12.10_i386.deb
sudo dpkg -i debs/libhtml-template-perl_2.9-1_all.deb
sudo dpkg -i debs/mysql-server-5.1_5.1.41-3ubuntu12.10_i386.deb
sudo dpkg -i debs/libvncserver0_0.9.7-2_i386.deb 
sudo dpkg -i debs/tcl_8.4.16-2_all.deb 
sudo dpkg -i debs/tk_8.4.16-2_all.deb 
sudo dpkg -i debs/x11vnc_0.9.9-1_i386.deb
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop
sudo cp overrides/defaultdesktop /usr/share/xsessions/default.desktop
sudo cp overrides/commonsetupvars /etc/X11/Xsession.d/01x11-common_setup-vars
sudo cp overrides/xsession ~/.xsession
sudo cp overrides/interfaces /etc/network/
sudo cp overrides/omr_lpr /usr/local/bin
sudo cp overrides/printers.conf /etc/cups/
sudo cp overrides/my.cnf /etc/mysql/
sudo cp overrides/lpttoB /home/pos/
sudo chown -R pos: /usr/local/bin/omr_lpr
cp -r PenguinPOS-FMCG ~/
sudo chown -R pos: ~/PenguinPOS-FMCG
cp -v dates/update_my_date.sh ~/
cp -v dates/get_server_date.sql ~/
cp -v sql/sync-registration.sql ~/
cp -v sql/updatesync ~/
sudo chmod -R /home/pos/*.sql
mysql -uroot -ppenpos < sql/users.sql
mysql -uroot -ppenpos < sql/Terminal_FMCG.sql
mysql -uroot -ppenpos < sql/Insert_SyncTouch.sql
sudo /etc/init.d/mysql restart
cp overrides/localrepo.zip /home/pos/
sudo chmod -R 777 /home/pos/localrepo.zip
unzip -o /home/pos/localrepo.zip -d /home/pos/
chmod -R 777 /home/pos/localrepo
sudo echo 'deb file:///home/pos/localrepo/ ./' >> /etc/apt/sources.list
sudo echo 'deb-src file:///home/pos/localrepo/ ./' >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get update
sudo apt-get --yes --force-yes install mono-complete
echo '----------------------------------------------------'
echo '          INSTALLING CRON JOBS                      '
echo '----------------------------------------------------'
echo '55 *   * * *    root    sh /home/pos/update_my_date.sh' >> /etc/crontab
echo '1 *    * * *    root    sh /home/pos/updatesync' >> /etc/crontab
echo 
echo '+-Network setup------------------------------------+'
echo '|                                                  |'
echo '|  modify your ip by with the command              |'
echo '|   "sudo nano /etc/network/interfaces"            |'
echo '|                                                  |'
echo '+-Time updates-------------------------------------+'
echo '|                                                  |'
echo '|  Add "* * * * * sudo sh /home/pos/updatesync"    |'
echo '|  Add "55 * * * * sh /home/pos/update_my_date.sh" |'
echo '|  to "sudo crontab -e"                            |'
echo '|                                                  |'
echo '+-Parallel Expander cards--------------------------+'
echo '|                                                  |'
echo '|  sudo cp overrides/rc.local /etc/rc.local        |'
echo '|                                                  |'
echo '+-Complete Install---------------------------------+'
echo '|                                                  |'
echo '|  Logout gnome and login after selecting          |'
echo '|   "run PenguinPos FMCG" as your session          |'
echo '|                                                  |'
echo '+--------------------------------------------------+'
echo

