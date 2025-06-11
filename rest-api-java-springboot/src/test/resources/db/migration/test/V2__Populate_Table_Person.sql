INSERT INTO person (id, address, first_name, gender, last_name) VALUES
    (1, 'São Paulo - Brasil', 'Ayrton', 'Male', 'Senna'),
    (2, 'Anchiano - Italy', 'Leonardo', 'Male', 'da Vinci'),
    (4, 'Porbandar - Índia', 'Indira', 'Female', 'Gandhi'),
    (5, 'Porbandar - Índia', 'Mahatma', 'Male', 'Gandhi'),
    (7, 'Kentucky - US', 'Muhamamd', 'Male', 'Ali'),
    (10, 'Mvezo - South Africa', 'Nelson', 'Male', 'Mandela'),
    (11, 'Mvezo - South Africa', 'Nelson', 'Male', 'Mandela'),
    (12, 'Smiljan - Croatia', 'Nikola', 'Male', 'Tesla');

-- Ajuste da sequência person_id_seq para evitar erros de chave duplicada
-- Quando registros são inseridos manualmente com IDs específicos, o valor da sequência
-- do BIGSERIAL pode ficar desatualizado, fazendo com que o banco tente gerar um ID já existente.
-- Esta correção redefine a sequência para garantir que novos registros recebam um ID válido.
-- SELECT setval('person_id_seq', (SELECT MAX(id) FROM person) + 1);

-- Ajuste da sequência person_id_seq para evitar erros de chave duplicada.
-- Esse comando garante que o próximo ID gerado pelo BIGSERIAL seja um valor válido,
-- respeitando o maior ID já presente na tabela, mesmo que registros tenham sido inseridos manualmente.
-- SELECT setval('person_id_seq', COALESCE((SELECT MAX(id) FROM person), 1) + 1, false);

-- Atualiza a sequência person_id_seq para manter a consistência com os dados inseridos manualmente.
-- Isso garante que o próximo valor de ID gerado pelo BIGSERIAL seja superior ao maior ID já existente,
-- evitando conflitos de chave primária em futuras inserções automáticas.
SELECT setval('person_id_seq', (SELECT MAX(id) FROM person));
