CREATE OR REPLACE PACKAGE getData AS
    
    -- GETS ALL JUDICIAL CIRCUITS
    PROCEDURE getCircuits (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL THE OFFICES FROM A CIRCUIT
    PROCEDURE getOffices (pCircuitId NUMBER, pRecordSet OUT SYS_REFCURSOR);
    
    -- GET LAWSUITS WITHOUT RECORD
    PROCEDURE getRecordlessLawsuits (pUserId NUMBER, pRecordSet OUT SYS_REFCURSOR);

    -- GETS THE ID OF THE LAWSUIT
    FUNCTION getLawsuitId (pDefendantId NUMBER, pProsecutorId NUMBER, pReason VARCHAR2)
    RETURN NUMBER;
    
    -- GETS ALL TYPES OF RECORDS
    PROCEDURE getSentenceTypes (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL COUNTRIES
    PROCEDURE getCountries (pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL PROVINCES
    PROCEDURE getProvinces (pCountryId NUMBER, pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL CANTONS
    PROCEDURE getCantons (pProvinceId NUMBER, pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL DISTRICTS
    PROCEDURE getDistricts (pCantonId NUMBER, pRecordSet OUT SYS_REFCURSOR);
    
    -- GETS ALL COMMUNITIES
    PROCEDURE getCommunities (pDistrictId NUMBER, pRecordSet OUT SYS_REFCURSOR);
END getData;