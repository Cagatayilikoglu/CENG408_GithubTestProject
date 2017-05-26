USE [master]
GO
/****** Object:  Database [RequestTrackkingSystem]    Script Date: 15.5.2017 12:08:54 ******/
CREATE DATABASE [RequestTrackkingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RequestTrackkingSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RequestTrackkingSystem.mdf' , SIZE = 104448KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RequestTrackkingSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RequestTrackkingSystem_log.ldf' , SIZE = 241216KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RequestTrackkingSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RequestTrackkingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RequestTrackkingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RequestTrackkingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RequestTrackkingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RequestTrackkingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RequestTrackkingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RequestTrackkingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [RequestTrackkingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [RequestTrackkingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RequestTrackkingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RequestTrackkingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RequestTrackkingSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RequestTrackkingSystem', N'ON'
GO
USE [RequestTrackkingSystem]
GO
/****** Object:  User [orbis_demo]    Script Date: 15.5.2017 12:08:54 ******/
CREATE USER [orbis_demo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [KTLP]    Script Date: 15.5.2017 12:08:54 ******/
CREATE SCHEMA [KTLP]
GO
/****** Object:  Schema [ORT]    Script Date: 15.5.2017 12:08:54 ******/
CREATE SCHEMA [ORT]
GO
/****** Object:  Schema [PRG]    Script Date: 15.5.2017 12:08:54 ******/
CREATE SCHEMA [PRG]
GO
/****** Object:  Schema [SKRT]    Script Date: 15.5.2017 12:08:54 ******/
CREATE SCHEMA [SKRT]
GO
/****** Object:  Schema [TLMT]    Script Date: 15.5.2017 12:08:54 ******/
CREATE SCHEMA [TLMT]
GO
/****** Object:  Schema [TLP]    Script Date: 15.5.2017 12:08:54 ******/
CREATE SCHEMA [TLP]
GO
/****** Object:  Schema [ZYRT]    Script Date: 15.5.2017 12:08:54 ******/
CREATE SCHEMA [ZYRT]
GO
/****** Object:  FullTextCatalog [test]    Script Date: 15.5.2017 12:08:54 ******/
CREATE FULLTEXT CATALOG [test]WITH ACCENT_SENSITIVITY = ON

GO
/****** Object:  StoredProcedure [dbo].[KisiSenksonizayon]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[KisiSenksonizayon]

@gorevtemizlensin bit,
@iletisimtemizlensin bit


AS
BEGIN

	SET NOCOUNT ON;

  DECLARE @ID int  ,
	@TCK nvarchar(11) ,
	@Adsoyad nvarchar(250) ,
	@DogumTarihi datetime ,
	@Cinsiyet int ,
	@MedeniDurum int ,
	@SicilNo nvarchar(50) ,
	@Eposta nvarchar(50) ,
	@Aciklama nvarchar(250) ,
	@EgitimDurumu int ,
	@Telefon1 nvarchar(11) ,
	@Telefon1Aciklama nvarchar(50) ,
	@Telefon2 nvarchar(11) ,
	@Telefon2Aciklama nvarchar(50) ,
	@Telefon3 nvarchar(11) ,
	@Telefon3Aciklama nvarchar(50) ,
	@Telefon4 nvarchar(11) ,
	@Telefon4Aciklama nvarchar(50) ,
	@GorevKategoriID int ,
	@GorevIl int ,
	@GorevIlce int ,
	@GorevAciklama nvarchar(250),
	@KisiID int




DECLARE CRS_PERSONEL CURSOR FOR
SELECT top 100 [ID]
      ,[TCK]
      ,[Adsoyad]
      ,[DogumTarihi]
      ,[Cinsiyet]
      ,[MedeniDurum]
      ,[SicilNo]
      ,[Eposta]
      ,[Aciklama]
      ,[EgitimDurumu]
      ,[Telefon1]
      ,[Telefon1Aciklama]
      ,[Telefon2]
      ,[Telefon2Aciklama]
      ,[Telefon3]
      ,[Telefon3Aciklama]
	  ,[Telefon4]
      ,[Telefon4Aciklama]
      ,[GorevKategoriID]
      ,[GorevIl]
      ,[GorevIlce]
      ,[GorevAciklama]
  FROM [RequestTrackkingSystem].[ORT].[tbl_KisiSenkronizasyon] 

OPEN CRS_PERSONEL

FETCH NEXT FROM CRS_PERSONEL INTO @ID
      ,@TCK
      ,@Adsoyad
      ,@DogumTarihi
      ,@Cinsiyet
      ,@MedeniDurum
      ,@SicilNo
      ,@Eposta
      ,@Aciklama
      ,@EgitimDurumu
      ,@Telefon1
      ,@Telefon1Aciklama
      ,@Telefon2
      ,@Telefon2Aciklama
      ,@Telefon3
      ,@Telefon3Aciklama
	   ,@Telefon4
      ,@Telefon4Aciklama
      ,@GorevKategoriID
      ,@GorevIl
      ,@GorevIlce
      ,@GorevAciklama

WHILE @@FETCH_STATUS=0
	BEGIN
	set @KisiID=0
	--set @KisiID=isnull(@KisiID,0)
	set @TCK =isnull(@TCK,'')
	set @Telefon1=ISNULL(@Telefon1,'')
	set @Telefon2=ISNULL(@Telefon2,'')
	set @Telefon3=ISNULL(@Telefon3,'')
	set @Telefon4=ISNULL(@Telefon4,'')
	set @GorevKategoriID=ISNULL( @GorevKategoriID,0)
	
	
	select @KisiID
if(len(@TCK)>0 and @KisiID=0 and  exists(select * from [RequestTrackkingSystem].ORT.tbl_Kisi k where k.TCK=@TCK)) -- tck ile denedik 
begin

select @TCK
set @KisiID=(select top 1 ID  from [RequestTrackkingSystem].ORT.tbl_Kisi k where k.TCK=@TCK)

end

if(len(@Telefon1)>0 and @KisiID=0 and  exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon k where k.Numara=@Telefon1)) -- telefon1 ile denedik 
begin

select @Telefon1
			if(exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt left outer join [RequestTrackkingSystem].ORT.tbl_Kisi k on k.ID=kt.KisiID where k.ID is not null and  kt.Numara=@Telefon1 and k.AdSoyad=@Adsoyad ))
			begin

			set @KisiID=(select top 1 k.ID from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt left outer join [RequestTrackkingSystem].ORT.tbl_Kisi k on k.ID=kt.KisiID	where k.ID is not null and  kt.Numara=@Telefon1 and k.AdSoyad=@Adsoyad )
			end
end
select @Telefon2+' ***' 
select @KisiID
if(len(@Telefon2)>0  and @KisiID=0 and  exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon k where k.Numara=@Telefon2)) -- telefon2 ile denedik 
begin
select @Telefon2
			if(exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt left outer join [RequestTrackkingSystem].ORT.tbl_Kisi k on k.ID=kt.KisiID where k.ID is not null and  kt.Numara=@Telefon2 and k.AdSoyad=@Adsoyad ))
			begin

			set @KisiID=(select top 1 k.ID from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt left outer join [RequestTrackkingSystem].ORT.tbl_Kisi k on k.ID=kt.KisiID	where k.ID is not null and  kt.Numara=@Telefon2 and k.AdSoyad=@Adsoyad )
			end
end

if(len(@Telefon3)>0 and @KisiID=0 and  exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon k where k.Numara=@Telefon3)) -- telefon3 ile denedik 
begin
select @Telefon3
			if(exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt left outer join [RequestTrackkingSystem].ORT.tbl_Kisi k on k.ID=kt.KisiID where k.ID is not null and  kt.Numara=@Telefon3 and k.AdSoyad=@Adsoyad ))
			begin

			set @KisiID=(select top 1 k.ID from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt left outer join [RequestTrackkingSystem].ORT.tbl_Kisi k on k.ID=kt.KisiID	where k.ID is not null and  kt.Numara=@Telefon3 and k.AdSoyad=@Adsoyad )
			end
end
if(len(@Telefon4)>0 and @KisiID=0 and  exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon k where k.Numara=@Telefon4)) -- telefon3 ile denedik 
begin
select @Telefon4
			if(exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt left outer join [RequestTrackkingSystem].ORT.tbl_Kisi k on k.ID=kt.KisiID where k.ID is not null and  kt.Numara=@Telefon4 and k.AdSoyad=@Adsoyad ))
			begin

			set @KisiID=(select top 1 k.ID from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt left outer join [RequestTrackkingSystem].ORT.tbl_Kisi k on k.ID=kt.KisiID	where k.ID is not null and  kt.Numara=@Telefon4 and k.AdSoyad=@Adsoyad )
			end
end


if(@KisiID=0)
begin
select 'insert yapýlýyor'
declare @IdentityOutput table ( ID int )

 INSERT  [ORT].[tbl_Kisi]
           ([AdSoyad]
           ,[TCK]
           ,[DogumTarihi]
           ,[Cinsiyet]
           ,[MedeniDurum]
           ,[IslemKulID]
           ,[EklenmeTarihi]
           ,[SicilNo]
           ,[EPosta]
           ,[Aciklama]
           ,[EgitimDurumu])
		   output inserted.ID into  @IdentityOutput
     VALUES
           (@Adsoyad
           ,@TCK
           ,@DogumTarihi
           ,isnull(@Cinsiyet,0)
           ,isnull(@MedeniDurum,0)
           ,1
           ,getdate()
           ,@SicilNo
           ,@Eposta
           ,@Aciklama
           ,@EgitimDurumu
		   )

		  set @KisiID=(select top 1 ID from @IdentityOutput)

		  delete from @IdentityOutput
		
		  select 'insert sonrasý KisiID='+CONVERT(nvarchar,@KisiID)


end
else if(@KisiID>0)
begin
select 'update  yapýlýyor'

update [RequestTrackkingSystem].ORT.tbl_Kisi
set TCK=case when TCK is null then @TCK else TCK end,
 AdSoyad=case when AdSoyad is null then @AdSoyad else AdSoyad end,
   DogumTarihi=case when DogumTarihi is null then @DogumTarihi else DogumTarihi end,
    Cinsiyet=case when Cinsiyet is null or Cinsiyet=0 then isnull(@Cinsiyet,0) else Cinsiyet end,
	  MedeniDurum=case when MedeniDurum is null or MedeniDurum=0 then isnull(@MedeniDurum,0) else MedeniDurum end,
	    SicilNo=case when SicilNo is null then @SicilNo else SicilNo end,
		  EPosta=case when EPosta is null then @Eposta else EPosta end,
		    EgitimDurumu=case when EgitimDurumu is null or EgitimDurumu=0 then isnull(@EgitimDurumu,0) else EgitimDurumu end,
			  Aciklama=case when Aciklama is null then @Aciklama else Aciklama end
where ID=@KisiID
  select 'update sonrasý KisiID='+CONVERT(nvarchar,@KisiID)
end
--bu noktadan sonra artýk elimizde kesinlikle bir @kisiID bulunuyor

if(@KisiID is null or @KisiID<=0)
begin
select 'kisiID tanýmsýz olduðundan iþlem iptal'
return

end



if(@gorevtemizlensin=1) -- görevler temizlensin
begin
delete from [RequestTrackkingSystem].ORT.tbl_KisiGorev where KisiID=@KisiID
end
if(@iletisimtemizlensin=1) --telefonlar temizlensin
begin
delete from [RequestTrackkingSystem].ORT.tbl_KisiTelefon where KisiID=@KisiID
end

if(len(@Telefon1)>0 and not exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt where kt.KisiID=@KisiID and  kt.Numara=@Telefon1))
begin

INSERT INTO [ORT].[tbl_KisiTelefon]
           ([KisiID]
           ,[Numara]
           ,[isVarsayilan]
           ,[isMobile]
           ,[Aciklama])
     VALUES
           (@KisiID
           ,@Telefon1
           ,0
           ,0
           ,@Telefon1Aciklama)
end
else if(len(@Telefon1)>0) --telefon hala null deðilse ilgili bir kayýt vardýr ve açýklamasý güncellenebilir 
begin

update kt 
set kt.Aciklama=(case when kt.Aciklama is null then @Telefon1Aciklama else kt.Aciklama end)
 from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt where kt.KisiID=@KisiID and  kt.Numara=@Telefon1

end
if(len(@Telefon2)>0 and not exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt where kt.KisiID=@KisiID and kt.Numara=@Telefon2))
begin

INSERT INTO [ORT].[tbl_KisiTelefon]
           ([KisiID]
           ,[Numara]
           ,[isVarsayilan]
           ,[isMobile]
           ,[Aciklama])
     VALUES
           (@KisiID
           ,@Telefon2
           ,0
           ,0
           ,@Telefon2Aciklama)
end
else if(len(@Telefon2)>0) --telefon hala null deðilse ilgili bir kayýt vardýr ve açýklamasý güncellenebilir 
begin

update kt 
set kt.Aciklama=case when kt.Aciklama is null then @Telefon2Aciklama else kt.Aciklama end
 from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt where kt.KisiID=@KisiID and  kt.Numara=@Telefon2

end
if(len(@Telefon3)>0 and not exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt where kt.KisiID=@KisiID and kt.Numara=@Telefon3))
begin

INSERT INTO [ORT].[tbl_KisiTelefon]
           ([KisiID]
           ,[Numara]
           ,[isVarsayilan]
           ,[isMobile]
           ,[Aciklama])
     VALUES
           (@KisiID
           ,@Telefon3
           ,0
           ,0
           ,@Telefon3Aciklama)
end
else if(len(@Telefon3)>0) --telefon hala null deðilse ilgili bir kayýt vardýr ve açýklamasý güncellenebilir 
begin

update kt 
set kt.Aciklama=(case when kt.Aciklama is null then @Telefon3Aciklama else kt.Aciklama end)
 from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt where kt.KisiID=@KisiID and  kt.Numara=@Telefon3

end
if(len(@Telefon4)>0 and not exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt where kt.KisiID=@KisiID and kt.Numara=@Telefon4))
begin

INSERT INTO [ORT].[tbl_KisiTelefon]
           ([KisiID]
           ,[Numara]
           ,[isVarsayilan]
           ,[isMobile]
           ,[Aciklama])
     VALUES
           (@KisiID
           ,@Telefon4
           ,0
           ,0
           ,@Telefon4Aciklama)
end
else if(len(@Telefon4)>0) --telefon hala null deðilse ilgili bir kayýt vardýr ve açýklamasý güncellenebilir 
begin

update kt 
set kt.Aciklama=case when kt.Aciklama is null then @Telefon4Aciklama else kt.Aciklama end
 from [RequestTrackkingSystem].ORT.tbl_KisiTelefon kt where kt.KisiID=@KisiID and  kt.Numara=@Telefon4

end

if(@GorevKategoriID>0 and not exists(select * from [RequestTrackkingSystem].ORT.tbl_KisiGorev kg where kg.KisiID=@KisiID and kg.GorevKategoriID=@GorevKategoriID))
begin

INSERT INTO [ORT].[tbl_KisiGorev]
           ([Aciklama]
           ,[KisiID]
           ,[IlID]
           ,[IlceID]
           ,[isAktif]
           ,[GorevKategoriID]
           ,[isIlgili]
           ,[EklenmeTarihi])
     VALUES
           (@GorevAciklama
           ,@KisiID
           ,@GorevIl
           ,@GorevIlce
           ,1
           ,@GorevKategoriID
           ,0
           ,getdate())

end
else if(@GorevKategoriID>0)
begin

update kg
set [Aciklama]=case when [Aciklama] is null then @GorevAciklama else [Aciklama] end
 from [RequestTrackkingSystem].ORT.tbl_KisiGorev kg where kg.KisiID=@KisiID and kg.GorevKategoriID=@GorevKategoriID

end 

delete from [RequestTrackkingSystem].ORT.tbl_KisiSenkronizasyon where ID=@ID





		FETCH NEXT FROM CRS_PERSONEL INTO @ID
      ,@TCK
      ,@Adsoyad
      ,@DogumTarihi
      ,@Cinsiyet
      ,@MedeniDurum
      ,@SicilNo
      ,@Eposta
      ,@Aciklama
      ,@EgitimDurumu
      ,@Telefon1
      ,@Telefon1Aciklama
      ,@Telefon2
      ,@Telefon2Aciklama
      ,@Telefon3
      ,@Telefon3Aciklama
	   ,@Telefon4
      ,@Telefon4Aciklama
      ,@GorevKategoriID
      ,@GorevIl
      ,@GorevIlce
      ,@GorevAciklama
 
	END

CLOSE CRS_PERSONEL

DEALLOCATE CRS_PERSONEL
END



GO
/****** Object:  Table [dbo].[_Employee_Audit]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Employee_Audit](
	[Audit_Command] [varchar](20) NULL,
	[Audit_TimeStamp] [datetime] NULL,
	[Audit_SystemUser] [nvarchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[temp]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp](
	[x1] [nvarchar](250) NULL,
	[x2] [nvarchar](250) NULL,
	[x3] [nvarchar](50) NULL,
	[x4] [nvarchar](50) NULL,
	[x5] [nvarchar](50) NULL,
	[x6] [nvarchar](50) NULL,
	[x7] [nvarchar](50) NULL,
	[x8] [nvarchar](50) NULL,
	[x9] [nvarchar](50) NULL,
	[x10] [nvarchar](50) NULL,
	[x11] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [KTLP].[tbl_Kurum]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KTLP].[tbl_Kurum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](500) NOT NULL,
	[Adres] [nvarchar](max) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[SecimTur] [int] NOT NULL,
	[UstID] [int] NOT NULL,
	[SiraNo] [int] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Kurum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [KTLP].[tbl_KurumIlgiliKisi]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KTLP].[tbl_KurumIlgiliKisi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KisiID] [int] NOT NULL,
	[KurumID] [int] NOT NULL,
	[IlID] [int] NULL,
	[IlceID] [int] NULL,
	[Aciklama] [nvarchar](250) NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_KurumIlgiliKisi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [KTLP].[tbl_KurumsalTalep]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KTLP].[tbl_KurumsalTalep](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KurumID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NOT NULL,
	[IlID] [int] NULL,
	[IlceID] [int] NULL,
	[KategoriID] [int] NOT NULL,
	[IlgiliKisiID] [int] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[OncelikID] [int] NOT NULL,
	[DurumID] [int] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[GrupID] [int] NULL,
	[isDeleted] [bit] NOT NULL,
	[HatirlatmaTarihi] [datetime] NULL,
 CONSTRAINT [PK_tbl_KurumsalTalep] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [KTLP].[tbl_KurumsalTalepSurec]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KTLP].[tbl_KurumsalTalepSurec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KurumsalTalepID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[TurID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[IslemKulID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_KurumsalTalepSurec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [KTLP].[tbl_KurumsalTalepYetki]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KTLP].[tbl_KurumsalTalepYetki](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KTalepID] [int] NOT NULL,
	[GrupID] [int] NULL,
	[YetkiTurID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[EkleyenKullaniciID] [int] NOT NULL,
	[KullaniciID] [int] NULL,
	[SurecID] [int] NULL,
	[isAktif] [bit] NULL,
 CONSTRAINT [PK_tbl_KTalepYetki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Dokuman]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Dokuman](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IlgiliID] [int] NULL,
	[TurID] [int] NOT NULL,
	[DokumanAdi] [nvarchar](250) NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Boyut] [nvarchar](50) NOT NULL,
	[Uzanti] [nvarchar](50) NOT NULL,
	[Dosya] [text] NULL,
	[TalepID] [int] NULL,
	[TalepSurecID] [int] NULL,
	[ZiyaretID] [int] NULL,
	[ZiyaretSurecID] [int] NULL,
	[TalimatGorevID] [int] NULL,
	[KisiID] [int] NULL,
	[DosyaArsivID] [int] NULL,
 CONSTRAINT [PK_tbl_Dokuman] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_DosyaArsiv]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_DosyaArsiv](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[YetkiTurID] [int] NOT NULL,
	[isOncelikli] [bit] NOT NULL,
	[IlID] [int] NULL,
	[IlceID] [int] NULL,
 CONSTRAINT [PK_tbl_DosyaArsiv] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_DosyaArsivSurec]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_DosyaArsivSurec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DosyaArsivID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[IslemKulID] [int] NOT NULL,
	[SurecTurID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_DosyaArsivSurec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_DosyaArsivYetki]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_DosyaArsivYetki](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DosyaArsivID] [int] NOT NULL,
	[KullaniciID] [int] NULL,
	[GrupID] [int] NULL,
	[isAktif] [bit] NOT NULL,
	[DosyaArsivSurecID] [int] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_DosyaArsivYetki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Durum]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Durum](
	[ID] [int] NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[isSurec] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Durum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Duyuru]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Duyuru](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Aciklama] [nvarchar](max) NOT NULL,
	[SonTarih] [datetime] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Bildirim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_DuyuruYetki]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_DuyuruYetki](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DuyuruID] [int] NOT NULL,
	[GrupID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_BildirimYetki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_EgitimDurumu]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_EgitimDurumu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](150) NULL,
 CONSTRAINT [PK_tbl_Egitim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_ErrorLog]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ORT].[tbl_ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KulID] [int] NULL,
	[Aciklama] [varchar](max) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Baslik] [nvarchar](500) NOT NULL,
	[Url] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tbl_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ORT].[tbl_GelisYolu]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_GelisYolu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[TurID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_GelisYolu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_GorevKategori]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_GorevKategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](150) NOT NULL,
	[UstID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NULL,
	[SiraNo] [int] NULL,
	[SecimTur] [int] NULL,
	[Limit] [int] NULL,
	[Puan] [int] NULL,
	[GorunenIsim] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Birim] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_GorusOneri]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_GorusOneri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mesaj] [nvarchar](max) NOT NULL,
	[KulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[IlgiliMesajID] [int] NOT NULL,
	[isOkundu] [bit] NOT NULL,
	[Baslik] [nvarchar](250) NULL,
	[DokumanAdi] [nvarchar](250) NULL,
	[Dosya] [text] NULL,
 CONSTRAINT [PK_tbl_GorusOneri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Grup]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Grup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](250) NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[UstID] [int] NOT NULL,
	[SiraNo] [int] NULL,
	[YetkiNo] [nvarchar](10) NULL,
 CONSTRAINT [PK_tbl_Grup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_GrupOrtak]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_GrupOrtak](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GrupKendi] [int] NOT NULL,
	[GrupKarsi] [int] NOT NULL,
 CONSTRAINT [PK_tbl_GrupOrtak] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_GrupRol]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_GrupRol](
	[GrupID] [int] NOT NULL,
	[RolID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_KullaniciRol] PRIMARY KEY CLUSTERED 
(
	[GrupID] ASC,
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Hatirlatma]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Hatirlatma](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Tarih] [datetime] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[GrupID] [int] NOT NULL,
	[TekrarID] [int] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Hatirlatma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Il]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Il](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Il] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Ilce]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Ilce](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NULL,
	[IlID] [int] NULL,
 CONSTRAINT [PK_tbl_Ilce] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_IlgiliKullanici]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_IlgiliKullanici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GrupID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[TurID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_IlgiliKullanici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KapiGiris]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KapiGiris](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GelenNot] [nvarchar](max) NULL,
	[IlgiliKullaniciID] [int] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[DurumID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_KapiGiris] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KapiGirisKisi]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KapiGirisKisi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KapiGirisID] [int] NOT NULL,
	[KisiID] [int] NOT NULL,
	[KisiNot] [nvarchar](500) NULL,
	[GirisTarihi] [datetime] NULL,
	[isGeldi] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_KapiGirisKisi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KapiGirisSurec]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KapiGirisSurec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KapiGirisID] [int] NOT NULL,
	[TurID] [int] NOT NULL,
	[Aciklama] [nvarchar](50) NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_KapiGirisSurec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Kategori]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Kategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[UstID] [int] NOT NULL,
	[TurID] [int] NOT NULL,
	[SiraNo] [int] NULL,
	[Renk] [nchar](7) NULL,
	[YaziRenk] [nchar](7) NULL,
 CONSTRAINT [PK_tbl_Kategori] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Kisi]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Kisi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](250) NULL,
	[TCK] [nvarchar](11) NULL,
	[DogumTarihi] [datetime] NULL,
	[Cinsiyet] [int] NULL,
	[MedeniDurum] [int] NULL,
	[IslemKulID] [int] NULL,
	[EklenmeTarihi] [datetime] NULL,
	[SicilNo] [nvarchar](13) NULL,
	[EPosta] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](250) NULL,
	[EgitimDurumu] [int] NULL,
	[GorevTanimi] [nvarchar](max) NULL,
	[sifre] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_Kisi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KisiGorev]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KisiGorev](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Aciklama] [nvarchar](250) NULL,
	[KisiID] [int] NOT NULL,
	[IlID] [int] NULL,
	[IlceID] [int] NULL,
	[isAktif] [bit] NOT NULL,
	[GorevKategoriID] [int] NULL,
	[isIlgili] [bit] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_KisiGorev] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KisiMernis]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KisiMernis](
	[TCK] [bigint] NOT NULL,
	[AdSoyad] [nvarchar](150) NOT NULL,
	[Cinsiyet] [int] NOT NULL,
	[DogumTarihi] [datetime] NOT NULL,
	[MedeniHal] [int] NOT NULL,
	[NufusIlID] [int] NOT NULL,
	[NufusIlceID] [int] NOT NULL,
	[DogumYeri] [nvarchar](150) NOT NULL,
	[AnaAdi] [nvarchar](150) NOT NULL,
	[BabaAdi] [nvarchar](150) NOT NULL,
	[SonSorguTarihi] [datetime] NOT NULL,
	[SorgulanmaSayisi] [int] NOT NULL,
	[SonIslemKullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_tbl_KisiMernis] PRIMARY KEY CLUSTERED 
(
	[TCK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KisiSenkronizasyon]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KisiSenkronizasyon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TCK] [nvarchar](11) NULL,
	[Adsoyad] [nvarchar](250) NULL,
	[DogumTarihi] [datetime] NULL,
	[Cinsiyet] [int] NULL,
	[MedeniDurum] [int] NULL,
	[SicilNo] [nvarchar](50) NULL,
	[Eposta] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](250) NULL,
	[EgitimDurumu] [int] NULL,
	[Telefon1] [nvarchar](11) NULL,
	[Telefon1Aciklama] [nvarchar](50) NULL,
	[Telefon2] [nvarchar](11) NULL,
	[Telefon2Aciklama] [nvarchar](50) NULL,
	[Telefon3] [nvarchar](11) NULL,
	[Telefon3Aciklama] [nvarchar](50) NULL,
	[Telefon4] [nvarchar](11) NULL,
	[Telefon4Aciklama] [nvarchar](50) NULL,
	[GorevKategoriID] [int] NULL,
	[GorevIl] [int] NULL,
	[GorevIlce] [int] NULL,
	[GorevAciklama] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_KisiSenkronizasyon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KisiSenkronizasyonBackup]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KisiSenkronizasyonBackup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TCK] [nvarchar](11) NULL,
	[Adsoyad] [nvarchar](250) NULL,
	[DogumTarihi] [datetime] NULL,
	[Cinsiyet] [int] NULL,
	[MedeniDurum] [int] NULL,
	[SicilNo] [nvarchar](50) NULL,
	[Eposta] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](250) NULL,
	[EgitimDurumu] [int] NULL,
	[Telefon1] [nvarchar](11) NULL,
	[Telefon1Aciklama] [nvarchar](50) NULL,
	[Telefon2] [nvarchar](11) NULL,
	[Telefon2Aciklama] [nvarchar](50) NULL,
	[Telefon3] [nvarchar](11) NULL,
	[Telefon3Aciklama] [nvarchar](50) NULL,
	[Telefon4] [nvarchar](11) NULL,
	[Telefon4Aciklama] [nvarchar](50) NULL,
	[GorevKategoriID] [int] NULL,
	[GorevIl] [int] NULL,
	[GorevIlce] [int] NULL,
	[GorevAciklama] [nvarchar](250) NULL,
	[EklenmeTarihi] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KisiTelefon]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KisiTelefon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KisiID] [int] NOT NULL,
	[Numara] [nvarchar](30) NULL,
	[isVarsayilan] [bit] NOT NULL,
	[isMobile] [bit] NULL,
	[Aciklama] [nvarchar](max) NULL,
	[isYurtDisi] [bit] NULL,
 CONSTRAINT [PK_tbl_KisiTelefon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KulIlgiliKullanici]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KulIlgiliKullanici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KulID] [int] NOT NULL,
	[IlgiliKulID] [int] NOT NULL,
	[TurID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_KulIlgiliKullanici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Kullanici]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Kullanici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KisiID] [int] NOT NULL,
	[Sifre] [nvarchar](250) NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[isAktif] [bit] NOT NULL,
	[GrupID] [int] NULL,
 CONSTRAINT [PK_tbl_Kullanici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KullaniciAyar]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KullaniciAyar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KisaAd] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](250) NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[Deger] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_KullaniciAyar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KullaniciLog]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KullaniciLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[Tur] [nvarchar](50) NOT NULL,
	[LogTur] [int] NOT NULL,
	[IPAdress] [nvarchar](50) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[SayfaLink] [nvarchar](max) NOT NULL,
	[OncekiLink] [nvarchar](max) NOT NULL,
	[Aciklama] [text] NULL,
 CONSTRAINT [PK_tbl_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_KullaniciRol]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_KullaniciRol](
	[KullaniciID] [int] NOT NULL,
	[RolID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_KullaniciYetki] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC,
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Mesajlasma]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Mesajlasma](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mesaj] [nvarchar](max) NOT NULL,
	[GonderenKullaniciID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[AlanKullaniciID] [int] NULL,
	[AlanGrupID] [int] NULL,
 CONSTRAINT [PK_tbl_Mesajlasma] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_MesajlasmaLog]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_MesajlasmaLog](
	[KulID] [int] NOT NULL,
	[OkunmaTarihi] [datetime] NOT NULL,
	[MesajID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_MesajlasmaLog] PRIMARY KEY CLUSTERED 
(
	[KulID] ASC,
	[MesajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Not]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Not](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KisiID] [int] NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[EkleyenKulID] [int] NOT NULL,
	[GrupID] [int] NULL,
	[NotYetkiID] [int] NULL,
 CONSTRAINT [PK_tbl_KisiNot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_PrintMode]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_PrintMode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Genislik] [int] NULL,
	[Yukseklik] [int] NULL,
	[Ad] [nvarchar](50) NULL,
	[Resim] [image] NULL,
	[PaddingTop] [int] NULL,
	[PaddingRight] [int] NULL,
	[PaddingBottom] [int] NULL,
	[PaddingLeft] [int] NULL,
	[Header] [text] NULL,
 CONSTRAINT [PK_tbl_PrintMode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Rol]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Rol](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](250) NOT NULL,
	[UstID] [int] NOT NULL,
	[SiraNo] [int] NULL,
 CONSTRAINT [PK_tbl_Rol] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_SikKullanilanlarMenu]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_SikKullanilanlarMenu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KulID] [int] NOT NULL,
	[Baslik] [nvarchar](250) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[SiraNo] [int] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_CokKullanilanlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_SistemSmsAyar]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_SistemSmsAyar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Turu] [nvarchar](50) NOT NULL,
	[SecimTurID] [int] NOT NULL,
	[Icerik] [nvarchar](max) NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[isAktif] [bit] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[isBirlikte] [bit] NOT NULL,
	[TelefonDeger] [nvarchar](max) NULL,
	[MailDeger] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_SMSAyar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_SistemSmsMailKisi]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_SistemSmsMailKisi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SistemID] [int] NOT NULL,
	[KisiID] [int] NOT NULL,
	[Telefon] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_SistemSmsMailKisi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_SMS]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_SMS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KayitID] [int] NOT NULL,
	[KisiID] [int] NOT NULL,
	[Mesaj] [nvarchar](max) NULL,
	[TurID] [int] NOT NULL,
	[isGonderildi] [bit] NULL,
	[GonderilmeTarihi] [datetime] NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[DurumBilgisi] [nvarchar](250) NULL,
	[DenemeSayisi] [int] NOT NULL,
	[MesajTakipID] [int] NULL,
 CONSTRAINT [PK_tbl_SMS_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_Tekrar]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_Tekrar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZamanTurID] [int] NOT NULL,
	[Sefer] [int] NOT NULL,
	[Sayi] [int] NOT NULL,
	[Gun] [nvarchar](50) NOT NULL,
	[SonTarihi] [datetime] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_ProgramTekrar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ORT].[tbl_TempDokuman]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORT].[tbl_TempDokuman](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Dosya] [text] NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[Uzanti] [nvarchar](50) NULL,
	[DosyaAdi] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_TempDokuman] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [SKRT].[tbl_Sekreterya]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SKRT].[tbl_Sekreterya](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TurID] [int] NOT NULL,
	[KisiID] [int] NULL,
	[ArananKulID] [int] NULL,
	[KategoriID] [int] NOT NULL,
	[DurumID] [int] NULL,
	[Aciklama] [nvarchar](max) NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[GrupID] [int] NOT NULL,
	[GelisYoluID] [int] NULL,
	[KisiNot] [nvarchar](max) NULL,
	[isGonderildi] [bit] NULL,
 CONSTRAINT [PK_tbl_Sekreterya] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [SKRT].[tbl_SekreteryaSurec]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SKRT].[tbl_SekreteryaSurec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TurID] [int] NOT NULL,
	[SekreteryaID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[YonlendirilenKulID] [int] NULL,
 CONSTRAINT [PK_tbl_SekreteryaSurec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [TLMT].[tbl_Talimat]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLMT].[tbl_Talimat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](max) NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[GrupID] [int] NOT NULL,
	[isGenel] [bit] NOT NULL,
	[ZiyaretID] [int] NULL,
 CONSTRAINT [PK_Talimat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [TLMT].[tbl_TalimatGorev]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLMT].[tbl_TalimatGorev](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TalimatID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[Baslik] [nvarchar](250) NULL,
	[DurumID] [int] NOT NULL,
	[SonTarih] [datetime] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[IlgiliGorevID] [int] NULL,
	[ProgramTarihiTotal] [int] NULL,
	[IlgiliProgramID] [int] NULL,
	[KopyaID] [int] NULL,
 CONSTRAINT [PK_TalimatGorev] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [TLMT].[tbl_TalimatGorevSurec]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLMT].[tbl_TalimatGorevSurec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TalimatGorevID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[IslemKulID] [int] NOT NULL,
	[TalimatSurecTurID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_TalimatGorevSurec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [TLMT].[tbl_TalimatGorevYetki]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLMT].[tbl_TalimatGorevYetki](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TalimatGorevID] [int] NOT NULL,
	[IlgiliKulID] [int] NULL,
	[IlgiliGrupID] [int] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[isAktif] [bit] NOT NULL,
	[TalimatGorevSurecID] [int] NOT NULL,
 CONSTRAINT [PK_TalimatYetki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [TLP].[tbl_Talep]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLP].[tbl_Talep](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KisiID] [int] NULL,
	[Aciklama] [nvarchar](max) NULL,
	[IlID] [int] NULL,
	[IlceID] [int] NULL,
	[EklenmeTarihi] [datetime] NULL,
	[DurumID] [int] NULL,
	[OncelikID] [int] NULL,
	[IlgiliKurumID] [int] NULL,
	[IslemKulID] [int] NULL,
	[GrupID] [int] NULL,
	[HatirlatmaTarihi] [datetime] NULL,
	[isDeleted] [bit] NULL,
	[GelisYoluID] [int] NULL,
	[IletenKulID] [int] NULL,
	[GelisTarihi] [datetime] NULL,
 CONSTRAINT [PK_tbl_Kayit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [TLP].[tbl_TalepKategori]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLP].[tbl_TalepKategori](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TalepID] [int] NOT NULL,
	[KategoriID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_TalepKategori] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [TLP].[tbl_TalepReferans]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLP].[tbl_TalepReferans](
	[TalepID] [int] NOT NULL,
	[KisiID] [int] NOT NULL,
	[ReferansNot] [nvarchar](500) NULL,
 CONSTRAINT [PK_tbl_TalepReferans] PRIMARY KEY CLUSTERED 
(
	[TalepID] ASC,
	[KisiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [TLP].[tbl_TalepSurec]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLP].[tbl_TalepSurec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TalepID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[TurID] [int] NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_KayitSurec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [TLP].[tbl_TalepYetki]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TLP].[tbl_TalepYetki](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TalepID] [int] NOT NULL,
	[GrupID] [int] NULL,
	[YetkiTurID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[EkleyenKullaniciID] [int] NOT NULL,
	[KullaniciID] [int] NULL,
	[SurecID] [int] NULL,
	[isAktif] [bit] NULL,
 CONSTRAINT [PK_tbl_Yetki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ZYRT].[tbl_ProgramEntegre]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZYRT].[tbl_ProgramEntegre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[IslemKulID] [int] NOT NULL,
	[TakvimID] [nvarchar](50) NULL,
	[AccessToken] [nvarchar](max) NULL,
	[isIzinVerildi] [bit] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[IlgiliKullaniciID] [int] NULL,
	[isIlk] [bit] NULL,
 CONSTRAINT [PK_tbl_ProgramEntegre] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ZYRT].[tbl_SiralamaGrup]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZYRT].[tbl_SiralamaGrup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Puan] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_SiralamaGrup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ZYRT].[tbl_Ziyaret]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZYRT].[tbl_Ziyaret](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TurID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[IslemKulID] [int] NOT NULL,
	[IlgiliKullaniciID] [int] NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[DurumID] [int] NOT NULL,
	[KategoriID] [int] NOT NULL,
	[GrupID] [int] NULL,
	[IlID] [int] NOT NULL,
	[IlceID] [int] NULL,
	[GelisTarihi] [datetime] NULL,
	[ProgramSuresi] [int] NULL,
	[ProgramOncelikID] [int] NULL,
	[isKurumIci] [bit] NULL,
	[TekrarID] [int] NULL,
	[isDeleted] [bit] NOT NULL,
	[isKatilimciSms] [bit] NULL,
	[isGoster] [bit] NULL,
	[isEntegre] [bit] NULL,
	[EntryID] [nvarchar](max) NULL,
	[isDuzenlendi] [bit] NULL,
	[ProgramNotu] [nvarchar](max) NULL,
	[SekreteryaID] [int] NULL,
	[SiralamaGrupID] [int] NULL,
	[GelisYoluID] [int] NULL,
	[isGonderildi] [bit] NULL,
	[ProgramEntegreID] [int] NULL,
	[IlgiliKayitID] [int] NULL,
 CONSTRAINT [PK_tbl_ZiyaretAramaTalep] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ZYRT].[tbl_ZiyaretDurum]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZYRT].[tbl_ZiyaretDurum](
	[ID] [int] NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_ZiyaretDurum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ZYRT].[tbl_ZiyaretKisi]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZYRT].[tbl_ZiyaretKisi](
	[ZiyaretID] [int] NOT NULL,
	[KisiID] [int] NOT NULL,
	[isTemsilci] [bit] NULL,
	[ZiyaretKisiNot] [nvarchar](250) NULL,
	[isReferans] [bit] NOT NULL,
	[isGeldi] [bit] NULL,
	[GelisTarihi] [datetime] NULL,
 CONSTRAINT [PK_tbl_ZiyaretKisi] PRIMARY KEY CLUSTERED 
(
	[ZiyaretID] ASC,
	[KisiID] ASC,
	[isReferans] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [ZYRT].[tbl_ZiyaretSurec]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZYRT].[tbl_ZiyaretSurec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZiyaretID] [int] NOT NULL,
	[Aciklama] [nvarchar](max) NULL,
	[TurID] [int] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[IslemKulID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_ZiyaretTalepSurec] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [ZYRT].[tbl_ZiyaretTalep]    Script Date: 15.5.2017 12:08:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ZYRT].[tbl_ZiyaretTalep](
	[TalepID] [int] NOT NULL,
	[ZiyaretID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_ZiyaretTalep] PRIMARY KEY CLUSTERED 
(
	[TalepID] ASC,
	[ZiyaretID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [ORT].[tbl_Kisi] ON 

GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (1, N'1123', N'123', CAST(0x0000A75C00000000 AS DateTime), 0, 0, 0, CAST(0x0000A75C00000000 AS DateTime), N'123', N'123', N'123123', 123, N'123', NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (2, N'muzafferhayta', N'11232131', CAST(0x0000A75300000000 AS DateTime), 0, 0, 0, CAST(0x0000A75300000000 AS DateTime), N'321', N'123', N'csafadsfa', 123, N'123', NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (3, N'12322', N'12322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (4, N'12322', N'12322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (5, N'mete', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (6, N'qweqwe', N'21312', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (7, N'denemeq', N'123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (9, N'123123', N'11111111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (10, N'muzaffeferfrr', N'1231231', CAST(0x0000875B00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [ORT].[tbl_Kisi] ([ID], [AdSoyad], [TCK], [DogumTarihi], [Cinsiyet], [MedeniDurum], [IslemKulID], [EklenmeTarihi], [SicilNo], [EPosta], [Aciklama], [EgitimDurumu], [GorevTanimi], [sifre]) VALUES (11, N'muzaffer hayta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [ORT].[tbl_Kisi] OFF
GO
SET IDENTITY_INSERT [TLP].[tbl_Talep] ON 

GO
INSERT [TLP].[tbl_Talep] ([ID], [KisiID], [Aciklama], [IlID], [IlceID], [EklenmeTarihi], [DurumID], [OncelikID], [IlgiliKurumID], [IslemKulID], [GrupID], [HatirlatmaTarihi], [isDeleted], [GelisYoluID], [IletenKulID], [GelisTarihi]) VALUES (1, 11, N'deneme', 0, NULL, CAST(0x0000A82C00000000 AS DateTime), 2, 0, NULL, 0, NULL, NULL, 0, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [TLP].[tbl_Talep] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tbl_Kisi_TCK_ID]    Script Date: 15.5.2017 12:08:54 ******/
CREATE NONCLUSTERED INDEX [IX_tbl_Kisi_TCK_ID] ON [ORT].[tbl_Kisi]
(
	[TCK] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tbl_TalepSurec_TurID]    Script Date: 15.5.2017 12:08:54 ******/
CREATE NONCLUSTERED INDEX [IX_tbl_TalepSurec_TurID] ON [TLP].[tbl_TalepSurec]
(
	[TurID] ASC
)
INCLUDE ( 	[TalepID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [ORT].[tbl_GelisYolu] ADD  CONSTRAINT [DF_tbl_GelisYolu_IslemKulID]  DEFAULT ((2)) FOR [IslemKulID]
GO
ALTER TABLE [ORT].[tbl_GorevKategori] ADD  CONSTRAINT [DF_tbl_Birim_SiraNo]  DEFAULT ((0)) FOR [SiraNo]
GO
ALTER TABLE [ORT].[tbl_Grup] ADD  CONSTRAINT [DF_tbl_Grup_SiraNo]  DEFAULT ((0)) FOR [SiraNo]
GO
ALTER TABLE [ORT].[tbl_Kategori] ADD  CONSTRAINT [DF_tbl_Kategori_SiraNo]  DEFAULT ((0)) FOR [SiraNo]
GO
ALTER TABLE [ORT].[tbl_Kisi] ADD  CONSTRAINT [DF_tbl_Kisi_Cinsiyet]  DEFAULT ((0)) FOR [Cinsiyet]
GO
ALTER TABLE [ORT].[tbl_KisiMernis] ADD  CONSTRAINT [DF_tbl_tbl_KisiMernis_SorgulanmaSayisi]  DEFAULT ((0)) FOR [SorgulanmaSayisi]
GO
ALTER TABLE [ORT].[tbl_KisiSenkronizasyonBackup] ADD  CONSTRAINT [DF_tbl_KisiSenkronizasyonBackup_EklenmeTarihi]  DEFAULT (getdate()) FOR [EklenmeTarihi]
GO
ALTER TABLE [ORT].[tbl_Rol] ADD  CONSTRAINT [DF_tbl_Rol_SiraNo]  DEFAULT ((0)) FOR [SiraNo]
GO
ALTER TABLE [ORT].[tbl_SMS] ADD  CONSTRAINT [DF_tbl_SMS_DenemeSayisi]  DEFAULT ((0)) FOR [DenemeSayisi]
GO
ALTER TABLE [ORT].[tbl_Tekrar] ADD  CONSTRAINT [DF_tbl_ProgramTekrar_EklenmeTarihi]  DEFAULT (getdate()) FOR [EklenmeTarihi]
GO
ALTER TABLE [SKRT].[tbl_Sekreterya] ADD  CONSTRAINT [DF_tbl_Sekreterya_TurID]  DEFAULT ((0)) FOR [TurID]
GO
ALTER TABLE [TLP].[tbl_Talep] ADD  CONSTRAINT [DF_tbl_Talep_IlID]  DEFAULT ((0)) FOR [IlID]
GO
ALTER TABLE [TLP].[tbl_Talep] ADD  CONSTRAINT [DF_tbl_Talep_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [TLP].[tbl_Talep] ADD  CONSTRAINT [DF_tbl_Talep_GelisYoluID]  DEFAULT ((0)) FOR [GelisYoluID]
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret] ADD  CONSTRAINT [DF_tbl_Ziyaret_ZiyaretEdilenKulID]  DEFAULT ((0)) FOR [IlgiliKullaniciID]
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret] ADD  CONSTRAINT [DF_tbl_Ziyaret_IlID]  DEFAULT ((0)) FOR [IlID]
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret] ADD  CONSTRAINT [DF_tbl_Ziyaret_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [KTLP].[tbl_KurumIlgiliKisi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KurumIlgiliKisi_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumIlgiliKisi] CHECK CONSTRAINT [FK_tbl_KurumIlgiliKisi_tbl_Kisi]
GO
ALTER TABLE [KTLP].[tbl_KurumIlgiliKisi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KurumIlgiliKisi_tbl_Kurum] FOREIGN KEY([KurumID])
REFERENCES [KTLP].[tbl_Kurum] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumIlgiliKisi] CHECK CONSTRAINT [FK_tbl_KurumIlgiliKisi_tbl_Kurum]
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalep]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KurumsalTalep_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalep] CHECK CONSTRAINT [FK_tbl_KurumsalTalep_tbl_Grup]
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalep]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KurumsalTalep_tbl_Kurum] FOREIGN KEY([KurumID])
REFERENCES [KTLP].[tbl_Kurum] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalep] CHECK CONSTRAINT [FK_tbl_KurumsalTalep_tbl_Kurum]
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalep]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KurumsalTalep_tbl_KurumIlgiliKisi] FOREIGN KEY([IlgiliKisiID])
REFERENCES [KTLP].[tbl_KurumIlgiliKisi] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalep] CHECK CONSTRAINT [FK_tbl_KurumsalTalep_tbl_KurumIlgiliKisi]
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalepSurec]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KurumsalTalepSurec_tbl_KurumsalTalep] FOREIGN KEY([KurumsalTalepID])
REFERENCES [KTLP].[tbl_KurumsalTalep] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalepSurec] CHECK CONSTRAINT [FK_tbl_KurumsalTalepSurec_tbl_KurumsalTalep]
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalepYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KTalepYetki_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalepYetki] CHECK CONSTRAINT [FK_tbl_KTalepYetki_tbl_Grup]
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalepYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KTalepYetki_tbl_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalepYetki] CHECK CONSTRAINT [FK_tbl_KTalepYetki_tbl_Kullanici]
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalepYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KTalepYetki_tbl_KurumsalTalep] FOREIGN KEY([KTalepID])
REFERENCES [KTLP].[tbl_KurumsalTalep] ([ID])
GO
ALTER TABLE [KTLP].[tbl_KurumsalTalepYetki] CHECK CONSTRAINT [FK_tbl_KTalepYetki_tbl_KurumsalTalep]
GO
ALTER TABLE [ORT].[tbl_Dokuman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dokuman_tbl_DosyaArsiv] FOREIGN KEY([DosyaArsivID])
REFERENCES [ORT].[tbl_DosyaArsiv] ([ID])
GO
ALTER TABLE [ORT].[tbl_Dokuman] CHECK CONSTRAINT [FK_tbl_Dokuman_tbl_DosyaArsiv]
GO
ALTER TABLE [ORT].[tbl_Dokuman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dokuman_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ORT].[tbl_Dokuman] CHECK CONSTRAINT [FK_tbl_Dokuman_tbl_Kisi]
GO
ALTER TABLE [ORT].[tbl_Dokuman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dokuman_tbl_Talep] FOREIGN KEY([TalepID])
REFERENCES [TLP].[tbl_Talep] ([ID])
GO
ALTER TABLE [ORT].[tbl_Dokuman] CHECK CONSTRAINT [FK_tbl_Dokuman_tbl_Talep]
GO
ALTER TABLE [ORT].[tbl_Dokuman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dokuman_tbl_TalepSurec] FOREIGN KEY([TalepSurecID])
REFERENCES [TLP].[tbl_TalepSurec] ([ID])
GO
ALTER TABLE [ORT].[tbl_Dokuman] CHECK CONSTRAINT [FK_tbl_Dokuman_tbl_TalepSurec]
GO
ALTER TABLE [ORT].[tbl_Dokuman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dokuman_tbl_TalimatGorev] FOREIGN KEY([TalimatGorevID])
REFERENCES [TLMT].[tbl_TalimatGorev] ([ID])
GO
ALTER TABLE [ORT].[tbl_Dokuman] CHECK CONSTRAINT [FK_tbl_Dokuman_tbl_TalimatGorev]
GO
ALTER TABLE [ORT].[tbl_Dokuman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dokuman_tbl_Ziyaret] FOREIGN KEY([ZiyaretID])
REFERENCES [ZYRT].[tbl_Ziyaret] ([ID])
GO
ALTER TABLE [ORT].[tbl_Dokuman] CHECK CONSTRAINT [FK_tbl_Dokuman_tbl_Ziyaret]
GO
ALTER TABLE [ORT].[tbl_Dokuman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Dokuman_tbl_ZiyaretSurec] FOREIGN KEY([ZiyaretSurecID])
REFERENCES [ZYRT].[tbl_ZiyaretSurec] ([ID])
GO
ALTER TABLE [ORT].[tbl_Dokuman] CHECK CONSTRAINT [FK_tbl_Dokuman_tbl_ZiyaretSurec]
GO
ALTER TABLE [ORT].[tbl_DosyaArsivSurec]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DosyaArsivSurec_tbl_DosyaArsiv] FOREIGN KEY([DosyaArsivID])
REFERENCES [ORT].[tbl_DosyaArsiv] ([ID])
GO
ALTER TABLE [ORT].[tbl_DosyaArsivSurec] CHECK CONSTRAINT [FK_tbl_DosyaArsivSurec_tbl_DosyaArsiv]
GO
ALTER TABLE [ORT].[tbl_DosyaArsivYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DosyaArsivYetki_tbl_DosyaArsivSurec] FOREIGN KEY([DosyaArsivSurecID])
REFERENCES [ORT].[tbl_DosyaArsivSurec] ([ID])
GO
ALTER TABLE [ORT].[tbl_DosyaArsivYetki] CHECK CONSTRAINT [FK_tbl_DosyaArsivYetki_tbl_DosyaArsivSurec]
GO
ALTER TABLE [ORT].[tbl_DosyaArsivYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DosyaArsivYetki_tbl_DosyaArsivYetki] FOREIGN KEY([DosyaArsivID])
REFERENCES [ORT].[tbl_DosyaArsiv] ([ID])
GO
ALTER TABLE [ORT].[tbl_DosyaArsivYetki] CHECK CONSTRAINT [FK_tbl_DosyaArsivYetki_tbl_DosyaArsivYetki]
GO
ALTER TABLE [ORT].[tbl_DosyaArsivYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DosyaArsivYetki_tbl_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ORT].[tbl_DosyaArsivYetki] CHECK CONSTRAINT [FK_tbl_DosyaArsivYetki_tbl_Kullanici]
GO
ALTER TABLE [ORT].[tbl_DuyuruYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DuyuruYetki_tbl_Duyuru] FOREIGN KEY([DuyuruID])
REFERENCES [ORT].[tbl_Duyuru] ([ID])
GO
ALTER TABLE [ORT].[tbl_DuyuruYetki] CHECK CONSTRAINT [FK_tbl_DuyuruYetki_tbl_Duyuru]
GO
ALTER TABLE [ORT].[tbl_GorusOneri]  WITH CHECK ADD  CONSTRAINT [FK_tbl_GorusOneri_tbl_Kullanici] FOREIGN KEY([KulID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ORT].[tbl_GorusOneri] CHECK CONSTRAINT [FK_tbl_GorusOneri_tbl_Kullanici]
GO
ALTER TABLE [ORT].[tbl_GrupOrtak]  WITH CHECK ADD  CONSTRAINT [FK_tbl_GrupOrtak_tbl_GrupOrtak] FOREIGN KEY([GrupKendi])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [ORT].[tbl_GrupOrtak] CHECK CONSTRAINT [FK_tbl_GrupOrtak_tbl_GrupOrtak]
GO
ALTER TABLE [ORT].[tbl_GrupRol]  WITH CHECK ADD  CONSTRAINT [FK_tbl_GrupRol_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [ORT].[tbl_GrupRol] CHECK CONSTRAINT [FK_tbl_GrupRol_tbl_Grup]
GO
ALTER TABLE [ORT].[tbl_GrupRol]  WITH CHECK ADD  CONSTRAINT [FK_tbl_GrupRol_tbl_Rol] FOREIGN KEY([RolID])
REFERENCES [ORT].[tbl_Rol] ([ID])
GO
ALTER TABLE [ORT].[tbl_GrupRol] CHECK CONSTRAINT [FK_tbl_GrupRol_tbl_Rol]
GO
ALTER TABLE [ORT].[tbl_Hatirlatma]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Hatirlatma_tbl_ProgramTekrar] FOREIGN KEY([TekrarID])
REFERENCES [ORT].[tbl_Tekrar] ([ID])
GO
ALTER TABLE [ORT].[tbl_Hatirlatma] CHECK CONSTRAINT [FK_tbl_Hatirlatma_tbl_ProgramTekrar]
GO
ALTER TABLE [ORT].[tbl_Ilce]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Ilce_tbl_Il] FOREIGN KEY([IlID])
REFERENCES [ORT].[tbl_Il] ([ID])
GO
ALTER TABLE [ORT].[tbl_Ilce] CHECK CONSTRAINT [FK_tbl_Ilce_tbl_Il]
GO
ALTER TABLE [ORT].[tbl_IlgiliKullanici]  WITH CHECK ADD  CONSTRAINT [FK_tbl_IlgiliKullanici_tbl_Grup1] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [ORT].[tbl_IlgiliKullanici] CHECK CONSTRAINT [FK_tbl_IlgiliKullanici_tbl_Grup1]
GO
ALTER TABLE [ORT].[tbl_KapiGirisKisi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KapiGirisKisi_tbl_KapiGiris] FOREIGN KEY([KapiGirisID])
REFERENCES [ORT].[tbl_KapiGiris] ([ID])
GO
ALTER TABLE [ORT].[tbl_KapiGirisKisi] CHECK CONSTRAINT [FK_tbl_KapiGirisKisi_tbl_KapiGiris]
GO
ALTER TABLE [ORT].[tbl_KapiGirisKisi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KapiGirisKisi_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ORT].[tbl_KapiGirisKisi] CHECK CONSTRAINT [FK_tbl_KapiGirisKisi_tbl_Kisi]
GO
ALTER TABLE [ORT].[tbl_KapiGirisSurec]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KapiGirisSurec_tbl_KapiGiris] FOREIGN KEY([KapiGirisID])
REFERENCES [ORT].[tbl_KapiGiris] ([ID])
GO
ALTER TABLE [ORT].[tbl_KapiGirisSurec] CHECK CONSTRAINT [FK_tbl_KapiGirisSurec_tbl_KapiGiris]
GO
ALTER TABLE [ORT].[tbl_KisiGorev]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KisiGorev_tbl_GorevKategori] FOREIGN KEY([GorevKategoriID])
REFERENCES [ORT].[tbl_GorevKategori] ([ID])
GO
ALTER TABLE [ORT].[tbl_KisiGorev] CHECK CONSTRAINT [FK_tbl_KisiGorev_tbl_GorevKategori]
GO
ALTER TABLE [ORT].[tbl_KisiGorev]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KisiGorev_tbl_GorevKategori1] FOREIGN KEY([GorevKategoriID])
REFERENCES [ORT].[tbl_GorevKategori] ([ID])
GO
ALTER TABLE [ORT].[tbl_KisiGorev] CHECK CONSTRAINT [FK_tbl_KisiGorev_tbl_GorevKategori1]
GO
ALTER TABLE [ORT].[tbl_KisiGorev]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KisiGorev_tbl_Il] FOREIGN KEY([IlID])
REFERENCES [ORT].[tbl_Il] ([ID])
GO
ALTER TABLE [ORT].[tbl_KisiGorev] CHECK CONSTRAINT [FK_tbl_KisiGorev_tbl_Il]
GO
ALTER TABLE [ORT].[tbl_KisiGorev]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KisiGorev_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ORT].[tbl_KisiGorev] CHECK CONSTRAINT [FK_tbl_KisiGorev_tbl_Kisi]
GO
ALTER TABLE [ORT].[tbl_KisiTelefon]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KisiTelefon_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ORT].[tbl_KisiTelefon] CHECK CONSTRAINT [FK_tbl_KisiTelefon_tbl_Kisi]
GO
ALTER TABLE [ORT].[tbl_KulIlgiliKullanici]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KulIlgiliKullanici_tbl_Kullanici] FOREIGN KEY([KulID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ORT].[tbl_KulIlgiliKullanici] CHECK CONSTRAINT [FK_tbl_KulIlgiliKullanici_tbl_Kullanici]
GO
ALTER TABLE [ORT].[tbl_Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Kullanici_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [ORT].[tbl_Kullanici] CHECK CONSTRAINT [FK_tbl_Kullanici_tbl_Grup]
GO
ALTER TABLE [ORT].[tbl_Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Kullanici_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ORT].[tbl_Kullanici] CHECK CONSTRAINT [FK_tbl_Kullanici_tbl_Kisi]
GO
ALTER TABLE [ORT].[tbl_KullaniciAyar]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KullaniciAyar_tbl_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ORT].[tbl_KullaniciAyar] CHECK CONSTRAINT [FK_tbl_KullaniciAyar_tbl_Kullanici]
GO
ALTER TABLE [ORT].[tbl_KullaniciLog]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KullaniciLog_tbl_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ORT].[tbl_KullaniciLog] CHECK CONSTRAINT [FK_tbl_KullaniciLog_tbl_Kullanici]
GO
ALTER TABLE [ORT].[tbl_KullaniciRol]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KullaniciRol_tbl_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ORT].[tbl_KullaniciRol] CHECK CONSTRAINT [FK_tbl_KullaniciRol_tbl_Kullanici]
GO
ALTER TABLE [ORT].[tbl_KullaniciRol]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KullaniciRol_tbl_Rol] FOREIGN KEY([RolID])
REFERENCES [ORT].[tbl_Rol] ([ID])
GO
ALTER TABLE [ORT].[tbl_KullaniciRol] CHECK CONSTRAINT [FK_tbl_KullaniciRol_tbl_Rol]
GO
ALTER TABLE [ORT].[tbl_Mesajlasma]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Mesajlasma_tbl_Kullanici] FOREIGN KEY([GonderenKullaniciID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ORT].[tbl_Mesajlasma] CHECK CONSTRAINT [FK_tbl_Mesajlasma_tbl_Kullanici]
GO
ALTER TABLE [ORT].[tbl_MesajlasmaLog]  WITH CHECK ADD  CONSTRAINT [FK_tbl_MesajlasmaLog_tbl_Mesajlasma] FOREIGN KEY([MesajID])
REFERENCES [ORT].[tbl_Mesajlasma] ([ID])
GO
ALTER TABLE [ORT].[tbl_MesajlasmaLog] CHECK CONSTRAINT [FK_tbl_MesajlasmaLog_tbl_Mesajlasma]
GO
ALTER TABLE [ORT].[tbl_Not]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KisiNot_tbl_Kisi1] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ORT].[tbl_Not] CHECK CONSTRAINT [FK_tbl_KisiNot_tbl_Kisi1]
GO
ALTER TABLE [ORT].[tbl_Not]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Not_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [ORT].[tbl_Not] CHECK CONSTRAINT [FK_tbl_Not_tbl_Grup]
GO
ALTER TABLE [ORT].[tbl_SikKullanilanlarMenu]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SikKullanilanlarMenu_tbl_Kullanici] FOREIGN KEY([KulID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ORT].[tbl_SikKullanilanlarMenu] CHECK CONSTRAINT [FK_tbl_SikKullanilanlarMenu_tbl_Kullanici]
GO
ALTER TABLE [ORT].[tbl_SistemSmsMailKisi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SistemSmsMailKisi_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ORT].[tbl_SistemSmsMailKisi] CHECK CONSTRAINT [FK_tbl_SistemSmsMailKisi_tbl_Kisi]
GO
ALTER TABLE [ORT].[tbl_SistemSmsMailKisi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SistemSmsMailKisi_tbl_SistemSmsAyar] FOREIGN KEY([SistemID])
REFERENCES [ORT].[tbl_SistemSmsAyar] ([ID])
GO
ALTER TABLE [ORT].[tbl_SistemSmsMailKisi] CHECK CONSTRAINT [FK_tbl_SistemSmsMailKisi_tbl_SistemSmsAyar]
GO
ALTER TABLE [ORT].[tbl_SMS]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SMS_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ORT].[tbl_SMS] CHECK CONSTRAINT [FK_tbl_SMS_tbl_Kisi]
GO
ALTER TABLE [SKRT].[tbl_Sekreterya]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Sekreterya_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [SKRT].[tbl_Sekreterya] CHECK CONSTRAINT [FK_tbl_Sekreterya_tbl_Grup]
GO
ALTER TABLE [SKRT].[tbl_Sekreterya]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Sekreterya_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [SKRT].[tbl_Sekreterya] CHECK CONSTRAINT [FK_tbl_Sekreterya_tbl_Kisi]
GO
ALTER TABLE [SKRT].[tbl_SekreteryaSurec]  WITH CHECK ADD  CONSTRAINT [FK_tbl_SekreteryaSurec_tbl_Sekreterya] FOREIGN KEY([SekreteryaID])
REFERENCES [SKRT].[tbl_Sekreterya] ([ID])
GO
ALTER TABLE [SKRT].[tbl_SekreteryaSurec] CHECK CONSTRAINT [FK_tbl_SekreteryaSurec_tbl_Sekreterya]
GO
ALTER TABLE [TLMT].[tbl_Talimat]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Talimat_tbl_Ziyaret] FOREIGN KEY([ZiyaretID])
REFERENCES [ZYRT].[tbl_Ziyaret] ([ID])
GO
ALTER TABLE [TLMT].[tbl_Talimat] CHECK CONSTRAINT [FK_tbl_Talimat_tbl_Ziyaret]
GO
ALTER TABLE [TLMT].[tbl_TalimatGorev]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TalimatGorev_tbl_Talimat] FOREIGN KEY([TalimatID])
REFERENCES [TLMT].[tbl_Talimat] ([ID])
GO
ALTER TABLE [TLMT].[tbl_TalimatGorev] CHECK CONSTRAINT [FK_tbl_TalimatGorev_tbl_Talimat]
GO
ALTER TABLE [TLMT].[tbl_TalimatGorevSurec]  WITH CHECK ADD  CONSTRAINT [FK_TalimatGorevSurec_TalimatGorev] FOREIGN KEY([TalimatGorevID])
REFERENCES [TLMT].[tbl_TalimatGorev] ([ID])
GO
ALTER TABLE [TLMT].[tbl_TalimatGorevSurec] CHECK CONSTRAINT [FK_TalimatGorevSurec_TalimatGorev]
GO
ALTER TABLE [TLMT].[tbl_TalimatGorevYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TalimatGorevYetki_tbl_TalimatGorevSurec] FOREIGN KEY([TalimatGorevSurecID])
REFERENCES [TLMT].[tbl_TalimatGorevSurec] ([ID])
GO
ALTER TABLE [TLMT].[tbl_TalimatGorevYetki] CHECK CONSTRAINT [FK_tbl_TalimatGorevYetki_tbl_TalimatGorevSurec]
GO
ALTER TABLE [TLMT].[tbl_TalimatGorevYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TalimatYetki_tbl_TalimatGorev] FOREIGN KEY([TalimatGorevID])
REFERENCES [TLMT].[tbl_TalimatGorev] ([ID])
GO
ALTER TABLE [TLMT].[tbl_TalimatGorevYetki] CHECK CONSTRAINT [FK_tbl_TalimatYetki_tbl_TalimatGorev]
GO
ALTER TABLE [TLP].[tbl_Talep]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Talep_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [TLP].[tbl_Talep] CHECK CONSTRAINT [FK_tbl_Talep_tbl_Grup]
GO
ALTER TABLE [TLP].[tbl_Talep]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Talep_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [TLP].[tbl_Talep] CHECK CONSTRAINT [FK_tbl_Talep_tbl_Kisi]
GO
ALTER TABLE [TLP].[tbl_TalepKategori]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TalepKategori_tbl_Kategori1] FOREIGN KEY([KategoriID])
REFERENCES [ORT].[tbl_Kategori] ([ID])
GO
ALTER TABLE [TLP].[tbl_TalepKategori] CHECK CONSTRAINT [FK_tbl_TalepKategori_tbl_Kategori1]
GO
ALTER TABLE [TLP].[tbl_TalepKategori]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TalepKategori_tbl_Talep] FOREIGN KEY([TalepID])
REFERENCES [TLP].[tbl_Talep] ([ID])
GO
ALTER TABLE [TLP].[tbl_TalepKategori] CHECK CONSTRAINT [FK_tbl_TalepKategori_tbl_Talep]
GO
ALTER TABLE [TLP].[tbl_TalepReferans]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TalepReferans_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [TLP].[tbl_TalepReferans] CHECK CONSTRAINT [FK_tbl_TalepReferans_tbl_Kisi]
GO
ALTER TABLE [TLP].[tbl_TalepReferans]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TalepReferans_tbl_Talep] FOREIGN KEY([TalepID])
REFERENCES [TLP].[tbl_Talep] ([ID])
GO
ALTER TABLE [TLP].[tbl_TalepReferans] CHECK CONSTRAINT [FK_tbl_TalepReferans_tbl_Talep]
GO
ALTER TABLE [TLP].[tbl_TalepSurec]  WITH CHECK ADD  CONSTRAINT [FK_tbl_KayitSurec_tbl_Kayit] FOREIGN KEY([TalepID])
REFERENCES [TLP].[tbl_Talep] ([ID])
GO
ALTER TABLE [TLP].[tbl_TalepSurec] CHECK CONSTRAINT [FK_tbl_KayitSurec_tbl_Kayit]
GO
ALTER TABLE [TLP].[tbl_TalepYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_TalepYetki_tbl_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [TLP].[tbl_TalepYetki] CHECK CONSTRAINT [FK_tbl_TalepYetki_tbl_Kullanici]
GO
ALTER TABLE [TLP].[tbl_TalepYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Yetki_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [TLP].[tbl_TalepYetki] CHECK CONSTRAINT [FK_tbl_Yetki_tbl_Grup]
GO
ALTER TABLE [TLP].[tbl_TalepYetki]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Yetki_tbl_Talep] FOREIGN KEY([TalepID])
REFERENCES [TLP].[tbl_Talep] ([ID])
GO
ALTER TABLE [TLP].[tbl_TalepYetki] CHECK CONSTRAINT [FK_tbl_Yetki_tbl_Talep]
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Ziyaret_tbl_Grup] FOREIGN KEY([GrupID])
REFERENCES [ORT].[tbl_Grup] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret] CHECK CONSTRAINT [FK_tbl_Ziyaret_tbl_Grup]
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Ziyaret_tbl_Kullanici] FOREIGN KEY([IslemKulID])
REFERENCES [ORT].[tbl_Kullanici] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret] CHECK CONSTRAINT [FK_tbl_Ziyaret_tbl_Kullanici]
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Ziyaret_tbl_SiralamaGrup] FOREIGN KEY([SiralamaGrupID])
REFERENCES [ZYRT].[tbl_SiralamaGrup] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret] CHECK CONSTRAINT [FK_tbl_Ziyaret_tbl_SiralamaGrup]
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Ziyaret_tbl_Tekrar] FOREIGN KEY([TekrarID])
REFERENCES [ORT].[tbl_Tekrar] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_Ziyaret] CHECK CONSTRAINT [FK_tbl_Ziyaret_tbl_Tekrar]
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretKisi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ZiyaretKisi_tbl_Kisi] FOREIGN KEY([KisiID])
REFERENCES [ORT].[tbl_Kisi] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretKisi] CHECK CONSTRAINT [FK_tbl_ZiyaretKisi_tbl_Kisi]
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretKisi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ZiyaretKisi_tbl_Ziyaret] FOREIGN KEY([ZiyaretID])
REFERENCES [ZYRT].[tbl_Ziyaret] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretKisi] CHECK CONSTRAINT [FK_tbl_ZiyaretKisi_tbl_Ziyaret]
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretSurec]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ZiyaretTalepSurec_tbl_ZiyaretAramaTalep] FOREIGN KEY([ZiyaretID])
REFERENCES [ZYRT].[tbl_Ziyaret] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretSurec] CHECK CONSTRAINT [FK_tbl_ZiyaretTalepSurec_tbl_ZiyaretAramaTalep]
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretTalep]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ZiyaretTalep_tbl_Talep] FOREIGN KEY([TalepID])
REFERENCES [TLP].[tbl_Talep] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretTalep] CHECK CONSTRAINT [FK_tbl_ZiyaretTalep_tbl_Talep]
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretTalep]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ZiyaretTalep_tbl_Ziyaret] FOREIGN KEY([ZiyaretID])
REFERENCES [ZYRT].[tbl_Ziyaret] ([ID])
GO
ALTER TABLE [ZYRT].[tbl_ZiyaretTalep] CHECK CONSTRAINT [FK_tbl_ZiyaretTalep_tbl_Ziyaret]
GO
USE [master]
GO
ALTER DATABASE [RequestTrackkingSystem] SET  READ_WRITE 
GO
