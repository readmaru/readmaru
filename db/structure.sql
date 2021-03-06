SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: admins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bans (
    id bigint NOT NULL,
    end_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    source_type character varying NOT NULL,
    source_id bigint NOT NULL,
    target_type character varying NOT NULL,
    target_id bigint NOT NULL,
    created_by_type character varying NOT NULL,
    created_by_id bigint NOT NULL,
    updated_by_type character varying NOT NULL,
    updated_by_id bigint NOT NULL
);


--
-- Name: bans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bans_id_seq OWNED BY public.bans.id;


--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bookmarks (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bookmarkable_type character varying NOT NULL,
    bookmarkable_id bigint NOT NULL
);


--
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    created_by_id bigint NOT NULL,
    post_id bigint NOT NULL,
    text text NOT NULL,
    ignore_reports boolean DEFAULT false NOT NULL,
    comments_count integer DEFAULT 0 NOT NULL,
    up_votes_count integer DEFAULT 0 NOT NULL,
    down_votes_count integer DEFAULT 0 NOT NULL,
    new_score integer DEFAULT 0 NOT NULL,
    hot_score double precision DEFAULT 0.0 NOT NULL,
    best_score double precision DEFAULT 0.0 NOT NULL,
    top_score integer DEFAULT 0 NOT NULL,
    controversy_score integer DEFAULT 0 NOT NULL,
    edited_by_id bigint,
    edited_at timestamp without time zone,
    approved_by_id bigint,
    approved_at timestamp without time zone,
    removed_by_id bigint,
    removed_at timestamp without time zone,
    removed_reason character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    comment_id bigint,
    community_id bigint NOT NULL,
    reports_count integer DEFAULT 0 NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: communities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.communities (
    id bigint NOT NULL,
    url character varying NOT NULL,
    followers_count integer DEFAULT 0 NOT NULL,
    description character varying,
    title character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.communities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: exiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exiles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: exiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exiles_id_seq OWNED BY public.exiles.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    followable_type character varying NOT NULL,
    followable_id bigint NOT NULL
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: moderators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moderators (
    id bigint NOT NULL,
    community_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: moderators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moderators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moderators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moderators_id_seq OWNED BY public.moderators.id;


--
-- Name: mutes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mutes (
    id bigint NOT NULL,
    end_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_by_type character varying NOT NULL,
    created_by_id bigint NOT NULL,
    updated_by_type character varying NOT NULL,
    updated_by_id bigint NOT NULL,
    source_type character varying NOT NULL,
    source_id bigint NOT NULL,
    target_type character varying NOT NULL,
    target_id bigint NOT NULL
);


--
-- Name: mutes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mutes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mutes_id_seq OWNED BY public.mutes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    created_by_id bigint NOT NULL,
    community_id bigint NOT NULL,
    title character varying NOT NULL,
    tag character varying,
    text text,
    explicit boolean DEFAULT false NOT NULL,
    spoiler boolean DEFAULT false NOT NULL,
    ignore_reports boolean DEFAULT false NOT NULL,
    comments_count integer DEFAULT 0 NOT NULL,
    up_votes_count integer DEFAULT 0 NOT NULL,
    down_votes_count integer DEFAULT 0 NOT NULL,
    new_score integer DEFAULT 0 NOT NULL,
    hot_score double precision DEFAULT 0.0 NOT NULL,
    top_score integer DEFAULT 0 NOT NULL,
    controversy_score integer DEFAULT 0 NOT NULL,
    edited_by_id bigint,
    edited_at timestamp without time zone,
    approved_by_id bigint,
    approved_at timestamp without time zone,
    removed_by_id bigint,
    removed_at timestamp without time zone,
    removed_reason character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reports_count integer DEFAULT 0 NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: rate_limits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rate_limits (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    action character varying NOT NULL,
    hits integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rate_limits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rate_limits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rate_limits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rate_limits_id_seq OWNED BY public.rate_limits.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reports (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    text character varying NOT NULL,
    reportable_type character varying NOT NULL,
    reportable_id bigint NOT NULL,
    community_id bigint NOT NULL
);


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rules (
    id bigint NOT NULL,
    community_id bigint NOT NULL,
    title character varying NOT NULL,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rules_id_seq OWNED BY public.rules.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    community_id bigint NOT NULL,
    text character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics (
    id bigint NOT NULL,
    tree jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    post_id bigint NOT NULL
);


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying NOT NULL,
    email character varying,
    password_digest character varying NOT NULL,
    forgot_password_token character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.votes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    vote_type integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    votable_type character varying NOT NULL,
    votable_id bigint NOT NULL
);


--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: bans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bans ALTER COLUMN id SET DEFAULT nextval('public.bans_id_seq'::regclass);


--
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: exiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exiles ALTER COLUMN id SET DEFAULT nextval('public.exiles_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: moderators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moderators ALTER COLUMN id SET DEFAULT nextval('public.moderators_id_seq'::regclass);


--
-- Name: mutes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutes ALTER COLUMN id SET DEFAULT nextval('public.mutes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: rate_limits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rate_limits ALTER COLUMN id SET DEFAULT nextval('public.rate_limits_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: rules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rules ALTER COLUMN id SET DEFAULT nextval('public.rules_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bans bans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bans
    ADD CONSTRAINT bans_pkey PRIMARY KEY (id);


--
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: exiles exiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exiles
    ADD CONSTRAINT exiles_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: moderators moderators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT moderators_pkey PRIMARY KEY (id);


--
-- Name: mutes mutes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mutes
    ADD CONSTRAINT mutes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: rate_limits rate_limits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rate_limits
    ADD CONSTRAINT rate_limits_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admins_on_user_id ON public.admins USING btree (user_id);


--
-- Name: index_bans_on_end_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bans_on_end_at ON public.bans USING btree (end_at);


--
-- Name: index_bans_on_source_type_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bans_on_source_type_and_source_id ON public.bans USING btree (source_type, source_id);


--
-- Name: index_bans_on_target_type_and_target_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bans_on_target_type_and_target_id ON public.bans USING btree (target_type, target_id);


--
-- Name: index_bans_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_bans_uniqueness ON public.bans USING btree (source_type, source_id, target_type, target_id);


--
-- Name: index_bookmarks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bookmarks_on_user_id ON public.bookmarks USING btree (user_id);


--
-- Name: index_bookmarks_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_bookmarks_uniqueness ON public.bookmarks USING btree (bookmarkable_id, bookmarkable_type, user_id);


--
-- Name: index_comments_on_approved_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_approved_at ON public.comments USING btree (approved_at);


--
-- Name: index_comments_on_best_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_best_score ON public.comments USING btree (best_score);


--
-- Name: index_comments_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_community_id ON public.comments USING btree (community_id);


--
-- Name: index_comments_on_controversy_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_controversy_score ON public.comments USING btree (controversy_score);


--
-- Name: index_comments_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_created_at ON public.comments USING btree (created_at);


--
-- Name: index_comments_on_created_by_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_created_by_id ON public.comments USING btree (created_by_id);


--
-- Name: index_comments_on_hot_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_hot_score ON public.comments USING btree (hot_score);


--
-- Name: index_comments_on_new_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_new_score ON public.comments USING btree (new_score);


--
-- Name: index_comments_on_removed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_removed_at ON public.comments USING btree (removed_at);


--
-- Name: index_comments_on_top_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_top_score ON public.comments USING btree (top_score);


--
-- Name: index_communities_on_lower_url; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_communities_on_lower_url ON public.communities USING btree (lower((url)::text));


--
-- Name: index_exiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_exiles_on_user_id ON public.exiles USING btree (user_id);


--
-- Name: index_follows_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_follows_on_user_id ON public.follows USING btree (user_id);


--
-- Name: index_follows_on_user_id_and_followable_type_and_followable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_follows_on_user_id_and_followable_type_and_followable_id ON public.follows USING btree (user_id, followable_type, followable_id);


--
-- Name: index_moderators_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_moderators_on_community_id ON public.moderators USING btree (community_id);


--
-- Name: index_moderators_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_moderators_on_user_id ON public.moderators USING btree (user_id);


--
-- Name: index_moderators_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_moderators_uniqueness ON public.moderators USING btree (community_id, user_id);


--
-- Name: index_mutes_on_end_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mutes_on_end_at ON public.mutes USING btree (end_at);


--
-- Name: index_mutes_on_source_type_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mutes_on_source_type_and_source_id ON public.mutes USING btree (source_type, source_id);


--
-- Name: index_mutes_on_target_type_and_target_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mutes_on_target_type_and_target_id ON public.mutes USING btree (target_type, target_id);


--
-- Name: index_mutes_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_mutes_uniqueness ON public.mutes USING btree (source_type, source_id, target_type, target_id);


--
-- Name: index_posts_on_approved_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_approved_at ON public.posts USING btree (approved_at);


--
-- Name: index_posts_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_community_id ON public.posts USING btree (community_id);


--
-- Name: index_posts_on_controversy_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_controversy_score ON public.posts USING btree (controversy_score);


--
-- Name: index_posts_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_created_at ON public.posts USING btree (created_at);


--
-- Name: index_posts_on_created_by_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_created_by_id ON public.posts USING btree (created_by_id);


--
-- Name: index_posts_on_hot_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_hot_score ON public.posts USING btree (hot_score);


--
-- Name: index_posts_on_new_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_new_score ON public.posts USING btree (new_score);


--
-- Name: index_posts_on_removed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_removed_at ON public.posts USING btree (removed_at);


--
-- Name: index_posts_on_top_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_top_score ON public.posts USING btree (top_score);


--
-- Name: index_rate_limits_on_action; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rate_limits_on_action ON public.rate_limits USING btree (action);


--
-- Name: index_rate_limits_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rate_limits_on_created_at ON public.rate_limits USING btree (created_at);


--
-- Name: index_rate_limits_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rate_limits_on_user_id ON public.rate_limits USING btree (user_id);


--
-- Name: index_reports_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_community_id ON public.reports USING btree (community_id);


--
-- Name: index_reports_on_reportable_type_and_reportable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_reportable_type_and_reportable_id ON public.reports USING btree (reportable_type, reportable_id);


--
-- Name: index_reports_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_user_id ON public.reports USING btree (user_id);


--
-- Name: index_reports_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reports_uniqueness ON public.reports USING btree (reportable_type, reportable_id, user_id);


--
-- Name: index_rules_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rules_on_community_id ON public.rules USING btree (community_id);


--
-- Name: index_tags_on_community_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tags_on_community_id ON public.tags USING btree (community_id);


--
-- Name: index_tags_on_community_id_and_text; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tags_on_community_id_and_text ON public.tags USING btree (community_id, text);


--
-- Name: index_topics_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_topics_uniqueness ON public.topics USING btree (post_id);


--
-- Name: index_users_on_forgot_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_forgot_password_token ON public.users USING btree (forgot_password_token);


--
-- Name: index_users_on_lower_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_lower_email ON public.users USING btree (lower((email)::text));


--
-- Name: index_users_on_lower_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_lower_username ON public.users USING btree (lower((username)::text));


--
-- Name: index_votes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_user_id ON public.votes USING btree (user_id);


--
-- Name: index_votes_on_vote_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_vote_type ON public.votes USING btree (vote_type);


--
-- Name: index_votes_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_votes_uniqueness ON public.votes USING btree (votable_type, votable_id, user_id);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: posts fk_rails_082ae69979; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_082ae69979 FOREIGN KEY (edited_by_id) REFERENCES public.users(id);


--
-- Name: topics fk_rails_20d6eae1b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT fk_rails_20d6eae1b8 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: comments fk_rails_293e84bea1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_293e84bea1 FOREIGN KEY (approved_by_id) REFERENCES public.users(id);


--
-- Name: rules fk_rails_2acf6061a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT fk_rails_2acf6061a2 FOREIGN KEY (community_id) REFERENCES public.communities(id);


--
-- Name: comments fk_rails_2c6f8fad1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_2c6f8fad1f FOREIGN KEY (edited_by_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_2fd19c0db7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_2fd19c0db7 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: follows fk_rails_32479bd030; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_rails_32479bd030 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: admins fk_rails_378b9734e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT fk_rails_378b9734e4 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_3f25c5a043; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_3f25c5a043 FOREIGN KEY (removed_by_id) REFERENCES public.users(id);


--
-- Name: rate_limits fk_rails_503ad46b83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rate_limits
    ADD CONSTRAINT fk_rails_503ad46b83 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: posts fk_rails_5736a68073; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5736a68073 FOREIGN KEY (removed_by_id) REFERENCES public.users(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: posts fk_rails_5bdccabcd5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5bdccabcd5 FOREIGN KEY (community_id) REFERENCES public.communities(id);


--
-- Name: comments fk_rails_6545a5f2bc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_6545a5f2bc FOREIGN KEY (comment_id) REFERENCES public.comments(id);


--
-- Name: exiles fk_rails_6ae9abf537; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exiles
    ADD CONSTRAINT fk_rails_6ae9abf537 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: posts fk_rails_78a7444b29; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_78a7444b29 FOREIGN KEY (approved_by_id) REFERENCES public.users(id);


--
-- Name: tags fk_rails_9d91798020; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT fk_rails_9d91798020 FOREIGN KEY (community_id) REFERENCES public.communities(id);


--
-- Name: comments fk_rails_a231e25c25; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_a231e25c25 FOREIGN KEY (community_id) REFERENCES public.communities(id);


--
-- Name: moderators fk_rails_be7d88c486; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT fk_rails_be7d88c486 FOREIGN KEY (community_id) REFERENCES public.communities(id);


--
-- Name: bookmarks fk_rails_c1ff6fa4ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_c1ff6fa4ac FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reports fk_rails_c7699d537d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fk_rails_c7699d537d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: votes fk_rails_c9b3bef597; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT fk_rails_c9b3bef597 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: moderators fk_rails_e69979a229; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moderators
    ADD CONSTRAINT fk_rails_e69979a229 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190604150812'),
('20190607040618'),
('20190614145100'),
('20190614152509'),
('20190614153421'),
('20190614153836'),
('20190614154235'),
('20190616102128'),
('20190616104344'),
('20190616105241'),
('20190619151146'),
('20190624121820'),
('20190709090102'),
('20190709090252'),
('20190709092346'),
('20190709092704'),
('20190716102457'),
('20190716105255'),
('20190716120617'),
('20190716120925'),
('20190716121355'),
('20190716122420'),
('20190716171022'),
('20190716175842'),
('20190717121108'),
('20190717122330'),
('20190717123516'),
('20190717171335'),
('20190721143014'),
('20190721153911'),
('20190721195133'),
('20190721202518'),
('20190721202915'),
('20190722001031'),
('20190722010653'),
('20190722010659'),
('20190722010707'),
('20190722012742'),
('20190724014115'),
('20190724022619'),
('20190724023901'),
('20190724023906'),
('20190724023916'),
('20190724025712'),
('20190724025818'),
('20190724152958'),
('20190724172531'),
('20190724172544'),
('20190724221053'),
('20190724221232'),
('20190724224154'),
('20190724225505'),
('20190724225534'),
('20190724230752'),
('20190724230802'),
('20190724232645'),
('20190725220001'),
('20190725220004'),
('20190726040646'),
('20190728020437'),
('20190728062131'),
('20190728063719'),
('20190728064759'),
('20190730025815'),
('20190730025956'),
('20190730025959'),
('20190730030026'),
('20190806141633'),
('20190806141651'),
('20190810090803'),
('20190810091117'),
('20190810135911'),
('20190811172834'),
('20190812172247'),
('20190814110115'),
('20190814132903'),
('20190814133845'),
('20190814134503'),
('20190814134909'),
('20190814140055'),
('20190814140631'),
('20190814141100'),
('20190814142320'),
('20190814142325'),
('20190814143945'),
('20190818113049'),
('20190818113247'),
('20190820140446'),
('20190820202154'),
('20190821105247'),
('20190822173713'),
('20190823145005'),
('20191230181216'),
('20191230181302'),
('20191231035003'),
('20191231040111'),
('20191231040128'),
('20200102204219'),
('20200105131241'),
('20200105131635'),
('20200105131738'),
('20200105132129'),
('20200105132223'),
('20200105135417'),
('20200105135906'),
('20200105140052'),
('20200105140257'),
('20200105140549'),
('20200105140805'),
('20200105141320'),
('20200105141429'),
('20200105142203'),
('20200105142414'),
('20200105142545'),
('20200105142742'),
('20200105143003'),
('20200106063848'),
('20200106064030'),
('20200106064109'),
('20200106064158'),
('20200106104836'),
('20200106105154'),
('20200106105306'),
('20200106105406'),
('20200308143756'),
('20200325220423'),
('20200330133958'),
('20200418102057'),
('20200418102156'),
('20200418102351'),
('20200425105535'),
('20200829150131'),
('20200906152330'),
('20200906152336'),
('20200906152349'),
('20200906152407'),
('20200906152418'),
('20200906152428'),
('20200906152501'),
('20200906152508'),
('20200906152529'),
('20200906152537'),
('20200906170014'),
('20200906174209'),
('20200906233425'),
('20200906233431'),
('20200906233438'),
('20200906233456'),
('20200906233505'),
('20200906233527'),
('20200906233534'),
('20200906233621'),
('20200906233633'),
('20200906233641'),
('20200906233908'),
('20200906233923'),
('20200906233942');


