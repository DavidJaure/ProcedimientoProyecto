/*Procedimiento proyecto*/
use madp;
DELIMITER //
CREATE PROCEDURE obtenerCreditosPorUsuario(IN cedulaUsuario INT)
BEGIN
    SELECT c.idCreditos, c.RangoInicial, c.RangoFinal, c.MontoTotal, t.TipoDeCredito
    FROM Creditos c
    INNER JOIN Presupuesto p ON c.idPresupuesto = p.idPresupuesto
    INNER JOIN TipoDeCredito t ON c.idTipoDeCredito = t.idTipoDeCredito
    WHERE p.Cedula = cedulaUsuario;
END //

DELIMITER ;
CALL obtenerCreditosPorUsuario(1010101);
