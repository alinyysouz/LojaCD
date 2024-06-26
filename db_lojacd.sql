CREATE DATABASE Db_Cd;
USE Db_Cd;

CREATE TABLE Cantor(
	Id_Cant INT NOT NULL,
	Nome_Cant VARCHAR(100) NOT NULL,
    CONSTRAINT Pk_Id_Cant PRIMARY KEY(Id_Cant)
);

CREATE TABLE Gravadora(
	Id_Grav INT NOT NULL,
    Cod_Grav INT NOT NULL,
    Nome_Grav VARCHAR(50) NOT NULL,
    CONSTRAINT Pk_Id_Grav PRIMARY KEY(Id_Grav)
);

CREATE TABLE Categoria(
	Id_Cat INT NOT NULL,
    Nome_Cat VARCHAR (50) NOT NULL,
	
    CONSTRAINT Pk_Id_Cat PRIMARY KEY(Id_Cat)
);

CREATE TABLE Cidade(
	Id_Cid INT NOT NULL,
    Fk_Sigla_Est CHAR(2) NOT NULL,
    Nome_Cid VARCHAR(100) NOT NULL,
    
    CONSTRAINT Pk_Id_Cid PRIMARY KEY(Id_Cid),
    
    CONSTRAINT Fk_Sigla_Est FOREIGN KEY(Fk_Sigla_Est)
    REFERENCES Estado (Id_Sigla_Est)
);

CREATE TABLE Estado(
	Id_Sigla_Est CHAR(2) NOT NULL,
    Nome_Est CHAR (50) NOT NULL,
    CONSTRAINT Pk_Id_Sigla_Est PRIMARY KEY(Id_Sigla_Est)
);

CREATE TABLE Cliente(
	Id_Cli INT NOT NULL,
    Fk_Cid INT NOT NULL,
    Nome_Cli VARCHAR(100) NOT NULL,
    End_Cli VARCHAR(200) NOT NULL,
    Renda_Cli DECIMAL(10,2) NOT NULL,
    Sexo_Cli ENUM('F', 'M') NOT NULL,
    
    CONSTRAINT Pk_Id_Cli PRIMARY KEY(Id_Cli),
    
    CONSTRAINT Fk_Cid FOREIGN KEY(Fk_Cid)
    REFERENCES Cidade (Id_Cid)
);


CREATE TABLE Conjuge(
	Fk_Cli INT NOT NULL,
    Nome_Conj VARCHAR(100) NOT NULL,
    Renda_Conj DECIMAL(10,2) NOT NULL,
    Sexo_Conj ENUM('F','M'),
    
    CONSTRAINT Fk_Cli FOREIGN KEY (Fk_Cli)
    REFERENCES Cliente (Id_Cli)
);

CREATE TABLE Funcionario(
	Id_Func INT NOT NULL,
    Nome_Func VARCHAR(100) NOT NULL,
    End_Func VARCHAR(200) NOT NULL,
    Sal_Func DECIMAL(10,2) NOT NULL,
    Sexo_Func ENUM('F','M'),
    
    CONSTRAINT Pk_Id_Func PRIMARY KEY(Id_Func)
);

CREATE TABLE Dependente(
	Id_Dep INT NOT NULL,
    Fk_Func INT NOT NULL,
    Nome_Dep VARCHAR(100) NOT NULL,
    Sexo_Dep ENUM('F','M'),
    
    CONSTRAINT Pk_Dep PRIMARY KEY(Id_Dep),
    
    CONSTRAINT Fk_Func FOREIGN KEY (Fk_Func)
    REFERENCES Funcionario (Id_Func)
);

CREATE TABLE TITULO(
	Id_Tit INT NOT NULL,
    Fk_Cat INT NOT NULL,
    Fk_Grav INT NOT NULL,
    Nome_CD VARCHAR(100) NOT NULL,
    VAL_CD DECIMAL(10,2) NOT NULL,
    Qtd_Estq INT NOT NULL,
    
    CONSTRAINT Pk_Id_Titulo PRIMARY KEY(Id_Tit),
    
    CONSTRAINT Fk_Cat FOREIGN KEY (Fk_Cat)
    REFERENCES Categoria (Id_Cat),
    
    CONSTRAINT Fk_Grav FOREIGN KEY (Fk_Grav)
    REFERENCES Gravadora (Id_Grav)
);

CREATE TABLE Pedido(
	Id_Num_Ped INT NOT NULL,
    Fk_Clii INT NOT NULL,
    Fk_Funcc INT NOT NULL,
    Data_Ped DATETIME NOT NULL,
    Val_Ped DECIMAL (10,2) NOT NULL,
	
    CONSTRAINT Pk_Id_Num_Ped PRIMARY KEY(Id_Num_Ped),
    
    CONSTRAINT Fk_Clii FOREIGN KEY (Fk_Clii)
    REFERENCES Cliente (Id_Cli),
    
    CONSTRAINT Fk_Funcc FOREIGN KEY (Fk_Funcc)
    REFERENCES Funcionario (Id_Func)
);

CREATE TABLE Titulo_Pedido(
	Fk_Num_Ped INT NOT NULL,
    Fk_Tit INT NOT NULL,
    Qtd_CD INT NOT NULL,
    Val_CD DECIMAL(10,2) NOT NULL,

    
    CONSTRAINT Fk_Num_Ped FOREIGN KEY (Fk_Num_Ped)
    REFERENCES Pedido (Id_Num_Ped),
    
    CONSTRAINT Fk_Cod_Tit FOREIGN KEY (Fk_Tit)
    REFERENCES Titulo (Id_Tit)
);

