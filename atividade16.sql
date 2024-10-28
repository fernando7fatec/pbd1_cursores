
--
CREATE OR REPLACE FUNCTION show_youtuber_rank()
RETURNS VOID AS $$
DECLARE
    rec RECORD;
    cur CURSOR FOR 
        SELECT rank, youtuber 
        FROM tb_top_youtubers 
        WHERE video_count >= 1000 
        AND category IN ('Sports', 'Music');
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO rec;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'Rank: %, Youtuber: %', rec.rank, rec.youtuber;
    END LOOP;
    CLOSE cur;
END;
$$ LANGUAGE plpgsql;

-- show youtubers in reverse
CREATE OR REPLACE FUNCTION show_youtubers_reverse()
RETURNS VOID AS $$
DECLARE
    rec RECORD;
    cur CURSOR FOR 
        SELECT youtuber 
        FROM tb_top_youtubers 
        ORDER BY youtuber;  -- Ordenação em ordem alfabética normal
BEGIN
    -- Abre o cursor
    OPEN cur;

    -- Move o cursor para a última tupla
    MOVE LAST FROM cur;

    -- Exibe os dados de baixo para cima
    LOOP
        FETCH PRIOR FROM cur INTO rec;  -- Busca a tupla anterior
        EXIT WHEN NOT FOUND;            -- sai do loop
        RAISE NOTICE 'Youtuber: %', rec.youtuber;
    END LOOP;

    -- Fecha o cursor
    CLOSE cur;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM tb_top_youtubers;


