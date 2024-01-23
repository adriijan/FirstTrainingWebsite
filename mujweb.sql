-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 23. led 2024, 17:14
-- Verze serveru: 10.4.28-MariaDB
-- Verze PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `mujweb`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `stranka`
--

DROP TABLE IF EXISTS `stranka`;
CREATE TABLE `stranka` (
  `id` varchar(100) NOT NULL,
  `titulek` text DEFAULT NULL,
  `menu` text DEFAULT NULL,
  `obsah` text DEFAULT NULL,
  `poradi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `stranka`
--

INSERT INTO `stranka` (`id`, `titulek`, `menu`, `obsah`, `poradi`) VALUES
('404', 'Page Not Found', '', '<div class=\"pageNotFound\">\r\n<h1>Page not found</h1>\r\n<div class=\"errorImg\"><img src=\"img/404img.jpg\" alt=\"Page not found\" title=\"Page not found\" /></div>\r\n</div>', 7),
('blog', 'Blog', 'Blog', '<div id=\"odkazy\" class=\"odkazy\"><a href=\"#clanek1\" class=\"scroll-link\">Winter atmosphere</a> <a href=\"#clanek2\" class=\"scroll-link\">Italy vacation</a> <a href=\"#clanek3\" class=\"scroll-link\">Scandinavia visit</a></div>\r\n<div class=\"clanky\">\r\n<div class=\"container\">\r\n<div class=\"clanek\" id=\"clanek1\">\r\n<div class=\"div1_clanek\">\r\n<h2>Winter atmosphere</h2>\r\n</div>\r\n<div class=\"div2_clanek\">\r\n<p><img class=\"obr_clanek\" src=\"img/vanoce/clanek_obrazek.jpg\" alt=\"Pan Perníček\" /> <span class=\"text-cast1\"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat non distinctio totam, similique dolore natus dolorum laboriosam delectus. Dolore a pariatur nesciunt, cupiditate sunt, itaque necessitatibus temporibus corporis maiores similique, autem quae. Reiciendis, beatae sed doloribus, et natus repellat eius voluptatibus, explicabo sunt ducimus magnam. Animi ea cupiditate rem temporibus reiciendis sed repellendus, voluptates dolorum maxime mollitia at libero cumque odio, tenetur harum pariatur quas soluta incidunt, sit error? Hic debitis asperiores exercitationem a beatae quod nisi, dolorum explicabo placeat. Reiciendis, ipsa voluptate. Vero expedita veniam non, fugit culpa quod est provident vel a laudantium voluptatem corrupti. </span> <span class=\"text-cast2\">Neque minima blanditiis tempore molestias a veniam sit voluptate ex ipsum eum quibusdam accusantium quod nulla magni voluptatem expedita numquam, asperiores deleniti consequuntur facilis vero fugit recusandae? Fugit expedita fugiat provident libero. Totam doloremque quidem voluptates, laborum at sint cumque placeat odit sunt reiciendis earum quo dolore voluptatibus accusantium, nobis vel quos obcaecati!</span></p>\r\n<button type=\"button\" class=\"btn btn-light zobrazitVice\">View more</button></div>\r\n</div>\r\n<div class=\"clanek\" id=\"clanek2\">\r\n<div class=\"div1_clanek\">\r\n<h2>Italy vacation</h2>\r\n</div>\r\n<div class=\"div2_clanek\">\r\n<p><img class=\"obr_clanek\" src=\"img/Italy/clanek_obrazek.jpg\" alt=\"Řím na Tibeře\" /> <span class=\"text-cast1\"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, magni! Voluptatibus explicabo sequi dignissimos repellat at quas nostrum temporibus maxime fuga cupiditate totam sapiente a fugit, debitis, sit veniam voluptatem, officiis minus similique fugiat quisquam consectetur! Nam atque veritatis corrupti consequatur, quos molestiae veniam. Aliquid est esse iure excepturi laboriosam similique quaerat minus in, voluptatibus cupiditate dolorem perspiciatis earum omnis at? Eius, consectetur! Possimus labore ea qui itaque quibusdam accusamus natus doloremque? Accusantium eligendi explicabo id ipsum placeat a minima quis totam eum, laborum velit quasi, quidem aut, itaque sunt sed cumque nemo saepe consectetur labore. Dolorem dolorum voluptatem libero. </span><span class=\"text-cast2\">Vero expedita veniam non, fugit culpa quod est provident vel a laudantium voluptatem corrupti. Neque minima blanditiis tempore molestias a veniam sit voluptate ex ipsum eum quibusdam accusantium quod nulla magni voluptatem expedita numquam, asperiores deleniti consequuntur facilis vero fugit recusandae? Fugit expedita fugiat provident libero. Totam doloremque quidem voluptates, laborum at sint cumque placeat odit sunt reiciendis earum quo dolore voluptatibus accusantium, nobis vel quos obcaecati!</span></p>\r\n<button type=\"button\" class=\"btn btn-light zobrazitVice\">View more</button></div>\r\n</div>\r\n<div class=\"clanek\" id=\"clanek3\">\r\n<div class=\"div1_clanek\">\r\n<h2>Scandinavia visit</h2>\r\n</div>\r\n<div class=\"div2_clanek\">\r\n<p><img class=\"obr_clanek\" src=\"img/sever/clanek_obrazek.jpg\" alt=\"Skandinávie\" /> <span class=\"text-cast1\"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus eveniet soluta quisquam tempore. Voluptatibus saepe nesciunt, sint enim doloremque eos provident, similique qui tempora, delectus explicabo culpa reprehenderit aperiam corrupti unde cupiditate dicta possimus dolorum. Debitis eveniet architecto laboriosam id sit perferendis ex quam at? Quisquam quis accusamus omnis praesentium pariatur at eaque veritatis nisi placeat, alias, nesciunt, dolorem aperiam impedit quasi. Autem eveniet illum et pariatur quidem, provident consequatur voluptates! Voluptas error inventore, qui necessitatibus quae dolore dolor, nobis nulla, dolorem earum laborum vel. Rem fugiat accusamus nihil provident beatae est, fuga eveniet neque pariatur quod ullam aspernatur porro quas, ducimus praesentium nobis enim obcaecati tempore? </span><span class=\"text-cast2\">Iste vel temporibus itaque autem eum similique, fuga labore incidunt iure fugiat nulla dolore perspiciatis! Nemo facilis eos optio, maiores nam quibusdam veniam corporis perferendis blanditiis eum modi consequuntur et iusto quidem reprehenderit. Repudiandae hic, placeat enim architecto harum quod, blanditiis cumque est quasi laboriosam voluptate sunt distinctio cupiditate reiciendis rem! Alias, dolore earum? Nobis architecto sed ex numquam natus aliquam tempora, corrupti ratione eos iure a dicta voluptatum repellendus eum consequatur fugit.</span></p>\r\n<button type=\"button\" class=\"btn btn-light zobrazitVice\">View more</button></div>\r\n</div>\r\n</div>\r\n</div>', 3),
('galerie', 'Gallery', 'Gallery', '<div class=\"odkazy\"><a href=\"#italy\" id=\"italyLink\">Rome</a> <a href=\"#north\" id=\"northLink\">North</a> <a href=\"#christmas\" id=\"christmasLink\">Christmas</a> <a href=\"#paris\" id=\"parisLink\">Paris</a> <a href=\"#london\" id=\"londonLink\">London</a></div>\r\n<div class=\"galerie\">\r\n<div class=\"container\">\r\n<div class=\"galerie_italy\" id=\"italy\">\r\n<h2>Rome, Italy</h2>\r\n<div class=\"parent_italy\">\r\n<div class=\"div1_italy\"><a href=\"img/Italy/4.jpg\" title=\"Kupole\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/4.jpg\" alt=\"Kupole\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div2_italy\"><a href=\"img/Italy/2.jpg\" title=\"Piazza Navona\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/2.jpg\" alt=\"Piazza Navona\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div3_italy\"><a href=\"img/Italy/3.jpg\" title=\"Památník Viktora Emanuela II.\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/3.jpg\" alt=\"Památník Viktora Emanuela II.\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div4_italy\"><a href=\"img/Italy/1.jpg\" title=\"Italský bar\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/1.jpg\" alt=\"Italský bar\" width=\"290px\" height=\"290px\" /></a></div>\r\n<div class=\"div5_italy\"><a href=\"img/Italy/7.jpg\" title=\"Trattoria\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/7.jpg\" alt=\"Trattoria\" width=\"290px\" height=\"290px\" /></a></div>\r\n<div class=\"div6_italy\"><a href=\"img/Italy/6.jpg\" title=\"Průchod\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/6.jpg\" alt=\"Průchod\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div7_italy\"><a href=\"img/Italy/5.jpg\" title=\"Italská ulice\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/5.jpg\" alt=\"Italská ulice\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div8_italy\"><a href=\"img/Italy/8.jpg\" title=\"Fontána Di Trevi\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/8.jpg\" alt=\"Fontána Di Trevi\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div9_italy\"><a href=\"img/Italy/9.jpg\" title=\"Italská ulice\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/9.jpg\" alt=\"Italská ulice\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div10_italy\"><a href=\"img/Italy/10.jpg\" title=\"Vatikán\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/10.jpg\" alt=\"Vatikán\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div11_italy\"><a href=\"img/Italy/11.jpg\" title=\"Vatikán\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/11.jpg\" alt=\"Vatikán\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div12_italy\"><a href=\"img/Italy/12.jpg\" title=\"Tibera\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/12.jpg\" alt=\"Tibera\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div13_italy\"><a href=\"img/Italy/14.jpg\" title=\"Forum Romanum\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/14.jpg\" alt=\"Forum Romanum\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div14_italy\"><a href=\"img/Italy/13.jpg\" title=\"Řím na Tibeře\" rel=\"lightbox[italie]\"> <img src=\"img/Italy/grid/13.jpg\" alt=\"Řím na Tibeře\" width=\"140px\" height=\"140px\" /></a></div>\r\n</div>\r\n<!-- <div class=\"parent_italy\">\r\n                        <div class=\"div1_italy\">\r\n                            <a href=\"./img/Italy/ulice.jpg\" title=\"Ulice v Římě\" rel=\"lightbox[italie]\">\r\n                                <img src=\"./img/Italy/500px/ulice_500.jpg\" alt=\"Ulice\" width=\"316px\" height=\"474px\"></a>\r\n                        </div>\r\n                        <div class=\"div2_italy\">\r\n                            <a href=\"./img/Italy/vatikan1.jpg\" title=\"Vatikán\" rel=\"lightbox[italie]\">\r\n                                <img src=\"./img/Italy/500px/vatikan1_500.jpg\" alt=\"Vatikán\" width=\"225px\"\r\n                                    height=\"150px\"> </a>\r\n                        </div>\r\n                        <div class=\"div3_italy\">\r\n                            <a href=\"./img/Italy/bar.jpg\" title=\"Italská kavárna\" rel=\"lightbox[italie]\">\r\n                                <img src=\"./img/Italy/500px/bar_500.jpg\" alt=\"kavárna\" width=\"225px\" height=\"150px\">\r\n                            </a>\r\n                        </div>\r\n                        <div class=\"div4_italy\">\r\n                            <a href=\"./img/Italy/vatikan2.jpg\" title=\"Vatikán\" rel=\"lightbox[italie]\">\r\n                                <img src=\"./img/Italy/500px/vatikan2_500.jpg\" alt=\"Vatikán\" width=\"225px\"\r\n                                    height=\"150px\"> </a>\r\n                        </div>\r\n                        <div class=\"div5_italy\">\r\n                            <a href=\"./img/Italy/trevi.jpg\" title=\"Fontána di Trevi\" rel=\"lightbox[italie]\">\r\n                                <img src=\"./img/Italy/500px/trevi_500.jpg\" alt=\"Fontána\" width=\"208px\" height=\"312px\">\r\n                            </a>\r\n                        </div>\r\n                        <div class=\"div6_italy\">\r\n                            <a href=\"./img/Italy/pruchod.jpg\" title=\"Průchod\" rel=\"lightbox[italie]\">\r\n                                <img src=\"./img/Italy/500px/pruchod_500.jpg\" alt=\"Průchod\" width=\"100px\"\r\n                                    height=\"150px\"></a>\r\n                        </div>\r\n                        <div class=\"div7_italy\">\r\n                            <a href=\"./img/Italy/kupole.jpg\" title=\"Kostely\" rel=\"lightbox[italie]\">\r\n                                <img src=\"./img/Italy/500px/kupole_500.jpg\" alt=\"Kupole\" width=\"100px\" height=\"150px\">\r\n                            </a>\r\n                        </div>\r\n                    </div> --></div>\r\n<div class=\"galerie_sever\" id=\"north\">\r\n<h2>North nature</h2>\r\n<div class=\"parent_sever\">\r\n<div class=\"div1_sever\"><a href=\"img/sever/01sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/01ctverec.jpg\" alt=\"Severská příroda\" width=\"290px\" height=\"290px\" /></a></div>\r\n<div class=\"div2_sever\"><a href=\"img/sever/02sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/02ctverec.jpg\" alt=\"Severská příroda\" width=\"290px\" height=\"290px\" /></a></div>\r\n<div class=\"div3_sever\"><a href=\"img/sever/03sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/03ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div4_sever\"><a href=\"img/sever/04sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/04ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div5_sever\"><a href=\"img/sever/05sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/05ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div6_sever\"><a href=\"img/sever/06sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/06ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div7_sever\"><a href=\"img/sever/07sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/07ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div8_sever\"><a href=\"img/sever/08sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/08ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /> </a></div>\r\n<div class=\"div9_sever\"><a href=\"img/sever/09sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/09ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div10_sever\"><a href=\"img/sever/10sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/10ctverec.jpg\" alt=\"Severská příroda\" width=\"290px\" height=\"290px\" /></a></div>\r\n<div class=\"div11_sever\"><a href=\"img/sever/11sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/11ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /> </a></div>\r\n<div class=\"div12_sever\"><a href=\"img/sever/12sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/12ctverec.jpg\" alt=\"Severská příroda\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div13_sever\"><a href=\"img/sever/13sever.jpg\" title=\"Severská příroda\" rel=\"lightbox[sever]\"> <img src=\"img/sever/grid/13ctverec.jpg\" alt=\"Severská příroda\" width=\"290px\" height=\"290px\" /></a></div>\r\n</div>\r\n</div>\r\n<div class=\"galerie_vanoce\" id=\"christmas\">\r\n<h2>Jingle Bells</h2>\r\n<div class=\"parent_vanoce\">\r\n<div class=\"div1_vanoce\"><a href=\"img/vanoce/12.jpg\" title=\"Perníček\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/12.jpg\" alt=\"Perníček\" width=\"290px\" height=\"290px\" /></a></div>\r\n<div class=\"div2_vanoce\"><a href=\"img/vanoce/11.jpg\" title=\"Autobus\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/11.jpg\" alt=\"Autobus\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div3_vanoce\"><a href=\"img/vanoce/6.jpg\" title=\"Koník\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/6.jpg\" alt=\"Koník\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div4_vanoce\"><a href=\"img/vanoce/5.jpg\" title=\"Autíčko\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/5.jpg\" alt=\"Autíčko\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div5_vanoce\"><a href=\"img/vanoce/9.jpg\" title=\"Cukroví\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/9.jpg\" alt=\"Cukroví\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div6_vanoce\"><a href=\"img/vanoce/2.jpg\" title=\"Vánoční tabule\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/2.jpg\" alt=\"Vánoční tabule\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div7_vanoce\"><a href=\"img/vanoce/1.jpg\" title=\"Šišky\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/1.jpg\" alt=\"Šišky\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div8_vanoce\"><a href=\"img/vanoce/3.jpg\" title=\"Vánoční výzdoba\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/3.jpg\" alt=\"Vánoční výzdoba\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div9_vanoce\"><a href=\"img/vanoce/4.jpg\" title=\"Vánoční dekorace\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/4.jpg\" alt=\"Vánoční dekorace\" width=\"290\" height=\"290\" /></a></div>\r\n<div class=\"div10_vanoce\"><a href=\"img/vanoce/10.jpg\" title=\"Kolotoč\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/10.jpg\" alt=\"Kolotoč\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div11_vanoce\"><a href=\"img/vanoce/8.jpg\" title=\"Vánoční tabule\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/8.jpg\" alt=\"Vánoční tabule\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div12_vanoce\"><a href=\"img/vanoce/7.jpg\" title=\"Vánoční dárek\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/7.jpg\" alt=\"Vánoční dárek\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div13_vanoce\"><a href=\"img/vanoce/13.jpg\" title=\"Autíčko\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/13.jpg\" alt=\"Autíčko\" width=\"140px\" height=\"140px\" /></a></div>\r\n<div class=\"div14_vanoce\"><a href=\"img/vanoce/14.jpg\" title=\"Vánoční dárek\" rel=\"lightbox[vanoce]\"> <img src=\"img/vanoce/grid/14.jpg\" alt=\"Vánoční dárek\" width=\"140px\" height=\"140px\" /></a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 2),
('kontakt', 'Contact', 'Contact', '<p>[kontaktni-formular email=\"adriana.domorakova@gnj.cz\"]</p>', 4),
('omne', 'About me', 'About&nbspme', '<div class=\"omne\">\r\n<div class=\"intro\">\r\n<div class=\"container\">\r\n<div class=\"boxy\">\r\n<h2>Let me introduce myself</h2>\r\n<div class=\"karta\"><img id=\"adri\" src=\"img/adri.png\" alt=\"adri\" />\r\n<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquid praesentium maxime quaerat saepe beatae aut in cupiditate temporibus est, vitae nobis, repudiandae quae impedit nemo voluptatum incidunt doloremque eveniet explicabo! Ea debitis, laboriosam ducimus incidunt pariatur molestiae tenetur rem quod necessitatibus velit, cumque ullam. Perferendis et doloremque dolorem repellat hic, eaque maiores qui magni, suscipit minus assumenda ut, sunt harum ex placeat magnam neque! Similique minima sed eaque optio delectus distinctio laboriosam alias commodi, ipsa ad magni, expedita unde quo pariatur rem nostrum atque repellendus veniam nobis quos corrupti temporibus omnis! Ad quos distinctio suscipit est tenetur laboriosam veritatis nobis.</p>\r\n</div>\r\n<h2>Certification</h2>\r\n<div class=\"karta\">\r\n<h3>JavaScript 1 - Czechitas</h3>\r\n<div class=\"text\">\r\n<p>A graduate of the JavaScript 1 course has mastered the basics of programming, knows how to manipulate elements in the DOM, and is able to create a simple application or game using JavaScript. They can subsequently publish this publicly via their GitHub account.</p>\r\n<br />\r\n<p><em>Absolventka kurzu JavaScript 1 ovládá základy programování, umí manipulovat s elementy v DOM a je schopna v JavaScriptu vytvořit jednoduchou aplikaci nebo hru. Tu umí následně veřejně vypublikovat prostřednictvím svého GitHub účtu.</em></p>\r\n</div>\r\n<a href=\"img/JavaScript1.jpg\" rel=\"lightbox[certifikace]\"> <img id=\"javascript1\" src=\"img/JavaScript1.jpg\" alt=\"certifikát\" /> </a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1),
('uvod', 'Homepage', 'Home', '<div class=\"domu\">\r\n<div class=\"intro\">\r\n<div class=\"container\">\r\n<h1>Welcome!</h1>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic officiis ab quae quidem reiciendis distinctio vero deleniti neque mollitia provident? Aut, assumenda? Maxime odit nostrum quis optio tempora ea quam modi repellendus culpa dignissimos pariatur, atque expedita veritatis quod maiores vero eius in, dolores harum quaerat doloribus. Excepturi ratione, sapiente obcaecati voluptatem hic vero. Veniam consequatur repudiandae aspernatur quae tempore.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"posledni_clanky\">\r\n<div class=\"container\">\r\n<h2>Latest blog posts</h2>\r\n<div class=\"boxy\">\r\n<div class=\"karta\">\r\n<div class=\"posledni_clanky_text\">\r\n<h3>Winter atmosphere</h3>\r\n<img src=\"img/vanoce/nahled_clanek.jpg\" alt=\"Winter atmosphere\" width=\"250\" height=\"166\" />\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vitae quasi sint quibusdam? Magni, soluta at. Similique nostrum atque possimus cum, necessitatibus commodi vitae nihil. Molestiae.</p>\r\n</div>\r\n<a href=\"blog#clanek1\" class=\"clickForMore\">Show more</a></div>\r\n<div class=\"karta\">\r\n<div class=\"posledni_clanky_text\">\r\n<h3>Italy vacation</h3>\r\n<img src=\"img/Italy/clanek_nahled.jpg\" alt=\"Trattoria\" width=\"250\" height=\"166\" />\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. In labore ducimus, vel doloremque sequi minima magni iste odio recusandae quam sunt est illum laborum non.</p>\r\n</div>\r\n<a href=\"blog#clanek2\" class=\"clickForMore\">Show more</a></div>\r\n<div class=\"karta\">\r\n<div class=\"posledni_clanky_text\">\r\n<h3>Scandinavia visit</h3>\r\n<img src=\"img/sever/clanek_nahled.jpg\" alt=\"Podzimní hrnek s kakaem\" width=\"250\" height=\"166\" />\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda laboriosam modi impedit vero laborum quam alias eaque et, unde labore esse odio? Sequi, quo ut.</p>\r\n</div>\r\n<a href=\"blog#clanek3\" class=\"clickForMore\">Show more</a></div>\r\n</div>\r\n</div>\r\n</div>', 0);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `stranka`
--
ALTER TABLE `stranka`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;