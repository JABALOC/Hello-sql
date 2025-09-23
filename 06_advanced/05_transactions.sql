TRANSACTION -- Conjunto de operaciones que se ejecutan como como una unidad. O se ejecutan todas correctamente o no se ejecuta ninguna.

START TRANSACTION -- Inicia la transacción, todo lo que se haga después de esto no se aplicará hasta hacer COMMIT
COMMIT -- Confirma todos los cambios realizados desde que se inició la transacción, una vez hecho, los cambios son definitivos.
ROLLBACK -- Deshace todos los cambios realizados desde que se inició la transacción. Si se usa algo y falla y no queremos que los cambiso queden guaradados.