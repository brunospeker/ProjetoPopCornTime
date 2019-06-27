# ProjetoPopcornTime
create table USUARIOS
(
	
ID INTEGER not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	
USUARIO VARCHAR(20) not null UNIQUE,
	
NOME VARCHAR(50) not null,
	
EMAIL VARCHAR(120) not null UNIQUE,
	
SENHA VARCHAR(20) default '0000' not null,
	
PIN VARCHAR(80) default '@123' not null,
	
URLFOTO VARCHAR(300),
	
ACESSO TIMESTAMP default CURRENT_TIMESTAMP not null,
	
ADMIN INTEGER default 0

)

INSERT INTO usuarios (usuario,nome,email,senha,pin,urlfoto,admin) VALUES
('admin','Administrador','admin@admin.com','123','@997','https://i.imgur.com/yFMOa7o.jpg',1),
('noobmaster69','Victor Eduardo','ghostwarrior01@gmail.com','vic9966','@997','https://i.imgur.com/Vvu011a.jpg',1),
('insanity02','Adalberto Linhares','linhares10@bol.com.br','foreveryoung22','@79','https://i.imgur.com/6100K7G.png',0),
('juniormelo10','Junior Melo','juninowna@hotmail.com','junin22','@546','https://i.imgur.com/AOaWSN5.jpg',0),
('gabi00','Gabriela Nunes','gabnunes@gmail.com','gabnunes10','@9821','https://i.imgur.com/8XWZlXl.jpg',0),
('darkflamemaster','Juliano Almeida','dfmalmeida@ig.com.br','almeida10','@92181','https://i.imgur.com/9qvjdLy.jpg',0),
('papata','Junior Atilla','jratilla98@gmail.com','darkness9876','@1375','https://i.imgur.com/0FH4o0S.jpg',1),
('magicbruna','Bruna Silva','magic123@gmail.com','silva98','@7362','https://i.imgur.com/oQHvaVK.jpg',0),
('matheusrio10','Matheus Lima','matheusrio10@hotmail.com','matheus10','@367','https://i.imgur.com/BcMeFGs.jpg',0),
('winchester10','Elywelton Gonçalves','elygon@gmail.com','winchester99','@412','https://i.imgur.com/x6Nx9YV.jpg',0),
('kylore','Laura Mendes','lonesomenerd@gmail.com','lauraaa5','@25','https://i.imgur.com/pDnTFZt.jpg',1);

create table FILMES
(

IDFILME INTEGER not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),

NOMEFILME VARCHAR(40) not null UNIQUE,

LANCAMENTO VARCHAR(20),

DIRECAO VARCHAR(20),

PAIS VARCHAR(30),

URLCARTAZ VARCHAR(300),

VOTOSFILME DOUBLE default 0,

VOTANTESFILME DOUBLE default 1,

MEDIAFILME DOUBLE GENERATED ALWAYS AS (VOTOSFILME/VOTANTESFILME)

)

INSERT INTO filmes (NOMEFILME, LANCAMENTO,DIRECAO,PAIS,URLCARTAZ,VOTOSFILME,VOTANTESFILME) VALUES
('Deadpool','2016/02/11','Tim Miller','Estados Unidos','https://i.imgur.com/1uL7VAt.jpg',0.0,1.0),  
('Warcraft','2014/02/20','Duncan Jones','Estados Unidos','https://i.imgur.com/CxHW6Nz.jpg',0.0,1.0),  
('A Dark Reflection','2012/02/20','Tristan Loraine','Estados Unidos','https://i.imgur.com/QjLiRD6.jpg',0.0,1.0),  
('Homem Formiga','2016/07/16','Peyton Reed','Estados Unidos','https://i.imgur.com/S5KwZPS.jpg',0.0,1.0),  
('Chappie','2015/04/16','Neill Blomkamp','Estados Unidos','https://i.imgur.com/KeHO6OH.jpg',0.0,1.0),  
('Fast and Furious 7','2015/02/02','James Wan','Estados Unidos','https://i.imgur.com/P4RmN5T.jpg',0.0,1.0),  
('O Destino de Júpiter','2015/02/15','L e L Wachowski','Estados Unidos','https://i.imgur.com/6y36YdX.jpg',0.0,1.0),  
('Jurassic World','2015/06/11','Colin Trevorrow','Estados Unidos','https://i.imgur.com/GbkuHmV.jpg',0.0,1.0),  
('Pixels','2016/07/23','Chris Columbus','Estados Unidos','https://i.imgur.com/OgyvbI6.jpg',0.0,1.0),  
('Operação:Big Hero','2014/12/25','Chris Williams','Estados Unidos','https://i.imgur.com/uQ1fxwl.jpg',0.0,1.0),  
('Capitão America: Soldado Invernal','2014/04/10','Irmãos Russo','Estados Unidos','https://i.imgur.com/MAU2JyK.jpg',0.0,1.0),  
('Planeta dos Macacos 2','2014/07/24','Matt Reeves','Estados Unidos','https://i.imgur.com/8bylEq2.jpg',0.0,1.0),  
('Dracula','2014/10/23','Gary Shore','Estados Unidos','https://i.imgur.com/pxHfGPR.jpg',0.0,1.0),  
('Prometheus','2012/06/07','Ridley Scott','Estados Unidos','https://i.imgur.com/9NfsehX.jpg',0.0,1.0),  
('Vingadores','2012/04/27','Joss Whedon','Estados Unidos','https://i.imgur.com/TBPD9Mp.jpg',0.0,1.0),  
('O Espetacular Homem-Aranha 2','2014/05/01','Mark Webb','Estados Unidos','https://i.imgur.com/NcnASW1.jpg',0.0,1.0),  
('Hobbit 2','2013/12/13','Peter Jackson','Estados Unidos','https://i.imgur.com/JO6DLPd.jpg',0.0,1.0),  
('Jogos Vorazes','2012/03/23','Gary Ross','Estados Unidos','https://i.imgur.com/8g5KDIV.jpg',0.0,1.0),  
('Godzilla','2014/05/15','Gareth Edwards','Estados Unidos','https://i.imgur.com/Vvu011a.jpg',0.0,1.0);


create table ATORES
(

IDATOR INTEGER not null primary key GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),

NOMEATOR VARCHAR(50) not null UNIQUE,

CONJUGE VARCHAR(50),

NACIONALIDADE VARCHAR(30),

NASCIMENTO VARCHAR(30),

URLRETRATO VARCHAR(300),

VOTOSATOR DOUBLE default 0,

VOTANTESATOR DOUBLE default 1,

MEDIAATOR DOUBLE GENERATED ALWAYS AS (VOTOSATOR/VOTANTESATOR)

)

INSERT INTO atores (NOMEATOR,CONJUGE,NACIONALIDADE,NASCIMENTO,URLRETRATO,VOTOSATOR,VOTANTESATOR) VALUES 
('Angelina Jolie','','Estados Unidos','1975/06/04','https://i.imgur.com/RjHqUSh.jpg',0.0,1.0),
('Robert Downey Jr.','Susan Downey','Estados Unidos','1965/03/04','https://i.imgur.com/bf4HuXI.jpg',0.0,1.0),
('Jim Carrey','','Estados Unidos','1962/01/17','https://i.imgur.com/Jm9Vbz6.jpg',0.0,1.0),
('Johnny Depp','','Estados Unidos','1963/06/09','https://i.imgur.com/OYuzSLM.jpg',0.0,1.0),
('Sylvester Stallone','Jennifer Flavin','Estados Unidos','1946/07/06','https://i.imgur.com/mArv6TV.jpg',0.0,1.0),
('Tom Cruise','Katie Holmes','Estados Unidos','1962/06/03','https://i.imgur.com/xQPzW5H.jpg',0.0,1.0),
('Will Smith','Jada Pinkett Smith','Estados Unidos','1968/09/25','https://i.imgur.com/x1YArGb.jpg',0.0,1.0),
('Brad Pitt','','Estados Unidos','1963/12/18','https://i.imgur.com/xSh6kH4.jpg',0.0,1.0),
('Adam Sandler','Jackie Sandler','Estados Unidos','1966/09/09','https://i.imgur.com/Kfyq2MW.jpg',0.0,1.0),
('Morgan Freeman','','Estados Unidos','1937/06/01','https://i.imgur.com/3Pxvw5q.jpg',0.0,1.0),
('Matt Damon','Luciana Barroso','Estados Unidos','1970/10/08','https://i.imgur.com/5xXvHrF.jpg',0.0,1.0),
('Jennifer Lawrence','','Estados Unidos','1990/08/15','https://i.imgur.com/D79oXjB.jpg',0.0,1.0),
('Julia Roberts','Daniel Moder','Estados Unidos','1967/08/28','https://i.imgur.com/BYPtKre.jpg',0.0,1.0),
('Sandra Bullock','Bryan Randall','Estados Unidos','1964/07/26','https://i.imgur.com/oOuthW0.jpg',0.0,1.0),
('Jennifer Aniston','Justin Theroux','Estados Unidos','1969/02/11','https://i.imgur.com/YZ1NKhA.jpg',0.0,1.0),
('Cameron Diaz','Benji Madden','Estados Unidos','1972/08/30','https://i.imgur.com/a0n2dSz.jpg',0.0,1.0),
('Scarlett Johansson','Romain Dauriac','Estados Unidos','1984/11/22','https://i.imgur.com/brvBBaK.jpg',0.0,1.0),
('Natalie Portman','Benjamin Millepied','Israel','1981/06/09','https://i.imgur.com/VRes3c1.jpg',0.0,1.0),
('Gal Gadot','Yaron Varsano','Israel','1985/04/30','https://i.imgur.com/aoIdkx9.jpg',0.0,1.0);
