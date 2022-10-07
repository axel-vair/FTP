file=Shell_Userlist.csv 
#On install sudo
apt -y install sudo

#On créé un groupe 
addgroup ftpgroup

#boucle while qui va supprimer la virgule avec la commande IFS
while IFS="," read -r col1 col2 col3 col4 col5 
do   
#Si la colonne 1 possède des chiffres alors elle est affichée, permet de skip la première ligne.
if [[ $col1 = [0-9]* ]]; then 
#variable username déclarée pour stocker les variables $col2 $col3 et en faire une nouvelle variable
#$username qu'on met en lowercase et à laquelle on enlève les espace
username=$col2$col3 
echo $username | sed 's/ //g' 

if [[ ${col5%?} = "Admin" ]]; then 
useradd -m -u $col1 $username
sudo adduser $username sudo

else  
useradd -m -u $col1 $username
sudo addgroup $username ftpgroup


fi
fi
done < "$file"