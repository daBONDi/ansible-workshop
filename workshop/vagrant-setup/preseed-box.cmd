REM Ensure required Vagrant Boxes
vagrant box add debian/stretch64 --box-version 9.6.0 --provider virtualbox
vagrant box add centos/7 --box-version 1812.01 --provider virtualbox
vagrant box add StefanScherer/windows_2019 --box-version 2019.01.18 --provider virtualbox