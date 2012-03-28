#! /bin/sh
if [ ! $# = 3 ]; then 
	echo "Usage : link.sh pass nom_ordnateur_local login@ordinateurdistant"
fi
echo "création de la clef"
ssh-keygen -P "$1" -f id_rsa
echo "copie de la cle sur l'ordinateur distant"
scp id_rsa.pub "$3:~/.ssh/$2.pub"
echo "ajout de la cle sur l'ordinateur distant"
ssh $3 "cat .ssh/\"$2.pub\">>.ssh/authorized_keys"
echo "ajout de la cle"
ssh-add id_rsa
