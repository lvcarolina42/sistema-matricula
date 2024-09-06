# Sistema de matrícula

Lab 01 - Projeto de desenvolvimento de software

## Integrantes do Grupo:
- Gabriel Henrique Miranda Rodrigues
- Livia Carolina
- Jhonatan Gutemberg

## Professor
João Paulo Carneiro Aramuni

## Proposta
A proposta é desenvolver um sistema de matrículas informatizado para uma universidade, que gerencie informações sobre currículos semestrais, disciplinas, professores e alunos. O sistema permitirá que os alunos se matriculem em até 4 disciplinas obrigatórias e 2 optativas. 

Disciplinas só serão ativadas se tiverem pelo menos 3 alunos matriculados no final do período de inscrições, e o limite máximo é de 60 alunos por disciplina. Quando esse limite é atingido, as inscrições para a disciplina são encerradas.

O sistema de matrículas também interage com o sistema de cobranças, informando sobre as disciplinas inscritas para que as taxas correspondentes sejam cobradas.

## Diagrama de Classes

![ClassDiagram_RegistrationSystem](https://github.com/user-attachments/assets/70e6be79-5f77-4195-a0d0-8221f4555f0b)
## Diagrama de caso de uso

![diagrama-casos-de-uso_page-0001](https://github.com/user-attachments/assets/2322ea24-efc0-432f-a6c9-defd5ff0de27)

## Casos de uso

US01 - Eu como usuário, quero poder fazer login usando número de usuário, senha e escolhendo o tipo de usuário (Secretário, aluno e professor)

US02 - Eu como usuário, quero poder recuperar a minha senha.

US03 - Eu como secretária, quero poder atualizar os dados dos alunos, buscando através do nome ou número de matrícula.

US04 - Eu como secretária, quero poder cunsultar os dados dos alunos, buscando através do nome ou número de matrícula.

US05 - Eu como secretária, quero poder gerar currículo para um ou vários alunos de uma vez.

US06 - Eu como secretária, quero poder cadastrar alunos.

US07 - Eu como secretária, quero poder remover alunos.

US08 - Eu como secretária, quero poder adicionar uma nova matéria.

US09 - Eu como aluno, quero poder matricular em duas matérias optativas.

US10 - Eu como aluno, quero poder matricular em quatro matérias obrigatórias.

US11 - Eu como aluno, quero poder cancelar minha matrícula.

US12 - Eu como professor, quero poder ver os alunos matriculados nas matérias que eu leciono.


