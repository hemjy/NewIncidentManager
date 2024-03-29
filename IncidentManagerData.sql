USE [CSLData]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/15/2019 1:11:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[DisplayName] [varchar](50) NOT NULL,
	[MustChangePassword] [bit] NOT NULL,
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Active] [bit] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 10/15/2019 1:11:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[ComplaintId] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintTypeId] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[MobileNo] [nvarchar](11) NOT NULL,
	[Title] [nchar](200) NOT NULL,
	[Details] [text] NOT NULL,
	[StatusId] [int] NOT NULL,
	[SolutionStatusId] [int] NOT NULL,
	[ComplaintOwnerName] [nvarchar](100) NULL,
	[ComplaintOwnerEmail] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[RegisteredBy] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ResolvedBy] [int] NULL,
	[ResolvedDate] [datetime] NULL,
 CONSTRAINT [PK_Complaint] PRIMARY KEY CLUSTERED 
(
	[ComplaintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComplaintStatus]    Script Date: 10/15/2019 1:11:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintStatus](
	[ComplaintStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_ComplaintStatus] PRIMARY KEY CLUSTERED 
(
	[ComplaintStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SolutionStatus]    Script Date: 10/15/2019 1:11:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolutionStatus](
	[SolutionStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_SolutionStatus] PRIMARY KEY CLUSTERED 
(
	[SolutionStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComplaintType]    Script Date: 10/15/2019 1:11:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintType](
	[ComplaintTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_ComplaintType] PRIMARY KEY CLUSTERED 
(
	[ComplaintTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vComplaint]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vComplaint]
AS
SELECT        dbo.Complaint.ComplaintId, dbo.Complaint.ComplaintTypeId, dbo.Complaint.Code, dbo.Complaint.MobileNo, dbo.Complaint.Title, dbo.Complaint.Details, dbo.Complaint.StatusId, dbo.Complaint.SolutionStatusId, 
                         dbo.Complaint.ComplaintOwnerName, dbo.Complaint.ComplaintOwnerEmail, dbo.Complaint.Location, dbo.Complaint.RegisteredBy, dbo.Complaint.Date, dbo.ComplaintType.Name AS ComplaintType, 
                         dbo.ComplaintStatus.Name AS ComplaintStatus, dbo.SolutionStatus.Name AS SolutionStatus, AspNetUsers_1.UserName, AspNetUsers_1.DisplayName, dbo.Complaint.ResolvedBy, dbo.Complaint.ResolvedDate, 
                         SupportUser.DisplayName AS SupportUser
FROM            (SELECT        DisplayName, UserId
                          FROM            dbo.AspNetUsers
                          WHERE        (Id IN
                                                        (SELECT        UserId
                                                          FROM            dbo.AspNetUserRoles
                                                          WHERE        (RoleId = 'f072a014-719a-4fc4-a4f8-e2930e95454f') OR
                                                                                    (RoleId = 'c8a46a88-e582-43f1-90ca-97bf3dc3652f')))) AS SupportUser RIGHT OUTER JOIN
                         dbo.Complaint INNER JOIN
                         dbo.ComplaintType ON dbo.Complaint.ComplaintTypeId = dbo.ComplaintType.ComplaintTypeId INNER JOIN
                         dbo.SolutionStatus ON dbo.Complaint.SolutionStatusId = dbo.SolutionStatus.SolutionStatusId INNER JOIN
                         dbo.ComplaintStatus ON dbo.Complaint.StatusId = dbo.ComplaintStatus.ComplaintStatusId INNER JOIN
                         dbo.AspNetUsers AS AspNetUsers_1 ON dbo.Complaint.RegisteredBy = AspNetUsers_1.UserId ON SupportUser.UserId = dbo.Complaint.ResolvedBy

GO
/****** Object:  Table [dbo].[ComplaintActivity]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintActivity](
	[ComplaintActivityId] [int] IDENTITY(1,1) NOT NULL,
	[ComplaintId] [int] NOT NULL,
	[SolutionDetails] [text] NOT NULL,
	[SolutionStatusId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[RecordedBy] [int] NOT NULL,
 CONSTRAINT [PK_ComplaintActivity] PRIMARY KEY CLUSTERED 
(
	[ComplaintActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[vComplaintActivity]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vComplaintActivity]
AS
SELECT        dbo.ComplaintActivity.ComplaintId, dbo.ComplaintActivity.ComplaintActivityId, dbo.ComplaintActivity.SolutionDetails, dbo.ComplaintActivity.SolutionStatusId, dbo.ComplaintActivity.RecordedBy, dbo.ComplaintActivity.Date, 
                         dbo.SolutionStatus.Name AS SolutionStatus, dbo.AspNetUsers.UserName, dbo.AspNetUsers.DisplayName
FROM            dbo.ComplaintActivity INNER JOIN
                         dbo.SolutionStatus ON dbo.ComplaintActivity.SolutionStatusId = dbo.SolutionStatus.SolutionStatusId INNER JOIN
                         dbo.AspNetUsers ON dbo.ComplaintActivity.RecordedBy = dbo.AspNetUsers.UserId

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserAspNetRoles]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserAspNetRoles](
	[AspnetUser_Id] [nvarchar](max) NOT NULL,
	[AspnetRole_Id] [nvarchar](max) NOT NULL,
	[operationType] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SolutionType]    Script Date: 10/15/2019 1:11:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolutionType](
	[SolutionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_SolutionType] PRIMARY KEY CLUSTERED 
(
	[SolutionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c4d9ed0e-2ec8-40fb-9f63-36c5ac6c697e', N'User')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c8a46a88-e582-43f1-90ca-97bf3dc3652f', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f072a014-719a-4fc4-a4f8-e2930e95454f', N'Support')
INSERT [dbo].[AspNetUserAspNetRoles] ([AspnetUser_Id], [AspnetRole_Id], [operationType]) VALUES (N'25505ab9-2e10-477b-a211-f652ae300787', N'f072a014-719a-4fc4-a4f8-e2930e95454f', N'insert')
INSERT [dbo].[AspNetUserAspNetRoles] ([AspnetUser_Id], [AspnetRole_Id], [operationType]) VALUES (N'999694ff-0296-4790-a9ff-f695ec1b6f6b', N'c4d9ed0e-2ec8-40fb-9f63-36c5ac6c697e', N'insert')
INSERT [dbo].[AspNetUserAspNetRoles] ([AspnetUser_Id], [AspnetRole_Id], [operationType]) VALUES (N'999694ff-0296-4790-a9ff-f695ec1b6f6b', N'c8a46a88-e582-43f1-90ca-97bf3dc3652f', N'insert')
INSERT [dbo].[AspNetUserAspNetRoles] ([AspnetUser_Id], [AspnetRole_Id], [operationType]) VALUES (N'9e970a6b-1d1a-48fd-bb53-93147842c782', N'c4d9ed0e-2ec8-40fb-9f63-36c5ac6c697e', N'insert')
INSERT [dbo].[AspNetUserAspNetRoles] ([AspnetUser_Id], [AspnetRole_Id], [operationType]) VALUES (N'a791057d-f7f0-4175-b06d-8efd85b57382', N'c4d9ed0e-2ec8-40fb-9f63-36c5ac6c697e', N'insert')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'25505ab9-2e10-477b-a211-f652ae300787', N'f072a014-719a-4fc4-a4f8-e2930e95454f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'999694ff-0296-4790-a9ff-f695ec1b6f6b', N'c4d9ed0e-2ec8-40fb-9f63-36c5ac6c697e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'999694ff-0296-4790-a9ff-f695ec1b6f6b', N'c8a46a88-e582-43f1-90ca-97bf3dc3652f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9e970a6b-1d1a-48fd-bb53-93147842c782', N'c4d9ed0e-2ec8-40fb-9f63-36c5ac6c697e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a791057d-f7f0-4175-b06d-8efd85b57382', N'c4d9ed0e-2ec8-40fb-9f63-36c5ac6c697e')
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [DisplayName], [MustChangePassword], [UserId], [Active], [Status]) VALUES (N'25505ab9-2e10-477b-a211-f652ae300787', N'support1@xplugng.com', 1, N'AK6bKoh2jiH7iE9hXxg8S4l5tY9mPOxVsvnf+6dsQ9dFIa8q8Z1ocSuAnI/K2cVjBw==', N'c5902757-0406-49c9-8886-e550918cfe27', NULL, 0, 0, NULL, 1, 0, N'support1@xplugng.com', N'support1', 0, 9, 1, 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [DisplayName], [MustChangePassword], [UserId], [Active], [Status]) VALUES (N'999694ff-0296-4790-a9ff-f695ec1b6f6b', N'admin@xplugng.com', 1, N'ACHQtMw/yKi/05ubrpqaF/CljjkyOpvXFq2frqj5X1hSA2MJDYp3VdVQIAi9y7pjvQ==', N'515d9ff2-cb57-4d19-bf9a-2cb49038ac5d', NULL, 0, 0, NULL, 1, 0, N'admin@xplugng.com', N'Admin', 0, 1, 1, 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [DisplayName], [MustChangePassword], [UserId], [Active], [Status]) VALUES (N'9e970a6b-1d1a-48fd-bb53-93147842c782', N'user1@gmail.com', 1, N'AJVvUFCCPIqSZV7Ju21EmE48gCPj8fFqJ1wHWMzkpMmHNo5/LRj/t7ObUopdKB/Hfw==', N'ea86fa5a-f481-433d-b160-b78ff62ffd09', NULL, 0, 0, NULL, 1, 0, N'user1@gmail.com', N'user1', 0, 10, 1, 1)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [DisplayName], [MustChangePassword], [UserId], [Active], [Status]) VALUES (N'a791057d-f7f0-4175-b06d-8efd85b57382', N'superb@gmail.com', 1, N'AAXpeUiiltl3c08zhhg/7Yw1Dj43GgX+5JZoDzZcnX2nGTdGI45F02dqsaMMqbGrHw==', N'f7d871ea-6dd6-445b-b14b-7e5f336b99c3', NULL, 0, 0, NULL, 1, 0, N'superb@gmail.com', N'Superb User', 0, 11, 1, 1)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
SET IDENTITY_INSERT [dbo].[Complaint] ON 

INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintTypeId], [Code], [MobileNo], [Title], [Details], [StatusId], [SolutionStatusId], [ComplaintOwnerName], [ComplaintOwnerEmail], [Location], [RegisteredBy], [Date], [ResolvedBy], [ResolvedDate]) VALUES (11658, 3, 102, N'08066666666', N'Wrong_Spelling_11_24_2019_01:24:12_PM_                                                                                                                                                                  ', N'test', 2, 1, NULL, NULL, NULL, 1, CAST(N'2019-10-11T13:24:27.687' AS DateTime), NULL, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintTypeId], [Code], [MobileNo], [Title], [Details], [StatusId], [SolutionStatusId], [ComplaintOwnerName], [ComplaintOwnerEmail], [Location], [RegisteredBy], [Date], [ResolvedBy], [ResolvedDate]) VALUES (11659, 3, 102, N'08066666666', N'Wrong_Spelling_11_22_2019_03:22:27_PM_                                                                                                                                                                  ', N'Test2', 4, 2, NULL, NULL, NULL, 1, CAST(N'2019-10-11T15:23:06.067' AS DateTime), 9, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintTypeId], [Code], [MobileNo], [Title], [Details], [StatusId], [SolutionStatusId], [ComplaintOwnerName], [ComplaintOwnerEmail], [Location], [RegisteredBy], [Date], [ResolvedBy], [ResolvedDate]) VALUES (11660, 5, 104, N'08066666666', N'Syntax_Error_14_59_2019_09:59:44_AM_                                                                                                                                                                    ', N'Test2', 2, 1, NULL, NULL, NULL, 10, CAST(N'2019-10-14T09:59:58.043' AS DateTime), NULL, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintTypeId], [Code], [MobileNo], [Title], [Details], [StatusId], [SolutionStatusId], [ComplaintOwnerName], [ComplaintOwnerEmail], [Location], [RegisteredBy], [Date], [ResolvedBy], [ResolvedDate]) VALUES (11661, 3, 102, N'08066666666', N'Wrong_Spelling_14_55_2019_12:55:32_PM_                                                                                                                                                                  ', N'today', 2, 1, NULL, NULL, NULL, 11, CAST(N'2019-10-14T12:55:41.663' AS DateTime), NULL, NULL)
INSERT [dbo].[Complaint] ([ComplaintId], [ComplaintTypeId], [Code], [MobileNo], [Title], [Details], [StatusId], [SolutionStatusId], [ComplaintOwnerName], [ComplaintOwnerEmail], [Location], [RegisteredBy], [Date], [ResolvedBy], [ResolvedDate]) VALUES (11662, 3, 102, N'08066666666', N'Wrong_Spelling_15_49_2019_11:49:26_AM_                                                                                                                                                                  ', N'test', 2, 3, NULL, NULL, NULL, 10, CAST(N'2019-10-15T11:49:40.770' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Complaint] OFF
SET IDENTITY_INSERT [dbo].[ComplaintActivity] ON 

INSERT [dbo].[ComplaintActivity] ([ComplaintActivityId], [ComplaintId], [SolutionDetails], [SolutionStatusId], [Date], [RecordedBy]) VALUES (10693, 11659, N'Done', 2, CAST(N'2019-10-11T16:04:29.917' AS DateTime), 9)
INSERT [dbo].[ComplaintActivity] ([ComplaintActivityId], [ComplaintId], [SolutionDetails], [SolutionStatusId], [Date], [RecordedBy]) VALUES (10694, 11662, N'Done', 3, CAST(N'2019-10-15T12:00:47.950' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ComplaintActivity] OFF
SET IDENTITY_INSERT [dbo].[ComplaintStatus] ON 

INSERT [dbo].[ComplaintStatus] ([ComplaintStatusId], [Name], [Status]) VALUES (1, N'Fresh', 1)
INSERT [dbo].[ComplaintStatus] ([ComplaintStatusId], [Name], [Status]) VALUES (2, N'In Progress', 1)
INSERT [dbo].[ComplaintStatus] ([ComplaintStatusId], [Name], [Status]) VALUES (3, N'Partly Completed', 1)
INSERT [dbo].[ComplaintStatus] ([ComplaintStatusId], [Name], [Status]) VALUES (4, N'Completed', 1)
INSERT [dbo].[ComplaintStatus] ([ComplaintStatusId], [Name], [Status]) VALUES (5, N'Closed', 1)
SET IDENTITY_INSERT [dbo].[ComplaintStatus] OFF
SET IDENTITY_INSERT [dbo].[ComplaintType] ON 

INSERT [dbo].[ComplaintType] ([ComplaintTypeId], [Name], [Code], [Status]) VALUES (2, N'Card Loading', 101, -1)
INSERT [dbo].[ComplaintType] ([ComplaintTypeId], [Name], [Code], [Status]) VALUES (3, N'Wrong Spelling', 102, 1)
INSERT [dbo].[ComplaintType] ([ComplaintTypeId], [Name], [Code], [Status]) VALUES (4, N'Missing Component', 103, 1)
INSERT [dbo].[ComplaintType] ([ComplaintTypeId], [Name], [Code], [Status]) VALUES (5, N'Syntax Error', 104, 1)
INSERT [dbo].[ComplaintType] ([ComplaintTypeId], [Name], [Code], [Status]) VALUES (13, N'TEST2', 111, -1)
SET IDENTITY_INSERT [dbo].[ComplaintType] OFF
SET IDENTITY_INSERT [dbo].[SolutionStatus] ON 

INSERT [dbo].[SolutionStatus] ([SolutionStatusId], [Name], [Code], [Status]) VALUES (1, N'Pending', 101, 1)
INSERT [dbo].[SolutionStatus] ([SolutionStatusId], [Name], [Code], [Status]) VALUES (2, N'Resolved Fully', 102, 1)
INSERT [dbo].[SolutionStatus] ([SolutionStatusId], [Name], [Code], [Status]) VALUES (3, N'Resolved Partly', 103, 1)
INSERT [dbo].[SolutionStatus] ([SolutionStatusId], [Name], [Code], [Status]) VALUES (4, N'Required Technical Skill', 104, -1)
INSERT [dbo].[SolutionStatus] ([SolutionStatusId], [Name], [Code], [Status]) VALUES (5, N'Suspended', 105, 0)
INSERT [dbo].[SolutionStatus] ([SolutionStatusId], [Name], [Code], [Status]) VALUES (6, N'Subscription from CRM base on user''s request', 106, -1)
INSERT [dbo].[SolutionStatus] ([SolutionStatusId], [Name], [Code], [Status]) VALUES (7, N'Card sent but unable to load due to network issue', 107, -1)
SET IDENTITY_INSERT [dbo].[SolutionStatus] OFF
SET IDENTITY_INSERT [dbo].[SolutionType] ON 

INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (4, N'Phone Restart', 201, -1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (5, N'Change of Route', 202, -1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (6, N'Subscription from CRM base on user''s request', 203, -1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (7, N'Account Transfer', 204, -1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (8, N'Resend Past Result', 205, -1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (9, N'Alternative mobile number', 206, -1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (10, N'Account Place on Hold', 207, -1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (11, N'Alert Type Changed', 208, 1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (12, N'Adjust Message Settings ', 209, 1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (13, N'Card loaded via CRM', 210, 1)
INSERT [dbo].[SolutionType] ([SolutionTypeId], [Name], [Code], [Status]) VALUES (14, N'Request to load via New Phone line', 211, -1)
SET IDENTITY_INSERT [dbo].[SolutionType] OFF
ALTER TABLE [dbo].[AspNetUserAspNetRoles] ADD  DEFAULT ('insert') FOR [operationType]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD  CONSTRAINT [FK_Complaint_ComplaintStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ComplaintStatus] ([ComplaintStatusId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_ComplaintStatus]
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD  CONSTRAINT [FK_Complaint_ComplaintType] FOREIGN KEY([ComplaintTypeId])
REFERENCES [dbo].[ComplaintType] ([ComplaintTypeId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_ComplaintType]
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD  CONSTRAINT [FK_Complaint_SolutionStatus] FOREIGN KEY([SolutionStatusId])
REFERENCES [dbo].[SolutionStatus] ([SolutionStatusId])
GO
ALTER TABLE [dbo].[Complaint] CHECK CONSTRAINT [FK_Complaint_SolutionStatus]
GO
ALTER TABLE [dbo].[ComplaintActivity]  WITH CHECK ADD  CONSTRAINT [FK_ComplaintActivity_Complaint] FOREIGN KEY([ComplaintId])
REFERENCES [dbo].[Complaint] ([ComplaintId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComplaintActivity] CHECK CONSTRAINT [FK_ComplaintActivity_Complaint]
GO
ALTER TABLE [dbo].[ComplaintActivity]  WITH CHECK ADD  CONSTRAINT [FK_ComplaintActivity_SolutionStatus] FOREIGN KEY([SolutionStatusId])
REFERENCES [dbo].[SolutionStatus] ([SolutionStatusId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ComplaintActivity] CHECK CONSTRAINT [FK_ComplaintActivity_SolutionStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[14] 2[35] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Complaint"
            Begin Extent = 
               Top = 0
               Left = 431
               Bottom = 326
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ComplaintType"
            Begin Extent = 
               Top = 29
               Left = 112
               Bottom = 163
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SolutionStatus"
            Begin Extent = 
               Top = 39
               Left = 734
               Bottom = 152
               Right = 909
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ComplaintStatus"
            Begin Extent = 
               Top = 199
               Left = 144
               Bottom = 312
               Right = 331
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AspNetUsers_1"
            Begin Extent = 
               Top = 157
               Left = 697
               Bottom = 287
               Right = 921
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "SupportUser"
            Begin Extent = 
               Top = 288
               Left = 650
               Bottom = 384
               Right = 820
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 22
         Width = 284
         Wi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vComplaint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'dth = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2490
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vComplaint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vComplaint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[53] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ComplaintActivity"
            Begin Extent = 
               Top = 41
               Left = 289
               Bottom = 351
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "SolutionStatus"
            Begin Extent = 
               Top = 242
               Left = 530
               Bottom = 355
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "AspNetUsers"
            Begin Extent = 
               Top = 202
               Left = 11
               Bottom = 332
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 11
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4185
         Alias = 1545
         Table = 2955
         Output = 1275
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vComplaintActivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vComplaintActivity'
GO
