CREATE SEQUENCE DKPB_SEQ --change to desired name
START WITH 1 -- Initial value
INCREMENT BY 1 -- Increment step
NOCACHE -- No caching (optional)
NOCYCLE; -- Prevent looping

CREATE OR REPLACE TRIGGER DKPB_BI --change to desired trigger name
BEFORE INSERT ON DKPB --change to desired table name
FOR EACH ROW
BEGIN
  :NEW.ID := DKPB_SEQ.NEXTVAL; --target the sequence name
END;
/