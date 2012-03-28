#! /bin/sh
if [ ! $# = 1 ]; then 
	echo "Usage : link.sh login@ordinateurdistant"
	exit
fi
if [ ! -f  ~/.ssh/id_rsa.pub ]; then
	echo "création de la clef"
	prev=$PWD;
	cd ~/.ssh
	ssh-keygen -N "" -f ~/.ssh/id_rsa
	cd $prev;
fi;
nom=$(unmame -n);
echo "copie de la cle sur l'ordinateur distant"
scp id_rsa.pub "$1:~/.ssh/"$nom".pub"
echo "Mise à jour des clés distantes :"
ssh $1 "cat .ssh/\"$nom.pub\">>.ssh/authorized_keys"
echo "ajout de la cle"
echo ssh-add ~/.ssh/id_rsa
