DROP SCHEMA Gimnasios;

create schema Gimnasios;

USE Gimnasios;

-- tablas
CREATE TABLE SOCIOS (
    ID_Socio INT AUTO_INCREMENT NOT NULL UNIQUE,
    Nombre VARCHAR (50) NOT NULL,
     Apellido VARCHAR (50) NOT NULL,
     DNI INT NOT NULL UNIQUE,
     Email VARCHAR (100) NULL UNIQUE,
     Telefono INT NOT NULL UNIQUE,
     SocioActivo BOOLEAN NOT NULL,
    CONSTRAINT PK_Socios PRIMARY KEY (ID_Socio)
    );
    
    CREATE TABLE PLAN (
    ID_Plan INT AUTO_INCREMENT NOT NULL UNIQUE,
    NombrePlan VARCHAR(30) NOT NULL UNIQUE,
    Descripcion VARCHAR(500) NOT NULL UNIQUE,
    Precio FLOAT NOT NULL,
    CONSTRAINT PK_Plan PRIMARY KEY (ID_Plan)
);
    
   CREATE TABLE METODOS_DE_PAGO (
    ID_MetodoDePago INT AUTO_INCREMENT NOT NULL UNIQUE,
    TipoDePago VARCHAR(50) NOT NULL,
    EntidadFinanciera VARCHAR(100) NULL,
    Detalles VARCHAR (100) NULL,
    ID_Socio INT NOT NULL UNIQUE,
	CONSTRAINT PK_ID_MetodoDePago PRIMARY KEY (ID_MetodoDePago)
); 
    
    CREATE TABLE DOCUMENTOS_DE_SALUD (
    ID_Documento INT AUTO_INCREMENT NOT NULL UNIQUE,
    ID_Socio INT NOT NULL,
    TipoDeDocumento VARCHAR (100) NOT NULL,
    Detalles VARCHAR(100) NULL,
    FechaDeExpiracion DATE NOT NULL,
    EstaApto BOOLEAN NOT NULL,
    CONSTRAINT PK_ID_Documento PRIMARY KEY (ID_Documento)
    );
    
    CREATE TABLE SEDES (
    ID_Sede INT AUTO_INCREMENT NOT NULL UNIQUE,
    NombreSede VARCHAR (50) NOT NULL UNIQUE,
    Direccion VARCHAR (200) NOT NULL UNIQUE,
    Email VARCHAR (100) NULL UNIQUE,
	Telefono INT NULL UNIQUE,
    CONSTRAINT PK_ID_Sede PRIMARY KEY (ID_Sede)
    );
    
    CREATE TABLE PLAN_SEDES (
    ID_Plan INT NOT NULL,
    ID_Sede INT NOT NULL,
    PRIMARY KEY (ID_Plan, ID_Sede),
    FOREIGN KEY (ID_Plan) REFERENCES PLAN (ID_Plan),
    FOREIGN KEY (ID_Sede) REFERENCES SEDES (ID_Sede)
    );
    
    CREATE TABLE CLASES (
    ID_Clase INT AUTO_INCREMENT NOT NULL UNIQUE,
    NombreClase VARCHAR (50) NOT NULL UNIQUE,
    Descripcion VARCHAR (200) NULL UNIQUE,
    CONSTRAINT PK_ID_Clase PRIMARY KEY (ID_Clase)
    );
    
    
     CREATE TABLE AREA_PROFESORES (
    ID_AreaProfesores INT AUTO_INCREMENT NOT NULL UNIQUE,
    NombreArea VARCHAR (50) NOT NULL UNIQUE,
     Detalles VARCHAR (100) NULL,
    CONSTRAINT PK_ID_AreaProfesores PRIMARY KEY (ID_AreaProfesores)
    ); 
    
            CREATE TABLE SALARIO_PROFESORES (
    ID_SalarioProfesores INT AUTO_INCREMENT NOT NULL UNIQUE,
    ID_AreaProfesores INT NOT NULL,
     Descripcion VARCHAR (200) NULL,
     AntiguedadMinima TINYINT NOT NULL,
     ValorHora FLOAT NOT NULL UNIQUE,
    CONSTRAINT PK_ID_SalarioProfesores PRIMARY KEY (ID_SalarioProfesores)
    ); 
    
    CREATE TABLE STAFF_PROFESORES (
    ID_Profesor INT AUTO_INCREMENT NOT NULL UNIQUE,
    Nombre VARCHAR (50) NOT NULL,
     Apellido VARCHAR (50) NOT NULL,
     DNI INT NOT NULL UNIQUE,
     Email VARCHAR (100) NULL UNIQUE,
     Telefono INT NULL UNIQUE,
     FechaInicioActividades DATE NOT NULL,
     ID_AreaProfesores INT NULL,
     ID_SalarioProfesores INT NULL,
    CONSTRAINT PK_ID_Profesor PRIMARY KEY (ID_Profesor)
    ); 
    
           CREATE TABLE AREA_ADMINISTRATIVOS (
    ID_AreaAdministrativos INT AUTO_INCREMENT NOT NULL UNIQUE,
    NombreArea VARCHAR (50) NOT NULL UNIQUE,
     Detalles VARCHAR (100) NULL,
    CONSTRAINT PK_ID_AreaAdministrativos PRIMARY KEY (ID_AreaAdministrativos)
    ); 
    
              CREATE TABLE SALARIO_ADMINISTRATIVOS (
    ID_SalarioAdministrativos INT AUTO_INCREMENT NOT NULL UNIQUE,
    ID_AreaAdministrativos INT NOT NULL,
     Descripcion VARCHAR (200) NULL,
     AntiguedadMinima TINYINT NOT NULL,
     ValorHora FLOAT NOT NULL UNIQUE,
    CONSTRAINT PK_ID_SalarioAdministrativos PRIMARY KEY (ID_SalarioAdministrativos)
    ); 
    
     CREATE TABLE STAFF_ADMINISTRATIVOS (
    ID_Administrativo INT AUTO_INCREMENT NOT NULL UNIQUE,
    Nombre VARCHAR (50) NOT NULL,
     Apellido VARCHAR (50) NOT NULL,
     DNI INT NOT NULL UNIQUE,
     Email VARCHAR (100) NULL UNIQUE,
     Telefono INT NULL UNIQUE,
     FechaInicioActividades DATE NOT NULL,
     ID_Sede INT NOT NULL,
     ID_AreaAdministrativos INT NULL,
     ID_SalarioAdministrativos INT NULL,
    CONSTRAINT PK_ID_Administrativo PRIMARY KEY (ID_Administrativo)
    ); 
    
    CREATE TABLE CLASES_SEDES (
         ID_Clase INT NOT NULL,
    ID_Sede INT NOT NULL,
    PRIMARY KEY (ID_Clase, ID_Sede),
    FOREIGN KEY (ID_Clase) REFERENCES CLASES (ID_Clase),
    FOREIGN KEY (ID_Sede) REFERENCES SEDES (ID_Sede)
);

    CREATE TABLE SEDES_PROFESORES (
    ID_Sede INT NOT NULL,
    ID_Profesor INT NOT NULL,
    PRIMARY KEY (ID_Sede, ID_Profesor),
    FOREIGN KEY (ID_Sede) REFERENCES SEDES (ID_Sede),
	FOREIGN KEY (ID_Profesor) REFERENCES STAFF_PROFESORES (ID_Profesor)
);

CREATE TABLE CLASES_PROFESORES (
     ID_Clase INT NOT NULL,
    ID_Profesor INT NOT NULL,
    PRIMARY KEY (ID_Clase, ID_Profesor),
    FOREIGN KEY (ID_Clase) REFERENCES CLASES (ID_Clase),
    FOREIGN KEY (ID_Profesor) REFERENCES STAFF_PROFESORES (ID_Profesor)
);

    
          CREATE TABLE REVIEWS (
    ID_Review INT AUTO_INCREMENT NOT NULL UNIQUE,
    ID_Socio INT NOT NULL,
	ID_Sede INT NULL,
    ID_Profesor INT NULL,
    ID_Clase INT NULL,
    Calificacion TINYINT NOT NULL,
    Comentarios VARCHAR (500) NULL,
    FechaReview DATE NOT NULL,
    CONSTRAINT PK_ID_Review PRIMARY KEY (ID_Review)
    ); 
    
-- foreign keys;
    
ALTER TABLE METODOS_DE_PAGO ADD CONSTRAINT FK_ID_Socio_MetodosDePago FOREIGN KEY FK_ID_Socio (ID_Socio)
	REFERENCES SOCIOS (ID_Socio); 
    
ALTER TABLE DOCUMENTOS_DE_SALUD ADD CONSTRAINT FK_ID_Socio_DocumentosDeSalud FOREIGN KEY FK_ID_Socio (ID_Socio)
	REFERENCES SOCIOS (ID_Socio); 
    
ALTER TABLE STAFF_PROFESORES ADD CONSTRAINT FK_ID_AreaProfesores_StaffProfesores FOREIGN KEY FK_ID_AreaProfesores (ID_AreaProfesores)
	REFERENCES AREA_PROFESORES (ID_AreaProfesores); 
    
ALTER TABLE STAFF_PROFESORES ADD CONSTRAINT FK_ID_SalarioProfesores_StaffProfesores FOREIGN KEY FK_ID_SalarioProfesores (ID_SalarioProfesores)
	REFERENCES SALARIO_PROFESORES (ID_SalarioProfesores); 
    
ALTER TABLE STAFF_ADMINISTRATIVOS ADD CONSTRAINT FK_ID_Sede_StaffAdministrativos FOREIGN KEY FK_ID_Sede (ID_Sede)
	REFERENCES SEDES (ID_Sede); 
    
ALTER TABLE STAFF_ADMINISTRATIVOS ADD CONSTRAINT FK_ID_AreaAdministrativos_StaffAdministrativos FOREIGN KEY FK_ID_AreaAdministrativos (ID_AreaAdministrativos)
	REFERENCES AREA_ADMINISTRATIVOS (ID_AreaAdministrativos); 
    
ALTER TABLE STAFF_ADMINISTRATIVOS ADD CONSTRAINT FK_ID_SalarioAdministrativos_StaffAdministrativos FOREIGN KEY FK_ID_SalarioAdministrativos (ID_SalarioAdministrativos)
	REFERENCES SALARIO_ADMINISTRATIVOS (ID_SalarioAdministrativos); 
    
ALTER TABLE SALARIO_ADMINISTRATIVOS ADD CONSTRAINT FK_ID_AreaAdministrativos_SalarioAdministrativos FOREIGN KEY FK_ID_AreaAdministrativos (ID_AreaAdministrativos)
	REFERENCES AREA_ADMINISTRATIVOS (ID_AreaAdministrativos);
    
ALTER TABLE SALARIO_PROFESORES ADD CONSTRAINT FK_ID_AreaProfesores_SalarioProfesores FOREIGN KEY FK_ID_AreaProfesores (ID_AreaProfesores)
	REFERENCES AREA_PROFESORES (ID_AreaProfesores);
    
ALTER TABLE REVIEWS ADD CONSTRAINT FK_ID_Socio_Reviews FOREIGN KEY FK_ID_Socio (ID_Socio)
	REFERENCES SOCIOS (ID_Socio);     
    
ALTER TABLE REVIEWS ADD CONSTRAINT FK_ID_Sede_Reviews FOREIGN KEY FK_ID_Sede (ID_Sede)
	REFERENCES SEDES (ID_Sede); 
    
ALTER TABLE REVIEWS  ADD CONSTRAINT FK_ID_Profesor_Reviews FOREIGN KEY FK_ID_Profesor (ID_Profesor)
	REFERENCES STAFF_PROFESORES (ID_Profesor); 
    
ALTER TABLE REVIEWS ADD CONSTRAINT FK_ID_Clase_Reviews FOREIGN KEY FK_ID_Clase (ID_Clase)
	REFERENCES CLASES (ID_Clase);
    
-- insercion de datos;

INSERT INTO SOCIOS (Nombre, Apellido, DNI, Email, Telefono, SocioActivo) VALUES
('Juan', 'Gómez', 12345678, 'juan@example.com', 91234567, 1),
('María', 'Rodríguez', 23456789, 'maria@example.com', 82345678, 1),
('Pedro', 'López', 34567890, 'pedro@example.com', 73456789, 1),
('Ana', 'Martínez', 45678901, 'ana@example.com', 64567890, 1),
('Luis', 'García', 56789012, 'luis@example.com', 55678901, 1),
('Laura', 'Fernández', 67890123, 'laura@example.com', 46789012, 1),
('Carlos', 'Pérez', 78901234, 'carlos@example.com', 37890123, 1),
('Marta', 'Gutiérrez', 89012345, 'marta@example.com', 28901234, 1),
('Roberto', 'Díaz', 90123456, 'roberto@example.com', 19012345, 1),
('Sofía', 'Silva', 98765432, 'sofia@example.com', 87654321, 1),
('Lucía', 'Torres', 87654321, 'lucia@example.com', 76543210, 1),
('Diego', 'González', 76543210, 'diego@example.com', 65432109, 1),
('Valentina', 'Hernández', 65432109, 'valentina@example.com', 54321098, 1),
('Andrés', 'Ramírez', 54321098, 'andres@example.com', 43210987, 1),
('Camila', 'Sánchez', 43210987, 'camila@example.com', 32109876, 1),
('Javier', 'Romero', 32109876, 'javier@example.com', 21098765, 1),
('Marcela', 'Ortega', 21098765, 'marcela@example.com', 10987654, 1),
('Fernando', 'Fuentes', 10987654, 'fernando@example.com', 98765432, 1),
('Gabriela', 'Meza', 99887766, 'gabriela@example.com', 12345678, 1),
('Eduardo', 'Cortés', 88776655, 'eduardo@example.com', 23456789, 1),
('Brenda', 'Paredes', 77665544, 'brenda@example.com', 34567890, 1),
('Roberto', 'Morales', 66554433, 'roberto_morales@example.com', 45678901, 1),
('Carolina', 'Vargas', 55443322, 'carolina@example.com', 56789012, 1),
('David', 'Valenzuela', 44332211, 'david@example.com', 67890123, 1),
('Natalia', 'Figueroa', 33221100, 'natalia@example.com', 78901234, 1),
('Mauricio', 'Espinoza', 22110099, 'mauricio@example.com', 89012345, 1),
('Alejandra', 'Rojas', 11009988, 'alejandra@example.com', 90123456, 1),
('Ricardo', 'Soto', 99008877, 'ricardo@example.com', 90234567, 1),
('Amanda', 'Castillo', 88007766, 'amanda@example.com', 90345678, 1),
('Emilio', 'Gallardo', 77006655, 'emilio@example.com', 90456789, 1),
('Valeria', 'Rivas', 66005544, 'valeria@example.com', 90567890, 1),
('Hugo', 'Montoya', 55004433, 'hugo@example.com', 90678901, 1),
('Isabel', 'Santos', 44003322, 'isabel@example.com', 90789012, 1),
('Ángel', 'Delgado', 33002211, 'angel@example.com', 90890123, 1),
('Adriana', 'Paredes', 22001100, 'adriana@example.com', 90901234, 1),
('Sebastián', 'Meza', 11000099, 'sebastian@example.com', 91012345, 1);


INSERT INTO PLAN (NombrePlan, Descripcion, Precio)
VALUES ('Classic', 'Acceso a sedes categoria classic, que incluyen sala de musculacion y salones de clases', '5000' ),
('Gold', 'Acceso a sedes categoria gold, que incluyen sala de musculacion y salones de clases. Incluye sedes con salon de spinning', '7000' ),
('Platinum', 'Acceso a sedes categoria platinum, que incluyen sala de musculacion y salones de clases. Incluye sedes con salon de spinning. Incluye sedes con acceso a pileta', '9000' );


INSERT INTO SEDES (NombreSede, Direccion, Email, Telefono) VALUES
('Center I', 'Av. 9 de Julio 123', 'sedecenter1@example.com', 11223344),
('Almagro', 'Av. Corrientes 456', 'sedealmagro@example.com', 22334455),
('Center II', 'Calle Florida 789', 'sedecenter2@example.com', 33445566),
('Palermo', 'Av. Santa Fe 1010', 'sedepalermo@example.com', 44556677),
('Retiro', 'Calle Lavalle 1313', 'sederetiro@example.com', 55667788),
('Belgrano', 'Av. Cabildo 1717', 'sedebelgrano@example.com', 66778899),
('Center III', 'Calle Reconquista 2121', 'sedecenter3@example.com', 77889900),
('Caballito', 'Av. La Plata 36', 'sedecaballito@example.com', 88990011),
('Congreso', 'Calle Sarmiento 2525', 'sedecongreso@example.com', 99001122),
('Plaza Miserere', 'Av. Rivadavia 2727', 'sedeplazamiserere@example.com', 10011223);

INSERT INTO CLASES (NombreClase, Descripcion)
VALUES ('BODYCOMBAT', 'Clase aerobica inspirada en las artes marciales. Intensidad alta'),
 ('BODYPUMP', 'Clase localizada, trabajo con barra, discos y pesos. Intensidad alta'),
('POWERJUMP', 'Clase aerobica con mini trampolin. Intensidad alta'),
('Spinning', 'Clase aerobica sobre bicicleta fija. Intensidad alta'),
('GAP', 'Trabajo de gluteos, abdominales y piernas. Intensidad media'),
('Zumba', 'Clase aerobica y coreografiada de baile. Intensidad media'),
('Aqua Gym', 'Clase localizada en pileta. Intensidad baja'),
('Yoga', 'Clase que utiliza posturas físicas, ejercicios de respiración y meditación. Intensidad baja');

INSERT INTO AREA_PROFESORES (NombreArea, Detalles) VALUES
('Musculacion', 'Profesores del salon de musculacion'),
('Tecnicas', 'Profesores de tecnicas de gimnasia'),
('Spinning', 'Profesores de spinning'),
('Pileta', 'Profesores de pileta');

INSERT INTO AREA_ADMINISTRATIVOS (NombreArea, Detalles) VALUES
('Recepcion', 'Empleados recepcionistas de socios'),
('Ventas', 'Empleados dedicados a la venta de planes y cobro'),
('RRHH', 'Empleados de recursos humanos'),
('Coordinacion', 'Empleados que coordinan las clases y salon de musc de la sede'),
('Gerencia', 'Empleados que forman parte de la gerencia de la sede');

INSERT INTO SALARIO_PROFESORES (ID_AreaProfesores, Descripcion, AntiguedadMinima, ValorHora) VALUES
(1, 'Área 1 - Básico', 1, 15.5),
(2, 'Área 2 - Avanzado', 2, 18.75),
(3, 'Área 3 - Especializado', 3, 22.25),
(4, 'Área 4 - Experto', 5, 25.0),
(1, 'Área 1 - Básico (Antigüedad)', 4, 16.75),
(2, 'Área 2 - Avanzado (Antigüedad)', 5, 19.5),
(3, 'Área 3 - Especializado (Antigüedad)', 6, 23.0),
(4, 'Área 4 - Experto (Antigüedad)', 8, 27.0);

INSERT INTO SALARIO_ADMINISTRATIVOS (ID_AreaAdministrativos, Descripcion, AntiguedadMinima, ValorHora) VALUES
(1, 'Área 1 - Administrativo Básico', 1, 25.5),
(2, 'Área 2 - Administrativo Avanzado', 2, 28.75),
(3, 'Área 3 - Administrativo Especializado', 3, 32.25),
(4, 'Área 4 - Administrativo Experto', 5, 37.0),
(5, 'Área 5 - Administrativo Senior', 4, 42.5),
(1, 'Área 1 - Administrativo Básico (Antigüedad)', 4, 26.75),
(2, 'Área 2 - Administrativo Avanzado (Antigüedad)', 5, 29.5),
(3, 'Área 3 - Administrativo Especializado (Antigüedad)', 6, 33.0),
(4, 'Área 4 - Administrativo Experto (Antigüedad)', 8, 38.0),
(5, 'Área 5 - Administrativo Senior (Antigüedad)', 7, 43.5);

INSERT INTO STAFF_PROFESORES (Nombre, Apellido, DNI, Email, Telefono, FechaInicioActividades, ID_AreaProfesores, ID_SalarioProfesores) VALUES
('Juan', 'Gómez', 11223344, 'juangomez@profegimnasio.com', 91234567, '2020-01-15', 1, 1),
('María', 'Rodríguez', 22334455, 'mariarodriguez@profegimnasio.com', 82345678, '2019-08-22', 2, 2),
('Pedro', 'López', 33445566, 'pedrolopez@profegimnasio.com', 73456789, '2021-03-10', 3, 3),
('Ana', 'Martínez', 44556677, 'anamartinez@profegimnasio.com', 64567890, '2018-12-05', 4, 4),
('Luis', 'García', 55667788, 'luisgarcia@profegimnasio.com', 55678901, '2022-02-28', 1, 5),
('Laura', 'Fernández', 66778899, 'laurafernandez@profegimnasio.com', 46789012, '2020-05-17', 2, 6),
('Carlos', 'Pérez', 77889900, 'carlosperez@profegimnasio.com', 37890123, '2019-10-09', 3, 7),
('Marta', 'Gutiérrez', 88990011, 'martagutierrez@profegimnasio.com', 28901234, '2023-01-03', 4, 8),
('Roberto', 'Díaz', 99001122, 'robertodiaz@profegimnasio.com', 19012345, '2017-06-12', 1, 1),
('Sofía', 'Silva', 10011223, 'sofiasilva@profegimnasio.com', 87654321, '2021-09-20', 2, 2),
('Lucía', 'Torres', 21100122, 'luciatorres@profegimnasio.com', 76543210, '2019-11-25', 3, 3),
('Diego', 'González', 32100122, 'diegogonzalez@profegimnasio.com', 65432109, '2020-07-08', 4, 4),
('Valentina', 'Hernández', 43100122, 'valentinahernandez@profegimnasio.com', 54321098, '2022-04-13', 1, 5),
('Andrés', 'Ramírez', 54100122, 'andresramirez@profegimnasio.com', 43210987, '2018-03-27', 2, 6),
('Camila', 'Sánchez', 65100122, 'camilasanchez@profegimnasio.com', 32109876, '2023-05-09', 3, 7),
('Javier', 'Romero', 76100122, 'javierromero@profegimnasio.com', 21098765, '2019-12-30', 4, 8),
('Marcela', 'Ortega', 87100122, 'marcelaortega@profegimnasio.com', 10987654, '2022-08-04', 1, 1),
('Fernando', 'Fuentes', 98100122, 'fernandofuentes@profegimnasio.com', 98765432, '2018-02-19', 2, 2),
('Gabriela', 'Meza', 99221100, 'gabrielameza@profegimnasio.com', 12345678, '2021-07-11', 3, 3),
('Eduardo', 'Cortés', 99332200, 'eduardocortes@profegimnasio.com', 23456789, '2019-04-26', 4, 4),
('Brenda', 'Paredes', 99443300, 'brendaparedes@profegimnasio.com', 34567890, '2020-10-14', 1, 5),
('Roberto', 'Morales', 99554400, 'robertomorales@profegimnasio.com', 45678901, '2023-02-02', 2, 6),
('Carolina', 'Vargas', 99665500, 'carolinavargas@profegimnasio.com', 56789012, '2019-11-08', 3, 7),
('David', 'Valenzuela', 99776600, 'davidvalenzuela@profegimnasio.com', 67890123, '2021-06-21', 4, 8),
('Natalia', 'Figueroa', 99887700, 'nataliafigueroa@profegimnasio.com', 78901234, '2022-09-30', 1, 1);

INSERT INTO STAFF_ADMINISTRATIVOS (Nombre, Apellido, DNI, Email, Telefono, FechaInicioActividades, ID_Sede, ID_AreaAdministrativos, ID_SalarioAdministrativos) VALUES
('Juan', 'Gómez', 11223344, 'juan@admin_gimnasio.com', 91234567, '2020-01-15', 1, 1, 1),
('María', 'Rodríguez', 22334455, 'maria@admin_gimnasio.com', 82345678, '2019-08-22', 2, 2, 2),
('Pedro', 'López', 33445566, 'pedro@admin_gimnasio.com', 73456789, '2021-03-10', 3, 3, 3),
('Ana', 'Martínez', 44556677, 'ana@admin_gimnasio.com', 64567890, '2018-12-05', 4, 4, 4),
('Luis', 'García', 55667788, 'luis@admin_gimnasio.com', 55678901, '2022-02-28', 5, 1, 5),
('Laura', 'Fernández', 66778899, 'laura@admin_gimnasio.com', 46789012, '2020-05-17', 6, 2, 6),
('Carlos', 'Pérez', 77889900, 'carlos@admin_gimnasio.com', 37890123, '2019-10-09', 7, 3, 7),
('Marta', 'Gutiérrez', 88990011, 'marta@admin_gimnasio.com', 28901234, '2023-01-03', 8, 4, 8),
('Roberto', 'Díaz', 99001122, 'robertodiaz@admin_gimnasio.com', 19012345, '2017-06-12', 9, 1, 9),
('Sofía', 'Silva', 10011223, 'sofia@admin_gimnasio.com', 87654321, '2021-09-20', 10, 2, 10),
('Lucía', 'Torres', 21100122, 'lucia@admin_gimnasio.com', 76543210, '2019-11-25', 1, 3, 1),
('Diego', 'González', 32100122, 'diego@admin_gimnasio.com', 65432109, '2020-07-08', 2, 4, 2),
('Valentina', 'Hernández', 43100122, 'valentina@admin_gimnasio.com', 54321098, '2022-04-13', 3, 1, 3),
('Andrés', 'Ramírez', 54100122, 'andres@admin_gimnasio.com', 43210987, '2018-03-27', 4, 2, 4),
('Camila', 'Sánchez', 65100122, 'camila@admin_gimnasio.com', 32109876, '2023-05-09', 5, 3, 5),
('Javier', 'Romero', 76100122, 'javier@admin_gimnasio.com', 21098765, '2019-12-30', 6, 4, 6),
('Marcela', 'Ortega', 87100122, 'marcela@admin_gimnasio.com', 10987654, '2022-08-04', 7, 1, 7),
('Fernando', 'Fuentes', 98100122, 'fernando@admin_gimnasio.com', 98765432, '2018-02-19', 8, 2, 8),
('Gabriela', 'Meza', 99221100, 'gabriela@admin_gimnasio.com', 12345678, '2021-07-11', 9, 3, 9),
('Eduardo', 'Cortés', 99332200, 'eduardo@admin_gimnasio.com', 23456789, '2019-04-26', 10, 4, 10),
('Brenda', 'Paredes', 99443300, 'brenda@admin_gimnasio.com', 34567890, '2020-10-14', 1, 1, 1),
('Roberto', 'Morales', 99554400, 'robertomorales@admin_gimnasio.com', 45678901, '2023-02-02', 2, 2, 2),
('Carolina', 'Vargas', 99665500, 'carolina@admin_gimnasio.com', 56789012, '2019-11-08', 3, 3, 3),
('David', 'Valenzuela', 99776600, 'david@admin_gimnasio.com', 67890123, '2021-06-21', 4, 4, 4),
('Natalia', 'Figueroa', 99887700, 'natalia@admin_gimnasio.com', 78901234, '2022-09-30', 5, 1, 5),
('Mauricio', 'Espinoza', 99998800, 'mauricio@admin_gimnasio.com', 89012345, '2018-05-07', 6, 2, 6),
('Alejandra', 'Rojas', 100009900, 'alejandra@admin_gimnasio.com', 90123456, '2020-12-18', 7, 3, 7),
('Ricardo', 'Soto', 100110000, 'ricardo@admin_gimnasio.com', 90234567, '2019-03-25', 8, 4, 8),
('Amanda', 'Castillo', 100221100, 'amanda@admin_gimnasio.com', 90345678, '2022-07-06', 9, 1, 9);

INSERT INTO CLASES_SEDES (ID_Clase, ID_Sede) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 2),
(5, 7),
(6, 4),
(7, 10),
(8, 6),
(1, 2),
(2, 5),
(3, 8),
(4, 6),
(5, 3),
(6, 1),
(7, 9),
(8, 10),
(1, 3),
(2, 7),
(3, 9),
(4, 5),
(5, 4),
(6, 2),
(7, 1),
(8, 8),
(1, 5),
(2, 6),
(3, 4),
(4, 3),
(5, 2),
(6, 9);

INSERT INTO CLASES_PROFESORES (ID_Clase, ID_Profesor) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 2),
(5, 7),
(6, 4),
(7, 10),
(8, 6),
(1, 2),
(2, 5),
(3, 8),
(4, 6),
(5, 3),
(6, 1),
(7, 9),
(8, 10),
(1, 3),
(2, 7),
(3, 9),
(4, 5),
(5, 4),
(6, 2),
(7, 1),
(8, 8),
(1, 5),
(2, 6),
(3, 4),
(4, 3),
(5, 2),
(6, 9);

INSERT INTO SEDES_PROFESORES (ID_Sede, ID_Profesor) VALUES
(1, 1),
(2, 3),
(3, 5),
(4, 2),
(5, 7),
(6, 4),
(7, 10),
(8, 6),
(9, 2),
(10, 5),
(1, 8),
(2, 6),
(3, 3),
(4, 1),
(5, 9),
(6, 10),
(7, 3),
(8, 7),
(9, 9),
(10, 9),
(1, 4),
(2, 1),
(3, 9),
(4, 10),
(5, 3),
(6, 2),
(7, 1),
(8, 8),
(9, 5),
(10, 6);

INSERT INTO METODOS_DE_PAGO (TipoDePago, EntidadFinanciera, Detalles, ID_Socio) VALUES
    ('Tarjeta de crédito', 'Banco ABC', 'Visa - 1234', 5),
    ('Efectivo', 'N/A', 'Pago en efectivo', 12),
    ('Transferencia bancaria', 'Banco XYZ', 'Cuenta: 98765432', 27),
    ('PayPal', 'PayPal', 'usuario@example.com', 9),
    ('Tarjeta de débito', 'Banco DEF', 'Mastercard - 5678', 18),
    ('Cheque', 'Banco GHI', 'Cheque No. 123456', 4),
    ('Transferencia bancaria', 'Banco ABC', 'Cuenta: 54321678', 31),
    ('Efectivo', 'N/A', 'Pago en efectivo', 8),
    ('PayPal', 'PayPal', 'usuario2@example.com', 25),
    ('Tarjeta de crédito', 'Banco JKL', 'American Express - 2468', 1),
    ('Transferencia bancaria', 'Banco XYZ', 'Cuenta: 13579024', 16),
    ('Efectivo', 'N/A', 'Pago en efectivo', 22),
    ('Tarjeta de débito', 'Banco GHI', 'Visa - 7890', 35),
    ('Cheque', 'Banco ABC', 'Cheque No. 654321', 11),
    ('Transferencia bancaria', 'Banco DEF', 'Cuenta: 24681357', 30),
    ('Efectivo', 'N/A', 'Pago en efectivo', 2),
    ('PayPal', 'PayPal', 'usuario3@example.com', 7),
    ('Tarjeta de crédito', 'Banco XYZ', 'Mastercard - 1357', 29),
    ('Transferencia bancaria', 'Banco JKL', 'Cuenta: 56789012', 13),
    ('Efectivo', 'N/A', 'Pago en efectivo', 26),
    ('PayPal', 'PayPal', 'usuario4@example.com', 15),
    ('Tarjeta de débito', 'Banco DEF', 'Visa - 2468', 36),
    ('Cheque', 'Banco GHI', 'Cheque No. 987654', 6),
    ('Transferencia bancaria', 'Banco ABC', 'Cuenta: 54321098', 24),
    ('Efectivo', 'N/A', 'Pago en efectivo', 3),
    ('PayPal', 'PayPal', 'usuario5@example.com', 32),
    ('Tarjeta de crédito', 'Banco JKL', 'Visa - 8642', 17),
    ('Transferencia bancaria', 'Banco XYZ', 'Cuenta: 76543210', 10),
    ('Efectivo', 'N/A', 'Pago en efectivo', 20),
    ('PayPal', 'PayPal', 'usuario6@example.com', 19); 
    
    INSERT INTO DOCUMENTOS_DE_SALUD (ID_Socio, TipoDeDocumento, Detalles, FechaDeExpiracion, EstaApto) VALUES
    (5, 'Certificado Médico', 'Examen general', '2024-07-15', TRUE),
    (12, 'Informe Médico', 'Alergias', '2023-12-31', FALSE),
    (27, 'Carnet de Vacunación', 'COVID-19', '2023-09-28', TRUE),
    (9, 'Certificado Médico', 'Examen pre-empleo', '2024-03-10', TRUE),
    (18, 'Informe Médico', 'Historial clínico', '2024-06-20', TRUE),
    (4, 'Certificado Médico', 'Examen deportivo', '2022-11-30', FALSE),
    (31, 'Carnet de Vacunación', 'Influenza', '2023-12-05', TRUE),
    (8, 'Informe Médico', 'Afección respiratoria', '2023-10-15', TRUE),
    (25, 'Certificado Médico', 'Examen general', '2024-09-22', TRUE),
    (1, 'Certificado Médico', 'Examen pre-empleo', '2024-06-10', TRUE),
    (16, 'Informe Médico', 'Alergias', '2024-05-28', TRUE),
    (22, 'Carnet de Vacunación', 'COVID-19', '2023-09-15', TRUE),
    (35, 'Certificado Médico', 'Examen deportivo', '2023-07-20', FALSE),
    (11, 'Informe Médico', 'Historial clínico', '2024-04-30', TRUE),
    (30, 'Certificado Médico', 'Examen general', '2024-08-05', TRUE),
    (2, 'Certificado Médico', 'Examen pre-empleo', '2024-05-02', TRUE),
    (7, 'Informe Médico', 'Afección cardíaca', '2024-09-15', TRUE),
    (29, 'Carnet de Vacunación', 'Influenza', '2023-12-15', TRUE),
    (13, 'Certificado Médico', 'Examen deportivo', '2023-06-28', FALSE),
    (26, 'Informe Médico', 'Alergias', '2024-03-12', TRUE),
    (3, 'Certificado Médico', 'Examen general', '2024-08-18', TRUE),
    (7, 'Certificado Médico', 'Examen pre-empleo', '2023-11-20', FALSE),
    (32, 'Informe Médico', 'Historial clínico', '2024-07-30', TRUE),
    (17, 'Certificado Médico', 'Examen general', '2023-10-22', TRUE),
    (10, 'Informe Médico', 'Afección respiratoria', '2024-04-18', TRUE),
    (20, 'Carnet de Vacunación', 'COVID-19', '2023-08-25', TRUE),
    (3, 'Certificado Médico', 'Examen deportivo', '2024-02-15', FALSE),
    (32, 'Informe Médico', 'Alergias', '2023-11-30', TRUE),
    (15, 'Certificado Médico', 'Examen general', '2024-09-08', TRUE),
    (36, 'Informe Médico', 'Afección cardíaca', '2023-12-05', TRUE);

INSERT INTO REVIEWS (ID_Socio, ID_Sede, ID_Profesor, ID_Clase, Calificacion, Comentarios, FechaReview) VALUES
    (5, 3, 10, 2, 9, 'Excelente profesor, muy recomendado.', '2023-07-15'),
    (12, 8, NULL, NULL, 7, NULL, '2023-07-21'),
    (27, 5, 20, 1, 8, 'Buena clase, pero la sede podría mejorar.', '2023-07-18'),
    (9, 1, NULL, NULL, 6, 'Más ejemplos prácticos serían útiles.', '2023-07-11'),
    (18, NULL, 5, 3, 10, 'El profesor es increíble, aprendí mucho.', '2023-07-20'),
    (4, 6, 15, 1, 7, 'Clase aceptable, pero la sede no estaba bien acondicionada.', '2023-07-25'),
    (31, 9, NULL, NULL, 8, 'Me gustó mucho la clase, el profesor fue claro.', '2023-07-14'),
    (8, NULL, 19, 6, 9, 'Muy buena clase, el profesor es experto en el tema.', '2023-07-19'),
    (25, 2, 11, 7, 6, NULL, '2023-07-17'),
    (1, 4, 6, 8, 9, 'Gran profesor y excelente ambiente en la sede.', '2023-07-13'),
    (16, 7, NULL, NULL, 8, 'La sede está bien ubicada, pero la clase podría ser más dinámica.', '2023-07-12'),
    (22, 10, 25, 4, 7, 'El profesor tiene buen conocimiento, pero podría explicar mejor.', '2023-07-26'),
    (35, 3, 22, 2, 5, 'No me gustó la clase, el profesor no estaba preparado.', '2023-07-29'),
    (11, 8, NULL, NULL, 8, 'Clase interesante, pero la sede podría ser más cómoda.', '2023-07-22'),
    (30, 5, 17, 1, 9, 'Recomendaría esta clase y profesor.', '2023-07-16'),
    (2, 1, NULL, NULL, 7, NULL, '2023-07-24'),
    (7, NULL, 3, 3, 6, 'El profesor no explicó bien algunos conceptos.', '2023-07-30'),
    (29, 6, 18, 1, 8, 'Buena clase, el profesor es amigable y paciente.', '2023-07-23'),
    (13, 9, NULL, NULL, 9, 'La sede es moderna y bien equipada, clase muy instructiva.', '2023-07-27'),
    (26, 2, 13, 7, 6, NULL, '2023-07-28'),
    (3, 4, 8, 8, 9, 'El profesor es motivador y explica de forma clara.', '2023-07-10'),
    (7, 8, NULL, NULL, 7, 'La sede es amplia, pero la clase podría ser más práctica.', '2023-07-09'),
    (32, 9, NULL, NULL, 6, 'No quedé satisfecho con la clase, el profesor no me entendía.', '2023-07-08'),
    (17, 3, 12, 2, 8, 'El profesor es muy conocedor, la sede necesita más estacionamiento.', '2023-07-07'),
    (10, 5, 7, 1, 7, 'La clase fue buena, pero la sede podría tener más comodidades.', '2023-07-06'),
    (20, 10, 24, 4, 9, 'El profesor es excelente, recomendaría esta clase.', '2023-07-05'),
    (3, 6, 21, 1, 5, 'No me gustó la clase, el profesor se distrajo mucho.', '2023-07-04'),
    (32, 9, NULL, NULL, 8, 'La clase y el profesor fueron muy buenos.', '2023-07-03'),
    (15, 3, 16, 2, 7, 'El profesor explica bien, pero la sede podría mejorar.', '2023-07-02'),
    (36, 8, NULL, NULL, 9, 'Clase excelente, el profesor es muy paciente.', '2023-07-01'),
    (1, 5, 9, 1, 6, 'No me gustó la clase, el profesor no tenía experiencia.', '2023-07-30'),
    (2, NULL, 23, 6, 8, 'Buena clase, el profesor tiene buenos ejemplos.', '2023-07-29'),
    (10, 2, 14, 1, 7, 'El profesor fue claro, pero la sede estaba un poco sucia.', '2023-07-28'),
    (5, 4, NULL, NULL, 9, 'Clase interesante y amena.', '2023-07-27'),
    (8, 6, 1, 8, 10, 'Excelente profesor y la sede tiene buenos espacios.', '2023-07-26'),
    (25, 9, NULL, NULL, 7, 'Buena clase, pero la sede podría estar mejor ubicada.', '2023-07-25'),
    (12, 3, 4, 2, 8, 'El profesor es atento, pero la sede necesita más iluminación.', '2023-07-24'),
    (6, 5, NULL, NULL, 7, 'La sede es cómoda, pero la clase podría ser más dinámica.', '2023-07-23'),
    (21, 10, 25, 5, 6, 'No me gustó la clase, el profesor no explica bien.', '2023-07-22'),
    (14, 2, NULL, NULL, 9, 'Buena clase, el profesor es muy dedicado.', '2023-07-21');