SET LINESIZE 200
SET PAGESIZE 200
UNDEF num_days
COL SNAP_ID FOR 9999999
COL INSTANCE_NUMBER FOR 9999999
COL TAKEN FOR a25
 
 
SELECT
s.SNAP_ID, 
s.INSTANCE_NUMBER,  
s.END_INTERVAL_TIME TAKEN
FROM
    dba_hist_snapshot s,
    dba_hist_database_instance di
WHERE
    di.dbid = s.dbid
    AND   di.instance_number = s.instance_number
    AND   end_interval_time > DECODE(&&num_days,0,TO_DATE('31-JAN-9999','DD-MON-YYYY'),3.14,s.end_interval_time,TO_DATE(SYSDATE,'dd/mm/yyyy'
) - (&num_days - 1) )
ORDER BY
    s.SNAP_ID ASC;
