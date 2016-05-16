
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/16/2016 21:21:59
-- Generated from EDMX file: D:\Диплом\ZooEnot\ZooEnot\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ZooEnot];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ItemSet'
CREATE TABLE [dbo].[ItemSet] (
    [ItemId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [TypeId] int  NOT NULL
);
GO

-- Creating table 'TypeSet'
CREATE TABLE [dbo].[TypeSet] (
    [TypeId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Poz2Set1'
CREATE TABLE [dbo].[Poz2Set1] (
    [Poz2Id] int IDENTITY(1,1) NOT NULL,
    [ItemId] int  NOT NULL,
    [Count] int  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [BilId] int  NOT NULL
);
GO

-- Creating table 'BillSet'
CREATE TABLE [dbo].[BillSet] (
    [BillId] int IDENTITY(1,1) NOT NULL,
    [ClientId] int  NOT NULL,
    [ShopId] int  NOT NULL,
    [Poz2Id] int  NOT NULL
);
GO

-- Creating table 'ClientSet'
CREATE TABLE [dbo].[ClientSet] (
    [ClientId] int IDENTITY(1,1) NOT NULL,
    [FIO] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ShopSet'
CREATE TABLE [dbo].[ShopSet] (
    [ShopId] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StockSet'
CREATE TABLE [dbo].[StockSet] (
    [ShopId] int  NOT NULL,
    [Count] int  NOT NULL,
    [MinCount] int  NOT NULL
);
GO

-- Creating table 'InvoiceSet'
CREATE TABLE [dbo].[InvoiceSet] (
    [InvoiceId] int IDENTITY(1,1) NOT NULL,
    [SellerId] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [ShopId] int  NOT NULL,
    [Poz1Id] int  NOT NULL
);
GO

-- Creating table 'SellerSet'
CREATE TABLE [dbo].[SellerSet] (
    [SellerId] int IDENTITY(1,1) NOT NULL,
    [NameCompany] nvarchar(max)  NOT NULL,
    [INN] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Poz1Set'
CREATE TABLE [dbo].[Poz1Set] (
    [Poz1Id] int IDENTITY(1,1) NOT NULL,
    [ItemId] int  NOT NULL,
    [Count] int  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [InvoiceId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ItemId] in table 'ItemSet'
ALTER TABLE [dbo].[ItemSet]
ADD CONSTRAINT [PK_ItemSet]
    PRIMARY KEY CLUSTERED ([ItemId] ASC);
GO

-- Creating primary key on [TypeId] in table 'TypeSet'
ALTER TABLE [dbo].[TypeSet]
ADD CONSTRAINT [PK_TypeSet]
    PRIMARY KEY CLUSTERED ([TypeId] ASC);
GO

-- Creating primary key on [Poz2Id] in table 'Poz2Set1'
ALTER TABLE [dbo].[Poz2Set1]
ADD CONSTRAINT [PK_Poz2Set1]
    PRIMARY KEY CLUSTERED ([Poz2Id] ASC);
GO

-- Creating primary key on [BillId] in table 'BillSet'
ALTER TABLE [dbo].[BillSet]
ADD CONSTRAINT [PK_BillSet]
    PRIMARY KEY CLUSTERED ([BillId] ASC);
GO

-- Creating primary key on [ClientId] in table 'ClientSet'
ALTER TABLE [dbo].[ClientSet]
ADD CONSTRAINT [PK_ClientSet]
    PRIMARY KEY CLUSTERED ([ClientId] ASC);
GO

-- Creating primary key on [ShopId] in table 'ShopSet'
ALTER TABLE [dbo].[ShopSet]
ADD CONSTRAINT [PK_ShopSet]
    PRIMARY KEY CLUSTERED ([ShopId] ASC);
GO

-- Creating primary key on [ShopId] in table 'StockSet'
ALTER TABLE [dbo].[StockSet]
ADD CONSTRAINT [PK_StockSet]
    PRIMARY KEY CLUSTERED ([ShopId] ASC);
GO

-- Creating primary key on [InvoiceId] in table 'InvoiceSet'
ALTER TABLE [dbo].[InvoiceSet]
ADD CONSTRAINT [PK_InvoiceSet]
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC);
GO

-- Creating primary key on [SellerId] in table 'SellerSet'
ALTER TABLE [dbo].[SellerSet]
ADD CONSTRAINT [PK_SellerSet]
    PRIMARY KEY CLUSTERED ([SellerId] ASC);
GO

-- Creating primary key on [Poz1Id] in table 'Poz1Set'
ALTER TABLE [dbo].[Poz1Set]
ADD CONSTRAINT [PK_Poz1Set]
    PRIMARY KEY CLUSTERED ([Poz1Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TypeId] in table 'ItemSet'
ALTER TABLE [dbo].[ItemSet]
ADD CONSTRAINT [FK_TypeItem]
    FOREIGN KEY ([TypeId])
    REFERENCES [dbo].[TypeSet]
        ([TypeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TypeItem'
CREATE INDEX [IX_FK_TypeItem]
ON [dbo].[ItemSet]
    ([TypeId]);
GO

-- Creating foreign key on [ItemId] in table 'Poz2Set1'
ALTER TABLE [dbo].[Poz2Set1]
ADD CONSTRAINT [FK_ItemPoz2]
    FOREIGN KEY ([ItemId])
    REFERENCES [dbo].[ItemSet]
        ([ItemId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ItemPoz2'
CREATE INDEX [IX_FK_ItemPoz2]
ON [dbo].[Poz2Set1]
    ([ItemId]);
GO

-- Creating foreign key on [ItemId] in table 'Poz1Set'
ALTER TABLE [dbo].[Poz1Set]
ADD CONSTRAINT [FK_ItemPoz1]
    FOREIGN KEY ([ItemId])
    REFERENCES [dbo].[ItemSet]
        ([ItemId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ItemPoz1'
CREATE INDEX [IX_FK_ItemPoz1]
ON [dbo].[Poz1Set]
    ([ItemId]);
GO

-- Creating foreign key on [BilId] in table 'Poz2Set1'
ALTER TABLE [dbo].[Poz2Set1]
ADD CONSTRAINT [FK_BillPoz2]
    FOREIGN KEY ([BilId])
    REFERENCES [dbo].[BillSet]
        ([BillId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillPoz2'
CREATE INDEX [IX_FK_BillPoz2]
ON [dbo].[Poz2Set1]
    ([BilId]);
GO

-- Creating foreign key on [InvoiceId] in table 'Poz1Set'
ALTER TABLE [dbo].[Poz1Set]
ADD CONSTRAINT [FK_InvoicePoz1]
    FOREIGN KEY ([InvoiceId])
    REFERENCES [dbo].[InvoiceSet]
        ([InvoiceId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoicePoz1'
CREATE INDEX [IX_FK_InvoicePoz1]
ON [dbo].[Poz1Set]
    ([InvoiceId]);
GO

-- Creating foreign key on [ShopId] in table 'BillSet'
ALTER TABLE [dbo].[BillSet]
ADD CONSTRAINT [FK_ShopBill]
    FOREIGN KEY ([ShopId])
    REFERENCES [dbo].[ShopSet]
        ([ShopId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShopBill'
CREATE INDEX [IX_FK_ShopBill]
ON [dbo].[BillSet]
    ([ShopId]);
GO

-- Creating foreign key on [ShopId] in table 'InvoiceSet'
ALTER TABLE [dbo].[InvoiceSet]
ADD CONSTRAINT [FK_ShopInvoice]
    FOREIGN KEY ([ShopId])
    REFERENCES [dbo].[ShopSet]
        ([ShopId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShopInvoice'
CREATE INDEX [IX_FK_ShopInvoice]
ON [dbo].[InvoiceSet]
    ([ShopId]);
GO

-- Creating foreign key on [ClientId] in table 'BillSet'
ALTER TABLE [dbo].[BillSet]
ADD CONSTRAINT [FK_ClientBill]
    FOREIGN KEY ([ClientId])
    REFERENCES [dbo].[ClientSet]
        ([ClientId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientBill'
CREATE INDEX [IX_FK_ClientBill]
ON [dbo].[BillSet]
    ([ClientId]);
GO

-- Creating foreign key on [SellerId] in table 'InvoiceSet'
ALTER TABLE [dbo].[InvoiceSet]
ADD CONSTRAINT [FK_SellerInvoice]
    FOREIGN KEY ([SellerId])
    REFERENCES [dbo].[SellerSet]
        ([SellerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SellerInvoice'
CREATE INDEX [IX_FK_SellerInvoice]
ON [dbo].[InvoiceSet]
    ([SellerId]);
GO

-- Creating foreign key on [ShopId] in table 'ShopSet'
ALTER TABLE [dbo].[ShopSet]
ADD CONSTRAINT [FK_ShopStock]
    FOREIGN KEY ([ShopId])
    REFERENCES [dbo].[StockSet]
        ([ShopId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------