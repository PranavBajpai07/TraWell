
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/05/2026 13:43:51
-- Generated from EDMX file: F:\Training\Gladiator Project\Final Repo\Final Project\TraWellApiSolution\TraWellApiProject\Models\TraWellModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TraWell];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Bookings__GuestI__5441852A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK__Bookings__GuestI__5441852A];
GO
IF OBJECT_ID(N'[dbo].[FK__Bookings__TripId__5535A963]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK__Bookings__TripId__5535A963];
GO
IF OBJECT_ID(N'[dbo].[FK__Bookings__UserId__5629CD9C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK__Bookings__UserId__5629CD9C];
GO
IF OBJECT_ID(N'[dbo].[FK__Buses__Admin__571DF1D5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Buses] DROP CONSTRAINT [FK__Buses__Admin__571DF1D5];
GO
IF OBJECT_ID(N'[dbo].[FK__Feedback__Bookin__6A30C649]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [FK__Feedback__Bookin__6A30C649];
GO
IF OBJECT_ID(N'[dbo].[FK__Feedback__BusID__6B24EA82]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Feedback] DROP CONSTRAINT [FK__Feedback__BusID__6B24EA82];
GO
IF OBJECT_ID(N'[dbo].[FK__Passenger__Booki__5812160E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PassengerDetails] DROP CONSTRAINT [FK__Passenger__Booki__5812160E];
GO
IF OBJECT_ID(N'[dbo].[FK__Routes__Admin__59063A47]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Routes] DROP CONSTRAINT [FK__Routes__Admin__59063A47];
GO
IF OBJECT_ID(N'[dbo].[FK__Routes__Destinat__59FA5E80]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Routes] DROP CONSTRAINT [FK__Routes__Destinat__59FA5E80];
GO
IF OBJECT_ID(N'[dbo].[FK__Routes__Source__5AEE82B9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Routes] DROP CONSTRAINT [FK__Routes__Source__5AEE82B9];
GO
IF OBJECT_ID(N'[dbo].[FK__Stops__RouteID__5BE2A6F2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Stops] DROP CONSTRAINT [FK__Stops__RouteID__5BE2A6F2];
GO
IF OBJECT_ID(N'[dbo].[FK__Stops__Stop__5CD6CB2B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Stops] DROP CONSTRAINT [FK__Stops__Stop__5CD6CB2B];
GO
IF OBJECT_ID(N'[dbo].[FK__Transacti__Booki__5DCAEF64]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK__Transacti__Booki__5DCAEF64];
GO
IF OBJECT_ID(N'[dbo].[FK__Trips__Admin__5EBF139D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Trips] DROP CONSTRAINT [FK__Trips__Admin__5EBF139D];
GO
IF OBJECT_ID(N'[dbo].[FK__Trips__BusID__5FB337D6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Trips] DROP CONSTRAINT [FK__Trips__BusID__5FB337D6];
GO
IF OBJECT_ID(N'[dbo].[FK__Trips__RouteID__60A75C0F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Trips] DROP CONSTRAINT [FK__Trips__RouteID__60A75C0F];
GO
IF OBJECT_ID(N'[dbo].[FK__TripStops__Stop__619B8048]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TripStops] DROP CONSTRAINT [FK__TripStops__Stop__619B8048];
GO
IF OBJECT_ID(N'[dbo].[FK__TripStops__TripI__628FA481]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TripStops] DROP CONSTRAINT [FK__TripStops__TripI__628FA481];
GO
IF OBJECT_ID(N'[dbo].[FK__UserLogs__UserId__6383C8BA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserLogs] DROP CONSTRAINT [FK__UserLogs__UserId__6383C8BA];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Admin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Admin];
GO
IF OBJECT_ID(N'[dbo].[Bookings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bookings];
GO
IF OBJECT_ID(N'[dbo].[Buses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Buses];
GO
IF OBJECT_ID(N'[dbo].[Feedback]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Feedback];
GO
IF OBJECT_ID(N'[dbo].[GuestUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GuestUsers];
GO
IF OBJECT_ID(N'[dbo].[PassengerDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PassengerDetails];
GO
IF OBJECT_ID(N'[dbo].[Places]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Places];
GO
IF OBJECT_ID(N'[dbo].[Routes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Routes];
GO
IF OBJECT_ID(N'[dbo].[Stops]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Stops];
GO
IF OBJECT_ID(N'[dbo].[Transactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transactions];
GO
IF OBJECT_ID(N'[dbo].[Trips]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Trips];
GO
IF OBJECT_ID(N'[dbo].[TripStops]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TripStops];
GO
IF OBJECT_ID(N'[dbo].[UserLogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserLogs];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] varchar(20)  NOT NULL,
    [Password] varchar(20)  NOT NULL,
    [isActive] int  NULL
);
GO

-- Creating table 'Bookings'
CREATE TABLE [dbo].[Bookings] (
    [BookingID] int IDENTITY(1,1) NOT NULL,
    [UserRegistered] int  NOT NULL,
    [UserId] int  NULL,
    [GuestId] int  NULL,
    [BookingDate] datetime  NOT NULL,
    [Status] varchar(10)  NOT NULL,
    [TripId] int  NOT NULL,
    [Boarding] varchar(5)  NOT NULL,
    [Arrival] varchar(5)  NOT NULL,
    [Feedback] varchar(100)  NULL,
    [Amount] float  NOT NULL
);
GO

-- Creating table 'Buses'
CREATE TABLE [dbo].[Buses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Number] varchar(10)  NOT NULL,
    [Name] varchar(20)  NOT NULL,
    [Seats] int  NOT NULL,
    [Admin] int  NOT NULL,
    [hasAc] int  NOT NULL,
    [hasWifi] int  NOT NULL,
    [isRecliner] int  NOT NULL,
    [SeatMap] varchar(3)  NOT NULL
);
GO

-- Creating table 'Feedbacks'
CREATE TABLE [dbo].[Feedbacks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BookingID] int  NOT NULL,
    [BusID] int  NOT NULL,
    [BookingFeedback] int  NULL,
    [BusFeedback] int  NULL
);
GO

-- Creating table 'GuestUsers'
CREATE TABLE [dbo].[GuestUsers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [Contact] varchar(30)  NOT NULL
);
GO

-- Creating table 'PassengerDetails'
CREATE TABLE [dbo].[PassengerDetails] (
    [BookingID] int  NOT NULL,
    [Seat] int  NOT NULL,
    [Name] varchar(30)  NOT NULL,
    [Age] int  NOT NULL,
    [Gender] varchar(6)  NOT NULL
);
GO

-- Creating table 'Places'
CREATE TABLE [dbo].[Places] (
    [Code] varchar(5)  NOT NULL,
    [Name] varchar(100)  NOT NULL,
    [City] varchar(50)  NOT NULL
);
GO

-- Creating table 'Routes'
CREATE TABLE [dbo].[Routes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Source] varchar(5)  NOT NULL,
    [Destination] varchar(5)  NOT NULL,
    [Admin] int  NOT NULL
);
GO

-- Creating table 'Stops'
CREATE TABLE [dbo].[Stops] (
    [RouteID] int  NOT NULL,
    [Stop1] varchar(5)  NOT NULL,
    [DistanceFromOrigin] float  NOT NULL
);
GO

-- Creating table 'Transactions'
CREATE TABLE [dbo].[Transactions] (
    [id] int IDENTITY(1,1) NOT NULL,
    [amount] decimal(18,0)  NOT NULL,
    [BookingID] int  NOT NULL,
    [Mode] varchar(20)  NOT NULL,
    [TransType] varchar(6)  NOT NULL,
    [TransactionDate] datetime  NOT NULL
);
GO

-- Creating table 'Trips'
CREATE TABLE [dbo].[Trips] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BusID] int  NOT NULL,
    [RouteID] int  NOT NULL,
    [Admin] int  NOT NULL,
    [CostPerKm] float  NOT NULL,
    [Status] varchar(20)  NOT NULL
);
GO

-- Creating table 'TripStops'
CREATE TABLE [dbo].[TripStops] (
    [TripId] int  NOT NULL,
    [Stop] varchar(5)  NOT NULL,
    [ArrivalTime] datetime  NOT NULL,
    [DepartureTime] datetime  NOT NULL
);
GO

-- Creating table 'UserLogs'
CREATE TABLE [dbo].[UserLogs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EncData] varchar(100)  NULL,
    [UserId] int  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(30)  NOT NULL,
    [LastName] varchar(30)  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [Password] varchar(30)  NOT NULL,
    [Contact] varchar(30)  NOT NULL,
    [Wallet] int  NOT NULL,
    [DOB] datetime  NULL,
    [Address] varchar(100)  NULL,
    [Gender] varchar(6)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [BookingID] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [PK_Bookings]
    PRIMARY KEY CLUSTERED ([BookingID] ASC);
GO

-- Creating primary key on [Id] in table 'Buses'
ALTER TABLE [dbo].[Buses]
ADD CONSTRAINT [PK_Buses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Feedbacks'
ALTER TABLE [dbo].[Feedbacks]
ADD CONSTRAINT [PK_Feedbacks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GuestUsers'
ALTER TABLE [dbo].[GuestUsers]
ADD CONSTRAINT [PK_GuestUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [BookingID], [Seat] in table 'PassengerDetails'
ALTER TABLE [dbo].[PassengerDetails]
ADD CONSTRAINT [PK_PassengerDetails]
    PRIMARY KEY CLUSTERED ([BookingID], [Seat] ASC);
GO

-- Creating primary key on [Code] in table 'Places'
ALTER TABLE [dbo].[Places]
ADD CONSTRAINT [PK_Places]
    PRIMARY KEY CLUSTERED ([Code] ASC);
GO

-- Creating primary key on [Id] in table 'Routes'
ALTER TABLE [dbo].[Routes]
ADD CONSTRAINT [PK_Routes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [RouteID], [Stop1] in table 'Stops'
ALTER TABLE [dbo].[Stops]
ADD CONSTRAINT [PK_Stops]
    PRIMARY KEY CLUSTERED ([RouteID], [Stop1] ASC);
GO

-- Creating primary key on [id] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [PK_Transactions]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'Trips'
ALTER TABLE [dbo].[Trips]
ADD CONSTRAINT [PK_Trips]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [TripId], [Stop] in table 'TripStops'
ALTER TABLE [dbo].[TripStops]
ADD CONSTRAINT [PK_TripStops]
    PRIMARY KEY CLUSTERED ([TripId], [Stop] ASC);
GO

-- Creating primary key on [Id] in table 'UserLogs'
ALTER TABLE [dbo].[UserLogs]
ADD CONSTRAINT [PK_UserLogs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Admin] in table 'Buses'
ALTER TABLE [dbo].[Buses]
ADD CONSTRAINT [FK__Buses__Admin__571DF1D5]
    FOREIGN KEY ([Admin])
    REFERENCES [dbo].[Admins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Buses__Admin__571DF1D5'
CREATE INDEX [IX_FK__Buses__Admin__571DF1D5]
ON [dbo].[Buses]
    ([Admin]);
GO

-- Creating foreign key on [Admin] in table 'Routes'
ALTER TABLE [dbo].[Routes]
ADD CONSTRAINT [FK__Routes__Admin__59063A47]
    FOREIGN KEY ([Admin])
    REFERENCES [dbo].[Admins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Routes__Admin__59063A47'
CREATE INDEX [IX_FK__Routes__Admin__59063A47]
ON [dbo].[Routes]
    ([Admin]);
GO

-- Creating foreign key on [Admin] in table 'Trips'
ALTER TABLE [dbo].[Trips]
ADD CONSTRAINT [FK__Trips__Admin__5EBF139D]
    FOREIGN KEY ([Admin])
    REFERENCES [dbo].[Admins]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Trips__Admin__5EBF139D'
CREATE INDEX [IX_FK__Trips__Admin__5EBF139D]
ON [dbo].[Trips]
    ([Admin]);
GO

-- Creating foreign key on [GuestId] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK__Bookings__GuestI__5441852A]
    FOREIGN KEY ([GuestId])
    REFERENCES [dbo].[GuestUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Bookings__GuestI__5441852A'
CREATE INDEX [IX_FK__Bookings__GuestI__5441852A]
ON [dbo].[Bookings]
    ([GuestId]);
GO

-- Creating foreign key on [TripId] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK__Bookings__TripId__5535A963]
    FOREIGN KEY ([TripId])
    REFERENCES [dbo].[Trips]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Bookings__TripId__5535A963'
CREATE INDEX [IX_FK__Bookings__TripId__5535A963]
ON [dbo].[Bookings]
    ([TripId]);
GO

-- Creating foreign key on [UserId] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK__Bookings__UserId__5629CD9C]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Bookings__UserId__5629CD9C'
CREATE INDEX [IX_FK__Bookings__UserId__5629CD9C]
ON [dbo].[Bookings]
    ([UserId]);
GO

-- Creating foreign key on [BookingID] in table 'Feedbacks'
ALTER TABLE [dbo].[Feedbacks]
ADD CONSTRAINT [FK__Feedback__Bookin__6A30C649]
    FOREIGN KEY ([BookingID])
    REFERENCES [dbo].[Bookings]
        ([BookingID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Feedback__Bookin__6A30C649'
CREATE INDEX [IX_FK__Feedback__Bookin__6A30C649]
ON [dbo].[Feedbacks]
    ([BookingID]);
GO

-- Creating foreign key on [BookingID] in table 'PassengerDetails'
ALTER TABLE [dbo].[PassengerDetails]
ADD CONSTRAINT [FK__Passenger__Booki__5812160E]
    FOREIGN KEY ([BookingID])
    REFERENCES [dbo].[Bookings]
        ([BookingID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BookingID] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [FK__Transacti__Booki__5DCAEF64]
    FOREIGN KEY ([BookingID])
    REFERENCES [dbo].[Bookings]
        ([BookingID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Transacti__Booki__5DCAEF64'
CREATE INDEX [IX_FK__Transacti__Booki__5DCAEF64]
ON [dbo].[Transactions]
    ([BookingID]);
GO

-- Creating foreign key on [BusID] in table 'Feedbacks'
ALTER TABLE [dbo].[Feedbacks]
ADD CONSTRAINT [FK__Feedback__BusID__6B24EA82]
    FOREIGN KEY ([BusID])
    REFERENCES [dbo].[Buses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Feedback__BusID__6B24EA82'
CREATE INDEX [IX_FK__Feedback__BusID__6B24EA82]
ON [dbo].[Feedbacks]
    ([BusID]);
GO

-- Creating foreign key on [BusID] in table 'Trips'
ALTER TABLE [dbo].[Trips]
ADD CONSTRAINT [FK__Trips__BusID__5FB337D6]
    FOREIGN KEY ([BusID])
    REFERENCES [dbo].[Buses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Trips__BusID__5FB337D6'
CREATE INDEX [IX_FK__Trips__BusID__5FB337D6]
ON [dbo].[Trips]
    ([BusID]);
GO

-- Creating foreign key on [Destination] in table 'Routes'
ALTER TABLE [dbo].[Routes]
ADD CONSTRAINT [FK__Routes__Destinat__59FA5E80]
    FOREIGN KEY ([Destination])
    REFERENCES [dbo].[Places]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Routes__Destinat__59FA5E80'
CREATE INDEX [IX_FK__Routes__Destinat__59FA5E80]
ON [dbo].[Routes]
    ([Destination]);
GO

-- Creating foreign key on [Source] in table 'Routes'
ALTER TABLE [dbo].[Routes]
ADD CONSTRAINT [FK__Routes__Source__5AEE82B9]
    FOREIGN KEY ([Source])
    REFERENCES [dbo].[Places]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Routes__Source__5AEE82B9'
CREATE INDEX [IX_FK__Routes__Source__5AEE82B9]
ON [dbo].[Routes]
    ([Source]);
GO

-- Creating foreign key on [Stop1] in table 'Stops'
ALTER TABLE [dbo].[Stops]
ADD CONSTRAINT [FK__Stops__Stop__5CD6CB2B]
    FOREIGN KEY ([Stop1])
    REFERENCES [dbo].[Places]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Stops__Stop__5CD6CB2B'
CREATE INDEX [IX_FK__Stops__Stop__5CD6CB2B]
ON [dbo].[Stops]
    ([Stop1]);
GO

-- Creating foreign key on [Stop] in table 'TripStops'
ALTER TABLE [dbo].[TripStops]
ADD CONSTRAINT [FK__TripStops__Stop__619B8048]
    FOREIGN KEY ([Stop])
    REFERENCES [dbo].[Places]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__TripStops__Stop__619B8048'
CREATE INDEX [IX_FK__TripStops__Stop__619B8048]
ON [dbo].[TripStops]
    ([Stop]);
GO

-- Creating foreign key on [RouteID] in table 'Stops'
ALTER TABLE [dbo].[Stops]
ADD CONSTRAINT [FK__Stops__RouteID__5BE2A6F2]
    FOREIGN KEY ([RouteID])
    REFERENCES [dbo].[Routes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RouteID] in table 'Trips'
ALTER TABLE [dbo].[Trips]
ADD CONSTRAINT [FK__Trips__RouteID__60A75C0F]
    FOREIGN KEY ([RouteID])
    REFERENCES [dbo].[Routes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Trips__RouteID__60A75C0F'
CREATE INDEX [IX_FK__Trips__RouteID__60A75C0F]
ON [dbo].[Trips]
    ([RouteID]);
GO

-- Creating foreign key on [TripId] in table 'TripStops'
ALTER TABLE [dbo].[TripStops]
ADD CONSTRAINT [FK__TripStops__TripI__628FA481]
    FOREIGN KEY ([TripId])
    REFERENCES [dbo].[Trips]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserId] in table 'UserLogs'
ALTER TABLE [dbo].[UserLogs]
ADD CONSTRAINT [FK__UserLogs__UserId__6383C8BA]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__UserLogs__UserId__6383C8BA'
CREATE INDEX [IX_FK__UserLogs__UserId__6383C8BA]
ON [dbo].[UserLogs]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------