USE [dbExamen]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmpleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_UpdateEmpleado]
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerDatosEmpleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_ObtenerDatosEmpleado]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaEmpleadoRol]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_InsertaEmpleadoRol]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaEmpleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_InsertaEmpleado]
GO
/****** Object:  StoredProcedure [dbo].[sp_GrabarEmpleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_GrabarEmpleado]
GO
/****** Object:  StoredProcedure [dbo].[sp_GrabaNomina]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_GrabaNomina]
GO
/****** Object:  StoredProcedure [dbo].[sp_GrabaMovimientosEmpleados]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_GrabaMovimientosEmpleados]
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerarNomina]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_GenerarNomina]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TbMovimientosEmpleados]') AND type in (N'U'))
ALTER TABLE [dbo].[TbMovimientosEmpleados] DROP CONSTRAINT IF EXISTS [FK_TbMovimientosEmpleados_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmpleadoRol]') AND type in (N'U'))
ALTER TABLE [dbo].[EmpleadoRol] DROP CONSTRAINT IF EXISTS [FK_EmpleadoRol_TbRolTrabajador]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmpleadoRol]') AND type in (N'U'))
ALTER TABLE [dbo].[EmpleadoRol] DROP CONSTRAINT IF EXISTS [FK_EmpleadoRol_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmpleadoPercepcion]') AND type in (N'U'))
ALTER TABLE [dbo].[EmpleadoPercepcion] DROP CONSTRAINT IF EXISTS [FK_EmpleadoPercepcion_Percepciones]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmpleadoPercepcion]') AND type in (N'U'))
ALTER TABLE [dbo].[EmpleadoPercepcion] DROP CONSTRAINT IF EXISTS [FK_EmpleadoPercepcion_Empleado1]
GO
/****** Object:  Table [dbo].[TbRolTrabajador]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP TABLE IF EXISTS [dbo].[TbRolTrabajador]
GO
/****** Object:  Table [dbo].[TbMovimientosEmpleados]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP TABLE IF EXISTS [dbo].[TbMovimientosEmpleados]
GO
/****** Object:  Table [dbo].[Nomina]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Nomina]
GO
/****** Object:  Table [dbo].[EmpleadoRol]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP TABLE IF EXISTS [dbo].[EmpleadoRol]
GO
/****** Object:  Table [dbo].[EmpleadoPercepcion]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP TABLE IF EXISTS [dbo].[EmpleadoPercepcion]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Empleado]
GO
/****** Object:  Table [dbo].[ConfiguracionPercepciones]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP TABLE IF EXISTS [dbo].[ConfiguracionPercepciones]
GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenerBonoPorRol]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP FUNCTION IF EXISTS [dbo].[fnObtenerBonoPorRol]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculaISR]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP FUNCTION IF EXISTS [dbo].[fnCalculaISR]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculaExcedenteSalarial]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP FUNCTION IF EXISTS [dbo].[fnCalculaExcedenteSalarial]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculaDespensa]    Script Date: 17/10/2022 11:45:56 p. m. ******/
DROP FUNCTION IF EXISTS [dbo].[fnCalculaDespensa]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculaDespensa]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Gilberto>
-- Create date: <12/10/2022>
-- Description:	<Calcular Descuento por Excedente Salarial>
-- =============================================
create FUNCTION [dbo].[fnCalculaDespensa]
(
	 @Salario float,
	 @Porcentaje int
)
RETURNS float
AS
BEGIN
declare @MontoCalculado float = 0.0;
 
	 set  @MontoCalculado = @Salario * (Cast(@Porcentaje as float) / Cast(100 as float)) ;
	 
	 RETURN @MontoCalculado;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculaExcedenteSalarial]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Gilberto>
-- Create date: <12/10/2022>
-- Description:	<Calcular Descuento por Excedente Salarial>
-- =============================================
create FUNCTION [dbo].[fnCalculaExcedenteSalarial]
(
	 @Monto float,
	 @TopeSalario float,
	 @Porcentaje int
)
RETURNS float
AS
BEGIN
declare @MontoCalculado float = 0.0;
if @Monto >@TopeSalario

	 set  @MontoCalculado = @Monto * (Cast(@Porcentaje as float) / Cast(100 as float)) ;
	 
	 RETURN @MontoCalculado;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculaISR]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Gilberto>
-- Create date: <12/10/2022>
-- Description:	<Calcular ISR>
-- =============================================
CREATE FUNCTION [dbo].[fnCalculaISR]
(
	 @Monto float,
	 @Porcentaje int
)
RETURNS float
AS
BEGIN
declare @MontoCalculado float;
	 set  @MontoCalculado = @Monto * (Cast(@Porcentaje as float) / Cast(100 as float)) ;
	 
	 RETURN @MontoCalculado;
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenerBonoPorRol]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Gilberto>
-- Create date: <12/10/2022>
-- Description:	<Calcular Descuento por Excedente Salarial>
-- =============================================
create FUNCTION [dbo].[fnObtenerBonoPorRol]
(
	 @IdRol int
)
RETURNS int
AS
BEGIN
declare @MontoBono int;
 
 select @MontoBono = Bonohora from [dbo].[TbRolTrabajador]  where id = @IdRol
	 
	 
	 RETURN @MontoBono;
END
GO
/****** Object:  Table [dbo].[ConfiguracionPercepciones]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfiguracionPercepciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Sueldobase] [float] NULL,
	[Pagorecorrido] [float] NULL,
	[PorcentajeIsr] [int] NULL,
	[TopeSalario] [float] NULL,
	[PorcentajeTope] [int] NULL,
	[PorcentajeValeDespensa] [int] NULL,
	[SemanaPorMes] [int] NULL,
	[Activo] [bit] NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_Percepciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[NumeroEmpleado] [nvarchar](10) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoPercepcion]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoPercepcion](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[idPercepcion] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpleadoRol]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadoRol](
	[IdEmpleado] [int] NOT NULL,
	[Activo] [bit] NULL,
	[IdRol] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nomina]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nomina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_Empleado] [int] NULL,
	[idPercepcion] [int] NULL,
	[TotalSueldo] [float] NULL,
	[TotalSR] [float] NULL,
	[TotalDescuentoTopeS] [float] NULL,
	[TotalDespensa] [float] NULL,
	[TotalRecorrido] [int] NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_Nomina] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbMovimientosEmpleados]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbMovimientosEmpleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[FechaMovimiento] [date] NOT NULL,
	[CantidadEntregas] [int] NOT NULL,
	[Id_Rol] [int] NOT NULL,
 CONSTRAINT [PK_TbMovimientosEmpleados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbRolTrabajador]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbRolTrabajador](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RolNombre] [nvarchar](50) NULL,
	[Bonohora] [float] NULL,
 CONSTRAINT [PK_TbRolTrabajador] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ConfiguracionPercepciones] ON 

INSERT [dbo].[ConfiguracionPercepciones] ([id], [Sueldobase], [Pagorecorrido], [PorcentajeIsr], [TopeSalario], [PorcentajeTope], [PorcentajeValeDespensa], [SemanaPorMes], [Activo], [fecha]) VALUES (1, 30, 5, 9, 10000, 3, 4, 6, 1, NULL)
SET IDENTITY_INSERT [dbo].[ConfiguracionPercepciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (6, N'Jesus Gomes', N'00001')
INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (7, N'Felipe Reyes M', N'00025')
INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (8, N'''Esther Muñoz''', N'''00002''')
INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (9, N'Emiliano Zentella', N'00003')
INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (10, N'Jorge Ricardez', N'00004')
INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (11, N'Nuevo Usuario', N'00005')
INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (15, N'0', N'1')
INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (16, N'0', N'1')
INSERT [dbo].[Empleado] ([Id], [Nombre], [NumeroEmpleado]) VALUES (17, N'Malaquias LowHigth', N'00006')
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (6, 0, 1)
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (7, 0, 2)
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (6, 1, 2)
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (7, 0, 3)
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (7, 1, 1)
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (9, 1, 1)
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (10, 1, 3)
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (17, 1, 2)
INSERT [dbo].[EmpleadoRol] ([IdEmpleado], [Activo], [IdRol]) VALUES (11, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[TbMovimientosEmpleados] ON 

INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (1, 6, CAST(N'2022-11-10' AS Date), 10, 1)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (2, 6, CAST(N'2022-12-10' AS Date), 25, 1)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (6, 7, CAST(N'2022-12-10' AS Date), 15, 1)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (7, 6, CAST(N'2022-12-10' AS Date), 15, 2)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (8, 6, CAST(N'2022-10-13' AS Date), 15, 2)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (9, 7, CAST(N'2022-10-13' AS Date), 20, 1)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (10, 9, CAST(N'2022-10-13' AS Date), 500, 1)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (11, 10, CAST(N'2022-10-13' AS Date), 800, 3)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (12, 10, CAST(N'2022-10-12' AS Date), 900, 3)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (13, 10, CAST(N'2022-10-11' AS Date), 900, 3)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (14, 10, CAST(N'2022-10-11' AS Date), 900, 3)
INSERT [dbo].[TbMovimientosEmpleados] ([id], [IdEmpleado], [FechaMovimiento], [CantidadEntregas], [Id_Rol]) VALUES (15, 17, CAST(N'2022-10-15' AS Date), 900, 2)
SET IDENTITY_INSERT [dbo].[TbMovimientosEmpleados] OFF
GO
SET IDENTITY_INSERT [dbo].[TbRolTrabajador] ON 

INSERT [dbo].[TbRolTrabajador] ([Id], [RolNombre], [Bonohora]) VALUES (1, N'Cofere', 10)
INSERT [dbo].[TbRolTrabajador] ([Id], [RolNombre], [Bonohora]) VALUES (2, N'Cargador', 5)
INSERT [dbo].[TbRolTrabajador] ([Id], [RolNombre], [Bonohora]) VALUES (3, N'Auxiliar', 0)
SET IDENTITY_INSERT [dbo].[TbRolTrabajador] OFF
GO
ALTER TABLE [dbo].[EmpleadoPercepcion]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoPercepcion_Empleado1] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[EmpleadoPercepcion] CHECK CONSTRAINT [FK_EmpleadoPercepcion_Empleado1]
GO
ALTER TABLE [dbo].[EmpleadoPercepcion]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoPercepcion_Percepciones] FOREIGN KEY([idPercepcion])
REFERENCES [dbo].[ConfiguracionPercepciones] ([id])
GO
ALTER TABLE [dbo].[EmpleadoPercepcion] CHECK CONSTRAINT [FK_EmpleadoPercepcion_Percepciones]
GO
ALTER TABLE [dbo].[EmpleadoRol]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoRol_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[EmpleadoRol] CHECK CONSTRAINT [FK_EmpleadoRol_Empleado]
GO
ALTER TABLE [dbo].[EmpleadoRol]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoRol_TbRolTrabajador] FOREIGN KEY([IdRol])
REFERENCES [dbo].[TbRolTrabajador] ([Id])
GO
ALTER TABLE [dbo].[EmpleadoRol] CHECK CONSTRAINT [FK_EmpleadoRol_TbRolTrabajador]
GO
ALTER TABLE [dbo].[TbMovimientosEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_TbMovimientosEmpleados_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[TbMovimientosEmpleados] CHECK CONSTRAINT [FK_TbMovimientosEmpleados_Empleado]
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerarNomina]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GenerarNomina](@NumeroMes int) 
AS

BEGIN
 DECLARE @idPercepcion           INT,
        @TotalSueldo            FLOAT,
        @TotalSR                FLOAT,
        @TotalDescuentoTopeS    FLOAT,
        @TotalDespensa          FLOAT,
        @TotalRecorrido         INT,
        @Sueldobase             FLOAT,
        @Pagorecorrido          FLOAT,
        @PorcentajeIsr          INT,
        @TopeSalario            FLOAT,
        @PorcentajeTope         INT,
        @PorcentajeValeDespensa INT,
        @SemanaPorMes           INT;

SELECT @Sueldobase = sueldobase,
       @Pagorecorrido = pagorecorrido,
       @PorcentajeIsr = porcentajeisr,
       @TopeSalario = topesalario,
       @PorcentajeTope = porcentajetope,
       @PorcentajeValeDespensa = porcentajevaledespensa
FROM   dbo.configuracionpercepciones
WHERE  activo = 1;

WITH tb1
     AS (SELECT Count(*) TotalDias, (( Count(*) * @Sueldobase ) * 8) + ( (dbo.Fnobtenerbonoporrol(ER.idrol) * 8) *  Count(*)  ) + (Sum(TME.cantidadentregas) * @Pagorecorrido ) AS Salario,
                IdRol, Sum(TME.cantidadentregas)   CantidadEntregas, E.nombre, E.numeroempleado
         FROM   dbo.tbmovimientosempleados TME
                INNER JOIN dbo.empleado E
                        ON TME.idempleado = E.id
                INNER JOIN dbo.empleadorol ER
                        ON E.id = ER.idempleado
                           AND ER.activo = 1
		 WHERE Month(TME.FechaMovimiento) = @NumeroMes
         GROUP  BY E.nombre,
                   E.numeroempleado,
                   idrol)
SELECT tb1.Nombre,tb1.IdRol,tb1.NumeroEmpleado,tb1.CantidadEntregas,tb1.Salario,tb1.TotalDias,
       [dbo].[Fncalculadespensa](tb1.salario, @PorcentajeValeDespensa)TotalDespensa,
	   dbo.Fncalculaisr(tb1.salario, @PorcentajeIsr) ISR,
	   dbo.Fncalculaexcedentesalarial(tb1.salario, @TopeSalario, @PorcentajeTope)DescuentoExcedenteSalario
FROM   tb1 

End
GO
/****** Object:  StoredProcedure [dbo].[sp_GrabaMovimientosEmpleados]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GrabaMovimientosEmpleados](@IdEmpleado int, @FechaMovimiento date,
				@CantidadEntregas int)                
AS

BEGIN
	BEGIN TRY
	Declare @Id_Rol INT;
	SELECT @Id_Rol = IdRol from [dbo].[EmpleadoRol] where IdEmpleado = @IdEmpleado and Activo = 1;

		Begin TRAN InsertMovimiento
 
		INSERT INTO [dbo].[TbMovimientosEmpleados]
				   ([IdEmpleado]
				   ,[FechaMovimiento]
				   ,[CantidadEntregas]
				   ,[Id_Rol])
			 VALUES
				   (@IdEmpleado,@FechaMovimiento,@CantidadEntregas,@Id_Rol)
  
		COMMIT TRAN	InsertMovimiento

	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT ERROR_MESSAGE()
	END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GrabaNomina]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GrabaNomina](@id int,
						   @id_Empleado int
						   ,@idPercepcion int
						   ,@TotalSueldo float
						   ,@TotalSR float
						   ,@TotalDescuentoTopeS float
						   ,@TotalDespensa float
						   ,@TotalRecorrido int
						   ,@Fecha datetime)                
AS

BEGIN
	BEGIN TRY
		Begin TRAN
 

				INSERT INTO [dbo].[Nomina]
						   ([id_Empleado]
						   ,[idPercepcion]
						   ,[TotalSueldo]
						   ,[TotalSR]
						   ,[TotalDescuentoTopeS]
						   ,[TotalDespensa]
						   ,[TotalRecorrido]
						   ,[Fecha])
					 VALUES
						   (@id_Empleado
						   ,@idPercepcion
						   ,@TotalSueldo
						   ,@TotalSR
						   ,@TotalDescuentoTopeS
						   ,@TotalDespensa
						   ,@TotalRecorrido
						   ,@Fecha);
		COMMIT TRAN	

	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT ERROR_MESSAGE()
	END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GrabarEmpleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GrabarEmpleado](@Nombre nvarchar(100),
				  @NumeroEmpleado nvarchar(10), @RolId int)                
AS
	
BEGIN
DECLARE @Id_new INT;
		BEGIN TRY
		Begin TRAN
			exec [dbo].[sp_InsertaEmpleado] @Nombre, @NumeroEmpleado,@RolId, @Id_nuevo = @Id_new OUTPUT;

			exec [dbo].[sp_InsertaEmpleadoRol] @Id_new, @RolId;
 
		COMMIT TRAN	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaEmpleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertaEmpleado](@Nombre nvarchar(100),
				  @NumeroEmpleado nvarchar(10), @IdRol int,  @Id_nuevo INT OUTPUT)                
AS

BEGIN
	BEGIN TRY

	
 
			INSERT INTO [dbo].[Empleado]
					   ([Nombre],					    
					   [NumeroEmpleado])
				 VALUES
					   (@Nombre,@NumeroEmpleado);
			 SELECT @Id_nuevo = @@IDENTITY;  
			
			--exec [dbo].[sp_InsertaEmpleadoRol] @Id_nuevo, @IdRol

		

	END TRY
	BEGIN CATCH
		
		PRINT ERROR_MESSAGE()
	END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaEmpleadoRol]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertaEmpleadoRol](@IdEmpleado int,
				 @IdRol int)                
AS

BEGIN
	BEGIN TRY


 
			INSERT INTO [dbo].[EmpleadoRol]
					   ([IdEmpleado]
					   ,[IdRol]
					   ,Activo
					   )
				 VALUES
					   (@IdEmpleado, @IdRol,1)
 
	END TRY
	BEGIN CATCH
	
		PRINT ERROR_MESSAGE()
	END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerDatosEmpleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerDatosEmpleado](@NumeroEmpleado varchar(10))
AS

BEGIN

--exec [dbo].[sp_ObtenerDatosEmpleado] '00001'

select E.*, ER.IdRol from dbo.empleado  E
	inner join [dbo].[EmpleadoRol] ER on E.id = ER.Idempleado and ER.Activo = 1
where  [NumeroEmpleado] = @NumeroEmpleado

End
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmpleado]    Script Date: 17/10/2022 11:45:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateEmpleado](@Nombre nvarchar(100),
				  @NumeroEmpleado nvarchar(10),@idRol int,  @IdEmpleado int)                
AS

BEGIN
	BEGIN TRY
		Begin TRAN TRUpdate

		if EXISTS(SELECT * FROM dbo.Empleado where id = @IdEmpleado)		
		begin
			
			update dbo.Empleado set Nombre = @Nombre where Id = @IdEmpleado;
		

			if Not exists (select IdRol from dbo.empleadoRol WITH (NOLOCK) where IdEmpleado = @IdEmpleado and IdRol = @idRol)
				begin
				update [dbo].[EmpleadoRol] set Activo = 0 where   IdEmpleado = @IdEmpleado;
				exec [dbo].[sp_InsertaEmpleadoRol] @IdEmpleado, @idRol;
				end
			else
				begin
				update [dbo].[EmpleadoRol] set Activo = 0 where   IdEmpleado = @IdEmpleado;
				update [dbo].[EmpleadoRol] set Activo = 1 where   IdEmpleado = @IdEmpleado and IdRol = @idRol;
			
				end

		end
 	  
	COMMIT TRAN TRUpdate

	END TRY
	BEGIN CATCH
		ROLLBACK;
		PRINT ERROR_MESSAGE()
	END CATCH
End
GO
