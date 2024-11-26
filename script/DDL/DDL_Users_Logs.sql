-- Create the sequence for generating unique IDs
CREATE SEQUENCE logs_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

-- Create the logs table
CREATE TABLE logs (
    log_id       NUMBER PRIMARY KEY,                                  -- Primary key populated via sequence
    user_id      VARCHAR(255) NOT NULL,                                     -- User ID
    aksi         VARCHAR2(255) NOT NULL,                              -- Action description
    url          VARCHAR2(512) NOT NULL,                              -- URL of the request
    method       VARCHAR2(10) NOT NULL,                               -- HTTP method (e.g., GET, POST)
    status       VARCHAR(20) NOT NULL,        
    respond      VARCHAR2(512),                                       -- Response message (optional)
    error        VARCHAR2(512),                                       -- Error message (optional)
    created_at   TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL               -- Timestamp of log entry
);

-- Create a trigger to auto-populate the log_id using the sequence
CREATE OR REPLACE TRIGGER trg_logs_id
BEFORE INSERT ON logs
FOR EACH ROW
BEGIN
    :NEW.log_id := logs_seq.NEXTVAL;
END;
/


CREATE TABLE users (
    user_id     VARCHAR(255) PRIMARY KEY,                            -- Unique user ID (Primary Key)
    password    VARCHAR2(255) NOT NULL,                        -- Hashed password for the user
    created_at  TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL       -- Timestamp for when the user was created
);

