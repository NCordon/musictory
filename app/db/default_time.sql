ALTER TABLE CD DROP COLUMN UPDATED_AT;
ALTER TABLE CD DROP COLUMN CREATED_AT;
ALTER TABLE VINILO DROP COLUMN UPDATED_AT;
ALTER TABLE VINILO DROP COLUMN CREATED_AT;


ALTER TABLE CD ADD(UPDATED_AT TIMESTAMP(6) DEFAULT SYSDATE NOT NULL);
ALTER TABLE CD ADD(CREATED_AT TIMESTAMP(6) DEFAULT SYSDATE NOT NULL);

ALTER TABLE VINILO ADD(UPDATED_AT TIMESTAMP(6) DEFAULT SYSDATE NOT NULL);
ALTER TABLE VINILO ADD(CREATED_AT TIMESTAMP(6) DEFAULT SYSDATE NOT NULL);