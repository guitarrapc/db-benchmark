SELECT @@VERSION;
select * from sys.dm_exec_sessions where client_interface_name = 'ODBC';
select * from sys.dm_exec_query_profiles where session_id in (
	select session_id from sys.dm_exec_sessions where client_interface_name = 'ODBC'
);
