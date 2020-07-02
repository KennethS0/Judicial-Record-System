CREATE OR REPLACE PACKAGE statistics AS
    -- QUERIES THE PEOPLE WHO HAVE ACCOUNTS IN THE SYSTEM, COUNTS THEM BY GROUPING IN AGE RANGE
    PROCEDURE getAccountRanges (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL EXPIRED SENTENCES IN THE SYSTEM BETWEEN A RANGE OF DATES
    PROCEDURE getExpiredSentences (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL THE FILES FILTERES BY ZONE
    PROCEDURE getFilesByZone (pCountry VARCHAR2,
                              pProvince VARCHAR2, 
                              pCanton VARCHAR2, 
                              pDistrict VARCHAR2, 
                              pCommunity VARCHAR2,
                              pRecordSet OUT SYS_REFCURSOR);
                              
    -- GETS AGE RANGES OF DEFENDANTS
    PROCEDURE getAgesDefendants (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS AGE RANGES OF PROSECUTORS
    PROCEDURE getAgeProsecutors (pRecordSet OUT SYS_REFCURSOR);
                              
    -- GETS PERCENTAGES AND TOTALS OF RECORDS BY CLASIFICATION
    PROCEDURE getRecordsByClassification (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS AMOUNT OF RECORDS BY TYPE WITH A SPECIFIC SENTENCE
    PROCEDURE getRecordsBySentence (pSentenceType VARCHAR2, pRecordSet OUT SYS_REFCURSOR);
                              
END statistics;
/