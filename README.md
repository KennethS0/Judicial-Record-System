# Judicial-Record-System

Set Up:
1) Connect to SYSTEM in SQL Developer and open 'SQL-SCRIPTS/INITIAL DDL/':
   - Tablespaces/            (Run all files, change the directories to match your PC).
   - Schemas/                (Run all files).
   
2) Connect to GE in SQL Developer and open 'SQL-SCRIPTS/GE':
   - DDL/Tables/             (Run all files).
   - DDL/Audit Columns/      (Run all files).
   - DDL/Keys/               (Run all files).
   - DML/Sequences/          (Run all files).
   - DML/Triggers/           (Run 'Audit Column Insert.sql' and 'Audit Column Updates.sql').

3) Connect to AD in SQL Developer and open 'SQL-SCRIPTS/AD':
   - DDL/Tables/             (Run all files).
   - DDL/Audit Columns/      (Run all files).
   - DDL/Keys/               (Run all files).
   - DML/Sequences/          (Run all files).
   - /                       (Run 'ge grants.sql').
   - DML/Triggers/           (Run all files).

4) Connect to GE in SQL Developer and open 'SQL-SCRIPTS/GE':
   - DML/Triggers/           (Run 'Password Hisotry Updated.sql').
   - DML/Packages/           (Run every file from every subdirectory).
