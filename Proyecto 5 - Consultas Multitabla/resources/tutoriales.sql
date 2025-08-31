-- BD Tutoriales

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tutoriales`
--
CREATE DATABASE `tutoriales` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tutoriales`;

-- --------------------------------------------------------

--
-- Table structure for table `etiquetas`
--

CREATE TABLE IF NOT EXISTS `etiquetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `creado` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `etiquetas`
--

INSERT INTO `etiquetas` (`id`, `nombre`, `creado`, `actualizado`) VALUES
(1, 'HTML', '2013-01-18 23:12:43', '2013-01-18 23:12:43'),
(2, 'CSS', '2013-01-18 23:12:47', '2013-01-18 23:12:47'),
(3, 'JS', '2013-01-18 23:12:49', '2013-01-18 23:12:49'),
(4, 'Cliente', '2012-03-16 14:56:45', '2012-03-16 14:56:45'),
(5, 'Servidor', '2012-03-16 14:56:51', '2012-03-16 14:56:51'),
(6, 'Front End', '2012-03-16 14:56:58', '2012-03-16 14:56:58'),
(7, 'Back End', '2012-03-16 14:57:05', '2012-03-16 14:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `etiquetas_publicaciones`
--

CREATE TABLE IF NOT EXISTS `etiquetas_publicaciones` (
  `etiqueta_id` int(11) NOT NULL DEFAULT '0',
  `publicacion_id` int(11) NOT NULL DEFAULT '0',
  `creado` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`etiqueta_id`,`publicacion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etiquetas_publicaciones`
--

INSERT INTO `etiquetas_publicaciones` (`etiqueta_id`, `publicacion_id`, `creado`, `actualizado`) VALUES
(6, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `niveles`
--

CREATE TABLE IF NOT EXISTS `niveles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `creado` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `creado`, `actualizado`) VALUES
(1, 'Fácil', '2013-01-18 23:11:53', '2013-01-18 23:11:53'),
(2, 'Medio', '2013-01-18 23:11:59', '2013-01-18 23:11:59'),
(3, 'Difícil', '2013-01-18 23:12:05', '2013-01-18 23:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `publicaciones`
--

CREATE TABLE IF NOT EXISTS `publicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `nivel_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `contenido` text,
  `publicado` tinyint(1) DEFAULT '0',
  `vistas` int(11) DEFAULT '0',
  `votos` decimal(10,0) DEFAULT '0',
  `creado` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `usuario_id`, `nivel_id`, `titulo`, `contenido`, `publicado`, `vistas`, `votos`, `creado`, `actualizado`) VALUES
(1, 4, 1, 'Definición HTML', 'HTML, siglas de HyperText Markup Language (Lenguaje de Marcado de Hipertexto), es el lenguaje de marcado predominante para la elaboración de páginas web. Es usado para describir la estructura y el contenido en forma de texto, así como para complementar el texto con objetos tales como imágenes. HTML se escribe en forma de \\"etiquetas\\", rodeadas por corchetes angulares (<,>). HTML también puede describir, hasta un cierto punto, la apariencia de un documento, y puede incluir un script (por ejemplo Javascript), el cual puede afectar el comportamiento de navegadores web y otros procesadores de HTML.\r\nHTML también es usado para referirse al contenido del tipo de MIME text/html o todavía más ampliamente como un término genérico para el HTML, ya sea en forma descendida del XML (como XHTML 1.0 y posteriores) o en forma descendida directamente de SGML (como HTML 4.01 y anteriores).', 1, 100, 10, '2010-03-25 17:54:14', '2010-03-25 17:54:14'),
(2, 4, 1, 'HTML5', 'Es un conjunto de elementos y atributos, escrito para ajustarse a las dos sintaxis HTML 5 y XHTML 5 \nde acuerdo con las especificaciones 1.7, "Esta especificación define un lenguaje abstracto para describir los documentos y aplicaciones, y algunas API para interactuar con las representaciones en memoria de los recursos que utilizan este lenguaje .... Hay varias sintaxis concretas que pueden ser utilizadas para transmitir los recursos que utilizan este lenguaje abstracto, dos de los cuales se definen en el presente pliego de condiciones. La primera de estas sintaxis concreta es "HTML5". Este es el formato recomendado para la mayoría de los autores. Es compatible con todos los navegadores Web tradicionales. Si un documento se transmite con el tipo MIME text/html, entonces será procesado como un documento "HTML5" por los navegadores Web.".', 1, 75, 2, '2012-03-01 12:59:42', '2012-03-01 12:59:42'),
(3, 5, 1, 'Definición CSS', 'Las hojas de estilo en cascada (en inglés Cascading Style Sheets), CSS es un lenguaje usado para definir la presentación de un documento estructurado escrito en HTML o XML (y por extensión en XHTML). El W3C (World Wide Web Consortium) es el encargado de formular la especificación de las hojas de estilo que servirán de estándar para los agentes de usuario o navegadores.\nLa idea que se encuentra detrás del desarrollo de CSS es separar la estructura de un documento de su presentación.\nPor ejemplo, el elemento de HTML <h1> indica que un bloque de texto es un encabezamiento y que es más importante que un bloque etiquetado como <H2>. Versiones más antiguas de HTML permitían atributos extra dentro de la etiqueta abierta para darle formato (como el color o el tamaÃ±o de fuente). No obstante, cada etiqueta <H1> debía disponer de la información si se deseaba un diseÃ±o consistente para una página y, además, una persona que lea esa página con un navegador pierde totalmente el control sobre la visualización del texto.\nCuando se utiliza CSS, la etiqueta <H1> no debería proporcionar información sobre como va a ser visualizado, solamente marca la estructura del documento. La información de estilo separada en una hoja de estilo, especifica cómo se ha de mostrar <H1>: color, fuente, alineación del texto, tamaÃ±o y otras características no visuales como definir el volumen de un sintetizador de voz (véase Sintetización del habla), por ejemplo.\nLa información de estilo puede ser adjuntada tanto como un documento separado o en el mismo documento HTML. En este Ãºltimo caso podrían definirse estilos generales en la cabecera del documento o en cada etiqueta particular mediante el atributo "style"', 1, 10, 10, '2010-03-25 17:54:14', '2010-03-25 17:54:14'),
(4, 5, 2, 'CSS3', 'CSS level 3 is currently under development.[9] The W3C maintains a CSS3 progress report. CSS3 is modularized and will consist of several separate recommendations. The W3C CSS3 Roadmap provides a summary and introduction.[10]', 1, 5, 1, '2012-03-01 12:59:42', '2012-03-01 12:59:42'),
(5, 6, 3, 'Archivo JS', 'Un archivo *.js, es un archivo de texto plano que contiene scripts de Javascript, y que puede, por tanto, ser modificado con cualquier editor de textos. Es ejecutado generalmente por un navegador web.\nLos archivos .js guardan funciones y variables globales que se ejecutarán en la página web pudiendo llamar a sus funciones desde cualquier subpágina sin tener que incrustar scripts en cada una de ellas y ahorrando así código. Para quien tenga idea de construcción de páginas web, podría decirse que es similar a un archivo CSS (desambiguación) pero en lugar de clases y estilos este archivo genera scripts.', 1, 21, 3, '2010-03-25 17:54:15', '2010-03-25 17:54:15'),
(6, 6, 2, 'Definición Javascript', 'JavaScript es un lenguaje de scripting basado en objetos, utilizado para acceder a objetos en aplicaciones. Principalmente, se utiliza integrado en un navegador web permitiendo el desarrollo de interfaces de usuario mejoradas y páginas web dinámicas. JavaScript es un dialecto de ECMAScript y se caracteriza por ser un lenguaje basado en prototipos, con entrada dinámica y con funciones de primera clase. JavaScript ha tenido influencia de mÃºltiples lenguajes y se diseÃ±ó con una sintaxis similar al lenguaje de programación Java, aunque más fácil de utilizar para personas que no programan.\nTodos los navegadores modernos interpretan el código JavaScript integrado dentro de las páginas web. Para interactuar con una página web se provee al lenguaje JavaScript de una implementación del DOM.\nEl lenguaje fue inventado por Brendan Eich en la empresa Netscape Communications, la que desarrolló los primeros navegadores web comerciales. Apareció por primera vez en el producto de Netscape llamado Netscape Navigator 2.0.\nTradicionalmente, se venía utilizando en páginas web HTML, para realizar operaciones y en el marco de la aplicación cliente, sin acceso a funciones del servidor. JavaScript se ejecuta en el agente de usuario, al mismo tiempo que las sentencias van descargándose junto con el código HTML.\nInicialmente los autores lo llamaron Mocha y más tarde LiveScript pero fue rebautizado como JavaScript en un anuncio conjunto entre Sun Microsystems y Netscape, el 4 de diciembre de 1995.\nEn 1997 los autores propusieron JavaScript para que fuera adoptado como estándar de la European Computer Manufacturers ''Association ECMA, que a pesar de su nombre no es europeo sino internacional, con sede en Ginebra. En junio de 1997 fue adoptado como un estándar ECMA, con el nombre de ECMAScript. Poco después también como un estándar ISO.\nJScript es la implementación de ECMAScript de Microsoft, muy similar al JavaScript de Netscape, pero con ciertas diferencias en el modelo de objetos del navegador que hacen ambas versiones sean incompatibles con frecuencia.\nPara evitar estas incompatibilidades, el World Wide Web Consortium diseÃ±ó el estándar Document Object Model (DOM, ó Modelo de Objetos del Documento en castellano), que incorporan Konqueror, las versiones 6 de Internet Explorer y Netscape Navigator, Opera la versión 7, y Mozilla Application Suite, Mozilla desde su primera versión.', 1, 31, 7, '2010-03-25 17:54:15', '2010-03-25 17:54:15'),
(7, 4, 3, 'XAMPP', 'XAMPP es un servidor independiente de plataforma, software libre, que consiste principalmente en la base de datos MySQL, el servidor web Apache y los intérpretes para lenguajes de script: PHP y Perl. El nombre proviene del acrónimo de X (para cualquiera de los diferentes sistemas operativos), Apache, MySQL, PHP, Perl.\nEl programa está liberado bajo la licencia GNU y actúa como un servidor web libre, fácil de usar y capaz de interpretar páginas dinámicas. Actualmente XAMPP está disponible para Microsoft Windows, GNU/Linux, Solaris y MacOS X.\n\n<a href=''http://es.wikipedia.org/wiki/XAMPP'' target=''_blank''>XAMPP Wikipedia</a>', 0, 0, 0, '2012-03-01 12:59:42', '2012-03-01 12:59:42'),
(8, NULL, NULL, 'PHP', 'PHP es un lenguaje de programación interpretado (Lenguaje de alto rendimiento), diseñado originalmente para la creación de páginas web dinámicas. Se usa principalmente para la interpretación del lado del servidor (server-side scripting) pero actualmente puede ser utilizado desde una interfaz de línea de comandos o en la creación de otros tipos de programas incluyendo aplicaciones con interfaz gráfica usando las bibliotecas Qt o GTK+.\n\n<a href=''http://es.wikipedia.org/wiki/Php'' target=''_blank''>PHP - Wikipedia</a>', 0, 0, 0, '2012-03-01 12:59:42', '2012-03-01 12:59:42'),
(9, NULL, NULL, 'Servidor Web', 'Un servidor web o servidor HTTP es un programa informático que procesa una aplicación del lado del servidor realizando conexiones bidireccionales y/o unidireccionales y síncronas o asíncronas con el cliente generando o cediendo una respuesta en cualquier lenguaje o Aplicación del lado del cliente. El código recibido por el cliente suele ser compilado y ejecutado por un navegador web. Para la transmisión de todos estos datos suele utilizarse algún protocolo. Generalmente se utiliza el protocolo HTTP para estas comunicaciones, perteneciente a la capa de aplicación del modelo OSI. El término también se emplea para referirse al ordenador que ejecuta el programa.\n<a href=''http://es.wikipedia.org/wiki/Servidor_web'' target=''_blank''>Servidor Web</a>', 0, 0, 0, '2012-03-01 12:59:42', '2012-03-01 12:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `creado` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `creado`, `actualizado`) VALUES
(1, 'administrador', '2010-03-25 17:54:14', '2010-03-25 17:54:14'),
(2, 'autor', '2010-03-25 17:54:14', '2010-03-25 17:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `creado` datetime NOT NULL,
  `actualizado` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol_id`, `creado`, `actualizado`) VALUES
(1, 'Garland Roberts', 'hollie_emard@reichel.ca', '375f542fcc03', 1, '2010-01-25 11:54:27', '2010-01-25 11:54:27'),
(2, 'Aliza Leuschke', 'watson_koepp@spencerlarkin.co.uk', 'fc387adac877', 1, '2010-02-25 11:54:27', '2010-02-25 11:54:27'),
(3, 'Percival VonRueden', 'gideon@donnelly.ca', '2898eed1ce28', 1, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(4, 'Dashawn Renner', 'louie@satterfield.uk', 'f83dd3e7faec', 2, '2010-04-25 11:54:27', '2010-04-25 11:54:27'),
(5, 'Ms. Eileen Waelchi', 'courtney.schumm@rippin.us', '0c6ff76dfa99', 2, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(6, 'Blaise Gaylord', 'torrey_renner@bradtke.uk', '2071acd0e271', 2, '2010-06-25 11:54:27', '2010-06-25 11:54:27'),
(7, 'Miss Ephraim Strosin', 'josue@mosciski.biz', NULL, 2, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(8, 'Marilie Vandervort', 'oma_stanton@zulauf.org', NULL, 2, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(9, 'Hailey Corwin', 'toney.reynolds@bogan.biz', NULL, 2, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(10, 'Chase Koss', 'wilton@cole.org', NULL, NULL, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(11, 'Dr. Maximillia Murazik', 'damon.bergnaum@bode.info', NULL, NULL, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(12, 'Dale Gerhold', 'bernie@davis.net', NULL, NULL, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(13, 'Carter Kunde', 'kallie_mclaughlin@bednar.name', NULL, NULL, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(14, 'Kaycee Maggio', 'clair@anderson.net', NULL, NULL, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(15, 'Mr. Darron Dooley', 'bertha_stroman@leannon.info', NULL, NULL, '2012-03-01 12:59:52', '2012-03-01 12:59:52'),
(16, 'Luz Yundt', 'aditya.hettinger@fisher.biz', NULL, NULL, '2012-03-01 12:59:52', '2012-03-01 12:59:52');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
