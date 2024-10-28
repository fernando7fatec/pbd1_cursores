-- Aula 16 - cursores
-- For this lecture:
-- 1 - use youtube.csv file to load the data
-- 2 - use/create a db called pessoal_cursores
-- 3 - use the file script.sql 
-- ** git repo - 
-- ˜/Desktop/FATEC/repos/pgbd_cursores

SELECT COUNT(*) FROM tb_top_youtubers;
SELECT * FROM tb_top_youtubers;

DO
$$
DECLARE
 cur_nomes_apartir_de REFCURSOR;
 youtuber VARCHAR(200);
 v_ano INT := 2008;
 v_nome_tabela VARCHAR(200) := 'tb_top_youtubers';
BEGIN

END;
$$