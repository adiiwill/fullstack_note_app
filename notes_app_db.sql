-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 10. 09:58
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `notes_app`
--
CREATE DATABASE IF NOT EXISTS `notes_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `notes_app`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `note`
--

CREATE TABLE `note` (
  `NoteID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `Content` text DEFAULT NULL,
  `IsFav` tinyint(1) NOT NULL DEFAULT 0,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastModifiedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `note`
--

INSERT INTO `note` (`NoteID`, `UserID`, `Title`, `Content`, `IsFav`, `CreationDate`, `LastModifiedDate`) VALUES
(4, 10, 'This is the title', 'This is the main content of the note. This will be editable and seen by the user.', 1, '2024-02-03 11:38:18', '2024-02-06 10:20:08'),
(6, 10, 'Loooooooooooooong note', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at elit at augue rhoncus efficitur. Ut a fermentum nisi. Nulla tortor eros, fringilla at nisl non, pulvinar pellentesque justo. Fusce maximus feugiat mauris, ac luctus massa venenatis et. Nam quis libero ante. Nullam venenatis, justo a aliquam luctus, diam mi accumsan nibh, tincidunt blandit velit est ac augue. Duis nec accumsan urna.\n\n---\n\nNunc condimentum sollicitudin nibh, nec facilisis enim tincidunt ac. Sed pulvinar, est vel fringilla ornare, urna risus ornare nibh, a pulvinar nibh orci at augue. Sed et ipsum quis elit tristique posuere. Duis malesuada risus sit amet ex tristique, eu tincidunt massa varius. Ut porta vestibulum lectus, vel consectetur nisl maximus ut. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at elit at augue rhoncus efficitur.\n\n---\n\nUt a fermentum nisi. Nulla tortor eros, fringilla at nisl non, pulvinar pellentesque justo. Fusce maximus feugiat mauris, ac luctus massa venenatis et. Nam quis libero ante. Nullam venenatis, justo a aliquam luctus, diam mi accumsan nibh, tincidunt blandit velit est ac augue. Duis nec accumsan urna. Nunc condimentum sollicitudin nibh, nec facilisis enim tincidunt ac. Sed pulvinar, est vel fringilla ornare, urna risus ornare nibh, a pulvinar nibh orci at augue. Sed et ipsum quis elit tristique posuere. Duis malesuada risus sit amet ex tristique, eu tincidunt massa varius. Ut porta vestibulum lectus, vel consectetur nisl maximus ut. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at elit at augue rhoncus efficitur. Ut a fermentum nisi. Nulla tortor eros, fringilla at nisl non, pulvinar pellentesque justo. Fusce maximus feugiat mauris, ac luctus massa venenatis et. Nam quis libero ante. Nullam venenatis, justo a aliquam luctus, diam mi accumsan nibh, tincidunt blandit velit est ac augue. Duis nec accumsan urna. Nunc condimentum sollicitudin nibh, nec facilisis enim tincidunt ac. Sed pulvinar, est vel fringilla ornare, urna risus ornare nibh, a pulvinar nibh orci at augue. Sed et ipsum quis elit tristique posuere. Duis malesuada risus sit amet ex tristique, eu tincidunt massa varius. Ut porta vestibulum lectus, vel consectetur nisl maximus ut. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at elit at augue rhoncus efficitur. Ut a fermentum nisi. Nulla tortor eros, fringilla at nisl non, pulvinar pellentesque justo. Fusce maximus feugiat mauris, ac luctus massa venenatis et. Nam quis libero ante. Nullam venenatis, justo a aliquam luctus, diam mi accumsan nibh, tincidunt blandit velit est ac augue. Duis nec accumsan urna. Nunc condimentum sollicitudin nibh, nec facilisis enim tincidunt ac. Sed pulvinar, est vel fringilla ornare, urna risus ornare nibh, a pulvinar nibh orci at augue. Sed et ipsum quis elit tristique posuere. Duis malesuada risus sit amet ex tristique, eu tincidunt massa varius. Ut porta vestibulum lectus, vel consectetur nisl maximus ut. ', 1, '2024-02-03 21:57:42', '2024-02-07 09:27:20'),
(14, 10, 'Markdown test', '---\n__Advertisement :)__\n\n- __[pica](https://nodeca.github.io/pica/demo/)__ - high quality and fast image\n  resize in browser.\n- __[babelfish](https://github.com/nodeca/babelfish/)__ - developer friendly\n  i18n with plurals support and easy syntax.\n\nYou will like those projects!\n\n---\n\n# h1 Heading 8-)\n## h2 Heading\n### h3 Heading\n#### h4 Heading\n##### h5 Heading\n###### h6 Heading\n\n\n## Horizontal Rules\n\n___\n\n---\n\n***\n\n\n## Typographic replacements\n\nEnable typographer option to see result.\n\n(c) (C) (r) (R) (tm) (TM) (p) (P) +-\n\ntest.. test... test..... test?..... test!....\n\n!!!!!! ???? ,,  -- ---\n\n\"Smartypants, double quotes\" and \'single quotes\'\n\n\n## Emphasis\n\n**This is bold text**\n\n__This is bold text__\n\n*This is italic text*\n\n_This is italic text_\n\n~~Strikethrough~~\n\n\n## Blockquotes\n\n\n> Blockquotes can also be nested...\n>> ...by using additional greater-than signs right next to each other...\n> > > ...or with spaces between arrows.\n\n\n## Lists\n\nUnordered\n\n+ Create a list by starting a line with `+`, `-`, or `*`\n+ Sub-lists are made by indenting 2 spaces:\n  - Marker character change forces new list start:\n    * Ac tristique libero volutpat at\n    + Facilisis in pretium nisl aliquet\n    - Nulla volutpat aliquam velit\n+ Very easy!\n\nOrdered\n\n1. Lorem ipsum dolor sit amet\n2. Consectetur adipiscing elit\n3. Integer molestie lorem at massa\n\n\n1. You can use sequential numbers...\n1. ...or keep all the numbers as `1.`\n\nStart numbering with offset:\n\n57. foo\n1. bar\n\n\n## Code\n\nInline `code`\n\nIndented code\n\n    // Some comments\n    line 1 of code\n    line 2 of code\n    line 3 of code\n\n\nBlock code \"fences\"\n\n```\nSample text here...\n```\n\nSyntax highlighting\n\n``` js\nvar foo = function (bar) {\n  return bar++;\n};\n\nconsole.log(foo(5));\n```\n\n## Tables\n\n| Option | Description |\n| ------ | ----------- |\n| data   | path to data files to supply the data that will be passed into templates. |\n| engine | engine to be used for processing templates. Handlebars is the default. |\n| ext    | extension to be used for dest files. |\n\nRight aligned columns\n\n| Option | Description |\n| ------:| -----------:|\n| data   | path to data files to supply the data that will be passed into templates. |\n| engine | engine to be used for processing templates. Handlebars is the default. |\n| ext    | extension to be used for dest files. |\n\n\n## Links\n\n[link text](http://dev.nodeca.com)\n\n[link with title](http://nodeca.github.io/pica/demo/ \"title text!\")\n\nAutoconverted link https://github.com/nodeca/pica (enable linkify to see)\n\n\n## Images\n\n![Minion](https://octodex.github.com/images/minion.png)\n![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg \"The Stormtroopocat\")\n\nLike links, Images also have a footnote style syntax\n\n![Alt text][id]\n\nWith a reference later in the document defining the URL location:\n\n[id]: https://octodex.github.com/images/dojocat.jpg  \"The Dojocat\"\n\n\n## Plugins\n\nThe killer feature of `markdown-it` is very effective support of\n[syntax plugins](https://www.npmjs.org/browse/keyword/markdown-it-plugin).\n\n\n### [Emojies](https://github.com/markdown-it/markdown-it-emoji)\n\n> Classic markup: :wink: :cry: :laughing: :yum:\n>\n> Shortcuts (emoticons): :-) :-( 8-) ;)\n\nsee [how to change output](https://github.com/markdown-it/markdown-it-emoji#change-output) with twemoji.\n\n\n### [Subscript](https://github.com/markdown-it/markdown-it-sub) / [Superscript](https://github.com/markdown-it/markdown-it-sup)\n\n- 19^th^\n- H~2~O\n\n\n### [\\<ins>](https://github.com/markdown-it/markdown-it-ins)\n\n++Inserted text++\n\n\n### [\\<mark>](https://github.com/markdown-it/markdown-it-mark)\n\n==Marked text==\n\n\n### [Footnotes](https://github.com/markdown-it/markdown-it-footnote)\n\nFootnote 1 link[^first].\n\nFootnote 2 link[^second].\n\nInline footnote^[Text of inline footnote] definition.\n\nDuplicated footnote reference[^second].\n\n[^first]: Footnote **can have markup**\n\n    and multiple paragraphs.\n\n[^second]: Footnote text.\n\n\n### [Definition lists](https://github.com/markdown-it/markdown-it-deflist)\n\nTerm 1\n\n:   Definition 1\nwith lazy continuation.\n\nTerm 2 with *inline markup*\n\n:   Definition 2\n\n        { some code, part of Definition 2 }\n\n    Third paragraph of definition 2.\n\n_Compact style:_\n\nTerm 1\n  ~ Definition 1\n\nTerm 2\n  ~ Definition 2a\n  ~ Definition 2b\n\n\n### [Abbreviations](https://github.com/markdown-it/markdown-it-abbr)\n\nThis is HTML abbreviation example.\n\nIt converts \"HTML\", but keep intact partial entries like \"xxxHTMLyyy\" and so on.\n\n*[HTML]: Hyper Text Markup Language\n\n### [Custom containers](https://github.com/markdown-it/markdown-it-container)\n\n::: warning\n*here be dragons*\n:::\n', 1, '2024-02-04 19:35:12', '2024-02-07 09:27:28'),
(16, 15, 'Gábor jegyzete', '# Valami\nA stardew valley-nek van magyar nagykövet és az app Store Windows és Mac OS egy méret a lényeg hogy a végsőkig kitart a rezsicsökkentés.', 0, '2024-02-05 08:50:05', '2024-02-05 09:08:07'),
(20, 16, 'Valmi', 'Sncjdjdjd\n', 0, '2024-02-05 09:13:23', '2024-02-05 09:13:23'),
(22, 10, 'This is a random note', 'Iunno', 0, '2024-02-06 10:05:52', '2024-02-06 10:05:52'),
(25, 10, 'Random note name', '# The beginning\nThe French Revolution and create a p ltd plot no to the best way to know what game engine did you get a személyin you to know what you think of the maximum number to know if you are not get the maximum number to know if there.\n\n---\n\n> This is an important text\n\n---\n\n# Something\nThe best way for you to know if there is no to the best Hungarian forint the best Hungarian forint you to water the plants and animals and I will send you a present my man ', 0, '2024-02-06 10:09:43', '2024-04-03 08:50:41'),
(29, 18, 'Szülői értekezlet', 'Dano szülői ért. 02.07 szerda 17:00\n', 0, '2024-02-07 09:33:15', '2024-02-07 09:33:40'),
(30, 18, 'Beni szerda zongora', 'Beni szerdán fél órával tovább lesz\n02.07', 0, '2024-02-07 09:34:23', '2024-02-07 09:34:23'),
(31, 18, 'Termál fürdő ', '02.24 családilag Hajdúszoboszló', 1, '2024-02-07 09:36:18', '2024-02-07 09:37:42'),
(32, 18, 'Március 15 hosszú hétvége', '# Utazás 3 napos\n\n---\n\n- Miskolc\n- Eger\n- Szlovákia', 0, '2024-02-07 09:41:38', '2024-02-07 09:41:38');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Email`, `Password`) VALUES
(10, 'Adi', 'adi@adam.hu', '$2b$10$L759tZzvEG2cBmZeUMxucO3MPoMowJpIfCIM9IhwSofFAhgdMPqmK'),
(12, 'Sasa', 'Sasa@sas.com', '$2b$10$Ec7HEPdQCVPvWCVrKroTcuZoN93I2w3dYti0/zJZBfqrpRaR2rM.e'),
(13, 'Adix', 'adix@adam.hu', '$2b$10$9uaO4W/FXH1brXFEycJOduG3KtRSzqN6RfjKlZXn3fky7iDz9Jv0i'),
(15, 'Garbor', 'gabo@xd.com', '$2b$10$5c5UvvX7vpYa3V9SsZCgh.w5dZhImPiDzvUw6ElDOUbvRh95YzUdu'),
(16, 'Virag', 'virag@virag.asd', '$2b$10$E/eD88ta9BYTbrrUyYfPQ.X1atiHIiaH1m2IcmOGPYZU7uBYGgHFS'),
(17, 'Demo', 'demo@gmail.com', '$2b$10$vV4P8VDH7IAKfaUNLFSOoeTZOwZU9YGe.R86xxILi1zJtpdgqE1yq'),
(18, 'nahaija ', 'nahaija@gmail.com', '$2b$10$UKtFUYzTxeYeXiscc0tGseVaRCUyZAyLcSchvGM/AXES0NuALyQSG');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`NoteID`),
  ADD KEY `UserID` (`UserID`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `note`
--
ALTER TABLE `note`
  MODIFY `NoteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
