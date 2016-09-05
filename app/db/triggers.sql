CREATE OR REPLACE TRIGGER TR_ZERO_STOCK
  AFTER INSERT ON catalogo
  FOR EACH ROW
BEGIN
  INSERT INTO cd(catalogo_id, id, cantidad)
    VALUES(:NEW.id, CD_SEQ.NEXTVAL, 0);

  INSERT INTO vinilo(catalogo_id, id, cantidad)
    VALUES(:NEW.id, VINILO_SEQ.NEXTVAL, 0);
END;
/

CREATE OR REPLACE TRIGGER TR_PRESERVE_CATALOGO
  BEFORE DELETE ON catalogo
  FOR EACH ROW
DECLARE
  asociadas INTEGER := 0;
BEGIN
  SELECT COUNT(*) into asociadas
    FROM venta
    WHERE catalogo_id=:OLD.id;

  IF asociadas > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Catálogo tiene facturación asociada');
  END IF;
END;
/
