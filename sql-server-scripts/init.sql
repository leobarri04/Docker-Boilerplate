-- Modified Heroes table with additional attributes
CREATE TABLE Heroes (
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    Alias NVARCHAR(255),
    PowerLevel INT NOT NULL,                -- Power level attribute
    Origin NVARCHAR(255),                   -- Origin of the hero (e.g., Krypton, Atlantis)
    Affiliation NVARCHAR(255),              -- Hero's team affiliation (e.g., Justice League)
    FirstAppearance DATE,                   -- Date of the first appearance
    Alignment NVARCHAR(50),                 -- Alignment (e.g., Hero, Antihero, Villain)
    
    CONSTRAINT PK_Heroes PRIMARY KEY (Id)
);

-- Insert Heroes with new attributes
INSERT INTO Heroes (Name, Alias, PowerLevel, Origin, Affiliation, FirstAppearance, Alignment)
VALUES 
('Superman', 'Clark Kent', 100, 'Krypton', 'Justice League', '1938-06-01', 'Hero'),
('Batman', 'Bruce Wayne', 90, 'Gotham City', 'Justice League', '1939-05-01', 'Hero'),
('Wonder Woman', 'Diana Prince', 95, 'Themyscira', 'Justice League', '1941-12-01', 'Hero'),
('Aquaman', 'Arthur Curry', 85, 'Atlantis', 'Justice League', '1941-11-01', 'Hero'),
('Flash', 'Barry Allen', 92, 'Central City', 'Justice League', '1956-10-01', 'Hero'),
('Green Lantern', 'Hal Jordan', 88, 'Coast City', 'Justice League', '1959-07-01', 'Hero'),
('Cyborg', 'Victor Stone', 80, 'Detroit', 'Justice League', '1980-10-01', 'Hero'),
('Green Arrow', 'Oliver Queen', 75, 'Star City', 'Justice League', '1941-11-01', 'Hero'),
('Shazam', 'Billy Batson', 90, 'Fawcett City', 'Justice League', '1940-02-01', 'Hero'),
('Martian Manhunter', 'Jonzz', 85, 'Mars', 'Justice League', '1955-11-01', 'Hero');


-- Modified Sidekicks table with HeroId as BIGINT
CREATE TABLE Sidekicks (
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    LoyaltyLevel INT NOT NULL,
    HeroId BIGINT NOT NULL,  -- Foreign key as BIGINT now
    CONSTRAINT PK_Sidekicks PRIMARY KEY (Id),
    CONSTRAINT FK_Sidekicks_Hero FOREIGN KEY (HeroId) REFERENCES Heroes(Id) 
);

-- Insert Sidekicks with new HeroId as BIGINT references
INSERT INTO Sidekicks (Name, LoyaltyLevel, HeroId)
VALUES
('Robin', 95, 2),
('Supergirl', 90, 1),
('Donna Troy', 85, 3),
('Aqualad', 88, 4),
('Kid Flash', 85, 5),
('Speedy', 80, 8),
('Freddy Freeman', 70, 9),
('Miss Martian', 75, 10),
('Lantern Jessica Cruz', 80, 6),
('Sarah Lance', 78, 7);

-- Modified Weapons table with HeroId as BIGINT
CREATE TABLE Weapons (
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(255) NOT NULL,
    Type NVARCHAR(255),
    PowerLevel INT NOT NULL,
    Description NVARCHAR(255),
    HeroId BIGINT NOT NULL,  -- Foreign key as BIGINT now
    CONSTRAINT PK_Weapons PRIMARY KEY (Id),
    CONSTRAINT FK_Weapons_Hero FOREIGN KEY (HeroId) REFERENCES Heroes(Id)
);

-- Insert Weapons with new HeroId as BIGINT references
INSERT INTO Weapons (Name, Type, PowerLevel, Description, HeroId)
VALUES
('Batarang', 'Gadget', 75, 'Throwable bat-shaped weapon', 2),
('Lasso of Truth', 'Melee', 90, 'Unbreakable rope that compels truth', 3),
('Heat Vision', 'Superpower', 95, 'Emits powerful beams of heat from eyes', 1),
('Trident', 'Melee', 85, 'Powerful Atlantean weapon', 4),
('Speed Force', 'Superpower', 98, 'Access to superhuman speed', 5),
('Power Ring', 'Gadget', 95, 'Energy-conjuring ring', 6),
('Sound Cannon', 'Gadget', 78, 'High-energy sound blast', 7),
('Bow and Arrow', 'Ranged', 70, 'Trick arrows with diverse abilities', 8),
('Lightning Bolt', 'Superpower', 88, 'Summon lightning at will', 9),
('Martian Vision', 'Superpower', 85, 'Laser-like beams from eyes', 10);
