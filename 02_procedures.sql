-- ===================================================================
-- Description: Stored procedure for terminal administration & logging
-- ===================================================================

CREATE OR REPLACE PROCEDURE manage_terminal (
    p_action IN VARCHAR2,    -- 'ADD', 'MODIFY_STATUS', 'TERMINATE'
    p_terminal_sn  IN VARCHAR2,
    p_bank_id IN NUMBER DEFAULT NULL,
    p_terminal_type IN VARCHAR2 DEFAULT NULL,
    P_status IN VARCHAR2 DEFAULT NULL
) AS
   v_terminal_id NUMBER;
BEGIN
    IF UPPER(p_action) = 'ADD' THEN
        INSERT INTO terminals (terminal_sn, bank_id, terminal_type, status)
        VALUES (p_terminal_sn, p_bank_id, p_terminal_type, NVL(p_status, 'ACTIVE'))
        RETURNING terminal_id INTO v_terminal_id;

        INSERT INTO audit_logs (action_type, entity_name, entity_id, detailes)
        VALUES ('ADD_TERMINAL', 'TERMINALS', v_terminal_id, 'Added terminal SN: ' || p_terminal_sn);

    ELSIF UPPER(p_action) = 'MODIFY STATUS' THEN 
        UPDATE terminals
        SET status = p_status
        WHERE terminal_sn = p_terminal_sn
        RETURNING terminal_id INTO v_terminal_id;

        INSERT INTO audit_logs (action_type, entity_name, entity_id, detailes)
        VALUES ('MODIFY_TERMINAL_STATUS', 'TERMINALS', v_terminal_id, 'Updated status to ' || p_status);

    ELSIF UPPER(p_action) = 'TERMINATE' THEN
        UPDATE terminals
        SET status = 'TERMINATED'
        WHERE terminal_sn = p_terminal_sn
        RETURNING terminal_id INTO v_terminal_id;

        INSERT INTO audit_logs (action_type, entity_name, entity_id, detailes)
        VALUES ('TERMINATE_TERMINAL', 'TERMINALS', v_terminal_id, 'Terminated terminal SN: ' || p_terminal_sn);
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END manage_terminal;
/
