/*Donnez la liste des hôtels de Paris.*/
select * 
from hotel, adresse, pays
WHERE hotel.id_adress = adress.id_adress
AND adress.id_pays = pays.id_pays
AND pays.nom_Pays = 'France'
AND code_postal IN ('75000' , '92000' , '94000')

/*Donnez la liste des hôtels situés en italie ainsi que ceux situés en Angleterre.*/
select * 
from hotels , adresses
where hotels.id_adress = adresses.id_adress
And adresses.id_pays in ('IT' , 'EN')

/*Donnez la listes des factures établies entre 01 et le 31 juillet 2023.*/
select *
from factures
where factures.date_facturaion Between '01/07/23' And '31/07/23'

/*Donnez la liste des hotels classée par enseigne.*/
select *
from hotel , enseigne
where hotel.id_enseigne = enseigne.id_enseigne
Group by enseigne

/*Donnez La liste des facture d'un hotel en donnant sont nom ou sa ville.*/
select nom_hotel
from factures , sejour , chambre , hotel
where factures.num_factures = sejour.num_factures
and sejour.code_chambre = chambre.code_chambre
and chambre.id_hotel = hotel.id_hotel
/*Donnez La liste des factures du client professionnel X (join)*/
select * 
from client
where typeClientPro = true;
/*Ajouter un nouveau service pour les hotels.*/
INSERT INTO hotels
VALUES (25,3, 'Europe');
/*Décrivez les actions (séquences de requêtes) qu'ils faudrait effectuer pour supprimer une enseigne de la BDD.*/
DELETE FROM enseigne
WHERE condition