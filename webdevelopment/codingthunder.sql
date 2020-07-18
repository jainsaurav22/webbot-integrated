-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2020 at 11:35 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `phone_num`, `mes`, `date`, `email`) VALUES
(1, 'Saurav Dungarwal', '07991105713', 'hello', '2020-06-27 18:51:26', 'jainsaurav22@gmail.com'),
(2, 'Saurav Dungarwal', '07991105713', 'hello', '2020-06-27 18:52:35', 'jainsaurav22@gmail.com'),
(3, 'Saurav Dungarwal', '07991105713', 'hello\r\n', '2020-06-28 14:43:54', 'jainsaurav22@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `sub_title` varchar(25) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `sub_title`, `slug`, `content`, `date`, `img_file`) VALUES
(1, 'Covid-pedia', 'What is Covid-19', 'first-post', 'Coronaviruses are a group of related RNA viruses that cause diseases in mammals and birds. In humans, these viruses cause respiratory tract infections that can range from mild to lethal. Mild illnesses include some cases of the common cold (which is also caused by other viruses, predominantly rhinoviruses), while more lethal varieties can cause SARS, MERS, and COVID-19. Symptoms in other species vary: in chickens, they cause an upper respiratory tract disease, while in cows and pigs they cause diarrhea. There are as yet no vaccines or antiviral drugs to prevent or treat human coronavirus infections.', '2020-07-17 12:35:22', 'post-bg.jpg'),
(2, 'COVID-19 Vaccine', 'Daily Updates', 'vaccine', 'Researchers worldwide are working around the clock to find a vaccine against SARS-CoV-2, the virus causing the COVID-19 pandemic. Experts estimate that a fast-tracked vaccine development process could speed a successful candidate to market in approximately 12-18 months – if the process goes smoothly from conception to market availability.\r\n \r\nThe pandemic has created unprecedented public/private partnerships. Operation Warp Speed (OWS) is a collaboration of several US federal government departments including Health and Human Services and its subagencies, Agriculture, Energy and Veterans Affairs and the private sector. Within OWS, the US National Institutes of Health (NIH) has partnered with more than 18 biopharmaceutical companies to accelerate development of drug and vaccine candidates for COVID-19 (ACTIV). The COVID-19 Prevention Trials Network (COVPN) has also been established, which combines clinical trial networks funded by the National Institute of Allergy and Infectious Diseases (NIAID): the HIV Vaccine Trials Network (HVTN), HIV Prevention Trials Network (HPTN), Infectious Diseases Clinical Research Consortium (IDCRC), and the AIDS Clinical Trials Group.\r\n \r\nThe US government is choosing three vaccine candidates to fund for Phase 3 trials under Operation Warp Speed: Moderna’s mRNA-1273 in July, The University of Oxford and AstraZeneca’s AZD1222 in August, and Pfizer and BioNTech\'s BNT162 in September. Members of ACTIV have suggested developing safe controlled human infection models (CHIMs) for human trials could take 1-2 years. A sponsor would need to provide data from placebo-controlled trials indicating their vaccine is at least 50% effective against COVID-19 in order to be authorized for use, according to FDA guidance issued and effective 30 June. \r\n \r\nThis tracker lists COVID-19 vaccine candidates currently in Phase 1-3 trials, as well as major candidates in pre-clinical stages of development and research. Information will be updated weekly. If you notice an issue with this data or wish to submit an update, please email Focus at news@raps.org. \r\n \r\nUpdated 16 July  to include new information on vaccine candidates from Chulalongkorn University, Zydus Cadila, Moderna, Pfizer and BioNTech, AstraZeneca and IQVIA, Anhui Zhifei Longcom Biopharmaceutical, Imperial College London, Medicago, Altimmune, University of Queensland,and Bharat Biotech.', '2020-07-17 12:29:52', 'post-bg.jpg'),
(3, 'COVID-19 has provoked data privacy issue', 'Covid-19 updates', 'covid-19', 'How can location intelligence help optimize resource allocation at a time of pandemic when virtually all supply lines are disrupted?\r\nSupply lines were disrupted with the advent of COVID-19. First and foremost being able to quickly examine, explore and interrogate data provides information about which factories are operational and which of their suppliers are online. As we get into the local market, that data can also provide insight into how things are being distributed in real time because there is a greater need for manual intervention simply because things could be disrupted at a moment’s notice. Due to COVID-19, many areas were shut down and anticipated deliveries were disrupted, so that requires a lot more human intervention. That is where our system excels by allowing human analysts, subject matter experts and decision makers to get the context they need to make decisions under changing conditions during black swan events like COVID-19.\r\n\r\nHow aggregated mobile location data can prove tracking and tracing of the virus?\r\nWe work with a number of partners in this space like Skyhook, SafeGraph and X-Mode to give us the ability to look at human movement patterns and correlate it with the spread of the virus. The first thing that we can do is build a predictive model of how fast we expect the virus to spread in a certain community to help plan for access to ventilators, hospital bed capacity, testing and reopening policies. Using a very coarse population model one can only reach a certain level of accuracy, but what we’ve found is that by incorporating more granular metrics of number of miles traveled per day, number of buildings visited and the aggregate population density of places people are visiting we can certainly correlate it with the spread of the virus. You can even bring together other factors like correlation to weather or demographics to inform the predictive model. The second thing we can do is get deeper into use cases of hotspot analysis and contact tracing. Hotspot analysis is particularly good for this sort of location data. If you are looking at country, state or municipality level data you won’t have 100 percent coverage, but if you know certain people are getting sick or visiting emergency rooms etc., you can basically back track and find if there are some points of interest or particular locations that stand out from the background. If certain restaurants, shopping malls or grocery stores are visited by an inordinate number of people who ultimately got sick, you can see that there may be some sort of unsafe condition happening there or perhaps it’s being visited by someone who is a “super spreader.” Lastly, in regard to contact tracing and patient zeroes, there’s been a lot of talk about how perhaps folks who were in New York City traveled to Florida or other places in the country which led to the spread of the virus there. You can use this data to help determine aggregate population movements between hotspots or infected areas and places that aren’t hotspots yet to predict flareups in these secondary locations.\r\n\r\nHow can use of artificial intelligence tools on location data help health organizations and local authorities for fighting the disease, and further disease modeling for prediction and prevention?\r\nWhen we say AI, it can be as simple as a statistical model but at scale. One of the things that we have done a great amount of work on is integrating data science, or converging data science workloads and machine learning workloads, into more traditional analytics workloads. First off you may want to visually analyze all this data to make sure that you understand what is going on and have some context, because maybe some of the data is anomalous. When you are getting reported cases of COVID, you might see spikes or aberrations that pertain to how the data is being reported. Somebody who is a subject matter expert can quickly spot those and ideally correct for those, but the challenge is then being able to seamlessly transition into something as simple as a regression, a more complicated XGBoost or something even more complex like a neural network. Being able to do that at scale on the same platform has been a boon for our customers — particularly for the predictive aspect when it comes to being able to forecast the number of ICU beds or testing kits in a supply chain, for example — because everything is a moving target right now.\r\n\r\nPandemic has also seen the value and benefits of location data and intelligence tools going up like never before, what would be the impact of COVID-19 on location and AI industry?\r\nIt is causing people to think more spatially, and not only about problems related to COVID-19, but in relation to more general business practices. As people have seen the power of geospatial analytics in general to provide intelligence that they wouldn’t necessarily get from more traditional BI tools, they start thinking of other use cases for our technology. We have actually looked at a supply chain problem with a federal government that quickly translated into a broader discussion about ensuring that there will be enough food, ventilators and other essential items in any disaster moving forward. I think people immediately grasp the correlations. Even in the retail or CPG sectors, by understanding aggregate movement patterns in a way that protects privacy you can get a greater sense of demand for your product and the best channels or stores to sell a given good. Even within a store you can start to think more spatially about shelf space, like where a certain brand of deodorant will sell best based on people’s pattern of movement through a store, and by doing so you’ll learn how to maximize presence and contact with a customer. I think this a conversation starter and once people see the power of analytics with COVID-19 they will start thinking about other corollary use cases outside the context of the outbreak.\r\n\r\nAmong your user industries where do you see the business falling and which areas do you see the demands going up?\r\nWe have seen a lot of interest from the Telco sector, which is already one of our key verticals. COVID-19 is changing everything in terms of demand for data and bandwidth. Maybe there is less demand because people are at home and are on Wi-Fi, or maybe there is more demand because people are surfing or consuming content in ways they wouldn’t be if they were at the office. So, everything is changing, and we see all these Telco companies throwing away their old models and trying to navigate how to not only survive, but actually deliver relevant benefits to their customers. For example, because people are consuming more content, how do companies then deliver discounts and gain market share? How do they ensure that, because people are in different places than they normally are, that they have the network capacity to deliver good service? Telco is one big sector where we have seen a lot of interest in either COVID-19 use cases or adjacent things pertaining to the more general impact on the economy and people’s behavior.\r\n\r\nUse of location data for contact tracing for COVID response have been a fresh debate on data privacy, what could be done to balance data privacy along with effectiveness and how do you see data privacy landscape evolving going forward?\r\nCOVID-19 has provoked a lot of conversations around data privacy framed as, “what if we erode privacy rights in exchange for the greater good of protecting human life and reopening the economy?” I think that’s a little bit of a false dichotomy or false choice. One of the problems right now is that even if location data is anonymized it still provides contextual information. If you have enough data points and know where someone lives or works, you can probably determine who someone is based on their location data. That understandably concerns people. One of the main issues right now is that people will give out this raw data, and that presents a lot of risks because anyone could look into the data for good or nefarious purposes. OmniSci is working on ways of protecting that data. Because OmniSci can process data server side, we essentially use differential privacy to roll up results based on individual, aggregated data. That way you get the full power of all the demographic data or patterns of movement you might have, but the end user, consumer or decision-maker can never see or get access to individual location data. Everything is rolled up into groups of 20+ people but it still provides the granularity and power needed to make better decisions. This is something I think will be become increasingly important as people are trying to navigate policy decisions.', '2020-07-17 12:34:08', 'post-bg.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
