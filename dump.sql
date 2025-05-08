--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Answers" (
    id integer NOT NULL,
    id_qstn integer,
    id_proj integer,
    frontend jsonb,
    backend jsonb,
    type_proj jsonb,
    globalgoal jsonb,
    databases jsonb
);


ALTER TABLE public."Answers" OWNER TO postgres;

--
-- Name: Answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Answers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Answers_id_seq" OWNER TO postgres;

--
-- Name: Answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Answers_id_seq" OWNED BY public."Answers".id;


--
-- Name: Project_selection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Project_selection" (
    id integer NOT NULL,
    id_qstn integer NOT NULL,
    id_proj integer NOT NULL,
    project jsonb
);


ALTER TABLE public."Project_selection" OWNER TO postgres;

--
-- Name: Project_selection_id_proj_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Project_selection_id_proj_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Project_selection_id_proj_seq" OWNER TO postgres;

--
-- Name: Project_selection_id_proj_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Project_selection_id_proj_seq" OWNED BY public."Project_selection".id_proj;


--
-- Name: Project_selection_id_qstn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Project_selection_id_qstn_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Project_selection_id_qstn_seq" OWNER TO postgres;

--
-- Name: Project_selection_id_qstn_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Project_selection_id_qstn_seq" OWNED BY public."Project_selection".id_qstn;


--
-- Name: Project_selection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Project_selection_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Project_selection_id_seq" OWNER TO postgres;

--
-- Name: Project_selection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Project_selection_id_seq" OWNED BY public."Project_selection".id;


--
-- Name: Questionnaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Questionnaire" (
    id integer NOT NULL,
    "timestamp" date,
    satisfaction numeric
);


ALTER TABLE public."Questionnaire" OWNER TO postgres;

--
-- Name: Questionnaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Questionnaire_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Questionnaire_id_seq" OWNER TO postgres;

--
-- Name: Questionnaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Questionnaire_id_seq" OWNED BY public."Questionnaire".id;


--
-- Name: Recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recommendations" (
    id integer NOT NULL,
    id_qstn integer,
    proj_id integer,
    projects jsonb
);


ALTER TABLE public."Recommendations" OWNER TO postgres;

--
-- Name: Recommendations_id_qstn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Recommendations_id_qstn_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Recommendations_id_qstn_seq" OWNER TO postgres;

--
-- Name: Recommendations_id_qstn_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Recommendations_id_qstn_seq" OWNED BY public."Recommendations".id_qstn;


--
-- Name: Recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Recommendations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Recommendations_id_seq" OWNER TO postgres;

--
-- Name: Recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Recommendations_id_seq" OWNED BY public."Recommendations".id;


--
-- Name: Recommendations_proj_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Recommendations_proj_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Recommendations_proj_id_seq" OWNER TO postgres;

--
-- Name: Recommendations_proj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Recommendations_proj_id_seq" OWNED BY public."Recommendations".proj_id;


--
-- Name: Answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Answers" ALTER COLUMN id SET DEFAULT nextval('public."Answers_id_seq"'::regclass);


--
-- Name: Project_selection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Project_selection" ALTER COLUMN id SET DEFAULT nextval('public."Project_selection_id_seq"'::regclass);


--
-- Name: Project_selection id_qstn; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Project_selection" ALTER COLUMN id_qstn SET DEFAULT nextval('public."Project_selection_id_qstn_seq"'::regclass);


--
-- Name: Project_selection id_proj; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Project_selection" ALTER COLUMN id_proj SET DEFAULT nextval('public."Project_selection_id_proj_seq"'::regclass);


--
-- Name: Questionnaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Questionnaire" ALTER COLUMN id SET DEFAULT nextval('public."Questionnaire_id_seq"'::regclass);


--
-- Name: Recommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recommendations" ALTER COLUMN id SET DEFAULT nextval('public."Recommendations_id_seq"'::regclass);


--
-- Data for Name: Answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Answers" (id, id_qstn, id_proj, frontend, backend, type_proj, globalgoal, databases) FROM stdin;
1	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
2	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
3	\N	\N	["React", "Vue.js"]	["Django"]	["Mobile-Web App", "Web App"]	["1. No Poverty", "2. Zero Hunger"]	["PostgreSQL", "MySQL"]
4	\N	\N	["Angular", "Next.js", "WebXr"]	["Node.js", "Spring Boot", "Flask"]	["Web App", "Mobile App", "Chatbot"]	["14. Life Below Water", "15. Life on Land", "13. Climate Action"]	["Firebase", "MySQL", "MongoDB"]
5	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
6	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
7	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
8	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
9	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
10	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
11	\N	\N	["WebXr"]	["Flask"]	["Mobile App"]	["15. Life on Land"]	["IPFS"]
12	\N	\N	["Next.js"]	["Spring Boot"]	["Mobile App"]	["12. Responsible Consumption and Production"]	["MongoDB"]
13	\N	\N	["WebXr"]	["Flask"]	["Chatbot"]	["14. Life Below Water"]	["SQLite"]
14	\N	\N	["React Native"]	["FastAPI"]	["Chatbot"]	["15. Life on Land"]	["IPFS"]
15	\N	\N	["Next.js"]	["Spring Boot"]	["Mobile App"]	["14. Life Below Water"]	["MongoDB"]
16	\N	\N	["WebXr"]	["Flask"]	["Chatbot"]	["14. Life Below Water"]	["SQLite"]
17	\N	\N	["React"]	["Django"]	["Mobile-Web App"]	["4. Quality Education"]	["PostgreSQL"]
18	\N	\N	["Next.js"]	["Spring Boot"]	["Mobile App"]	["12. Responsible Consumption and Production"]	["Firebase"]
19	\N	\N	["WebXr"]	["Spring Boot"]	["Mobile App"]	["13. Climate Action"]	["MongoDB"]
20	\N	\N	["Next.js"]	["Spring Boot"]	["Mobile App", "Chatbot"]	["13. Climate Action"]	["Firebase"]
21	\N	\N	["Angular"]	["Node.js"]	["Web App"]	["11. Sustainable Cities and Communities"]	["Firebase"]
22	\N	\N	["Next.js"]	["Spring Boot"]	["Mobile App"]	["12. Responsible Consumption and Production"]	["MongoDB"]
23	\N	\N	["WebXr", "Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
24	\N	\N	["Flutter"]	["FastAPI"]	["Chatbot"]	["17. Partnerships for the Goals"]	["InfluxDB"]
25	\N	\N	["Next.js"]	["Spring Boot"]	["Chatbot"]	["13. Climate Action"]	["Firebase"]
26	\N	\N	["Vue.js"]	["Node.js"]	["Mobile App"]	["16. Peace, Justice and Strong Institutions"]	["Firebase"]
27	\N	\N	["Angular"]	["Spring Boot"]	["Mobile-Web App"]	["2. Zero Hunger"]	["MongoDB"]
\.


--
-- Data for Name: Project_selection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Project_selection" (id, id_qstn, id_proj, project) FROM stdin;
\.


--
-- Data for Name: Questionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Questionnaire" (id, "timestamp", satisfaction) FROM stdin;
\.


--
-- Data for Name: Recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Recommendations" (id, id_qstn, proj_id, projects) FROM stdin;
1	1	1	[]
2	2	2	[{"id": 43, "name": "Smart Manufacturing & IoT Automation System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["9. Industry, Innovation, and Infrastructure"]}, "image": "/images/gg9.jpg", "globalgoal": "Industry, Innovation, and Infrastructure", "description": "An Industry 4.0 solution that integrates IoT, AI, and automation to enhance factory production and resource management."}, {"id": 54, "name": "Smart Energy Management for Buildings", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "An IoT-powered platform that helps homes and commercial buildings reduce energy consumption and transition to renewable sources."}, {"id": 4, "name": "Smart Agriculture Advisory System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile application that provides small-scale farmers with real-time agricultural advice, weather updates, and market prices to maximize their yield and income."}, {"id": 7, "name": "Smart Farming & Precision Agriculture System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "An IoT-based platform that helps small-scale farmers optimize water usage, soil health, and crop yield using AI and sensors."}, {"id": 12, "name": "Wearable Health Monitoring & Emergency Alert System", "tags": {"type": ["Mobile App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["Flutter", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A mobile app connected to wearable devices that monitors vital signs and alerts emergency contacts or healthcare providers in case of anomalies."}]
3	3	3	[{"id": 43, "name": "Smart Manufacturing & IoT Automation System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["9. Industry, Innovation, and Infrastructure"]}, "image": "/images/gg9.jpg", "globalgoal": "Industry, Innovation, and Infrastructure", "description": "An Industry 4.0 solution that integrates IoT, AI, and automation to enhance factory production and resource management."}, {"id": 54, "name": "Smart Energy Management for Buildings", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "An IoT-powered platform that helps homes and commercial buildings reduce energy consumption and transition to renewable sources."}, {"id": 4, "name": "Smart Agriculture Advisory System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile application that provides small-scale farmers with real-time agricultural advice, weather updates, and market prices to maximize their yield and income."}, {"id": 7, "name": "Smart Farming & Precision Agriculture System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "An IoT-based platform that helps small-scale farmers optimize water usage, soil health, and crop yield using AI and sensors."}, {"id": 12, "name": "Wearable Health Monitoring & Emergency Alert System", "tags": {"type": ["Mobile App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["Flutter", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A mobile app connected to wearable devices that monitors vital signs and alerts emergency contacts or healthcare providers in case of anomalies."}]
4	4	4	[{"id": 43, "name": "Smart Manufacturing & IoT Automation System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["9. Industry, Innovation, and Infrastructure"]}, "image": "/images/gg9.jpg", "globalgoal": "Industry, Innovation, and Infrastructure", "description": "An Industry 4.0 solution that integrates IoT, AI, and automation to enhance factory production and resource management."}, {"id": 54, "name": "Smart Energy Management for Buildings", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "An IoT-powered platform that helps homes and commercial buildings reduce energy consumption and transition to renewable sources."}, {"id": 4, "name": "Smart Agriculture Advisory System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile application that provides small-scale farmers with real-time agricultural advice, weather updates, and market prices to maximize their yield and income."}, {"id": 7, "name": "Smart Farming & Precision Agriculture System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "An IoT-based platform that helps small-scale farmers optimize water usage, soil health, and crop yield using AI and sensors."}, {"id": 12, "name": "Wearable Health Monitoring & Emergency Alert System", "tags": {"type": ["Mobile App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["Flutter", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A mobile app connected to wearable devices that monitors vital signs and alerts emergency contacts or healthcare providers in case of anomalies."}]
5	\N	\N	[{"id": 3, "name": "Blockchain-Based Transparent Aid Distribution System", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Flask"], "database": ["IPFS", "PostgreSQL"], "frontend": ["React"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A blockchain platform to track and distribute financial aid efficiently, ensuring transparency and reducing corruption."}, {"id": 72, "name": "Blockchain-Based Sustainable Agriculture & Land Use Platform", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "IPFS"], "frontend": ["React", "React Native"], "globalgoal": ["15. Life on Land"]}, "image": "/images/gg15.jpg", "globalgoal": "Life on Land", "description": "A decentralized system that tracks land use, promotes sustainable farming, and ensures ethical land management. "}, {"id": 9, "name": "Blockchain-Enabled Food Supply Chain Transparency", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["IPFS", "PostgreSQL"], "frontend": ["React"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "A decentralized system that ensures fair pricing and efficient distribution of food from farmers to consumers."}, {"id": 17, "name": "VR/AR-Based Immersive Learning System", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["WebXr", "Flutter"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "A virtual reality (VR) and augmented reality (AR) platform that enhances education by creating interactive and immersive learning experiences."}, {"id": 20, "name": "Blockchain-Based Credential Verification System", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "IPFS"], "frontend": ["React"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "A secure and decentralized platform for issuing, verifying, and storing academic certificates and qualifications."}]
6	\N	\N	[{"id": 5, "name": "Digital Identity and Financial Inclusion App", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular", "React Native"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A digital identity system using biometrics and blockchain to help the unbanked access financial services, government aid, and job opportunities."}, {"id": 8, "name": "Nutritional Guidance & Meal Planning App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["Next.js", "React Native"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "A mobile app that provides low-income families with affordable, nutritious meal plans based on locally available food."}, {"id": 38, "name": "Microfinance & Digital Banking App for Small Businesses", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["8. Decent Work and Economic Growth"]}, "image": "/images/gg8.jpg", "globalgoal": "Decent Work and Economic Growth", "description": "A fintech platform that provides small entrepreneurs with access to microloans, digital payments, and financial literacy tools."}, {"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}, {"id": 2, "name": "Skill Development and Job Matching Portal", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "An AI-powered platform that provides free online courses, certifications, and job-matching services for underprivileged communities."}]
7	\N	\N	[{"id": 23, "name": "Gender Bias & Inclusivity AI Tool", "tags": {"type": ["Mobile-Web App"], "backend": ["FastAPI", "Flask"], "database": ["PostgreSQL", "SQLite"], "frontend": ["React"], "globalgoal": ["5. Gender Equality"]}, "image": "/images/gg5.jpg", "globalgoal": "Gender Equality", "description": "A machine learning tool that analyzes workplace policies, job descriptions, and media content to detect and reduce gender bias."}, {"id": 3, "name": "Blockchain-Based Transparent Aid Distribution System", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Flask"], "database": ["IPFS", "PostgreSQL"], "frontend": ["React"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A blockchain platform to track and distribute financial aid efficiently, ensuring transparency and reducing corruption."}, {"id": 17, "name": "VR/AR-Based Immersive Learning System", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["WebXr", "Flutter"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "A virtual reality (VR) and augmented reality (AR) platform that enhances education by creating interactive and immersive learning experiences."}, {"id": 19, "name": "Open-Source Digital Library & Offline Learning Hub", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "SQLite"], "frontend": ["React"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "A platform that provides free access to educational materials, books, and courses, even in low-connectivity areas."}, {"id": 66, "name": "AI-Powered Ocean Pollution Detection System", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["14. Life Below Water"]}, "image": "/images/gg14.jpg", "globalgoal": "Life Below Water", "description": "A platform that uses satellite imagery, AI, and IoT sensors to detect and track marine pollution, such as plastic waste and oil spills."}]
8	\N	\N	[{"id": 72, "name": "Blockchain-Based Sustainable Agriculture & Land Use Platform", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "IPFS"], "frontend": ["React", "React Native"], "globalgoal": ["15. Life on Land"]}, "image": "/images/gg15.jpg", "globalgoal": "Life on Land", "description": "A decentralized system that tracks land use, promotes sustainable farming, and ensures ethical land management. "}, {"id": 12, "name": "Wearable Health Monitoring & Emergency Alert System", "tags": {"type": ["Mobile App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["Flutter", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A mobile app connected to wearable devices that monitors vital signs and alerts emergency contacts or healthcare providers in case of anomalies."}, {"id": 15, "name": "Smart Nutrition & Fitness Assistant", "tags": {"type": ["Mobile-Web App"], "backend": ["FastAPI", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A mobile app that helps users maintain a healthy lifestyle through AI-driven diet plans, workout routines, and hydration reminders."}, {"id": 18, "name": "Educational Chatbot & Homework Assistant", "tags": {"type": ["Chatbot"], "backend": ["FastAPI", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "An AI chatbot that helps students with homework, provides explanations, and connects them with tutors if needed."}, {"id": 27, "name": "AI-Powered Water Waste Reduction App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["6. Clean Water and Sanitation"]}, "image": "/images/gg6.jpg", "globalgoal": "Clean Water and Sanitation", "description": "A mobile app that helps households and industries track and reduce water usage through AI-driven recommendations."}]
9	\N	\N	[{"id": 5, "name": "Digital Identity and Financial Inclusion App", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular", "React Native"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A digital identity system using biometrics and blockchain to help the unbanked access financial services, government aid, and job opportunities."}, {"id": 8, "name": "Nutritional Guidance & Meal Planning App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["Next.js", "React Native"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "A mobile app that provides low-income families with affordable, nutritious meal plans based on locally available food."}, {"id": 38, "name": "Microfinance & Digital Banking App for Small Businesses", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["8. Decent Work and Economic Growth"]}, "image": "/images/gg8.jpg", "globalgoal": "Decent Work and Economic Growth", "description": "A fintech platform that provides small entrepreneurs with access to microloans, digital payments, and financial literacy tools."}, {"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}, {"id": 2, "name": "Skill Development and Job Matching Portal", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "An AI-powered platform that provides free online courses, certifications, and job-matching services for underprivileged communities."}]
10	\N	\N	[{"id": 23, "name": "Gender Bias & Inclusivity AI Tool", "tags": {"type": ["Mobile-Web App"], "backend": ["FastAPI", "Flask"], "database": ["PostgreSQL", "SQLite"], "frontend": ["React"], "globalgoal": ["5. Gender Equality"]}, "image": "/images/gg5.jpg", "globalgoal": "Gender Equality", "description": "A machine learning tool that analyzes workplace policies, job descriptions, and media content to detect and reduce gender bias."}, {"id": 3, "name": "Blockchain-Based Transparent Aid Distribution System", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Flask"], "database": ["IPFS", "PostgreSQL"], "frontend": ["React"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A blockchain platform to track and distribute financial aid efficiently, ensuring transparency and reducing corruption."}, {"id": 17, "name": "VR/AR-Based Immersive Learning System", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["WebXr", "Flutter"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "A virtual reality (VR) and augmented reality (AR) platform that enhances education by creating interactive and immersive learning experiences."}, {"id": 19, "name": "Open-Source Digital Library & Offline Learning Hub", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "SQLite"], "frontend": ["React"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "A platform that provides free access to educational materials, books, and courses, even in low-connectivity areas."}, {"id": 66, "name": "AI-Powered Ocean Pollution Detection System", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["14. Life Below Water"]}, "image": "/images/gg14.jpg", "globalgoal": "Life Below Water", "description": "A platform that uses satellite imagery, AI, and IoT sensors to detect and track marine pollution, such as plastic waste and oil spills."}]
11	\N	\N	[{"id": 16, "name": "AI-Powered Personalized Learning Platform", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "React Native"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "An adaptive e-learning system that customizes lessons based on students' learning styles, progress, and strengths."}, {"id": 18, "name": "Educational Chatbot & Homework Assistant", "tags": {"type": ["Chatbot"], "backend": ["FastAPI", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "An AI chatbot that helps students with homework, provides explanations, and connects them with tutors if needed."}, {"id": 19, "name": "Open-Source Digital Library & Offline Learning Hub", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "SQLite"], "frontend": ["React"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "A platform that provides free access to educational materials, books, and courses, even in low-connectivity areas."}, {"id": 20, "name": "Blockchain-Based Credential Verification System", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "IPFS"], "frontend": ["React"], "globalgoal": ["4. Quality Education"]}, "image": "/images/gg4.jpg", "globalgoal": "Quality Education", "description": "A secure and decentralized platform for issuing, verifying, and storing academic certificates and qualifications."}, {"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}]
12	\N	\N	[{"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}, {"id": 14, "name": "Vaccine & Health Awareness Tracking System", "tags": {"type": ["Mobile-Web App"], "backend": ["Spring Boot", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A community-based app that helps track vaccinations, medication schedules, and provides real-time disease outbreak alerts."}, {"id": 57, "name": "AI-Powered Sustainable Shopping Assistant", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["12. Responsible Consumption and Production"]}, "image": "/images/gg12.jpg", "globalgoal": "Responsible Consumption and Production", "description": "A browser extension or mobile app that helps consumers make eco-friendly purchasing decisions by analyzing product sustainability."}, {"id": 58, "name": "Smart Waste Reduction & Upcycling Platform", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["12. Responsible Consumption and Production"]}, "image": "/images/gg12.jpg", "globalgoal": "Responsible Consumption and Production", "description": "A digital marketplace that connects people with businesses or organizations that can reuse, recycle, or upcycle their unwanted items."}, {"id": 60, "name": "Food Waste Prevention & Redistribution App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["12. Responsible Consumption and Production"]}, "image": "/images/gg12.jpg", "globalgoal": "Responsible Consumption and Production", "description": "A platform that connects restaurants, supermarkets, and households with surplus food to NGOs or individuals in need."}]
13	\N	\N	[{"id": 5, "name": "Digital Identity and Financial Inclusion App", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular", "React Native"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A digital identity system using biometrics and blockchain to help the unbanked access financial services, government aid, and job opportunities."}, {"id": 38, "name": "Microfinance & Digital Banking App for Small Businesses", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["8. Decent Work and Economic Growth"]}, "image": "/images/gg8.jpg", "globalgoal": "Decent Work and Economic Growth", "description": "A fintech platform that provides small entrepreneurs with access to microloans, digital payments, and financial literacy tools."}, {"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}, {"id": 2, "name": "Skill Development and Job Matching Portal", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "An AI-powered platform that provides free online courses, certifications, and job-matching services for underprivileged communities."}, {"id": 6, "name": "AI-Powered Food Waste Reduction Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Vue.js"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": " "}]
14	\N	\N	[{"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}, {"id": 14, "name": "Vaccine & Health Awareness Tracking System", "tags": {"type": ["Mobile-Web App"], "backend": ["Spring Boot", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A community-based app that helps track vaccinations, medication schedules, and provides real-time disease outbreak alerts."}, {"id": 61, "name": "AI-Powered Carbon Footprint Tracker", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["13. Climate Action"]}, "image": "/images/gg13.jpg", "globalgoal": "Climate Action", "description": "A mobile app that helps individuals and businesses measure, reduce, and offset their carbon footprint."}, {"id": 64, "name": "Crowdsourced Reforestation & Green Action App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["13. Climate Action"]}, "image": "/images/gg13.jpg", "globalgoal": "Climate Action", "description": "A community-driven app that tracks tree-planting initiatives, monitors forest health, and encourages users to participate in climate-positive actions."}, {"id": 4, "name": "Smart Agriculture Advisory System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile application that provides small-scale farmers with real-time agricultural advice, weather updates, and market prices to maximize their yield and income."}]
15	\N	\N	[{"id": 51, "name": "Smart Waste Management & Recycling Platform", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "A system that uses IoT and AI to optimize waste collection, track recycling efforts, and promote sustainable waste disposal."}, {"id": 52, "name": "AI-Powered Traffic & Public Transport Optimization", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "A platform that uses real-time data to reduce traffic congestion and improve public transport efficiency."}, {"id": 53, "name": "Crowdsourced Urban Issue Reporting App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "A mobile app where citizens can report infrastructure issues (potholes, broken streetlights, unsafe areas) and track resolutions."}, {"id": 55, "name": "Disaster Preparedness & Emergency Response System", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "A real-time alert and coordination platform for cities to manage natural disasters, fires, or other emergencies effectively."}, {"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}]
16	\N	\N	[{"id": 5, "name": "Digital Identity and Financial Inclusion App", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular", "React Native"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A digital identity system using biometrics and blockchain to help the unbanked access financial services, government aid, and job opportunities."}, {"id": 8, "name": "Nutritional Guidance & Meal Planning App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["Next.js", "React Native"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "A mobile app that provides low-income families with affordable, nutritious meal plans based on locally available food."}, {"id": 38, "name": "Microfinance & Digital Banking App for Small Businesses", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["8. Decent Work and Economic Growth"]}, "image": "/images/gg8.jpg", "globalgoal": "Decent Work and Economic Growth", "description": "A fintech platform that provides small entrepreneurs with access to microloans, digital payments, and financial literacy tools."}, {"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}, {"id": 2, "name": "Skill Development and Job Matching Portal", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "An AI-powered platform that provides free online courses, certifications, and job-matching services for underprivileged communities."}]
17	\N	\N	[{"id": 43, "name": "Smart Manufacturing & IoT Automation System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["9. Industry, Innovation, and Infrastructure"]}, "image": "/images/gg9.jpg", "globalgoal": "Industry, Innovation, and Infrastructure", "description": "An Industry 4.0 solution that integrates IoT, AI, and automation to enhance factory production and resource management."}, {"id": 54, "name": "Smart Energy Management for Buildings", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "An IoT-powered platform that helps homes and commercial buildings reduce energy consumption and transition to renewable sources."}, {"id": 4, "name": "Smart Agriculture Advisory System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile application that provides small-scale farmers with real-time agricultural advice, weather updates, and market prices to maximize their yield and income."}, {"id": 7, "name": "Smart Farming & Precision Agriculture System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "An IoT-based platform that helps small-scale farmers optimize water usage, soil health, and crop yield using AI and sensors."}, {"id": 12, "name": "Wearable Health Monitoring & Emergency Alert System", "tags": {"type": ["Mobile App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["Flutter", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A mobile app connected to wearable devices that monitors vital signs and alerts emergency contacts or healthcare providers in case of anomalies."}]
18	\N	\N	[{"id": 43, "name": "Smart Manufacturing & IoT Automation System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["9. Industry, Innovation, and Infrastructure"]}, "image": "/images/gg9.jpg", "globalgoal": "Industry, Innovation, and Infrastructure", "description": "An Industry 4.0 solution that integrates IoT, AI, and automation to enhance factory production and resource management."}, {"id": 54, "name": "Smart Energy Management for Buildings", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "InfluxDB"], "frontend": ["React", "Flutter"], "globalgoal": ["11. Sustainable Cities and Communities"]}, "image": "/images/gg11.jpg", "globalgoal": "Sustainable Cities and Communities", "description": "An IoT-powered platform that helps homes and commercial buildings reduce energy consumption and transition to renewable sources."}, {"id": 4, "name": "Smart Agriculture Advisory System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile application that provides small-scale farmers with real-time agricultural advice, weather updates, and market prices to maximize their yield and income."}, {"id": 7, "name": "Smart Farming & Precision Agriculture System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "An IoT-based platform that helps small-scale farmers optimize water usage, soil health, and crop yield using AI and sensors."}, {"id": 12, "name": "Wearable Health Monitoring & Emergency Alert System", "tags": {"type": ["Mobile App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["Flutter", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A mobile app connected to wearable devices that monitors vital signs and alerts emergency contacts or healthcare providers in case of anomalies."}]
19	\N	\N	[{"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}, {"id": 14, "name": "Vaccine & Health Awareness Tracking System", "tags": {"type": ["Mobile-Web App"], "backend": ["Spring Boot", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A community-based app that helps track vaccinations, medication schedules, and provides real-time disease outbreak alerts."}, {"id": 61, "name": "AI-Powered Carbon Footprint Tracker", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["13. Climate Action"]}, "image": "/images/gg13.jpg", "globalgoal": "Climate Action", "description": "A mobile app that helps individuals and businesses measure, reduce, and offset their carbon footprint."}, {"id": 64, "name": "Crowdsourced Reforestation & Green Action App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["13. Climate Action"]}, "image": "/images/gg13.jpg", "globalgoal": "Climate Action", "description": "A community-driven app that tracks tree-planting initiatives, monitors forest health, and encourages users to participate in climate-positive actions."}, {"id": 4, "name": "Smart Agriculture Advisory System", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile application that provides small-scale farmers with real-time agricultural advice, weather updates, and market prices to maximize their yield and income."}]
20	\N	\N	[{"id": 1, "name": "Microfinance and Crowdfunding Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django", "Spring Boot"], "database": ["PostgreSQL", "MySQL", "Firebase"], "frontend": ["React", "Vue.js"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A mobile/web app that connects low-income entrepreneurs with micro-investors willing to fund small businesses."}, {"id": 6, "name": "AI-Powered Food Waste Reduction Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Vue.js"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": " "}, {"id": 10, "name": "Urban Farming & Community Garden Management Platform", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "Flutter"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "A digital platform that helps cities set up and manage urban farms, connecting volunteers, donors, and local communities."}, {"id": 11, "name": "AI-Powered Telemedicine Platform", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "Firebase"], "frontend": ["React", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A virtual healthcare system that connects patients with doctors, providing remote consultations, diagnoses, and prescriptions."}, {"id": 12, "name": "Wearable Health Monitoring & Emergency Alert System", "tags": {"type": ["Mobile App"], "backend": ["Node.js", "FastAPI"], "database": ["PostgreSQL", "Firebase"], "frontend": ["Flutter", "React Native"], "globalgoal": ["3. Good Health and Well-Being"]}, "image": "/images/gg3.jpg", "globalgoal": "Good Health and Well-Being", "description": "A mobile app connected to wearable devices that monitors vital signs and alerts emergency contacts or healthcare providers in case of anomalies."}]
21	\N	\N	[{"id": 5, "name": "Digital Identity and Financial Inclusion App", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular", "React Native"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "A digital identity system using biometrics and blockchain to help the unbanked access financial services, government aid, and job opportunities."}, {"id": 2, "name": "Skill Development and Job Matching Portal", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Angular"], "globalgoal": ["1. No poverty"]}, "image": "/images/gg1.jpg", "globalgoal": "No poverty", "description": "An AI-powered platform that provides free online courses, certifications, and job-matching services for underprivileged communities."}, {"id": 6, "name": "AI-Powered Food Waste Reduction Platform", "tags": {"type": ["Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "Vue.js"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": " "}, {"id": 8, "name": "Nutritional Guidance & Meal Planning App", "tags": {"type": ["Mobile-Web App"], "backend": ["Node.js", "Django"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["Next.js", "React Native"], "globalgoal": ["2. Zero Hunger"]}, "image": "/images/gg2.jpg", "globalgoal": "Zero Hunger", "description": "A mobile app that provides low-income families with affordable, nutritious meal plans based on locally available food."}, {"id": 38, "name": "Microfinance & Digital Banking App for Small Businesses", "tags": {"type": ["Mobile-Web App"], "backend": ["Django", "Spring Boot"], "database": ["PostgreSQL", "MongoDB"], "frontend": ["React", "React Native"], "globalgoal": ["8. Decent Work and Economic Growth"]}, "image": "/images/gg8.jpg", "globalgoal": "Decent Work and Economic Growth", "description": "A fintech platform that provides small entrepreneurs with access to microloans, digital payments, and financial literacy tools."}]
\.


--
-- Name: Answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Answers_id_seq"', 27, true);


--
-- Name: Project_selection_id_proj_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Project_selection_id_proj_seq"', 1, false);


--
-- Name: Project_selection_id_qstn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Project_selection_id_qstn_seq"', 1, false);


--
-- Name: Project_selection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Project_selection_id_seq"', 1, false);


--
-- Name: Questionnaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Questionnaire_id_seq"', 1, false);


--
-- Name: Recommendations_id_qstn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Recommendations_id_qstn_seq"', 4, true);


--
-- Name: Recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Recommendations_id_seq"', 21, true);


--
-- Name: Recommendations_proj_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Recommendations_proj_id_seq"', 4, true);


--
-- Name: Answers Answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Answers"
    ADD CONSTRAINT "Answers_pkey" PRIMARY KEY (id);


--
-- Name: Recommendations Recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recommendations"
    ADD CONSTRAINT "Recommendations_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

