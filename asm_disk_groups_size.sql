col diskgroup_name format a30 heading 'Diskgroup'
col group_number format 999999 heading '#DG'
col asm_total_mb format 999,999,990 heading 'Total MB'
col asm_used_mb format 999,999,990 heading 'Used MB'
col asm_free_mb format 999,999,990 heading 'Free MB'
 
set pagesize 200
set linesize 78
ttitle left 'ASM - DISK GROUPS SIZE' skip 1 -
       left '=============================================================================='
 
select
    group_number,
    name diskgroup_name,
    total_mb asm_total_mb,
    total_mb-free_mb asm_used_mb,
    free_mb asm_free_mb
from
    sys.v$asm_diskgroup
order by name;
