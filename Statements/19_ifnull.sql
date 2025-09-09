IFNULL -- Función que devuelve un valor alternativo si la columna es NULL

SELECT name, surname, IFNULL(age, 0) FROM users; 
/*
    Jorge	Abalo	    37
    Irene	González	37
    Carlos	Abalo	    29
    Paco	Paco	    0
    Miguel	Abalo	    30
    Daniel	Abalo       0
    Jorge	Abalo	    36
*/

