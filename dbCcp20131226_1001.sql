-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ccp
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ckeditor_assets`
--

DROP TABLE IF EXISTS `ckeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ckeditor_assetable_type` (`assetable_type`,`type`,`assetable_id`),
  KEY `idx_ckeditor_assetable` (`assetable_type`,`assetable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_assets`
--

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
INSERT INTO `ckeditor_assets` VALUES (2,'dff.png','image/png',82109,NULL,'0','Ckeditor::Picture',620,352,'2013-12-23 20:35:19','2013-12-23 20:35:19');
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercury_images`
--

DROP TABLE IF EXISTS `mercury_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mercury_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercury_images`
--

LOCK TABLES `mercury_images` WRITE;
/*!40000 ALTER TABLE `mercury_images` DISABLE KEYS */;
INSERT INTO `mercury_images` VALUES (1,'MicaraMBA.png','image/png',225439,'2013-03-10 19:50:58','2013-03-10 19:50:58','2013-03-10 19:50:58'),(2,'MicaraMBA.png','image/png',225439,'2013-03-10 20:12:28','2013-03-10 20:12:29','2013-03-10 20:12:29');
/*!40000 ALTER TABLE `mercury_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_posts_on_ancestry` (`ancestry`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Acerca de','<p><img src=\"/system/images/2/medium/MicaraMBA.png?1362946348\" style=\"opacity: 0.9; float: right;\" />Soy Cristian Castillo y he programado este sitio. El c&oacute;digo fuente est&aacute; en <a href=\"https://github.com/ccastillop/ccp\" target=\"_blank\">Github</a>&nbsp;por si deseas verlo. Utilizo <a href=\"http://rubyonrails.org/\" target=\"_blank\">Ruby on Rails</a> para programar en un servidor de <a href=\"https://www.digitalocean.com/\" target=\"_blank\">Digital Ocean</a>&nbsp;y he tratado de hacer este sitio lo m&aacute;s minimalista posible.</p>\r\n\r\n<p>Mis estudios, por s&iacute; te interesa, aunque seguro que no tanto:</p>\r\n\r\n<ul>\r\n	<li>Llev&eacute; el <strong>MBA Gerencial</strong> en Centrum Cat&oacute;lica del 2008-2010. Tengo el grado de Magister en Administraci&oacute;n de Empresas.</li>\r\n	<li>Estudi&eacute;<strong> Ingenier&iacute;a Electr&oacute;nica</strong> en la Pontifica Universidad Cat&oacute;lica del Per&uacute;. Tengo el grado de Bachiller en Ingenier&iacute;a Electr&oacute;nica.</li>\r\n	<li>Termin&eacute; el Ingl&eacute;s del Brit&aacute;nico (al fin!)</li>\r\n	<li>Tengo estudios de Ingenier&iacute;a de Software en la PUCP, Java en Telematic, algo de Marketing Digital en Seminarium y otras cosas m&aacute;s que ya no recuerdo.</li>\r\n	<li>Durante a&ntilde;os dise&ntilde;&eacute; y constru&iacute; circuitos electr&oacute;nicos anal&oacute;gicos y digitales, con &eacute;nfasis en radiofrecuencia, quem&eacute; muchos transistores pero logr&eacute; emitir ondas electromagn&eacute;ticas moduladas en amplitud y en frecuencia :)</li>\r\n	<li>Aprend&iacute; mucho m&aacute;s como Autodidacta:\r\n	<ul>\r\n		<li>C&oacute;mo quemar transistores y diodos :)</li>\r\n		<li>Programaci&oacute;n Web: PHP, ASP</li>\r\n		<li>Bases de datos: MSSQL, MySQL, Posgree,&nbsp;</li>\r\n		<li>Programaci&oacute;n en Ruby y&nbsp;Ruby on Rails</li>\r\n		<li>Javascript,&nbsp;HTML y CSS</li>\r\n		<li>Servidores Linux y despliegue de servidores (deployment)</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p>Algunos sitios que est&aacute;n funcionando actualmente y que he desarrollado. La mayor&iacute;a est&aacute;n en Ruby on Rails</p>\r\n\r\n<ul>\r\n	<li><a href=\"http://casadeplaya.com\" target=\"_blank\">casadeplaya.com</a>: el lugar ideal para encontrar una casa de playa en Per&uacute;</li>\r\n	<li><a href=\"http://mailerball.com\" target=\"_blank\">mailerball.com</a>: un motor para env&iacute;os masivos f&aacute;cil de usar y pr&aacute;ctico</li>\r\n	<li><a href=\"http://yupiyap.com\" target=\"_blank\">yupiyap.com</a>: jugetes did&aacute;cticos con un transfondo metodol&oacute;gico valioso para los ni&ntilde;os</li>\r\n	<li><a href=\"http://innovasupplychain.pe\" target=\"_blank\">innovasupplychain.pe</a>: noticias sobre cadena de suministro de GS1 Per&uacute;</li>\r\n	<li><a href=\"http://smartsearchperu.com\" target=\"_blank\">smartsearchperu.com</a>: empresa para reclutamiento de personal especializado</li>\r\n	<li><a href=\"http://proexpansion.com\" target=\"_blank\">proexpansion.com</a>: noticias de econom&iacute;a relevantes para el per&uacute;</li>\r\n	<li><a href=\"http://persuadir.pe/\" target=\"_blank\">persuadir.pe</a>: couching y escuela de vendedores top</li>\r\n	<li><a href=\"http://porpartidadoble.com\" target=\"_blank\">porpartidadoble.com</a>: un sistema propio para manejar la contabilidad de manera sencilla</li>\r\n</ul>\r\n\r\n<p>En verdad hay otros tantos, como <a href=\"http://semanaeconomica.com\">semanaeconomica.com</a> y&nbsp;<a href=\"http://confiep.org.pe\" target=\"_blank\">confiep.org.pe</a> pero ya los han sacado o los han cambiado por otra aplicaci&oacute;n. Hay otras tantas que ya no recuerdo.</p>\r\n\r\n<p>Tambi&eacute;n he hecho intranets que no puedo mostrar: sistemas para operaciones de reclutamiento y selecci&oacute;n de personal, bases de datos para actualizar clientes, facturaci&oacute;n, cobranzas, contabilidad, intranets para generar reportes estad&iacute;sticos y gr&aacute;ficos en base a censos, entre otras tantas.</p>\r\n\r\n<p>Ahora estoy en una etapa: &iquest;qu&eacute; hacer a continuaci&oacute;n? por lo que he subido mi costo hora y bajado mi disponibilidad. Estoy entre llevar una maestr&iacute;a en micro electr&oacute;nica o hacer m&aacute;s empresas digitales. Es decir, entre aprovechar mi MBA o salir del pais y seguir quemando transistores, pero m&aacute;s peque&ntilde;os.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n','2013-03-09 21:20:41','2013-12-24 00:29:02',NULL,''),(2,'Mi blog','Entradas del post','2013-03-10 00:21:39','2013-03-10 00:21:39',NULL,'#'),(3,'Sitios relacionados','<p>Sitios de inter&eacute;s</p>\r\n','2013-03-10 00:27:01','2013-12-23 20:40:37',NULL,'#'),(4,'Software bajo Demanda','Algo','2013-03-10 00:32:08','2013-03-10 00:32:31','3','http://softwarebajodemanda.com'),(5,'Facebook','','2013-03-10 00:34:23','2013-03-10 00:36:44','3','http://facebook.com/ccastillop'),(6,'Github','','2013-03-10 00:35:31','2013-03-10 00:36:50','3','https://github.com/ccastillop'),(7,'Twitter','','2013-03-10 00:37:21','2013-03-10 00:37:21','3','https://twitter.com/ccastillop'),(8,'El futuro de la programación','<p>Un trabajador de IBM de 1973&nbsp;nos presenta lo que vendr&aacute; en las siguientes d&eacute;cadas respecto a las computadoras y c&oacute;mo interactuamos con ellas (program&aacute;ndolas o us&aacute;ndolas).&nbsp;</p>\r\n\r\n<p>Las predicciones son:</p>\r\n\r\n<ol>\r\n	<li>programaci&oacute;n -&gt; manipulaci&oacute;n directa de la data</li>\r\n	<li>procedimientos -&gt; metas y restricciones</li>\r\n	<li>volcado de texto -&gt; representaci&oacute;n espacial</li>\r\n	<li>secuencial -&gt; concurrente</li>\r\n</ol>\r\n\r\n<p>La idea final: &quot;El pensamiento m&aacute;s peligroso que puedes tener como una persona creativa is pensar que sabes lo que est&aacute;s haciendo&quot;</p>\r\n\r\n<p><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"315\" src=\"//www.youtube.com/embed/8pTEmbeENF4\" width=\"560\"></iframe></p>\r\n\r\n<p>&nbsp;</p>\r\n','2013-03-10 00:37:56','2013-09-07 17:48:48','2',''),(9,'Casadeplaya.com','','2013-03-10 00:38:30','2013-03-10 00:38:30','3','http://casadeplaya.com'),(10,'Comercio electrónico y pagos OnLine en Perú','<p>Situaci&oacute;n del comercio electr&oacute;nico de negocios a clientes (B2C) en el Per&uacute;, presentaci&oacute;n hecha para una conferencia Ruby del jueves 05 de setiembre de 2013</p>\r\n\r\n<p>Fuentes:&nbsp;</p>\r\n\r\n<ul>\r\n	<li><span style=\"line-height: 1.6em;\"><a href=\"http://centrum.pucp.edu.pe/es/contenido.php?835/investigacion_publicacion/como_desarrollar_comercio_electronico_peru.html&amp;idp=283\">C&oacute;mo desarrollar el comercio electr&oacute;nico en el Per&uacute;, Centrum PUCP 2010</a></span></li>\r\n	<li><a href=\"http://www.futurolabs.com/ii-estudio-de-comercio-electronico-en-el-peru/\">II Estudio de Comercio Electr&oacute;nico. FuturoLabs Dic 2012</a></li>\r\n	<li>C&oacute;digo de Edgar Valderrama&nbsp;</li>\r\n	<li>C&oacute;digo y elaboraci&oacute;n propia</li>\r\n</ul>\r\n\r\n<p><iframe allowfullscreen=\"true\" frameborder=\"0\" height=\"749\" mozallowfullscreen=\"true\" src=\"https://docs.google.com/presentation/d/1WSRtHsK9UUKUVsI2cxm0EIZMfHW7lv1Me_W4Rvbh_n8/embed?start=false&amp;loop=false&amp;delayms=3000\" webkitallowfullscreen=\"true\" width=\"960\"></iframe></p>\r\n','2013-09-07 18:09:47','2013-12-09 20:06:16','2',''),(11,'Recomendaciones para el envío efectivo de email masivo','<p>He anotado algunas conclusiones que podr&iacute;an ayudar a los interesados en enviar email masivo a llegar de manera m&aacute;s efectiva. Se aplica a temas&nbsp;como boletines o informaci&oacute;n sobre eventos, productos o servicios.&nbsp;</p>\r\n\r\n<div style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; line-height: normal;\">\r\n<h2>1.- Contenido del email</h2>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Es obvio que quien recibe el email debe tener cierto inter&eacute;s en el mensaje y debe apreciar el valor, ya que es la &quot;primera impresi&oacute;n&quot;.&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Por esa raz&oacute;n el T&iacute;tulo debe ser &quot;magn&eacute;tico&quot;. Por ejemplo, cambiar &ldquo;C&oacute;mo hacer el producto m&aacute;s vendible&rdquo; a &ldquo;Has tu producto m&aacute;s sexy que Nicole Kidman&rdquo; increment&oacute; el clic de un promomail al doble, s&oacute;lo con unos minutos de pensar en el t&iacute;tulo. Un buen texto para leer sobre t&iacute;tulos magn&eacute;ticos es [2]</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Otro tema del t&iacute;tulo es la palabra &quot;Publicidad&quot;. Traten de ver la forma de no utilizarla. Es sabido que Google suele marcar emails con esa palabra inmediatamente.&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Respecto al contenido o cuerpo, &eacute;ste debe ser corto. Enviar s&aacute;banas explicando las virtudes de un programa simplemente lo hace imposible de leer. Recuerden que quienes ahora est&aacute;n leyendo son ejecutivos en blackberry, Iphone o Android, con capacidades limitadas de pantalla. &nbsp;Un email no deber&iacute;a ser m&aacute;s ancho de 600px y no m&aacute;s largo que unos cuatro p&aacute;rrafos.</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Finalmente, lo anterior implica una conclusi&oacute;n:&nbsp;<b>orientar el contenido a la acci&oacute;n</b>.</div>\r\n\r\n<div>Frases como &quot;si desea m&aacute;s informaci&oacute;n&quot; y llevarlos a una p&aacute;gina externa son important&iacute;simas para saber qu&eacute; tan efectivo ha sido el titular y los cuatro p&aacute;rrafos. De hecho, la medici&oacute;n del clic es m&aacute;s efectiva y relevante que saber si el email ha sido abierto o no.</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Cabe destacar una &uacute;ltima tendencia. Las im&aacute;genes deben ser incrustadas en el email como adjuntos, y no ser &quot;linkeadas&quot; a fuentes externas. Es sabido que la mayor&iacute;a de lectores de emails ya no permiten descargar im&aacute;genes autom&aacute;ticamente a menos que el usuario lo autorice. Por esa raz&oacute;n ahora los enviadores Promomailapp ya permiten incrustar im&aacute;genes, aunque a costa del aumento del ancho de banda y del tiempo de env&iacute;o.</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Es por eso que probablemente un email en texto plano con algunos colores sea m&aacute;s efectivo que un &quot;flayer&quot; enviado por email. El dise&ntilde;o no es importante, la diagramaci&oacute;n y los textos magn&eacute;ticos s&iacute;.</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<h2>2.- Mejor ritmo y momento para enviar</h2>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Seg&uacute;n [1] no es bueno pasar de 4 env&iacute;os a la misma persona al mes. La idea es &quot;construir una relaci&oacute;n&quot; en base a enviar informaci&oacute;n valiosa.</div>\r\n\r\n<div>Adem&aacute;s, seg&uacute;n [4] es necesario entender el &quot;timing&quot; de los env&iacute;os, que depende de los contenidos. Promociones u ofertas de &uacute;ltima hora se abren mejor al final del d&iacute;a, cuando los destinatarios est&aacute;n en sus hogares. Mientras que productos como ropa, eventos, restaurantes, entre otros, son m&aacute;s abiertos entre las 6am y las 10am. La infograf&iacute;a de&nbsp;<a href=\"http://blog.kissmetrics.com/science-of-social-timing-2/?wide=1\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">http://blog.kissmetrics.com/<wbr />science-of-social-timing-2/?<wbr />wide=1</a>&nbsp;es muy &uacute;til para decidir la mejor hora, aunque no haya estudios en Per&uacute; de ello.</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<h2>3.- Medici&oacute;n de la efectividad</h2>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Cada vez es m&aacute;s dif&iacute;cil saber si un email es abierto, y este dato necesariamente est&aacute; sesgado hacia abajo. Lo mejor es que los contenidos tengan una llamada a la acci&oacute;n desde los primeros p&aacute;rrafos.&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<h2>4.- Pol&iacute;tica &quot;Opt-in&quot; o &quot;permitir enviar publicidad&quot;</h2>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>Es verdad, debemos aceptar que los ejecutivos y mandos medios no les gusta recibir emails promocionales, y tienen a pedir a sus jefes de sistemas que bloqueen tal o cual fuente. Es mejor pensar de una vez en una campa&ntilde;a para reclutar emails de ejecutivos que realmente perciban el valor de la propuesta de Ustedes y se registren o acepten que pueden recibir publicidad, o en su defecto indiquen un email para publicidad.</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<h2>Conclusiones</h2>\r\n\r\n<div>\r\n<ul>\r\n	<li style=\"margin-left: 15px;\">El t&iacute;tulo o subject es la puerta de entrada: debe ser llamativo y magn&eacute;tico&nbsp;</li>\r\n	<li style=\"margin-left: 15px;\">Los contenidos deben ser cortos, en lo posible texto, no importa el dise&ntilde;o, m&aacute;s bien el mensaje</li>\r\n	<li style=\"margin-left: 15px;\">Llamar a la acci&oacute;n... &quot;m&aacute;s informaci&oacute;n aqu&iacute;....&quot;</li>\r\n	<li style=\"margin-left: 15px;\">Pocos env&iacute;os al mes a la misma persona, no m&aacute;s de 4 al mes. Segmentarse mejor, enviar menos.</li>\r\n	<li style=\"margin-left: 15px;\">Pensar en campa&ntilde;as de suscripci&oacute;n, preguntar al destinatario si realmente desea publicidad de Ustedes y sus clientes.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n\r\n<div style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; line-height: normal;\">&nbsp;</div>\r\n\r\n<div style=\"color: rgb(34, 34, 34); font-family: arial, sans-serif; line-height: normal;\">\r\n<h2>Fuentes:</h2>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>[1] How to Make Your Email Open and Click-Through Rates Skyrocket</div>\r\n\r\n<div>&nbsp; &nbsp; &nbsp;<a href=\"http://blog.kissmetrics.com/email-clickthrough-rates-skyrocket/\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">http://blog.kissmetrics.com/<wbr />email-clickthrough-rates-<wbr />skyrocket/</a>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>[2] Sex, Lies, and the Art of Commanding Attention</div>\r\n\r\n<div>&nbsp; &nbsp;&nbsp;<a href=\"http://www.copyblogger.com/attention-getting-headlines/\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">http://www.copyblogger.com/<wbr />attention-getting-headlines/</a></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>[3] Fuentes de info Mailchimp:</div>\r\n\r\n<div><a href=\"http://mailchimp.com/resources/guides/email-marketing-field-guide/\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">http://mailchimp.com/<wbr />resources/guides/email-<wbr />marketing-field-guide/</a></div>\r\n\r\n<div><a href=\"http://mailchimp.com/resources/guides/how-to-create-an-email-marketing-plan/\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">http://mailchimp.com/<wbr />resources/guides/how-to-<wbr />create-an-email-marketing-<wbr />plan/</a></div>\r\n\r\n<div><a href=\"http://mailchimp.com/resources/guides/email-jitsu/\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">http://mailchimp.com/<wbr />resources/guides/email-jitsu/</a></div>\r\n\r\n<div><a href=\"http://mailchimp.com/resources/guides/how-to-avoid-spam-filters/\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">http://mailchimp.com/<wbr />resources/guides/how-to-avoid-<wbr />spam-filters/</a></div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>[4] The Science of Social Timing Part 2: Timing &amp; Email Marketing</div>\r\n\r\n<div><a href=\"http://blog.kissmetrics.com/science-of-social-timing-2/\" style=\"color: rgb(17, 85, 204);\" target=\"_blank\">http://blog.kissmetrics.com/<wbr />science-of-social-timing-2/</a></div>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n','2013-12-09 20:05:23','2013-12-09 20:06:02','2',''),(12,'Mailerball','<p>Hace algunos a&ntilde;os una empresa me pidi&oacute; le ayude con un env&iacute;o masivo de emails. Eso fu&eacute; hace cinco a&ntilde;os y el env&iacute;o fue tan efectivo que no se han detenido de solicitarme m&aacute;s servicios.</p>\r\n\r\n<p>A partir de esa experiencia elabor&eacute; el servicio bajo demanda Mailerball.com. Mailerball permite enviar correo masivo, as&iacute; como medir qu&eacute; tan efectivo fue el email mediante un reporte de aperturas, clics y rebotes.</p>\r\n\r\n<p>Si est&aacute;s interesado en el servicio, ingresa a <a href=\"http://mailerball.com\">http://mailerball.com</a> para mayor informaci&oacute;n</p>\r\n','2013-12-09 20:09:56','2013-12-09 20:10:12','2',''),(13,'Mailerball.com','','2013-12-09 20:10:34','2013-12-09 20:10:34','3','http://mailerball.com'),(14,'David Heinemeier Hansson: cómo hacer dinero en Internet','<p>David Heinemeier Hansson hablando sobre c&oacute;mo hacer dinero mediante aplicaciones sencillas y focalizadas que resuelvan problemas reales.</p>\r\n\r\n<p><img alt=\"\" src=\"/ckeditor_assets/pictures/2/content_dff.png\" /></p>\r\n','2013-12-23 20:31:00','2013-12-23 20:35:50','2',''),(15,'Servicios','','2013-12-23 20:41:23','2013-12-23 21:17:03',NULL,'#'),(16,'Marketing Digital','<p>Tenemos experiencia en estrat&eacute;gicas de marketing: dise&ntilde;o, an&aacute;lisis, planificaci&oacute;n, ejecuci&oacute;n y seguimiento de campa&ntilde;as de publicidad digital.</p>\r\n','2013-12-23 21:18:17','2013-12-23 21:18:30','15',''),(17,'Ruby Perú','','2013-12-24 00:35:00','2013-12-24 00:35:00','3','http://ruby.pe');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130309192912'),('20130309222556'),('20130309230652'),('20130310165139'),('20130407222426');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-26 10:02:07
