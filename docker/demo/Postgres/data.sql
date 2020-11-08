--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Debian 13.0-1.pgdg100+1)
-- Dumped by pg_dump version 13.0 (Debian 13.0-1.pgdg100+1)

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

\connect simplywall

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO simplywall;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO simplywall;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO simplywall;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO simplywall;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO simplywall;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO simplywall;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO simplywall;

--
-- Name: client; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO simplywall;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO simplywall;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO simplywall;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO simplywall;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO simplywall;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO simplywall;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO simplywall;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO simplywall;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO simplywall;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO simplywall;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO simplywall;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO simplywall;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO simplywall;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO simplywall;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO simplywall;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO simplywall;

--
-- Name: component; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO simplywall;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO simplywall;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO simplywall;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO simplywall;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO simplywall;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO simplywall;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO simplywall;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO simplywall;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO simplywall;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO simplywall;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO simplywall;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO simplywall;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO simplywall;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO simplywall;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO simplywall;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO simplywall;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO simplywall;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO simplywall;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO simplywall;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: simplywall
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO simplywall;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO simplywall;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO simplywall;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO simplywall;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO simplywall;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO simplywall;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO simplywall;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO simplywall;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO simplywall;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO simplywall;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO simplywall;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO simplywall;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO simplywall;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO simplywall;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO simplywall;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO simplywall;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO simplywall;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO simplywall;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO simplywall;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO simplywall;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO simplywall;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO simplywall;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO simplywall;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO simplywall;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO simplywall;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO simplywall;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO simplywall;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO simplywall;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO simplywall;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO simplywall;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO simplywall;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO simplywall;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO simplywall;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO simplywall;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO simplywall;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO simplywall;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO simplywall;

--
-- Name: sws_sompany_price_close; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.sws_sompany_price_close (
    date date,
    company_id character varying(36),
    price real,
    date_created timestamp without time zone,
    id integer NOT NULL
);


ALTER TABLE public.sws_sompany_price_close OWNER TO simplywall;

--
-- Name: swsCompanyPriceClose_id_seq; Type: SEQUENCE; Schema: public; Owner: simplywall
--

CREATE SEQUENCE public."swsCompanyPriceClose_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."swsCompanyPriceClose_id_seq" OWNER TO simplywall;

--
-- Name: swsCompanyPriceClose_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simplywall
--

ALTER SEQUENCE public."swsCompanyPriceClose_id_seq" OWNED BY public.sws_sompany_price_close.id;


--
-- Name: sws_company; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.sws_company (
    id character varying(36) NOT NULL,
    name character varying(255),
    ticker_symbol character varying(255),
    exchange_symbol character varying(255),
    unique_symbol character varying(255),
    date_generated timestamp without time zone,
    security_name character varying(255),
    exchange_country_iso character varying(255),
    listing_currency_iso character varying(255),
    canonical_url character varying(255),
    unique_symbol_slug character varying(255),
    score_id integer,
    canonicalurl character varying(255),
    exchange_countryiso character varying(255),
    listing_currencyiso character varying(255)
);


ALTER TABLE public.sws_company OWNER TO simplywall;

--
-- Name: sws_company_score; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.sws_company_score (
    id integer NOT NULL,
    company_id character varying(36),
    date_generated timestamp without time zone,
    dividend integer,
    future integer,
    health integer,
    management integer,
    past integer,
    value integer,
    misc integer,
    total integer,
    sentence character varying(255)
);


ALTER TABLE public.sws_company_score OWNER TO simplywall;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO simplywall;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO simplywall;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO simplywall;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO simplywall;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO simplywall;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO simplywall;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO simplywall;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO simplywall;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO simplywall;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO simplywall;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO simplywall;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO simplywall;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO simplywall;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO simplywall;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: simplywall
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO simplywall;

--
-- Name: sws_sompany_price_close id; Type: DEFAULT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.sws_sompany_price_close ALTER COLUMN id SET DEFAULT nextval('public."swsCompanyPriceClose_id_seq"'::regclass);


--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.authentication_execution VALUES ('99b200a3-5627-43a7-9b41-48eeff401be0', NULL, 'auth-cookie', 'master', 'e1805c4a-36e5-4f22-b511-bbde0f1b8fd0', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c2af3872-7f19-4675-9a11-4f32451d3d4e', NULL, 'auth-spnego', 'master', 'e1805c4a-36e5-4f22-b511-bbde0f1b8fd0', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('01dbf8d1-4335-490e-8eda-e306e0bc358a', NULL, 'identity-provider-redirector', 'master', 'e1805c4a-36e5-4f22-b511-bbde0f1b8fd0', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('475f8d21-a2e4-4dd6-a7b2-b0810bb16ef9', NULL, NULL, 'master', 'e1805c4a-36e5-4f22-b511-bbde0f1b8fd0', 2, 30, true, '0e596e22-c073-486e-b4f3-37a5c2567bbf', NULL);
INSERT INTO public.authentication_execution VALUES ('7ae7556c-68ba-4383-b8e6-312157bc51b2', NULL, 'auth-username-password-form', 'master', '0e596e22-c073-486e-b4f3-37a5c2567bbf', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('87543729-b8f1-48f7-be1c-e4990eaca18b', NULL, NULL, 'master', '0e596e22-c073-486e-b4f3-37a5c2567bbf', 1, 20, true, '95323bc9-d24a-4a72-91dc-9e0c31e15581', NULL);
INSERT INTO public.authentication_execution VALUES ('3ed77c48-31e9-42d4-a32f-4c5454ad6fee', NULL, 'conditional-user-configured', 'master', '95323bc9-d24a-4a72-91dc-9e0c31e15581', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('eb21c5f8-cb2b-48ce-a921-d25a5b997343', NULL, 'auth-otp-form', 'master', '95323bc9-d24a-4a72-91dc-9e0c31e15581', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('659e5ca1-e3fc-4d71-8ec7-5f0821119465', NULL, 'direct-grant-validate-username', 'master', '212a6252-4a6e-4177-a08f-0c60c51016c3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fb69c6fb-209f-4937-a66f-ad09b67f717b', NULL, 'direct-grant-validate-password', 'master', '212a6252-4a6e-4177-a08f-0c60c51016c3', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('74b5985c-61a0-4007-82f8-0f28b13d081f', NULL, NULL, 'master', '212a6252-4a6e-4177-a08f-0c60c51016c3', 1, 30, true, '2a2d6c47-0879-4761-90c5-e36ce5dc6bc1', NULL);
INSERT INTO public.authentication_execution VALUES ('9a28ea05-babf-482c-9a63-52fd6225af43', NULL, 'conditional-user-configured', 'master', '2a2d6c47-0879-4761-90c5-e36ce5dc6bc1', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('91090f54-3f77-41ab-a997-535b8795c160', NULL, 'direct-grant-validate-otp', 'master', '2a2d6c47-0879-4761-90c5-e36ce5dc6bc1', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('aa60d7f8-3238-4867-a271-0d40e1cc8544', NULL, 'registration-page-form', 'master', '86d95d5f-cbce-4ac3-831e-c8283096c3df', 0, 10, true, 'bab4114f-77b8-4f52-b800-98c9b117192d', NULL);
INSERT INTO public.authentication_execution VALUES ('5ebf8abc-9fe4-47b0-9366-31af96fd84ee', NULL, 'registration-user-creation', 'master', 'bab4114f-77b8-4f52-b800-98c9b117192d', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e755a403-9d0f-4c40-9eec-39e4dfa49f5f', NULL, 'registration-profile-action', 'master', 'bab4114f-77b8-4f52-b800-98c9b117192d', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('63644659-c3ca-4847-a129-aca8ad7b1b06', NULL, 'registration-password-action', 'master', 'bab4114f-77b8-4f52-b800-98c9b117192d', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1bb6c658-e863-48ff-abc2-5d98ba914be0', NULL, 'registration-recaptcha-action', 'master', 'bab4114f-77b8-4f52-b800-98c9b117192d', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b125e3fd-cbb3-484a-9b8a-dad7953e21f1', NULL, 'reset-credentials-choose-user', 'master', '522f688b-1080-4f50-af94-047d65027c8a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4348c620-a0c6-466a-b33f-677d06e5ae16', NULL, 'reset-credential-email', 'master', '522f688b-1080-4f50-af94-047d65027c8a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('227db901-eec4-4a4e-822a-13b83f95d17c', NULL, 'reset-password', 'master', '522f688b-1080-4f50-af94-047d65027c8a', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4067060c-aee1-4916-a05b-5b03b5ff7f02', NULL, NULL, 'master', '522f688b-1080-4f50-af94-047d65027c8a', 1, 40, true, '20f2b1f5-9021-4625-b7a3-b8de724d0fe1', NULL);
INSERT INTO public.authentication_execution VALUES ('d16b6410-8c5f-453d-bc07-592fe935333f', NULL, 'conditional-user-configured', 'master', '20f2b1f5-9021-4625-b7a3-b8de724d0fe1', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('33653562-b91a-4ae8-bc78-33155c180c70', NULL, 'reset-otp', 'master', '20f2b1f5-9021-4625-b7a3-b8de724d0fe1', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('23cd2df4-75c9-4acf-aac5-983f67b62fa4', NULL, 'client-secret', 'master', '480f66b1-2255-4f45-9a31-f6a9383b597d', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ea0ab28a-2a0e-4f7e-a1cc-192f7ba1885d', NULL, 'client-jwt', 'master', '480f66b1-2255-4f45-9a31-f6a9383b597d', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bc75c44f-76a7-49e9-854c-4198d12fa17e', NULL, 'client-secret-jwt', 'master', '480f66b1-2255-4f45-9a31-f6a9383b597d', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e9b1185b-4b8e-4d30-88b7-f1fae0d51ed6', NULL, 'client-x509', 'master', '480f66b1-2255-4f45-9a31-f6a9383b597d', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('e5890a23-4df2-43c6-9139-de81fcaad733', NULL, 'idp-review-profile', 'master', '411e4d11-cf1a-4883-bcaf-578102a970d3', 0, 10, false, NULL, '24fb701c-0012-4b72-aede-f54a44984cb3');
INSERT INTO public.authentication_execution VALUES ('700f3bf4-7122-400d-8e3d-6aa46f17e348', NULL, NULL, 'master', '411e4d11-cf1a-4883-bcaf-578102a970d3', 0, 20, true, '0c5c7a34-bbca-4865-8383-87c544f4da38', NULL);
INSERT INTO public.authentication_execution VALUES ('dc030e09-7971-4cc6-a25e-ee3e313d76d3', NULL, 'idp-create-user-if-unique', 'master', '0c5c7a34-bbca-4865-8383-87c544f4da38', 2, 10, false, NULL, '3dec2a09-a867-4cd6-ada4-f101bceb4a32');
INSERT INTO public.authentication_execution VALUES ('f801ec13-478f-4245-a7de-fa4d46121174', NULL, NULL, 'master', '0c5c7a34-bbca-4865-8383-87c544f4da38', 2, 20, true, 'c4928458-4d2a-4dba-be9b-f382b6773f48', NULL);
INSERT INTO public.authentication_execution VALUES ('c1944054-fbf4-47cc-86c6-90c177c2c97c', NULL, 'idp-confirm-link', 'master', 'c4928458-4d2a-4dba-be9b-f382b6773f48', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('df678a70-e39a-4959-a922-708d3319326d', NULL, NULL, 'master', 'c4928458-4d2a-4dba-be9b-f382b6773f48', 0, 20, true, '5642563c-8a21-47ee-8b14-007517dd5d28', NULL);
INSERT INTO public.authentication_execution VALUES ('444f94ae-1c1a-4b61-8a7b-0a4c0b77615e', NULL, 'idp-email-verification', 'master', '5642563c-8a21-47ee-8b14-007517dd5d28', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4fe26f2d-bf8a-407a-8d53-b207d070b9fe', NULL, NULL, 'master', '5642563c-8a21-47ee-8b14-007517dd5d28', 2, 20, true, '9f3de248-d7f7-49e6-8078-a4bacbe7c4d9', NULL);
INSERT INTO public.authentication_execution VALUES ('5c176090-f948-4698-95ba-ebecb3b137a9', NULL, 'idp-username-password-form', 'master', '9f3de248-d7f7-49e6-8078-a4bacbe7c4d9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('dac2563c-aca3-4b0b-bf2f-1f8f2ece08f0', NULL, NULL, 'master', '9f3de248-d7f7-49e6-8078-a4bacbe7c4d9', 1, 20, true, 'c4426214-2752-41eb-98a1-1930186e4896', NULL);
INSERT INTO public.authentication_execution VALUES ('de19f027-e639-4db6-83e2-34f1e100b045', NULL, 'conditional-user-configured', 'master', 'c4426214-2752-41eb-98a1-1930186e4896', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b328dc43-52f8-48ee-8ef4-ee92727f204e', NULL, 'auth-otp-form', 'master', 'c4426214-2752-41eb-98a1-1930186e4896', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('1d2f14ac-8e62-4f2e-9add-982ef7a3c672', NULL, 'http-basic-authenticator', 'master', 'c63937b9-959c-4e86-875d-2348425cdf7e', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ea8e57d5-36fd-4f43-ae54-c647f346be22', NULL, 'docker-http-basic-authenticator', 'master', 'e6f0b445-efb2-4347-b555-a349f44e7bef', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('49a0d3bf-9d5d-4c0d-9dec-3f612fa2642a', NULL, 'no-cookie-redirect', 'master', 'adc12644-e06d-499f-85c9-df4d0f829128', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7b0f5af2-dca7-446b-970a-9fd2e9539298', NULL, NULL, 'master', 'adc12644-e06d-499f-85c9-df4d0f829128', 0, 20, true, 'c7e314b6-7c8d-4233-a3fe-4a85b6377e10', NULL);
INSERT INTO public.authentication_execution VALUES ('e9a5fcc7-511b-46e2-abf6-803387d017ca', NULL, 'basic-auth', 'master', 'c7e314b6-7c8d-4233-a3fe-4a85b6377e10', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8e841839-ea0a-4e64-a41e-34847dd5f81e', NULL, 'basic-auth-otp', 'master', 'c7e314b6-7c8d-4233-a3fe-4a85b6377e10', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b23f2da3-7bf6-4ab5-a3d6-2ad3b7a4c6df', NULL, 'auth-spnego', 'master', 'c7e314b6-7c8d-4233-a3fe-4a85b6377e10', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d38c159d-b638-40f4-9de1-cc55a1b3d355', NULL, 'auth-cookie', 'simplywall', '5b87f440-6495-4c40-b2f4-bf05bfabff75', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('4fb6d7b2-bc92-4ab9-995d-5dcb22b25488', NULL, 'auth-spnego', 'simplywall', '5b87f440-6495-4c40-b2f4-bf05bfabff75', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('28c08281-b416-4977-9c37-de9dedb28666', NULL, 'identity-provider-redirector', 'simplywall', '5b87f440-6495-4c40-b2f4-bf05bfabff75', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5598e7bb-3086-484d-a65a-b3006d5f0f79', NULL, NULL, 'simplywall', '5b87f440-6495-4c40-b2f4-bf05bfabff75', 2, 30, true, '2b223787-248a-4431-8afd-4c150e87a692', NULL);
INSERT INTO public.authentication_execution VALUES ('ed4e8a85-1dc3-4993-9aa7-6a9130d22e56', NULL, 'auth-username-password-form', 'simplywall', '2b223787-248a-4431-8afd-4c150e87a692', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('cc8a3833-49c8-4588-bc8f-5b31d6553d28', NULL, NULL, 'simplywall', '2b223787-248a-4431-8afd-4c150e87a692', 1, 20, true, 'ce0117f7-d64b-44ce-a952-9cfbd99cc689', NULL);
INSERT INTO public.authentication_execution VALUES ('e36bfc68-fe59-4c82-9380-335cee449909', NULL, 'conditional-user-configured', 'simplywall', 'ce0117f7-d64b-44ce-a952-9cfbd99cc689', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('20b161c0-9173-4146-a1d7-f74146604bed', NULL, 'auth-otp-form', 'simplywall', 'ce0117f7-d64b-44ce-a952-9cfbd99cc689', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5f31691d-3ed0-4fd8-8cf2-301ce47144dc', NULL, 'direct-grant-validate-username', 'simplywall', '18e396c1-7c2f-40cb-94ed-0e84a6907520', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6250bde1-a3a1-4c42-857e-dca41d796fd4', NULL, 'direct-grant-validate-password', 'simplywall', '18e396c1-7c2f-40cb-94ed-0e84a6907520', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6d509697-02c0-4281-bdec-7ac0aa52ac2d', NULL, NULL, 'simplywall', '18e396c1-7c2f-40cb-94ed-0e84a6907520', 1, 30, true, '6e70ac74-d760-4218-842f-e40e55789204', NULL);
INSERT INTO public.authentication_execution VALUES ('c90cbabc-8b05-4c26-bd25-288c41402ae6', NULL, 'conditional-user-configured', 'simplywall', '6e70ac74-d760-4218-842f-e40e55789204', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('dee2a97f-68ca-46d7-9699-5f8617e21243', NULL, 'direct-grant-validate-otp', 'simplywall', '6e70ac74-d760-4218-842f-e40e55789204', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('d3452c4e-9547-47e3-88fe-b02f367187c9', NULL, 'registration-page-form', 'simplywall', '0cb8789c-5cc3-4386-8290-a309e51abd15', 0, 10, true, '4a9fa846-5700-4e2d-b5a2-0712a1079fb9', NULL);
INSERT INTO public.authentication_execution VALUES ('117ad971-6491-43ae-8e7b-8c4595b33f23', NULL, 'registration-user-creation', 'simplywall', '4a9fa846-5700-4e2d-b5a2-0712a1079fb9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('45848b44-064a-4475-95ac-c46a848b7d6c', NULL, 'registration-profile-action', 'simplywall', '4a9fa846-5700-4e2d-b5a2-0712a1079fb9', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('b5bda92b-f9d2-4991-abee-0989593f439f', NULL, 'registration-password-action', 'simplywall', '4a9fa846-5700-4e2d-b5a2-0712a1079fb9', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('23c2d4d8-1b96-401d-8673-bf232f5693e4', NULL, 'registration-recaptcha-action', 'simplywall', '4a9fa846-5700-4e2d-b5a2-0712a1079fb9', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c32bd3fd-53ab-4344-adbd-abc867841726', NULL, 'reset-credentials-choose-user', 'simplywall', 'e8ac0d9b-acd3-4f2a-871b-7daace54f981', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('434b09b9-5346-43fd-9870-274d3cd6aa3a', NULL, 'reset-credential-email', 'simplywall', 'e8ac0d9b-acd3-4f2a-871b-7daace54f981', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('6b79ce5a-f1e6-48d2-9d66-1e18e31e1213', NULL, 'reset-password', 'simplywall', 'e8ac0d9b-acd3-4f2a-871b-7daace54f981', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f0e382c3-c32a-4ad8-a2a5-790dc05e30e3', NULL, NULL, 'simplywall', 'e8ac0d9b-acd3-4f2a-871b-7daace54f981', 1, 40, true, 'f7de2b17-6879-42cf-8632-f9f4d80b11b5', NULL);
INSERT INTO public.authentication_execution VALUES ('1c93cb3f-875f-4bec-be4a-c0d792fef725', NULL, 'conditional-user-configured', 'simplywall', 'f7de2b17-6879-42cf-8632-f9f4d80b11b5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('37939228-9957-4fdf-9bf9-023d1156d1df', NULL, 'reset-otp', 'simplywall', 'f7de2b17-6879-42cf-8632-f9f4d80b11b5', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('f9f999d0-c34d-4067-9882-0eee47ec631f', NULL, 'client-secret', 'simplywall', '730e5c67-426b-4329-801c-8c00171761c3', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('fe1e330b-7d28-42fc-9bd1-c11bc26fc30d', NULL, 'client-jwt', 'simplywall', '730e5c67-426b-4329-801c-8c00171761c3', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('8d55b273-ea25-4348-9b05-715f6ff0c7a3', NULL, 'client-secret-jwt', 'simplywall', '730e5c67-426b-4329-801c-8c00171761c3', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('c7d4759d-0bb0-476f-8788-0fe32ca16c4a', NULL, 'client-x509', 'simplywall', '730e5c67-426b-4329-801c-8c00171761c3', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('a05e5bd1-aa01-4b77-997b-28e36fb5d8b4', NULL, 'idp-review-profile', 'simplywall', 'e0d8efb9-6491-4266-a5b1-92882d397aa0', 0, 10, false, NULL, '58ba57c2-7c6d-43a7-bea3-60f78039798f');
INSERT INTO public.authentication_execution VALUES ('cc78ec1b-3001-42af-a6e8-93b730f0d61d', NULL, NULL, 'simplywall', 'e0d8efb9-6491-4266-a5b1-92882d397aa0', 0, 20, true, '3f01d0d5-0317-40bf-9efa-0edd7f72814c', NULL);
INSERT INTO public.authentication_execution VALUES ('60a755ec-589e-4fd9-8f64-24c530c8cc5f', NULL, 'idp-create-user-if-unique', 'simplywall', '3f01d0d5-0317-40bf-9efa-0edd7f72814c', 2, 10, false, NULL, '64ac93f1-3a8f-46de-a048-f6993dbf374a');
INSERT INTO public.authentication_execution VALUES ('e1bf4cb9-3664-4b67-b8ca-a5f6c859262a', NULL, NULL, 'simplywall', '3f01d0d5-0317-40bf-9efa-0edd7f72814c', 2, 20, true, 'e4bef59d-2344-441a-96d1-d1f4ade61a28', NULL);
INSERT INTO public.authentication_execution VALUES ('6f876245-f2b5-487e-b4ae-b53187d19a24', NULL, 'idp-confirm-link', 'simplywall', 'e4bef59d-2344-441a-96d1-d1f4ade61a28', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('45e4ee2b-480f-4fd7-988c-ab45c9d1beb6', NULL, NULL, 'simplywall', 'e4bef59d-2344-441a-96d1-d1f4ade61a28', 0, 20, true, '14508449-68ae-41dd-88de-d67c7637846b', NULL);
INSERT INTO public.authentication_execution VALUES ('a53d8e9f-9145-4b03-a56c-4b87eccc62b3', NULL, 'idp-email-verification', 'simplywall', '14508449-68ae-41dd-88de-d67c7637846b', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('7157b92c-b6ca-464e-90a9-78e34ed2bb69', NULL, NULL, 'simplywall', '14508449-68ae-41dd-88de-d67c7637846b', 2, 20, true, 'da673a3a-aa76-4e75-b170-c9fe85d0ee86', NULL);
INSERT INTO public.authentication_execution VALUES ('99ff79e1-f870-451e-ade4-7e9766565f7c', NULL, 'idp-username-password-form', 'simplywall', 'da673a3a-aa76-4e75-b170-c9fe85d0ee86', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('35a015ed-3bd7-4e1d-9296-f3412c800036', NULL, NULL, 'simplywall', 'da673a3a-aa76-4e75-b170-c9fe85d0ee86', 1, 20, true, '213da54b-67d1-461c-8538-da83e6e8cfc3', NULL);
INSERT INTO public.authentication_execution VALUES ('46a015ea-6e95-494e-9067-d476bf55a3ee', NULL, 'conditional-user-configured', 'simplywall', '213da54b-67d1-461c-8538-da83e6e8cfc3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('bc06686d-c9a9-4797-9fc5-da4335267485', NULL, 'auth-otp-form', 'simplywall', '213da54b-67d1-461c-8538-da83e6e8cfc3', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('5ad24b45-6081-4140-8f6c-118fc05d546f', NULL, 'http-basic-authenticator', 'simplywall', 'cb6ccbbe-2408-4956-bf05-c469780aec38', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('31e2d222-f641-4561-b14d-8bd80592e911', NULL, 'docker-http-basic-authenticator', 'simplywall', '14ab1a5b-3fe4-44f3-919b-e4cd71707536', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('138f3ab3-77f5-47ca-b00f-5feccc56cf4a', NULL, 'no-cookie-redirect', 'simplywall', '5dc69f83-b1d4-4e76-b5b6-5faca0f157b9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('9a6d495b-7baf-4be7-a932-54b7898e3e5f', NULL, NULL, 'simplywall', '5dc69f83-b1d4-4e76-b5b6-5faca0f157b9', 0, 20, true, '6217761a-70c7-416a-8cb9-abacfd4b1332', NULL);
INSERT INTO public.authentication_execution VALUES ('39b16d21-a38e-4a30-984a-eaf4aed8b89b', NULL, 'basic-auth', 'simplywall', '6217761a-70c7-416a-8cb9-abacfd4b1332', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('ed2c1a82-ab55-4883-b347-b501006af404', NULL, 'basic-auth-otp', 'simplywall', '6217761a-70c7-416a-8cb9-abacfd4b1332', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution VALUES ('113387b1-6fd5-4110-ae52-d872fe73153c', NULL, 'auth-spnego', 'simplywall', '6217761a-70c7-416a-8cb9-abacfd4b1332', 3, 30, false, NULL, NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.authentication_flow VALUES ('e1805c4a-36e5-4f22-b511-bbde0f1b8fd0', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('0e596e22-c073-486e-b4f3-37a5c2567bbf', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('95323bc9-d24a-4a72-91dc-9e0c31e15581', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('212a6252-4a6e-4177-a08f-0c60c51016c3', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('2a2d6c47-0879-4761-90c5-e36ce5dc6bc1', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('86d95d5f-cbce-4ac3-831e-c8283096c3df', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('bab4114f-77b8-4f52-b800-98c9b117192d', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('522f688b-1080-4f50-af94-047d65027c8a', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('20f2b1f5-9021-4625-b7a3-b8de724d0fe1', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('480f66b1-2255-4f45-9a31-f6a9383b597d', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('411e4d11-cf1a-4883-bcaf-578102a970d3', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('0c5c7a34-bbca-4865-8383-87c544f4da38', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('c4928458-4d2a-4dba-be9b-f382b6773f48', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5642563c-8a21-47ee-8b14-007517dd5d28', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('9f3de248-d7f7-49e6-8078-a4bacbe7c4d9', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('c4426214-2752-41eb-98a1-1930186e4896', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('c63937b9-959c-4e86-875d-2348425cdf7e', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('e6f0b445-efb2-4347-b555-a349f44e7bef', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('adc12644-e06d-499f-85c9-df4d0f829128', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('c7e314b6-7c8d-4233-a3fe-4a85b6377e10', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('5b87f440-6495-4c40-b2f4-bf05bfabff75', 'browser', 'browser based authentication', 'simplywall', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('2b223787-248a-4431-8afd-4c150e87a692', 'forms', 'Username, password, otp and other auth forms.', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('ce0117f7-d64b-44ce-a952-9cfbd99cc689', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('18e396c1-7c2f-40cb-94ed-0e84a6907520', 'direct grant', 'OpenID Connect Resource Owner Grant', 'simplywall', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('6e70ac74-d760-4218-842f-e40e55789204', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('0cb8789c-5cc3-4386-8290-a309e51abd15', 'registration', 'registration flow', 'simplywall', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('4a9fa846-5700-4e2d-b5a2-0712a1079fb9', 'registration form', 'registration form', 'simplywall', 'form-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('e8ac0d9b-acd3-4f2a-871b-7daace54f981', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'simplywall', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('f7de2b17-6879-42cf-8632-f9f4d80b11b5', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('730e5c67-426b-4329-801c-8c00171761c3', 'clients', 'Base authentication for clients', 'simplywall', 'client-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('e0d8efb9-6491-4266-a5b1-92882d397aa0', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'simplywall', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('3f01d0d5-0317-40bf-9efa-0edd7f72814c', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('e4bef59d-2344-441a-96d1-d1f4ade61a28', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('14508449-68ae-41dd-88de-d67c7637846b', 'Account verification options', 'Method with which to verity the existing account', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('da673a3a-aa76-4e75-b170-c9fe85d0ee86', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('213da54b-67d1-461c-8538-da83e6e8cfc3', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'simplywall', 'basic-flow', false, true);
INSERT INTO public.authentication_flow VALUES ('cb6ccbbe-2408-4956-bf05-c469780aec38', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'simplywall', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('14ab1a5b-3fe4-44f3-919b-e4cd71707536', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'simplywall', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('5dc69f83-b1d4-4e76-b5b6-5faca0f157b9', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'simplywall', 'basic-flow', true, true);
INSERT INTO public.authentication_flow VALUES ('6217761a-70c7-416a-8cb9-abacfd4b1332', 'Authentication Options', 'Authentication options.', 'simplywall', 'basic-flow', false, true);


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.authenticator_config VALUES ('24fb701c-0012-4b72-aede-f54a44984cb3', 'review profile config', 'master');
INSERT INTO public.authenticator_config VALUES ('3dec2a09-a867-4cd6-ada4-f101bceb4a32', 'create unique user config', 'master');
INSERT INTO public.authenticator_config VALUES ('58ba57c2-7c6d-43a7-bea3-60f78039798f', 'review profile config', 'simplywall');
INSERT INTO public.authenticator_config VALUES ('64ac93f1-3a8f-46de-a048-f6993dbf374a', 'create unique user config', 'simplywall');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.authenticator_config_entry VALUES ('24fb701c-0012-4b72-aede-f54a44984cb3', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('3dec2a09-a867-4cd6-ada4-f101bceb4a32', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry VALUES ('58ba57c2-7c6d-43a7-bea3-60f78039798f', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry VALUES ('64ac93f1-3a8f-46de-a048-f6993dbf374a', 'false', 'require.password.update.after.registration');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, true, 'master-realm', 0, false, '0dbd2d47-8d1c-497d-92f9-7618524a4557', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', true, false, 'account', 0, false, '3a855f65-4874-444c-8b2e-946cb9d04a9c', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', true, false, 'account-console', 0, true, 'fdcb9b04-a4f1-43c9-a47d-a170a115fb88', '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', true, false, 'broker', 0, false, '29be09f5-0e71-4ae0-a6c8-821a5db3d99f', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('62064bd3-182d-4043-b272-2984019094a6', true, false, 'security-admin-console', 0, true, '0b4b69f9-fec9-44cc-bf3b-b27678424dc4', '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', true, false, 'admin-cli', 0, true, 'fc8ff40d-7d5a-4ac2-a459-0392114642fa', NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, true, 'simplywall-realm', 0, false, '6c9e9ecc-88e3-4638-9ec6-e5506d8af689', NULL, true, NULL, false, 'master', NULL, 0, false, false, 'simplywall Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', true, false, 'realm-management', 0, false, '6d90553c-e907-40a2-b488-a67a104fa375', NULL, true, NULL, false, 'simplywall', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', true, false, 'account', 0, false, '8f0e4855-0007-49db-b3a9-e369750cb4f9', '/realms/simplywall/account/', false, NULL, false, 'simplywall', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', true, false, 'account-console', 0, true, 'bbf806a6-a2f0-4fe6-9462-593197ce5119', '/realms/simplywall/account/', false, NULL, false, 'simplywall', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', true, false, 'broker', 0, false, '8e2d0c16-e91e-4f2e-9b3c-02fe08533fa4', NULL, false, NULL, false, 'simplywall', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', true, false, 'security-admin-console', 0, true, '4fa766c3-926e-4edd-9ae9-22e94fb81439', '/admin/simplywall/console/', false, NULL, false, 'simplywall', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', true, false, 'admin-cli', 0, true, '76ab5f13-f192-49a5-b687-32223a67dc4e', NULL, false, NULL, false, 'simplywall', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', true, true, 'simplywall-service', 0, false, 'a5a51b54-4990-4efc-b6d2-fecbdd7d6a88', NULL, false, NULL, false, 'simplywall', 'openid-connect', -1, false, false, NULL, true, 'client-secret', NULL, NULL, NULL, false, false, false, false);
INSERT INTO public.client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', true, true, 'simplywall-ui', 0, true, 'ca94c4c8-1140-41f0-bec4-fe9982c08738', NULL, false, NULL, false, 'simplywall', 'openid-connect', -1, false, false, NULL, false, 'client-secret', NULL, NULL, NULL, true, false, true, false);


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.client_attributes VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('62064bd3-182d-4043-b272-2984019094a6', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('7398983c-678e-4702-aada-4803e6effb4b', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'false', 'display.on.consent.screen');


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.client_default_roles VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', 'd1eae49e-e614-45c2-82f0-0cfb27170d5b');
INSERT INTO public.client_default_roles VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', 'b562a42b-9322-4743-a5bc-6c6b0f870e12');
INSERT INTO public.client_default_roles VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '62bd377e-f697-4d2e-bf11-89a39cbf62f7');
INSERT INTO public.client_default_roles VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '4122f892-75f6-46ff-b96c-efd1d68ab02b');


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.client_scope VALUES ('653a3501-b85f-49ba-9d85-16674029439c', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('27c8d369-1d3a-4d64-9012-ba424402bd3b', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('1904788e-cfba-43e2-bf5d-766c815f8e1f', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('72962555-d177-47ff-9759-6f8ed875ffa9', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('bce4d45a-9f33-4a3d-97eb-979a1067e2a6', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('4a85beb5-8ee0-4085-9120-9341161ebd5e', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('94dfdcea-f8df-42b4-9a4e-3839e0470ec7', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('d9a50cea-c9e0-4108-b897-980e5b76cfbb', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6b276cd7-79c2-46d3-b3cc-56c52ec89743', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope VALUES ('2984d1ec-d1c2-41ba-b1b8-329e15511d8f', 'offline_access', 'simplywall', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope VALUES ('2f243448-7916-412b-87cd-dee43bc4d32d', 'role_list', 'simplywall', 'SAML role list', 'saml');
INSERT INTO public.client_scope VALUES ('1811c2f0-575c-402c-9eb8-0c33ef691710', 'profile', 'simplywall', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope VALUES ('15f5532d-92e0-48b7-822a-e5a7171f5263', 'email', 'simplywall', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope VALUES ('6638d6aa-5778-4e00-86df-98fb7b3a3a61', 'address', 'simplywall', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope VALUES ('e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', 'phone', 'simplywall', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope VALUES ('fbed4e2d-16e4-4238-8d95-f8679fe2d284', 'roles', 'simplywall', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('39ddf344-5308-4471-a494-3caaf0116495', 'web-origins', 'simplywall', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope VALUES ('f3f721f6-caf3-4f13-a2db-73f03fc0eb72', 'microprofile-jwt', 'simplywall', 'Microprofile - JWT built-in scope', 'openid-connect');


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.client_scope_attributes VALUES ('653a3501-b85f-49ba-9d85-16674029439c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('653a3501-b85f-49ba-9d85-16674029439c', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('27c8d369-1d3a-4d64-9012-ba424402bd3b', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('27c8d369-1d3a-4d64-9012-ba424402bd3b', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('1904788e-cfba-43e2-bf5d-766c815f8e1f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('1904788e-cfba-43e2-bf5d-766c815f8e1f', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('1904788e-cfba-43e2-bf5d-766c815f8e1f', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('72962555-d177-47ff-9759-6f8ed875ffa9', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('72962555-d177-47ff-9759-6f8ed875ffa9', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('72962555-d177-47ff-9759-6f8ed875ffa9', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('bce4d45a-9f33-4a3d-97eb-979a1067e2a6', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('bce4d45a-9f33-4a3d-97eb-979a1067e2a6', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('bce4d45a-9f33-4a3d-97eb-979a1067e2a6', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('4a85beb5-8ee0-4085-9120-9341161ebd5e', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('4a85beb5-8ee0-4085-9120-9341161ebd5e', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('4a85beb5-8ee0-4085-9120-9341161ebd5e', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('94dfdcea-f8df-42b4-9a4e-3839e0470ec7', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('94dfdcea-f8df-42b4-9a4e-3839e0470ec7', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('94dfdcea-f8df-42b4-9a4e-3839e0470ec7', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('d9a50cea-c9e0-4108-b897-980e5b76cfbb', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('d9a50cea-c9e0-4108-b897-980e5b76cfbb', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('d9a50cea-c9e0-4108-b897-980e5b76cfbb', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('6b276cd7-79c2-46d3-b3cc-56c52ec89743', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6b276cd7-79c2-46d3-b3cc-56c52ec89743', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('2984d1ec-d1c2-41ba-b1b8-329e15511d8f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('2984d1ec-d1c2-41ba-b1b8-329e15511d8f', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('2f243448-7916-412b-87cd-dee43bc4d32d', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('2f243448-7916-412b-87cd-dee43bc4d32d', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('1811c2f0-575c-402c-9eb8-0c33ef691710', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('1811c2f0-575c-402c-9eb8-0c33ef691710', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('1811c2f0-575c-402c-9eb8-0c33ef691710', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('15f5532d-92e0-48b7-822a-e5a7171f5263', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('15f5532d-92e0-48b7-822a-e5a7171f5263', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('15f5532d-92e0-48b7-822a-e5a7171f5263', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('6638d6aa-5778-4e00-86df-98fb7b3a3a61', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('6638d6aa-5778-4e00-86df-98fb7b3a3a61', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('6638d6aa-5778-4e00-86df-98fb7b3a3a61', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('fbed4e2d-16e4-4238-8d95-f8679fe2d284', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('fbed4e2d-16e4-4238-8d95-f8679fe2d284', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('fbed4e2d-16e4-4238-8d95-f8679fe2d284', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('39ddf344-5308-4471-a494-3caaf0116495', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('39ddf344-5308-4471-a494-3caaf0116495', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes VALUES ('39ddf344-5308-4471-a494-3caaf0116495', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes VALUES ('f3f721f6-caf3-4f13-a2db-73f03fc0eb72', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes VALUES ('f3f721f6-caf3-4f13-a2db-73f03fc0eb72', 'true', 'include.in.token.scope');


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', '27c8d369-1d3a-4d64-9012-ba424402bd3b', true);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', '27c8d369-1d3a-4d64-9012-ba424402bd3b', true);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', '27c8d369-1d3a-4d64-9012-ba424402bd3b', true);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', '27c8d369-1d3a-4d64-9012-ba424402bd3b', true);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', '27c8d369-1d3a-4d64-9012-ba424402bd3b', true);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', '27c8d369-1d3a-4d64-9012-ba424402bd3b', true);
INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', '72962555-d177-47ff-9759-6f8ed875ffa9', true);
INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', '94dfdcea-f8df-42b4-9a4e-3839e0470ec7', true);
INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', '1904788e-cfba-43e2-bf5d-766c815f8e1f', true);
INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', 'd9a50cea-c9e0-4108-b897-980e5b76cfbb', true);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', '72962555-d177-47ff-9759-6f8ed875ffa9', true);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', '94dfdcea-f8df-42b4-9a4e-3839e0470ec7', true);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', '1904788e-cfba-43e2-bf5d-766c815f8e1f', true);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', 'd9a50cea-c9e0-4108-b897-980e5b76cfbb', true);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', '72962555-d177-47ff-9759-6f8ed875ffa9', true);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', '94dfdcea-f8df-42b4-9a4e-3839e0470ec7', true);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', '1904788e-cfba-43e2-bf5d-766c815f8e1f', true);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', 'd9a50cea-c9e0-4108-b897-980e5b76cfbb', true);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', '72962555-d177-47ff-9759-6f8ed875ffa9', true);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', '94dfdcea-f8df-42b4-9a4e-3839e0470ec7', true);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', '1904788e-cfba-43e2-bf5d-766c815f8e1f', true);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', 'd9a50cea-c9e0-4108-b897-980e5b76cfbb', true);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', '72962555-d177-47ff-9759-6f8ed875ffa9', true);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', '94dfdcea-f8df-42b4-9a4e-3839e0470ec7', true);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', '1904788e-cfba-43e2-bf5d-766c815f8e1f', true);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', 'd9a50cea-c9e0-4108-b897-980e5b76cfbb', true);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', '72962555-d177-47ff-9759-6f8ed875ffa9', true);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', '94dfdcea-f8df-42b4-9a4e-3839e0470ec7', true);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', '1904788e-cfba-43e2-bf5d-766c815f8e1f', true);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', 'd9a50cea-c9e0-4108-b897-980e5b76cfbb', true);
INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', '6b276cd7-79c2-46d3-b3cc-56c52ec89743', false);
INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', '4a85beb5-8ee0-4085-9120-9341161ebd5e', false);
INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', '653a3501-b85f-49ba-9d85-16674029439c', false);
INSERT INTO public.client_scope_client VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6', false);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', '6b276cd7-79c2-46d3-b3cc-56c52ec89743', false);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', '4a85beb5-8ee0-4085-9120-9341161ebd5e', false);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', '653a3501-b85f-49ba-9d85-16674029439c', false);
INSERT INTO public.client_scope_client VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6', false);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', '6b276cd7-79c2-46d3-b3cc-56c52ec89743', false);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', '4a85beb5-8ee0-4085-9120-9341161ebd5e', false);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', '653a3501-b85f-49ba-9d85-16674029439c', false);
INSERT INTO public.client_scope_client VALUES ('b5fc66ed-d564-4227-b2a5-6fd8a5dfd08c', 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6', false);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', '6b276cd7-79c2-46d3-b3cc-56c52ec89743', false);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', '4a85beb5-8ee0-4085-9120-9341161ebd5e', false);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', '653a3501-b85f-49ba-9d85-16674029439c', false);
INSERT INTO public.client_scope_client VALUES ('5fa5154a-fc3b-4ac8-b798-1c486746d8e5', 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6', false);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', '6b276cd7-79c2-46d3-b3cc-56c52ec89743', false);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', '4a85beb5-8ee0-4085-9120-9341161ebd5e', false);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', '653a3501-b85f-49ba-9d85-16674029439c', false);
INSERT INTO public.client_scope_client VALUES ('8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6', false);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', '6b276cd7-79c2-46d3-b3cc-56c52ec89743', false);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', '4a85beb5-8ee0-4085-9120-9341161ebd5e', false);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', '653a3501-b85f-49ba-9d85-16674029439c', false);
INSERT INTO public.client_scope_client VALUES ('62064bd3-182d-4043-b272-2984019094a6', 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6', false);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', '27c8d369-1d3a-4d64-9012-ba424402bd3b', true);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', '72962555-d177-47ff-9759-6f8ed875ffa9', true);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', '94dfdcea-f8df-42b4-9a4e-3839e0470ec7', true);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', '1904788e-cfba-43e2-bf5d-766c815f8e1f', true);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', 'd9a50cea-c9e0-4108-b897-980e5b76cfbb', true);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', '6b276cd7-79c2-46d3-b3cc-56c52ec89743', false);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', '4a85beb5-8ee0-4085-9120-9341161ebd5e', false);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', '653a3501-b85f-49ba-9d85-16674029439c', false);
INSERT INTO public.client_scope_client VALUES ('1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6', false);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);
INSERT INTO public.client_scope_client VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);
INSERT INTO public.client_scope_client VALUES ('7398983c-678e-4702-aada-4803e6effb4b', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);
INSERT INTO public.client_scope_client VALUES ('a069346f-797c-40be-b110-e559e6e6a8fc', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);
INSERT INTO public.client_scope_client VALUES ('79a0248e-5463-455a-aa06-f11dbfa6d5fa', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);
INSERT INTO public.client_scope_client VALUES ('f06ff598-8ef3-4690-9732-183d7aea29d9', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);
INSERT INTO public.client_scope_client VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);
INSERT INTO public.client_scope_client VALUES ('b16c509f-5b3e-4716-886a-038d49143d2e', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);
INSERT INTO public.client_scope_client VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.client_scope_role_mapping VALUES ('653a3501-b85f-49ba-9d85-16674029439c', '56c0c9b8-ce63-42be-a816-10965f38f607');
INSERT INTO public.client_scope_role_mapping VALUES ('2984d1ec-d1c2-41ba-b1b8-329e15511d8f', '9acc730a-dc8a-415c-991c-3c3a8e90b2b6');


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.component VALUES ('453a33fd-304c-461e-9287-25d251740faf', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('0cd764e7-5a25-4308-acf6-0435d335dc6a', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('130163af-43ec-43ea-bcfd-a129756939bc', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('e4423eb1-e1bf-4690-9673-1ca5ac13e6be', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('f0faeab7-7149-41e5-a62a-984371a7cb93', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component VALUES ('3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('590e97ca-e7a0-4f3a-a199-a910e79ab249', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component VALUES ('4f572ed8-2680-42d6-bbe6-cb5a662dc1e8', 'fallback-HS256', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('36af9175-ec56-4fe7-92e3-48dd0d16012c', 'fallback-RS256', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component VALUES ('22902ae8-5351-4a63-b421-64f3b00416a5', 'rsa-generated', 'simplywall', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'simplywall', NULL);
INSERT INTO public.component VALUES ('7b878c00-85a6-4751-8cf3-a3ace0864847', 'hmac-generated', 'simplywall', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'simplywall', NULL);
INSERT INTO public.component VALUES ('af00ccda-721c-44a4-96c2-03f8fc23e5a4', 'aes-generated', 'simplywall', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'simplywall', NULL);
INSERT INTO public.component VALUES ('e68d6067-109c-4556-bd24-4858fdde87c0', 'Trusted Hosts', 'simplywall', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'simplywall', 'anonymous');
INSERT INTO public.component VALUES ('0943ce3f-9267-417c-aa65-d82cc89e4478', 'Consent Required', 'simplywall', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'simplywall', 'anonymous');
INSERT INTO public.component VALUES ('7205c58b-779e-4d8f-8f4e-9086ad6c5a78', 'Full Scope Disabled', 'simplywall', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'simplywall', 'anonymous');
INSERT INTO public.component VALUES ('4623a999-9642-4ba0-9aed-79c7e83acf9f', 'Max Clients Limit', 'simplywall', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'simplywall', 'anonymous');
INSERT INTO public.component VALUES ('488a6345-632f-49c6-9eab-9d27c5e446fd', 'Allowed Protocol Mapper Types', 'simplywall', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'simplywall', 'anonymous');
INSERT INTO public.component VALUES ('744245a1-1e8a-4666-8c53-e02563f69575', 'Allowed Client Scopes', 'simplywall', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'simplywall', 'anonymous');
INSERT INTO public.component VALUES ('f25e8f9e-4d36-4a86-94c3-91afe5870223', 'Allowed Protocol Mapper Types', 'simplywall', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'simplywall', 'authenticated');
INSERT INTO public.component VALUES ('d467a50f-b6b9-4dbc-a088-6089ee70cbb1', 'Allowed Client Scopes', 'simplywall', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'simplywall', 'authenticated');


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.component_config VALUES ('9ad8c6ef-d26c-4ce8-86fe-65ed9b6c70f2', '453a33fd-304c-461e-9287-25d251740faf', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('212921ad-e160-4c19-a63f-8a2acb90a2bf', '453a33fd-304c-461e-9287-25d251740faf', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('21be9109-1494-4c25-9ca1-9dec7fc97131', '3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('ce6bcd48-26f2-4d47-8fe5-49c64fcba7bd', '3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('ee6587ae-ff5b-4763-9064-a328b5e7ba13', '3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('ac8622a5-2d6a-4671-8c92-1b78fbdd5ae5', '3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('ecefd712-6d72-4617-948d-a544600674a0', '3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('a2346e45-b360-4d17-899d-fe63bce114b3', '3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('8f4e09eb-607f-4158-80e2-323567d979b0', '3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('bd4de1af-2447-4cce-a3bc-96b4cd07e505', '3d9d7170-9fe6-4ef3-b3ea-b39ca71da5cb', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('e3936475-46bf-4890-8505-52710c2cf4bb', '1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('12b1e413-4787-4798-8ea4-f06a5b789a64', '1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('4b0dc2e1-0bf0-4e97-a53b-e6c187411cbc', '1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('2bebd14f-d809-4e83-8a0d-8603adf83553', '1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('4763f03e-b3b3-4200-b609-8dc98f1a52fa', '1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('abfeb7b2-2a07-4748-b253-a50ed4e918b9', '1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('2663c6e4-d74e-4e18-97e7-b27e59ef5d9a', '1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('f81099ee-8f47-4170-a285-636995bcdcd0', '1c4ab098-1c09-43d1-9051-d1ecb8757b22', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('4c30d51b-653b-40f5-a244-3fdb393dccc8', 'f0faeab7-7149-41e5-a62a-984371a7cb93', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('3c879f4b-aff4-42de-b1d0-3c16336c91d8', 'e4423eb1-e1bf-4690-9673-1ca5ac13e6be', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('8c75b2c7-521f-4f79-80de-8861d75d9646', '590e97ca-e7a0-4f3a-a199-a910e79ab249', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('889184cf-d37e-44d5-bb3f-caf76d20aa75', '4f572ed8-2680-42d6-bbe6-cb5a662dc1e8', 'secret', 'lgcc-Kl1BUt3Yhs6Nzz-aOOahm7GzEtg9ST5fjaN5CUEx7euUHYFcMQtuVO7V8fdzxf2mJoYV2wHccQNJkQWGQ');
INSERT INTO public.component_config VALUES ('a080c767-e77e-42f1-899a-7b199788d8c2', '4f572ed8-2680-42d6-bbe6-cb5a662dc1e8', 'kid', '6416a33b-bacd-4ced-b69c-5d2aa201dd77');
INSERT INTO public.component_config VALUES ('c126757c-4cf1-4f4e-a448-fc39a99c613c', '4f572ed8-2680-42d6-bbe6-cb5a662dc1e8', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('d010ab22-1444-4623-a9f4-3d0b26adb935', '4f572ed8-2680-42d6-bbe6-cb5a662dc1e8', 'priority', '-100');
INSERT INTO public.component_config VALUES ('608ddf2f-0fd3-42e3-8c8f-b88812ac6cf4', '36af9175-ec56-4fe7-92e3-48dd0d16012c', 'algorithm', 'RS256');
INSERT INTO public.component_config VALUES ('cb045ccd-5f0e-49ff-b8fd-26e023b23f46', '36af9175-ec56-4fe7-92e3-48dd0d16012c', 'certificate', 'MIICmzCCAYMCBgF1nBdxZDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAxMTA2MDU0NDQzWhcNMzAxMTA2MDU0NjIzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDShg2snqNH9+TU/sOiKbA3ux7uQOJrAL5jZEa+um+eHs+Fe3wkPkvQcktd338Oev8cvfWtuQ5AYlZ8gs4CujW1E6LCKTXURt3f2drsDlr/qt2EsXS3dZmIGqqTGS+eTjAcZAaxCpIuxKbXZn5RHgwGxzcqX1wMYCmvekKbklIfxliYIzxmkCTqObEquaCiXVHf9t65pj/9yZtn/6gp4+u38tbVuekqAcdP5j1ziruvF5enIGlWwtasRcgFZRtYXprvh32UdqgDiPw22EsvFKi+KxYXiXJi70UkohOeLu95vVGKklo+YlrQIjSeAj+qQusUdiClYgOpKyISjdiVvnwlAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHP+q93f9170UBwi9q+7SJllB9S1hV2YpP7k4prQzQgYhEMR6GaCMdZtvTuWO4/FvZsrHo6OrOkaKEJd41kpI2wPncgAEGyu/LvjEG5eCPBPDOjfx0v5KRMTuxZ++NFKu58Q5KWDCKEcBe0hJXLXrFpwdbiGMpgomJ5VP81AQGsiGaOG7yYbYoJpMSE+hQpnqYNb5Zx5wfE/LJnH2LG7LCNePWvu3n9NDhQ8nUSTBKoNS9I5JX+ABA9MoAoMtJbRwMHYBHbFEl3w7ohxc3d49rt8h/NNB1O8ZvjuW8DzXJB4IaVZ2A6IbycXhP8Qk7qSm9tYZFvqXCqB3C+IW+QlA+Y=');
INSERT INTO public.component_config VALUES ('fb7567d9-4f9e-4a1d-991f-38062e63b5d9', '36af9175-ec56-4fe7-92e3-48dd0d16012c', 'privateKey', 'MIIEpgIBAAKCAQEA0oYNrJ6jR/fk1P7DoimwN7se7kDiawC+Y2RGvrpvnh7PhXt8JD5L0HJLXd9/Dnr/HL31rbkOQGJWfILOAro1tROiwik11Ebd39na7A5a/6rdhLF0t3WZiBqqkxkvnk4wHGQGsQqSLsSm12Z+UR4MBsc3Kl9cDGApr3pCm5JSH8ZYmCM8ZpAk6jmxKrmgol1R3/beuaY//cmbZ/+oKePrt/LW1bnpKgHHT+Y9c4q7rxeXpyBpVsLWrEXIBWUbWF6a74d9lHaoA4j8NthLLxSovisWF4lyYu9FJKITni7veb1RipJaPmJa0CI0ngI/qkLrFHYgpWIDqSsiEo3Ylb58JQIDAQABAoIBAQCULsudP6SK2dB2pESr9lAVSl8BMSauTr20VDb/tVcvo1xLBpphIIBY3rpx/wj99lFvt74gY+vGIfHifmfnv45iQMoFhOBg5Ojz0fKoyYoAABMgfZA8OkixZqO+GrJL6ZkvwrB7GYe/56fQYlJzYoTwmHUaHDk8dMuiupn7y0iHF9vk6kIbN1ytu/66n1sU8nvyC8p76ix7IcB8F1b2rwdo6qMbtyN6Mx3/nPJiRErfA/RUZ2q0mKNzfu55mtgt28g4VeX5cdpqxj2TriK822W7a2saMUMWhHlzXDqdr3Kk7DBxQpJg+WfYwtffx4y08967Pywb3nGiM18oYiAcdWYZAoGBAP0rxflYZ28+p/pwTqECaP14DvbQFxCLOZu8rLwP980C/A2gJRwHs/UaAYsmmAnOVz31lT1WLUi7JZwDKrrQ/EuV8Gnrsbw6TKXbjcfzgCVZOIVSsLyez8FyF1JqrGDwxUkcUKhPnpA27PE/9vcEhZ6OdPN9Ml6ZjxFybCc/wGEjAoGBANTgSDk5dZ2cyBA3b/j5jGpP//zp1UjseS5f/tohuZuJ1TBfiMvtiSUBaWWfGX2pIR2cvtIfOKTWqdKdJDl6edybbd0+gfjj/ezh8lEueKxsTMDuEQIsXjPAc2+I5Q8mI14B72iXsZ4fotoRKf4A3uXF7439lbbtSSW56FopHFYXAoGBAM7Wf3U6s67gas6iCKtk07AZ8WfWFLHwfU1udVVkWljFUnYzW34uEOlzqMUt79M7IG2/gYFOMcsVEyIGOFfOvAFo67Ut2dTlcI+k843js9NPtGzAZSKFQUlTVBiCjHja3OPhXUhVXD+IkEZ9suCXci9bRdNUet1s6cUgTZo3bI4vAoGBAIAoMnL5C70CqVNR/MBYhFdwqD18DSKk8uOfeU+bZCGmnklMCpAzBhDYQ7qhSPhk/QHV3u+jSje64GxinG9aM8lDbaX3vsm3gKS+9mI3ZwDvBlpUOLslOOVRJG3ubXBsVnh/E8HVKWJ3y1QbZzt7DLYqLuk91IdXXWUwAhldjKirAoGBALUz6ywPr1ltxUFi862rEw/apNqW/792yA5YkdnbIdVfHWFNirA1vq9Pfw14XiIiFDkqTdGCd1IFUZ7V1s/u4dgw7yrf3Xuso795+QFG/En1lC0lHMbGK2gcjdW4/KropkyqPTK9usrbCS3f+AHj58ZnxxG/X8U5+IZQn7UfE+Rf');
INSERT INTO public.component_config VALUES ('6bc1b3b1-cd10-468e-b33f-3583530354ba', '36af9175-ec56-4fe7-92e3-48dd0d16012c', 'priority', '-100');
INSERT INTO public.component_config VALUES ('8939797d-98eb-4613-9cdd-d0f769c27725', '22902ae8-5351-4a63-b421-64f3b00416a5', 'certificate', 'MIICozCCAYsCBgF1nBofhDANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApzaW1wbHl3YWxsMB4XDTIwMTEwNjA1NDczOVoXDTMwMTEwNjA1NDkxOVowFTETMBEGA1UEAwwKc2ltcGx5d2FsbDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJIwb9/de+7T80jMii1ACPCIGkkau6Xy8X//lyUuYCqTrztmXkLHC2r5EJyx4ZWxcaTaV4l5evnE3WZvBGzc5URGlI6WDCZxt+BTr2z+c41dhzgDePJq75/x6AE79+NJL3rjsHxWghZOh5pPj+GUJby+C3yBrrOtZPhf6Aj4IcplxTuloKJYo2A4GB3BeitWQyDsVkr1NtL1qaSg8Z5FZqtvHUSdXP8lCbQlcPqfwydwrc0vMRiEbT/8nJYnTo1Xkg7QcKY8AKLtl7lDrQVpF6NVPQBxcqA+/hJdUmyIG5aoKwyZl305zsccVtGmxL1cqH99pHTSUT7VllcpjpmMgcsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAZAbLBxDQhSh+VFbdFCR9GCkHQTUKge2P11z7vYeY0qK0l6DyJuYSboCsKwsM/71vP0EOh+/KdgqEERSU7YtsoHpudYwbZ7gZjK4VhmuCJTPjVB9v55q1mEqKSDxvr/JZO86kvAPeDaL079WP5mr3qTPgdRi8WBx5tnFaQvPYnO7L8hA8DXGPS/limP7ZPPd61FD4MclwwhFpIr4WHW1434Sczl067N6RzfbSFrCf76pxyNiwBdoDSC9yVM1oqo7fjNr7ZrGmtEirStRWLnrlNZ9tpvSA/xZ6gOqZEBPVnt0DSLnz/Q2wVnoxnzrOAiXXtKZnvJ+ib/mZyvSHamMArQ==');
INSERT INTO public.component_config VALUES ('1bf1f703-9304-469a-aa4c-62ed02e14849', '22902ae8-5351-4a63-b421-64f3b00416a5', 'privateKey', 'MIIEogIBAAKCAQEAkjBv39177tPzSMyKLUAI8IgaSRq7pfLxf/+XJS5gKpOvO2ZeQscLavkQnLHhlbFxpNpXiXl6+cTdZm8EbNzlREaUjpYMJnG34FOvbP5zjV2HOAN48mrvn/HoATv340kveuOwfFaCFk6Hmk+P4ZQlvL4LfIGus61k+F/oCPghymXFO6WgolijYDgYHcF6K1ZDIOxWSvU20vWppKDxnkVmq28dRJ1c/yUJtCVw+p/DJ3CtzS8xGIRtP/yclidOjVeSDtBwpjwAou2XuUOtBWkXo1U9AHFyoD7+El1SbIgblqgrDJmXfTnOxxxW0abEvVyof32kdNJRPtWWVymOmYyBywIDAQABAoIBAGJPkpzBDPxCqyQ08WOW4awoS00IXlMuevwyPUny0xcu9DQFFrTfuKz6zBIkiekqSJutfhrkiC/6FU4ysI4pS0FMGdF91LPx289PV/T7dWgHEs03gJm+EmHEw9o4ou7Fo9mHz4L+hkNMEmNSyBbSk0JHp9/WMk+A9xsVHC0T+V1raOfFrEKsKIMTmIJj19wgnQ+UrrwcYSK6g+YqPzS3PyZyGExS2gAODVqHQOq65HgnXw5lFFBHaNkBP1CfWGFgoJGk17ICMvE55LsNSjPuQ43dkC7l1sWTEMaR7J/KiyeX4EvNMXL3g1feDc99IdPao/phB28XqHJhbpaYeBYXwVkCgYEAyuCKU3LSUT1PVGOaIMKDqNbfbAMbEPw4l4z96sjhELG8Voz/pEzLP39PhCUchnKNtDZdGJj8424zFy9XQflmTxemwtUd5gxEGII8hyLCKltBh6cr6HzySU7WncivURZTcRScUG7W+qiS5NOpEqgHXSa0bWja4lzOALEgUNc2HTUCgYEAuHfv2PvTgnBZHyRiVuIG3ew+ctc8Q6pCPVJF8stXLKk2tog/HaZVIoWeC1orV1C1I3Vf0fCPPWBqW5whnNomd9nH4mQQEhmKix9u+Wh19r4v8Akbl5sCRfw+GQHtRy/NFgBMbdy2KvRvK1b0e0AxFDq7h/t4QH1nMYJUpNEfAv8CgYAv8Er/WPx1keUy7a4323684Lk+jqVQqCi/NuOxHPKBvV3hncOykSrdwDmL4jERW/Q8BzSMYWowW5PbAKa/wiz4t4ACPdWozHEy0WN4EzCKTbH4Wfo4H34o8GYqNoemw33IFLSzFN3bsQW06IblD6tdyY2M5OAD6SYMZ85ZC+GPmQKBgHt1mgrpD/ge5SbYnRB1Gg9xS6Jktyq6Srbr13DV8rQrVDj6GvPnHNeMAeirIpK/q1vd9JF3pQZ4/vXtGvn1bwWLtiGowrC6c2UFVqqJ5VmMlFzcW6Et12mrlov6JCoere3pqT1mGG3LRpQFEH9kyPQ3EsfB4AuZYnVaOvhMFatVAoGAEyoyO86MLT4jZ+siuxKNpKJfKMKPwUkaDUIXXfNb2k43VEXftIH0YBLoYVg/VhUehdqvJbbS/o9Je1eOaRzjKVJ0S7RpLFxO4uGJJLDFRotL1WCjw1tCv3xRMKK9QBxtvHL3PvPnlKzHKtRplSK/XusT0LTUZj85FSSzOE+J7O4=');
INSERT INTO public.component_config VALUES ('778c96d7-46da-4370-a302-5d24e3cdda0f', '22902ae8-5351-4a63-b421-64f3b00416a5', 'priority', '100');
INSERT INTO public.component_config VALUES ('07025cd2-7b86-4eea-a493-d73aceacc850', '7b878c00-85a6-4751-8cf3-a3ace0864847', 'secret', 'IoKikkKjYAcIDU8WMdVIDKse4fy2qM0xnL7pcfaD67xRG9sS-RquXXmnGgLzg7bBzJCQxz0T27zKtJ5Fv3JJBA');
INSERT INTO public.component_config VALUES ('13bddfc0-50f5-4751-b174-96b8500058bf', '7b878c00-85a6-4751-8cf3-a3ace0864847', 'priority', '100');
INSERT INTO public.component_config VALUES ('b3915711-ab67-4e55-a974-61d628d1a0f0', '7b878c00-85a6-4751-8cf3-a3ace0864847', 'kid', '9029538c-bc3d-4e17-bf38-bb3aab6cc539');
INSERT INTO public.component_config VALUES ('0cec4d9a-b479-41e9-be0c-c5fb85d391f0', '7b878c00-85a6-4751-8cf3-a3ace0864847', 'algorithm', 'HS256');
INSERT INTO public.component_config VALUES ('3d3c34aa-8155-488e-93f3-8e03783d02d8', 'af00ccda-721c-44a4-96c2-03f8fc23e5a4', 'priority', '100');
INSERT INTO public.component_config VALUES ('8887996f-72a8-4b47-97b2-01679bd148c7', 'af00ccda-721c-44a4-96c2-03f8fc23e5a4', 'kid', 'd0131556-d3b3-4f05-90d3-a71669ff52e9');
INSERT INTO public.component_config VALUES ('4d795d01-2055-48a1-8caa-17c0001dbf33', 'af00ccda-721c-44a4-96c2-03f8fc23e5a4', 'secret', 'vvBesi5Tv4LiQvdlmisCRQ');
INSERT INTO public.component_config VALUES ('cb0067c1-0def-441a-832d-0a63b5b8da7d', '744245a1-1e8a-4666-8c53-e02563f69575', 'allow-default-scopes', 'true');
INSERT INTO public.component_config VALUES ('6cc4444d-353d-44eb-a43c-398e439406f6', 'e68d6067-109c-4556-bd24-4858fdde87c0', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config VALUES ('0c12ceeb-f5d2-4934-b4cd-f935d382476e', 'e68d6067-109c-4556-bd24-4858fdde87c0', 'client-uris-must-match', 'true');
INSERT INTO public.component_config VALUES ('1d8e9038-a121-4859-baa5-3d2c0ee5ed87', '4623a999-9642-4ba0-9aed-79c7e83acf9f', 'max-clients', '200');
INSERT INTO public.component_config VALUES ('41987578-2765-4067-af1f-7ee4067e877d', 'f25e8f9e-4d36-4a86-94c3-91afe5870223', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('143f35c9-ca95-4d0d-9047-140350fba940', 'f25e8f9e-4d36-4a86-94c3-91afe5870223', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('29000a69-f622-418d-a619-314f469abb5f', 'f25e8f9e-4d36-4a86-94c3-91afe5870223', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('f49fa5a8-25ea-43cb-bdfb-ed92955e085e', 'f25e8f9e-4d36-4a86-94c3-91afe5870223', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('46010014-0283-4993-93d0-06aa5eeaa8ff', 'f25e8f9e-4d36-4a86-94c3-91afe5870223', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('9c01a86c-1dd4-4a00-bfed-c54cb9c7e590', 'f25e8f9e-4d36-4a86-94c3-91afe5870223', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('35531824-c94a-44ac-ba5f-497b11aff280', 'f25e8f9e-4d36-4a86-94c3-91afe5870223', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('72695c77-becf-4d72-ab61-0e84306105cb', 'f25e8f9e-4d36-4a86-94c3-91afe5870223', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('3456ed8f-2427-42e4-9c55-ac71245a9a5d', '488a6345-632f-49c6-9eab-9d27c5e446fd', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config VALUES ('d79616f7-7bc9-4e87-be78-51195a0809e4', '488a6345-632f-49c6-9eab-9d27c5e446fd', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config VALUES ('e4b0197a-93cc-40e3-b4c4-341f745ee458', '488a6345-632f-49c6-9eab-9d27c5e446fd', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config VALUES ('447b22ae-c449-4a7e-8e18-048c3d8f3c03', '488a6345-632f-49c6-9eab-9d27c5e446fd', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config VALUES ('41925074-ec3b-4c71-9b41-0f6373c97c2c', '488a6345-632f-49c6-9eab-9d27c5e446fd', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config VALUES ('ffa355ac-9248-4799-b513-83d319f3165f', '488a6345-632f-49c6-9eab-9d27c5e446fd', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config VALUES ('2ffb0f84-1841-4b72-be76-989aadfbde67', '488a6345-632f-49c6-9eab-9d27c5e446fd', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config VALUES ('8c31caff-85bd-4e81-9653-0ce01ecf4bed', '488a6345-632f-49c6-9eab-9d27c5e446fd', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config VALUES ('3b7bd839-0066-47eb-b164-1fa2387f50bc', 'd467a50f-b6b9-4dbc-a088-6089ee70cbb1', 'allow-default-scopes', 'true');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '7d1e788d-7a7b-4b51-ae2f-7abc793cf97b');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'd8345fa8-ade6-4559-b407-6e6fc9de6ca7');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '55d42a96-2cb6-4a30-aaff-54425fe16268');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '92bad4d8-55b7-47f5-b489-9a859e587d6b');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '3030fe9f-fb1b-4e30-90e4-fdb4839e99d4');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '105b9afe-5cad-4635-90da-0b4d1a4241b2');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '6f418445-3e0e-423f-b524-ccc536facc03');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'dcfb3345-8067-45a7-9ea8-09607a82988b');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '0adf849f-cf22-45bb-91e8-57a3d7c40304');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'aa93db9a-dcca-4810-87eb-2f443bbb4ef2');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '60c251bf-378c-4088-a8b7-0733f7a66811');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '40582c0a-6290-4997-8e66-919aee93ff96');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '86b55cc4-24ae-4d26-9185-27e246305f2d');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'e5ab0994-6b94-4449-8820-d60a0ecdc2b0');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'f577c50d-5df1-4ae7-995a-7a783779b73a');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'dd66e604-dd87-4cd7-b00d-4427fbf4eb33');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '6702d2d6-a212-4e1e-adef-836d2d9698be');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '86f402e6-35f8-45c7-8e4b-8e3fba740933');
INSERT INTO public.composite_role VALUES ('3030fe9f-fb1b-4e30-90e4-fdb4839e99d4', 'dd66e604-dd87-4cd7-b00d-4427fbf4eb33');
INSERT INTO public.composite_role VALUES ('92bad4d8-55b7-47f5-b489-9a859e587d6b', '86f402e6-35f8-45c7-8e4b-8e3fba740933');
INSERT INTO public.composite_role VALUES ('92bad4d8-55b7-47f5-b489-9a859e587d6b', 'f577c50d-5df1-4ae7-995a-7a783779b73a');
INSERT INTO public.composite_role VALUES ('b562a42b-9322-4743-a5bc-6c6b0f870e12', 'f770f86b-f7f2-4f9e-ae44-36dab1eb07b7');
INSERT INTO public.composite_role VALUES ('624f49b9-0051-41bc-8146-fd519f579e13', '84b4001e-4853-486d-bc16-72710d8ed92e');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '9e72870c-e92a-417e-ba33-48aca93b1c7d');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '8e5eba5a-4da9-4917-8340-1bcc64e8dd17');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '0755d69a-a529-4079-bdc0-829df6a39d3c');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '0d5b7a28-a93e-4427-b7b8-ab1419317f4a');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '09dfdb09-5676-4176-b554-6d7e7e1cab67');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '1162dc39-a314-4473-9faf-7b380890c7e0');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'accd7feb-953b-4001-9693-3993fa7493ca');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '151f30cc-b424-4a23-b0ff-09c81c424927');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'ba5984f1-f806-4460-8d72-41650664cf85');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'd2a0e179-7a13-4c5a-a0b2-90d26dfd4921');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '19494193-999d-4462-9cfd-ce7b3fab8107');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'a5fc95b7-b5f6-4782-acd1-db4ce6522a16');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '0a59e654-a673-47f2-a68f-6ffea57d2642');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '75c4c1ae-0e5c-4ec1-890e-550c9115fbcb');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'cc6b0931-fab5-421a-8fc2-c89296547584');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'b6f9baa8-cd5f-4935-8b9d-c8e8027ecf1b');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'ace35ea1-ba49-432c-b569-ec33bdb34682');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'b3177bcf-b5ec-4010-97d5-80585128b2c4');
INSERT INTO public.composite_role VALUES ('09dfdb09-5676-4176-b554-6d7e7e1cab67', 'b6f9baa8-cd5f-4935-8b9d-c8e8027ecf1b');
INSERT INTO public.composite_role VALUES ('0d5b7a28-a93e-4427-b7b8-ab1419317f4a', 'cc6b0931-fab5-421a-8fc2-c89296547584');
INSERT INTO public.composite_role VALUES ('0d5b7a28-a93e-4427-b7b8-ab1419317f4a', 'b3177bcf-b5ec-4010-97d5-80585128b2c4');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '9d1f9d1a-ebe8-4d63-8b7b-9e3e0b6c7c4c');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '36204568-5674-4a23-89b2-df274966179c');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '768f0092-b747-4efb-acaf-d0815f6173e5');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '703b21c1-2328-4fee-b5bd-7dffcd9ad5b9');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', 'db14206a-e22b-4d1b-927f-502364271b8a');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '0654338b-832f-4adc-9a32-a36066d29202');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '10db6029-2495-4e87-8bce-0e5a8905193e');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', 'cb31acd8-2e1b-4305-aaac-d91bee943322');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '6231f6d8-b30f-488e-8394-ce3f4ec6d188');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', 'a7eb912a-ec76-4e0c-9e99-c9891b99e5db');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', 'cbb43efd-9a23-426e-a4e5-3b4ab4a97627');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', 'bddc2301-3382-4939-a298-2a39b5cff30e');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', 'c0695a83-a45e-486d-baf6-cced20faf6ee');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '62a60b90-ad3b-42db-86c5-4c80698350a1');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', 'c5e69fc4-0ed9-4f4a-85f5-1ed271d29583');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '8df40fba-b06d-4c12-8793-147e21d1ca3b');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '0e84f476-6414-4bf2-ab93-35911454339e');
INSERT INTO public.composite_role VALUES ('703b21c1-2328-4fee-b5bd-7dffcd9ad5b9', 'c5e69fc4-0ed9-4f4a-85f5-1ed271d29583');
INSERT INTO public.composite_role VALUES ('768f0092-b747-4efb-acaf-d0815f6173e5', '0e84f476-6414-4bf2-ab93-35911454339e');
INSERT INTO public.composite_role VALUES ('768f0092-b747-4efb-acaf-d0815f6173e5', '62a60b90-ad3b-42db-86c5-4c80698350a1');
INSERT INTO public.composite_role VALUES ('4122f892-75f6-46ff-b96c-efd1d68ab02b', 'd5cca26c-ee6f-4a4a-9d66-5803a6fe14c1');
INSERT INTO public.composite_role VALUES ('b7648d4a-bab9-4465-a889-4e58d9e22540', 'd090b1b4-9d95-4934-a83f-08ff4b91cf26');
INSERT INTO public.composite_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', '10cc668f-34c9-4b07-8706-640afb7b425b');
INSERT INTO public.composite_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', '8c520edb-fe5d-4729-9ae9-e1c65d619689');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.credential VALUES ('18c23bb4-8b4a-4c35-9bf5-f98d3615b73d', NULL, 'password', 'dde8e79d-d39b-4d84-9a90-a3efa7b715ed', 1604641302519, NULL, '{"value":"znENYw2jh/N2aTiXwDLCHGb8xPdYZL5FYewAf6+3NoVnVWUW+jLtSxuFYRCI9pbnXSIxLZl5R2TExVodrqPIPA==","salt":"dxlR6a1qg4Rl9cHQVx9Piw=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO public.credential VALUES ('856a0d8c-00bb-40af-91f7-1dfe621a59b4', NULL, 'password', '50d06183-ce53-4294-8422-6a7e77a65f81', 1604641819203, NULL, '{"value":"wNa/++guscVVd0+7XMK4Q8vhU/kdaQxzsxjVSZLAYRcJHDvoExFw2REL38nM1x59kM7OEANb3WhFnWoYG0fgcw==","salt":"8u0xf8HAA6OTRMDRIgc3Jg=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO public.credential VALUES ('84782905-e26d-43f9-826b-5f6d9af4ced6', NULL, 'password', '751495b7-7495-4aa9-869a-194c6fe0a4cd', 1604699794863, NULL, '{"value":"s5uRuHkWSjEfH6QeAEQiFK+aYS7p/edWvWkht9ZdpPVmIPYP+Yo58P3Bq+J+yzLn8TpppL0en2Mri1xS50I2/w==","salt":"rrZxVZ5y+b8SmeuZHUD7/w=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2020-11-06 05:41:37.84527', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2020-11-06 05:41:37.862411', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2020-11-06 05:41:37.910974', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2020-11-06 05:41:37.916947', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2020-11-06 05:41:38.042401', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2020-11-06 05:41:38.048966', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2020-11-06 05:41:38.162614', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2020-11-06 05:41:38.169805', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2020-11-06 05:41:38.17728', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2020-11-06 05:41:38.29631', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2020-11-06 05:41:38.358863', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2020-11-06 05:41:38.369305', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2020-11-06 05:41:38.385845', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-11-06 05:41:38.410627', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-11-06 05:41:38.414523', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-11-06 05:41:38.41792', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-11-06 05:41:38.420971', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2020-11-06 05:41:38.477695', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2020-11-06 05:41:38.529521', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2020-11-06 05:41:38.536009', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-11-06 05:41:39.113564', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2020-11-06 05:41:38.539911', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2020-11-06 05:41:38.54369', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2020-11-06 05:41:38.568907', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2020-11-06 05:41:38.574994', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2020-11-06 05:41:38.577652', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2020-11-06 05:41:38.615314', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2020-11-06 05:41:38.706844', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2020-11-06 05:41:38.71232', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2020-11-06 05:41:38.790456', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2020-11-06 05:41:38.809359', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2020-11-06 05:41:38.831151', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2020-11-06 05:41:38.838443', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-11-06 05:41:38.846958', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-11-06 05:41:38.850639', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-11-06 05:41:38.884365', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2020-11-06 05:41:38.891099', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-11-06 05:41:38.899618', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2020-11-06 05:41:38.904493', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2020-11-06 05:41:38.909416', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-11-06 05:41:38.912335', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-11-06 05:41:38.915418', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2020-11-06 05:41:38.922835', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-11-06 05:41:39.100675', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2020-11-06 05:41:39.10781', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-11-06 05:41:39.120207', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-11-06 05:41:39.123079', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-11-06 05:41:39.168865', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-11-06 05:41:39.175721', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2020-11-06 05:41:39.235181', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2020-11-06 05:41:39.277371', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2020-11-06 05:41:39.282822', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2020-11-06 05:41:39.287124', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2020-11-06 05:41:39.291385', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-11-06 05:41:39.300712', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-11-06 05:41:39.307923', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-11-06 05:41:39.335446', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-11-06 05:41:39.449408', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2020-11-06 05:41:39.484006', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2020-11-06 05:41:39.493191', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2020-11-06 05:41:39.504325', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2020-11-06 05:41:39.512175', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2020-11-06 05:41:39.516355', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2020-11-06 05:41:39.519915', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2020-11-06 05:41:39.523241', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2020-11-06 05:41:39.539913', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2020-11-06 05:41:39.547362', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2020-11-06 05:41:39.552979', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2020-11-06 05:41:39.565377', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2020-11-06 05:41:39.57162', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2020-11-06 05:41:39.57644', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-11-06 05:41:39.582645', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-11-06 05:41:39.589059', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-11-06 05:41:39.591854', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-11-06 05:41:39.609321', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-11-06 05:41:39.619032', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-11-06 05:41:39.62414', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-11-06 05:41:39.627097', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-11-06 05:41:39.651356', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-11-06 05:41:39.654877', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-11-06 05:41:39.662995', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-11-06 05:41:39.665814', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-11-06 05:41:39.671083', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-11-06 05:41:39.674382', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2020-11-06 05:41:39.682358', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '4641297562');
INSERT INTO public.databasechangelog VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2020-11-06 05:41:39.689259', 86, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '4641297562');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.default_client_scope VALUES ('master', '653a3501-b85f-49ba-9d85-16674029439c', false);
INSERT INTO public.default_client_scope VALUES ('master', '27c8d369-1d3a-4d64-9012-ba424402bd3b', true);
INSERT INTO public.default_client_scope VALUES ('master', '1904788e-cfba-43e2-bf5d-766c815f8e1f', true);
INSERT INTO public.default_client_scope VALUES ('master', '72962555-d177-47ff-9759-6f8ed875ffa9', true);
INSERT INTO public.default_client_scope VALUES ('master', 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6', false);
INSERT INTO public.default_client_scope VALUES ('master', '4a85beb5-8ee0-4085-9120-9341161ebd5e', false);
INSERT INTO public.default_client_scope VALUES ('master', '94dfdcea-f8df-42b4-9a4e-3839e0470ec7', true);
INSERT INTO public.default_client_scope VALUES ('master', 'd9a50cea-c9e0-4108-b897-980e5b76cfbb', true);
INSERT INTO public.default_client_scope VALUES ('master', '6b276cd7-79c2-46d3-b3cc-56c52ec89743', false);
INSERT INTO public.default_client_scope VALUES ('simplywall', '2984d1ec-d1c2-41ba-b1b8-329e15511d8f', false);
INSERT INTO public.default_client_scope VALUES ('simplywall', '2f243448-7916-412b-87cd-dee43bc4d32d', true);
INSERT INTO public.default_client_scope VALUES ('simplywall', '1811c2f0-575c-402c-9eb8-0c33ef691710', true);
INSERT INTO public.default_client_scope VALUES ('simplywall', '15f5532d-92e0-48b7-822a-e5a7171f5263', true);
INSERT INTO public.default_client_scope VALUES ('simplywall', '6638d6aa-5778-4e00-86df-98fb7b3a3a61', false);
INSERT INTO public.default_client_scope VALUES ('simplywall', 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007', false);
INSERT INTO public.default_client_scope VALUES ('simplywall', 'fbed4e2d-16e4-4238-8d95-f8679fe2d284', true);
INSERT INTO public.default_client_scope VALUES ('simplywall', '39ddf344-5308-4471-a494-3caaf0116495', true);
INSERT INTO public.default_client_scope VALUES ('simplywall', 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72', false);


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.keycloak_role VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'master', false, '${role_admin}', 'admin', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('7d1e788d-7a7b-4b51-ae2f-7abc793cf97b', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('d8345fa8-ade6-4559-b407-6e6fc9de6ca7', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_create-client}', 'create-client', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('55d42a96-2cb6-4a30-aaff-54425fe16268', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_view-realm}', 'view-realm', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('92bad4d8-55b7-47f5-b489-9a859e587d6b', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_view-users}', 'view-users', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('3030fe9f-fb1b-4e30-90e4-fdb4839e99d4', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_view-clients}', 'view-clients', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('105b9afe-5cad-4635-90da-0b4d1a4241b2', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_view-events}', 'view-events', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('6f418445-3e0e-423f-b524-ccc536facc03', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('dcfb3345-8067-45a7-9ea8-09607a82988b', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_view-authorization}', 'view-authorization', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('0adf849f-cf22-45bb-91e8-57a3d7c40304', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_manage-realm}', 'manage-realm', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('aa93db9a-dcca-4810-87eb-2f443bbb4ef2', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_manage-users}', 'manage-users', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('60c251bf-378c-4088-a8b7-0733f7a66811', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_manage-clients}', 'manage-clients', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('40582c0a-6290-4997-8e66-919aee93ff96', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_manage-events}', 'manage-events', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('86b55cc4-24ae-4d26-9185-27e246305f2d', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('e5ab0994-6b94-4449-8820-d60a0ecdc2b0', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_manage-authorization}', 'manage-authorization', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('f577c50d-5df1-4ae7-995a-7a783779b73a', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_query-users}', 'query-users', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('dd66e604-dd87-4cd7-b00d-4427fbf4eb33', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_query-clients}', 'query-clients', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('6702d2d6-a212-4e1e-adef-836d2d9698be', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_query-realms}', 'query-realms', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('86f402e6-35f8-45c7-8e4b-8e3fba740933', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_query-groups}', 'query-groups', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('d1eae49e-e614-45c2-82f0-0cfb27170d5b', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', true, '${role_view-profile}', 'view-profile', 'master', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', NULL);
INSERT INTO public.keycloak_role VALUES ('b562a42b-9322-4743-a5bc-6c6b0f870e12', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', true, '${role_manage-account}', 'manage-account', 'master', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', NULL);
INSERT INTO public.keycloak_role VALUES ('f770f86b-f7f2-4f9e-ae44-36dab1eb07b7', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', true, '${role_manage-account-links}', 'manage-account-links', 'master', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', NULL);
INSERT INTO public.keycloak_role VALUES ('cb07bbe7-d630-440d-b527-e826c11bb9ab', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', true, '${role_view-applications}', 'view-applications', 'master', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', NULL);
INSERT INTO public.keycloak_role VALUES ('84b4001e-4853-486d-bc16-72710d8ed92e', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', true, '${role_view-consent}', 'view-consent', 'master', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', NULL);
INSERT INTO public.keycloak_role VALUES ('624f49b9-0051-41bc-8146-fd519f579e13', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', true, '${role_manage-consent}', 'manage-consent', 'master', '46be1b9a-6d0d-4923-bf12-de0ee25bd488', NULL);
INSERT INTO public.keycloak_role VALUES ('5ce46ce3-56d5-4941-9e33-7cc1b0bcbfb3', '5fa5154a-fc3b-4ac8-b798-1c486746d8e5', true, '${role_read-token}', 'read-token', 'master', '5fa5154a-fc3b-4ac8-b798-1c486746d8e5', NULL);
INSERT INTO public.keycloak_role VALUES ('9e72870c-e92a-417e-ba33-48aca93b1c7d', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', true, '${role_impersonation}', 'impersonation', 'master', '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', NULL);
INSERT INTO public.keycloak_role VALUES ('56c0c9b8-ce63-42be-a816-10965f38f607', 'master', false, '${role_offline-access}', 'offline_access', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('c9020303-35e3-4889-80cf-bfed3551a07a', 'master', false, '${role_uma_authorization}', 'uma_authorization', 'master', NULL, 'master');
INSERT INTO public.keycloak_role VALUES ('8e5eba5a-4da9-4917-8340-1bcc64e8dd17', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_create-client}', 'create-client', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('0755d69a-a529-4079-bdc0-829df6a39d3c', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_view-realm}', 'view-realm', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('0d5b7a28-a93e-4427-b7b8-ab1419317f4a', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_view-users}', 'view-users', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('09dfdb09-5676-4176-b554-6d7e7e1cab67', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_view-clients}', 'view-clients', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('1162dc39-a314-4473-9faf-7b380890c7e0', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_view-events}', 'view-events', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('accd7feb-953b-4001-9693-3993fa7493ca', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('151f30cc-b424-4a23-b0ff-09c81c424927', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_view-authorization}', 'view-authorization', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('ba5984f1-f806-4460-8d72-41650664cf85', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_manage-realm}', 'manage-realm', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('d2a0e179-7a13-4c5a-a0b2-90d26dfd4921', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_manage-users}', 'manage-users', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('19494193-999d-4462-9cfd-ce7b3fab8107', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_manage-clients}', 'manage-clients', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('a5fc95b7-b5f6-4782-acd1-db4ce6522a16', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_manage-events}', 'manage-events', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('0a59e654-a673-47f2-a68f-6ffea57d2642', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('75c4c1ae-0e5c-4ec1-890e-550c9115fbcb', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_manage-authorization}', 'manage-authorization', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('cc6b0931-fab5-421a-8fc2-c89296547584', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_query-users}', 'query-users', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('b6f9baa8-cd5f-4935-8b9d-c8e8027ecf1b', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_query-clients}', 'query-clients', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('ace35ea1-ba49-432c-b569-ec33bdb34682', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_query-realms}', 'query-realms', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('b3177bcf-b5ec-4010-97d5-80585128b2c4', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_query-groups}', 'query-groups', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('2c3a8288-280f-4fb3-ae9d-886096abdd40', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_realm-admin}', 'realm-admin', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('9d1f9d1a-ebe8-4d63-8b7b-9e3e0b6c7c4c', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_create-client}', 'create-client', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('36204568-5674-4a23-89b2-df274966179c', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_view-realm}', 'view-realm', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('768f0092-b747-4efb-acaf-d0815f6173e5', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_view-users}', 'view-users', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('703b21c1-2328-4fee-b5bd-7dffcd9ad5b9', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_view-clients}', 'view-clients', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('db14206a-e22b-4d1b-927f-502364271b8a', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_view-events}', 'view-events', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('0654338b-832f-4adc-9a32-a36066d29202', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_view-identity-providers}', 'view-identity-providers', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('10db6029-2495-4e87-8bce-0e5a8905193e', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_view-authorization}', 'view-authorization', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('cb31acd8-2e1b-4305-aaac-d91bee943322', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_manage-realm}', 'manage-realm', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('6231f6d8-b30f-488e-8394-ce3f4ec6d188', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_manage-users}', 'manage-users', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('a7eb912a-ec76-4e0c-9e99-c9891b99e5db', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_manage-clients}', 'manage-clients', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('cbb43efd-9a23-426e-a4e5-3b4ab4a97627', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_manage-events}', 'manage-events', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('bddc2301-3382-4939-a298-2a39b5cff30e', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('c0695a83-a45e-486d-baf6-cced20faf6ee', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_manage-authorization}', 'manage-authorization', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('62a60b90-ad3b-42db-86c5-4c80698350a1', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_query-users}', 'query-users', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('c5e69fc4-0ed9-4f4a-85f5-1ed271d29583', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_query-clients}', 'query-clients', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('8df40fba-b06d-4c12-8793-147e21d1ca3b', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_query-realms}', 'query-realms', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('0e84f476-6414-4bf2-ab93-35911454339e', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_query-groups}', 'query-groups', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('62bd377e-f697-4d2e-bf11-89a39cbf62f7', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', true, '${role_view-profile}', 'view-profile', 'simplywall', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', NULL);
INSERT INTO public.keycloak_role VALUES ('4122f892-75f6-46ff-b96c-efd1d68ab02b', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', true, '${role_manage-account}', 'manage-account', 'simplywall', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', NULL);
INSERT INTO public.keycloak_role VALUES ('d5cca26c-ee6f-4a4a-9d66-5803a6fe14c1', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', true, '${role_manage-account-links}', 'manage-account-links', 'simplywall', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', NULL);
INSERT INTO public.keycloak_role VALUES ('faa223e6-375d-45fe-8c8e-46b487f600ed', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', true, '${role_view-applications}', 'view-applications', 'simplywall', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', NULL);
INSERT INTO public.keycloak_role VALUES ('d090b1b4-9d95-4934-a83f-08ff4b91cf26', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', true, '${role_view-consent}', 'view-consent', 'simplywall', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', NULL);
INSERT INTO public.keycloak_role VALUES ('b7648d4a-bab9-4465-a889-4e58d9e22540', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', true, '${role_manage-consent}', 'manage-consent', 'simplywall', 'b3b41b25-99bc-42d5-a76d-216004e7e84d', NULL);
INSERT INTO public.keycloak_role VALUES ('10cc668f-34c9-4b07-8706-640afb7b425b', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', true, '${role_impersonation}', 'impersonation', 'master', '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', NULL);
INSERT INTO public.keycloak_role VALUES ('8c520edb-fe5d-4729-9ae9-e1c65d619689', 'f06ff598-8ef3-4690-9732-183d7aea29d9', true, '${role_impersonation}', 'impersonation', 'simplywall', 'f06ff598-8ef3-4690-9732-183d7aea29d9', NULL);
INSERT INTO public.keycloak_role VALUES ('23b05ac2-a536-42f8-bad8-4c815c83fffd', '79a0248e-5463-455a-aa06-f11dbfa6d5fa', true, '${role_read-token}', 'read-token', 'simplywall', '79a0248e-5463-455a-aa06-f11dbfa6d5fa', NULL);
INSERT INTO public.keycloak_role VALUES ('9acc730a-dc8a-415c-991c-3c3a8e90b2b6', 'simplywall', false, '${role_offline-access}', 'offline_access', 'simplywall', NULL, 'simplywall');
INSERT INTO public.keycloak_role VALUES ('e472f42c-7680-4399-968e-adb5928b159c', 'simplywall', false, '${role_uma_authorization}', 'uma_authorization', 'simplywall', NULL, 'simplywall');


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.migration_model VALUES ('d1fdu', '11.0.3', 1604641301);


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.protocol_mapper VALUES ('5b886c5f-89ba-403c-9a11-15bdf3005e6e', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'd745efd2-9a7a-4a52-83ec-2537b2750605', NULL);
INSERT INTO public.protocol_mapper VALUES ('b6c50ee3-95cf-4d34-a8da-c1977331dcf4', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '62064bd3-182d-4043-b272-2984019094a6', NULL);
INSERT INTO public.protocol_mapper VALUES ('452bf726-2405-4b4a-a7ff-62fa395dacd8', 'role list', 'saml', 'saml-role-list-mapper', NULL, '27c8d369-1d3a-4d64-9012-ba424402bd3b');
INSERT INTO public.protocol_mapper VALUES ('f3153625-4ea6-4269-80eb-b2cf14dd9509', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('4cde32d8-9a27-43fa-9761-5629209a638f', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('49e75669-eb7e-43f5-9d3a-2fc843c1ae9e', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('cf03ca4d-34c5-4c2a-9c79-49d04334c8a3', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('453d5902-8ee4-4d55-9f88-032c9a1cefde', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('c6a84cf1-997c-4525-b5b1-6d239c5fc826', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('c722199c-ad84-4b87-b223-339ce15a8347', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('aa3ae7df-08d7-458e-a1f3-dab5911d5712', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('6fb56e05-f7e9-43e6-9178-af8c2b34899b', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('ddbb06a6-4ff8-4a06-bd17-1854e816c7e6', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('f792de9d-4393-4e70-b196-5708810a16cd', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('fb07c6c6-b50c-4847-9ec0-4a1f8dc387ab', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('fd26ccb9-ae1f-4cce-9eae-bb99cb303123', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('210aed9f-5104-4768-aa5c-3137d94710cc', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1904788e-cfba-43e2-bf5d-766c815f8e1f');
INSERT INTO public.protocol_mapper VALUES ('fae61803-124d-431e-9e07-c05d40c19ab9', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '72962555-d177-47ff-9759-6f8ed875ffa9');
INSERT INTO public.protocol_mapper VALUES ('af2f8919-5052-4cc4-abe6-fa4a62515002', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '72962555-d177-47ff-9759-6f8ed875ffa9');
INSERT INTO public.protocol_mapper VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'bce4d45a-9f33-4a3d-97eb-979a1067e2a6');
INSERT INTO public.protocol_mapper VALUES ('1d62cf03-05ef-480f-a902-51dddab77ce6', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '4a85beb5-8ee0-4085-9120-9341161ebd5e');
INSERT INTO public.protocol_mapper VALUES ('78841a96-95ae-47e6-bcc9-b6489d111b2d', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '4a85beb5-8ee0-4085-9120-9341161ebd5e');
INSERT INTO public.protocol_mapper VALUES ('941df9d1-cb47-4062-bef8-dbb47680c57e', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '94dfdcea-f8df-42b4-9a4e-3839e0470ec7');
INSERT INTO public.protocol_mapper VALUES ('258bbfe2-f141-442e-affc-89577098ec18', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '94dfdcea-f8df-42b4-9a4e-3839e0470ec7');
INSERT INTO public.protocol_mapper VALUES ('a28df1d8-c84b-4b16-b06b-bfebd36a9c73', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '94dfdcea-f8df-42b4-9a4e-3839e0470ec7');
INSERT INTO public.protocol_mapper VALUES ('d0236961-b3e5-40fb-9e9f-a06ede857899', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'd9a50cea-c9e0-4108-b897-980e5b76cfbb');
INSERT INTO public.protocol_mapper VALUES ('80991a76-2f28-4326-a192-bd1f356a4ea1', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '6b276cd7-79c2-46d3-b3cc-56c52ec89743');
INSERT INTO public.protocol_mapper VALUES ('f6f34b4c-ba1c-46ec-bf26-31cf525da34d', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '6b276cd7-79c2-46d3-b3cc-56c52ec89743');
INSERT INTO public.protocol_mapper VALUES ('959150d5-d996-4498-a6c0-1294d57d2b88', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '7398983c-678e-4702-aada-4803e6effb4b', NULL);
INSERT INTO public.protocol_mapper VALUES ('b5c9ef45-c554-48ba-993c-08dd744b2a52', 'role list', 'saml', 'saml-role-list-mapper', NULL, '2f243448-7916-412b-87cd-dee43bc4d32d');
INSERT INTO public.protocol_mapper VALUES ('0000eb46-f1b9-45b4-bb87-a881566caeeb', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('e4a7f12f-545b-4b87-a04e-a57c8e41946a', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('0fe96974-3caa-4190-95a8-de139b760437', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('48fcce08-1843-4c08-955d-f342e22f35de', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('275ae23c-3646-4a28-9249-d88bb5bc92fa', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('fb57d982-58b5-456a-bf46-0c2c61965937', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('7d0136fa-c7d2-4d5c-ad68-fedfb0a3327f', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('b310a046-caba-4ed0-aab3-d5d4d72bae82', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('2b41a212-ff51-43c1-b205-35983e4c7877', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('0435253a-327f-46c8-9a67-c85264803eba', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('abadf5ba-b61c-48eb-b55e-dec67224457d', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('c5819b66-1f61-41e8-86bf-2b58ac821a3e', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('8b3af344-9a7a-4f07-96ff-ebbc3de9c835', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('d0ddcb55-5263-4b43-b963-fabed19537b6', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1811c2f0-575c-402c-9eb8-0c33ef691710');
INSERT INTO public.protocol_mapper VALUES ('cc4d7e16-9451-4785-8e44-1aa2ef34f1aa', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '15f5532d-92e0-48b7-822a-e5a7171f5263');
INSERT INTO public.protocol_mapper VALUES ('a3885321-59e3-4486-8dee-e6dcf522fa26', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '15f5532d-92e0-48b7-822a-e5a7171f5263');
INSERT INTO public.protocol_mapper VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '6638d6aa-5778-4e00-86df-98fb7b3a3a61');
INSERT INTO public.protocol_mapper VALUES ('8a4766e4-8ee4-45e3-a8a4-5a0d24a7b791', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007');
INSERT INTO public.protocol_mapper VALUES ('27c37aa9-3b11-4876-8944-1c5ada01a29d', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'e9a3bbdd-fe4b-4ca6-90df-838fbbc5b007');
INSERT INTO public.protocol_mapper VALUES ('8d90d33a-464a-43b2-9617-77ae7a30705b', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'fbed4e2d-16e4-4238-8d95-f8679fe2d284');
INSERT INTO public.protocol_mapper VALUES ('88a2aa6a-be2f-4157-b03f-af9439c02c17', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'fbed4e2d-16e4-4238-8d95-f8679fe2d284');
INSERT INTO public.protocol_mapper VALUES ('087266d5-b857-48ab-8024-1f42a67ed7c3', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'fbed4e2d-16e4-4238-8d95-f8679fe2d284');
INSERT INTO public.protocol_mapper VALUES ('ce3bb554-c251-43a6-b05e-e87ee9c28029', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '39ddf344-5308-4471-a494-3caaf0116495');
INSERT INTO public.protocol_mapper VALUES ('70b7f407-3fae-4d43-9bdf-9f3946b838d8', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72');
INSERT INTO public.protocol_mapper VALUES ('9405ad01-bde6-4802-bb68-9d1024fd4fb6', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'f3f721f6-caf3-4f13-a2db-73f03fc0eb72');
INSERT INTO public.protocol_mapper VALUES ('0b84ffb4-87ea-475c-82de-a612ee549ed2', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'ba347729-cad6-408f-b536-50a6d6b34a9f', NULL);
INSERT INTO public.protocol_mapper VALUES ('0f59596b-48bb-4e98-ad77-8d4ef25c1d81', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'b16c509f-5b3e-4716-886a-038d49143d2e', NULL);
INSERT INTO public.protocol_mapper VALUES ('c95528b5-9bcf-4de0-85ae-bc15f96f8513', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'b16c509f-5b3e-4716-886a-038d49143d2e', NULL);
INSERT INTO public.protocol_mapper VALUES ('34a64a76-22cb-4d86-b24a-a98ed74677e7', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'b16c509f-5b3e-4716-886a-038d49143d2e', NULL);


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.protocol_mapper_config VALUES ('b6c50ee3-95cf-4d34-a8da-c1977331dcf4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b6c50ee3-95cf-4d34-a8da-c1977331dcf4', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b6c50ee3-95cf-4d34-a8da-c1977331dcf4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b6c50ee3-95cf-4d34-a8da-c1977331dcf4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b6c50ee3-95cf-4d34-a8da-c1977331dcf4', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b6c50ee3-95cf-4d34-a8da-c1977331dcf4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('452bf726-2405-4b4a-a7ff-62fa395dacd8', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('452bf726-2405-4b4a-a7ff-62fa395dacd8', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('452bf726-2405-4b4a-a7ff-62fa395dacd8', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('f3153625-4ea6-4269-80eb-b2cf14dd9509', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f3153625-4ea6-4269-80eb-b2cf14dd9509', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f3153625-4ea6-4269-80eb-b2cf14dd9509', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4cde32d8-9a27-43fa-9761-5629209a638f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4cde32d8-9a27-43fa-9761-5629209a638f', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('4cde32d8-9a27-43fa-9761-5629209a638f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4cde32d8-9a27-43fa-9761-5629209a638f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('4cde32d8-9a27-43fa-9761-5629209a638f', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('4cde32d8-9a27-43fa-9761-5629209a638f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('49e75669-eb7e-43f5-9d3a-2fc843c1ae9e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49e75669-eb7e-43f5-9d3a-2fc843c1ae9e', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('49e75669-eb7e-43f5-9d3a-2fc843c1ae9e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49e75669-eb7e-43f5-9d3a-2fc843c1ae9e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('49e75669-eb7e-43f5-9d3a-2fc843c1ae9e', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('49e75669-eb7e-43f5-9d3a-2fc843c1ae9e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cf03ca4d-34c5-4c2a-9c79-49d04334c8a3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cf03ca4d-34c5-4c2a-9c79-49d04334c8a3', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cf03ca4d-34c5-4c2a-9c79-49d04334c8a3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cf03ca4d-34c5-4c2a-9c79-49d04334c8a3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cf03ca4d-34c5-4c2a-9c79-49d04334c8a3', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cf03ca4d-34c5-4c2a-9c79-49d04334c8a3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('453d5902-8ee4-4d55-9f88-032c9a1cefde', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('453d5902-8ee4-4d55-9f88-032c9a1cefde', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('453d5902-8ee4-4d55-9f88-032c9a1cefde', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('453d5902-8ee4-4d55-9f88-032c9a1cefde', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('453d5902-8ee4-4d55-9f88-032c9a1cefde', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('453d5902-8ee4-4d55-9f88-032c9a1cefde', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c6a84cf1-997c-4525-b5b1-6d239c5fc826', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c6a84cf1-997c-4525-b5b1-6d239c5fc826', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c6a84cf1-997c-4525-b5b1-6d239c5fc826', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c6a84cf1-997c-4525-b5b1-6d239c5fc826', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c6a84cf1-997c-4525-b5b1-6d239c5fc826', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c6a84cf1-997c-4525-b5b1-6d239c5fc826', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c722199c-ad84-4b87-b223-339ce15a8347', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c722199c-ad84-4b87-b223-339ce15a8347', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c722199c-ad84-4b87-b223-339ce15a8347', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c722199c-ad84-4b87-b223-339ce15a8347', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c722199c-ad84-4b87-b223-339ce15a8347', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c722199c-ad84-4b87-b223-339ce15a8347', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('aa3ae7df-08d7-458e-a1f3-dab5911d5712', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa3ae7df-08d7-458e-a1f3-dab5911d5712', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('aa3ae7df-08d7-458e-a1f3-dab5911d5712', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa3ae7df-08d7-458e-a1f3-dab5911d5712', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('aa3ae7df-08d7-458e-a1f3-dab5911d5712', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('aa3ae7df-08d7-458e-a1f3-dab5911d5712', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('6fb56e05-f7e9-43e6-9178-af8c2b34899b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6fb56e05-f7e9-43e6-9178-af8c2b34899b', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('6fb56e05-f7e9-43e6-9178-af8c2b34899b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6fb56e05-f7e9-43e6-9178-af8c2b34899b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('6fb56e05-f7e9-43e6-9178-af8c2b34899b', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('6fb56e05-f7e9-43e6-9178-af8c2b34899b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('ddbb06a6-4ff8-4a06-bd17-1854e816c7e6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ddbb06a6-4ff8-4a06-bd17-1854e816c7e6', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('ddbb06a6-4ff8-4a06-bd17-1854e816c7e6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ddbb06a6-4ff8-4a06-bd17-1854e816c7e6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('ddbb06a6-4ff8-4a06-bd17-1854e816c7e6', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('ddbb06a6-4ff8-4a06-bd17-1854e816c7e6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f792de9d-4393-4e70-b196-5708810a16cd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f792de9d-4393-4e70-b196-5708810a16cd', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f792de9d-4393-4e70-b196-5708810a16cd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f792de9d-4393-4e70-b196-5708810a16cd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f792de9d-4393-4e70-b196-5708810a16cd', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f792de9d-4393-4e70-b196-5708810a16cd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fb07c6c6-b50c-4847-9ec0-4a1f8dc387ab', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fb07c6c6-b50c-4847-9ec0-4a1f8dc387ab', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fb07c6c6-b50c-4847-9ec0-4a1f8dc387ab', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fb07c6c6-b50c-4847-9ec0-4a1f8dc387ab', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fb07c6c6-b50c-4847-9ec0-4a1f8dc387ab', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fb07c6c6-b50c-4847-9ec0-4a1f8dc387ab', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fd26ccb9-ae1f-4cce-9eae-bb99cb303123', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fd26ccb9-ae1f-4cce-9eae-bb99cb303123', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fd26ccb9-ae1f-4cce-9eae-bb99cb303123', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fd26ccb9-ae1f-4cce-9eae-bb99cb303123', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fd26ccb9-ae1f-4cce-9eae-bb99cb303123', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fd26ccb9-ae1f-4cce-9eae-bb99cb303123', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('210aed9f-5104-4768-aa5c-3137d94710cc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('210aed9f-5104-4768-aa5c-3137d94710cc', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('210aed9f-5104-4768-aa5c-3137d94710cc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('210aed9f-5104-4768-aa5c-3137d94710cc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('210aed9f-5104-4768-aa5c-3137d94710cc', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('210aed9f-5104-4768-aa5c-3137d94710cc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fae61803-124d-431e-9e07-c05d40c19ab9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fae61803-124d-431e-9e07-c05d40c19ab9', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fae61803-124d-431e-9e07-c05d40c19ab9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fae61803-124d-431e-9e07-c05d40c19ab9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fae61803-124d-431e-9e07-c05d40c19ab9', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fae61803-124d-431e-9e07-c05d40c19ab9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('af2f8919-5052-4cc4-abe6-fa4a62515002', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('af2f8919-5052-4cc4-abe6-fa4a62515002', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('af2f8919-5052-4cc4-abe6-fa4a62515002', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('af2f8919-5052-4cc4-abe6-fa4a62515002', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('af2f8919-5052-4cc4-abe6-fa4a62515002', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('af2f8919-5052-4cc4-abe6-fa4a62515002', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('97544f24-81f9-4651-8658-4433e781afc8', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('1d62cf03-05ef-480f-a902-51dddab77ce6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1d62cf03-05ef-480f-a902-51dddab77ce6', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('1d62cf03-05ef-480f-a902-51dddab77ce6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1d62cf03-05ef-480f-a902-51dddab77ce6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('1d62cf03-05ef-480f-a902-51dddab77ce6', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('1d62cf03-05ef-480f-a902-51dddab77ce6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('78841a96-95ae-47e6-bcc9-b6489d111b2d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('78841a96-95ae-47e6-bcc9-b6489d111b2d', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('78841a96-95ae-47e6-bcc9-b6489d111b2d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('78841a96-95ae-47e6-bcc9-b6489d111b2d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('78841a96-95ae-47e6-bcc9-b6489d111b2d', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('78841a96-95ae-47e6-bcc9-b6489d111b2d', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('941df9d1-cb47-4062-bef8-dbb47680c57e', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('941df9d1-cb47-4062-bef8-dbb47680c57e', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('941df9d1-cb47-4062-bef8-dbb47680c57e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('941df9d1-cb47-4062-bef8-dbb47680c57e', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('941df9d1-cb47-4062-bef8-dbb47680c57e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('258bbfe2-f141-442e-affc-89577098ec18', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('258bbfe2-f141-442e-affc-89577098ec18', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('258bbfe2-f141-442e-affc-89577098ec18', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('258bbfe2-f141-442e-affc-89577098ec18', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('258bbfe2-f141-442e-affc-89577098ec18', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('80991a76-2f28-4326-a192-bd1f356a4ea1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('80991a76-2f28-4326-a192-bd1f356a4ea1', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('80991a76-2f28-4326-a192-bd1f356a4ea1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('80991a76-2f28-4326-a192-bd1f356a4ea1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('80991a76-2f28-4326-a192-bd1f356a4ea1', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('80991a76-2f28-4326-a192-bd1f356a4ea1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('f6f34b4c-ba1c-46ec-bf26-31cf525da34d', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('f6f34b4c-ba1c-46ec-bf26-31cf525da34d', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('f6f34b4c-ba1c-46ec-bf26-31cf525da34d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f6f34b4c-ba1c-46ec-bf26-31cf525da34d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('f6f34b4c-ba1c-46ec-bf26-31cf525da34d', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('f6f34b4c-ba1c-46ec-bf26-31cf525da34d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b5c9ef45-c554-48ba-993c-08dd744b2a52', 'false', 'single');
INSERT INTO public.protocol_mapper_config VALUES ('b5c9ef45-c554-48ba-993c-08dd744b2a52', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config VALUES ('b5c9ef45-c554-48ba-993c-08dd744b2a52', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config VALUES ('0000eb46-f1b9-45b4-bb87-a881566caeeb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0000eb46-f1b9-45b4-bb87-a881566caeeb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0000eb46-f1b9-45b4-bb87-a881566caeeb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e4a7f12f-545b-4b87-a04e-a57c8e41946a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e4a7f12f-545b-4b87-a04e-a57c8e41946a', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('e4a7f12f-545b-4b87-a04e-a57c8e41946a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e4a7f12f-545b-4b87-a04e-a57c8e41946a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('e4a7f12f-545b-4b87-a04e-a57c8e41946a', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('e4a7f12f-545b-4b87-a04e-a57c8e41946a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0fe96974-3caa-4190-95a8-de139b760437', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0fe96974-3caa-4190-95a8-de139b760437', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0fe96974-3caa-4190-95a8-de139b760437', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0fe96974-3caa-4190-95a8-de139b760437', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0fe96974-3caa-4190-95a8-de139b760437', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0fe96974-3caa-4190-95a8-de139b760437', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('48fcce08-1843-4c08-955d-f342e22f35de', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48fcce08-1843-4c08-955d-f342e22f35de', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('48fcce08-1843-4c08-955d-f342e22f35de', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48fcce08-1843-4c08-955d-f342e22f35de', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('48fcce08-1843-4c08-955d-f342e22f35de', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('48fcce08-1843-4c08-955d-f342e22f35de', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('275ae23c-3646-4a28-9249-d88bb5bc92fa', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('275ae23c-3646-4a28-9249-d88bb5bc92fa', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('275ae23c-3646-4a28-9249-d88bb5bc92fa', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('275ae23c-3646-4a28-9249-d88bb5bc92fa', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('275ae23c-3646-4a28-9249-d88bb5bc92fa', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('275ae23c-3646-4a28-9249-d88bb5bc92fa', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('fb57d982-58b5-456a-bf46-0c2c61965937', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fb57d982-58b5-456a-bf46-0c2c61965937', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('fb57d982-58b5-456a-bf46-0c2c61965937', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fb57d982-58b5-456a-bf46-0c2c61965937', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('fb57d982-58b5-456a-bf46-0c2c61965937', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('fb57d982-58b5-456a-bf46-0c2c61965937', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('7d0136fa-c7d2-4d5c-ad68-fedfb0a3327f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7d0136fa-c7d2-4d5c-ad68-fedfb0a3327f', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('7d0136fa-c7d2-4d5c-ad68-fedfb0a3327f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7d0136fa-c7d2-4d5c-ad68-fedfb0a3327f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('7d0136fa-c7d2-4d5c-ad68-fedfb0a3327f', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('7d0136fa-c7d2-4d5c-ad68-fedfb0a3327f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('b310a046-caba-4ed0-aab3-d5d4d72bae82', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b310a046-caba-4ed0-aab3-d5d4d72bae82', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('b310a046-caba-4ed0-aab3-d5d4d72bae82', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b310a046-caba-4ed0-aab3-d5d4d72bae82', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('b310a046-caba-4ed0-aab3-d5d4d72bae82', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('b310a046-caba-4ed0-aab3-d5d4d72bae82', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('2b41a212-ff51-43c1-b205-35983e4c7877', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2b41a212-ff51-43c1-b205-35983e4c7877', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('2b41a212-ff51-43c1-b205-35983e4c7877', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2b41a212-ff51-43c1-b205-35983e4c7877', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('2b41a212-ff51-43c1-b205-35983e4c7877', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('2b41a212-ff51-43c1-b205-35983e4c7877', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0435253a-327f-46c8-9a67-c85264803eba', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0435253a-327f-46c8-9a67-c85264803eba', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0435253a-327f-46c8-9a67-c85264803eba', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0435253a-327f-46c8-9a67-c85264803eba', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0435253a-327f-46c8-9a67-c85264803eba', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0435253a-327f-46c8-9a67-c85264803eba', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('abadf5ba-b61c-48eb-b55e-dec67224457d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('abadf5ba-b61c-48eb-b55e-dec67224457d', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('abadf5ba-b61c-48eb-b55e-dec67224457d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('abadf5ba-b61c-48eb-b55e-dec67224457d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('abadf5ba-b61c-48eb-b55e-dec67224457d', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('abadf5ba-b61c-48eb-b55e-dec67224457d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c5819b66-1f61-41e8-86bf-2b58ac821a3e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c5819b66-1f61-41e8-86bf-2b58ac821a3e', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('c5819b66-1f61-41e8-86bf-2b58ac821a3e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c5819b66-1f61-41e8-86bf-2b58ac821a3e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c5819b66-1f61-41e8-86bf-2b58ac821a3e', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c5819b66-1f61-41e8-86bf-2b58ac821a3e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8b3af344-9a7a-4f07-96ff-ebbc3de9c835', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8b3af344-9a7a-4f07-96ff-ebbc3de9c835', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8b3af344-9a7a-4f07-96ff-ebbc3de9c835', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8b3af344-9a7a-4f07-96ff-ebbc3de9c835', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8b3af344-9a7a-4f07-96ff-ebbc3de9c835', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8b3af344-9a7a-4f07-96ff-ebbc3de9c835', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('d0ddcb55-5263-4b43-b963-fabed19537b6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d0ddcb55-5263-4b43-b963-fabed19537b6', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('d0ddcb55-5263-4b43-b963-fabed19537b6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d0ddcb55-5263-4b43-b963-fabed19537b6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('d0ddcb55-5263-4b43-b963-fabed19537b6', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('d0ddcb55-5263-4b43-b963-fabed19537b6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('cc4d7e16-9451-4785-8e44-1aa2ef34f1aa', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cc4d7e16-9451-4785-8e44-1aa2ef34f1aa', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('cc4d7e16-9451-4785-8e44-1aa2ef34f1aa', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cc4d7e16-9451-4785-8e44-1aa2ef34f1aa', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('cc4d7e16-9451-4785-8e44-1aa2ef34f1aa', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('cc4d7e16-9451-4785-8e44-1aa2ef34f1aa', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('a3885321-59e3-4486-8dee-e6dcf522fa26', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a3885321-59e3-4486-8dee-e6dcf522fa26', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('a3885321-59e3-4486-8dee-e6dcf522fa26', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a3885321-59e3-4486-8dee-e6dcf522fa26', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('a3885321-59e3-4486-8dee-e6dcf522fa26', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('a3885321-59e3-4486-8dee-e6dcf522fa26', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('3c20690f-8681-4848-9450-c6dda9a84114', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config VALUES ('8a4766e4-8ee4-45e3-a8a4-5a0d24a7b791', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8a4766e4-8ee4-45e3-a8a4-5a0d24a7b791', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8a4766e4-8ee4-45e3-a8a4-5a0d24a7b791', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8a4766e4-8ee4-45e3-a8a4-5a0d24a7b791', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8a4766e4-8ee4-45e3-a8a4-5a0d24a7b791', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8a4766e4-8ee4-45e3-a8a4-5a0d24a7b791', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('27c37aa9-3b11-4876-8944-1c5ada01a29d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27c37aa9-3b11-4876-8944-1c5ada01a29d', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('27c37aa9-3b11-4876-8944-1c5ada01a29d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27c37aa9-3b11-4876-8944-1c5ada01a29d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('27c37aa9-3b11-4876-8944-1c5ada01a29d', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('27c37aa9-3b11-4876-8944-1c5ada01a29d', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('8d90d33a-464a-43b2-9617-77ae7a30705b', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('8d90d33a-464a-43b2-9617-77ae7a30705b', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('8d90d33a-464a-43b2-9617-77ae7a30705b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('8d90d33a-464a-43b2-9617-77ae7a30705b', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('8d90d33a-464a-43b2-9617-77ae7a30705b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('88a2aa6a-be2f-4157-b03f-af9439c02c17', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('88a2aa6a-be2f-4157-b03f-af9439c02c17', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('88a2aa6a-be2f-4157-b03f-af9439c02c17', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('88a2aa6a-be2f-4157-b03f-af9439c02c17', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('88a2aa6a-be2f-4157-b03f-af9439c02c17', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('70b7f407-3fae-4d43-9bdf-9f3946b838d8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('70b7f407-3fae-4d43-9bdf-9f3946b838d8', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('70b7f407-3fae-4d43-9bdf-9f3946b838d8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('70b7f407-3fae-4d43-9bdf-9f3946b838d8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('70b7f407-3fae-4d43-9bdf-9f3946b838d8', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('70b7f407-3fae-4d43-9bdf-9f3946b838d8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('9405ad01-bde6-4802-bb68-9d1024fd4fb6', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config VALUES ('9405ad01-bde6-4802-bb68-9d1024fd4fb6', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('9405ad01-bde6-4802-bb68-9d1024fd4fb6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9405ad01-bde6-4802-bb68-9d1024fd4fb6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('9405ad01-bde6-4802-bb68-9d1024fd4fb6', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('9405ad01-bde6-4802-bb68-9d1024fd4fb6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0b84ffb4-87ea-475c-82de-a612ee549ed2', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0b84ffb4-87ea-475c-82de-a612ee549ed2', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config VALUES ('0b84ffb4-87ea-475c-82de-a612ee549ed2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0b84ffb4-87ea-475c-82de-a612ee549ed2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0b84ffb4-87ea-475c-82de-a612ee549ed2', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0b84ffb4-87ea-475c-82de-a612ee549ed2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('0f59596b-48bb-4e98-ad77-8d4ef25c1d81', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('0f59596b-48bb-4e98-ad77-8d4ef25c1d81', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0f59596b-48bb-4e98-ad77-8d4ef25c1d81', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('0f59596b-48bb-4e98-ad77-8d4ef25c1d81', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('0f59596b-48bb-4e98-ad77-8d4ef25c1d81', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('c95528b5-9bcf-4de0-85ae-bc15f96f8513', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('c95528b5-9bcf-4de0-85ae-bc15f96f8513', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c95528b5-9bcf-4de0-85ae-bc15f96f8513', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('c95528b5-9bcf-4de0-85ae-bc15f96f8513', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('c95528b5-9bcf-4de0-85ae-bc15f96f8513', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config VALUES ('34a64a76-22cb-4d86-b24a-a98ed74677e7', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config VALUES ('34a64a76-22cb-4d86-b24a-a98ed74677e7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('34a64a76-22cb-4d86-b24a-a98ed74677e7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config VALUES ('34a64a76-22cb-4d86-b24a-a98ed74677e7', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config VALUES ('34a64a76-22cb-4d86-b24a-a98ed74677e7', 'String', 'jsonType.label');


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.realm VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '8204dc19-85b4-4cc9-a4f9-f69ff7cf2700', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'e1805c4a-36e5-4f22-b511-bbde0f1b8fd0', '86d95d5f-cbce-4ac3-831e-c8283096c3df', '212a6252-4a6e-4177-a08f-0c60c51016c3', '522f688b-1080-4f50-af94-047d65027c8a', '480f66b1-2255-4f45-9a31-f6a9383b597d', 2592000, false, 900, true, false, 'e6f0b445-efb2-4347-b555-a349f44e7bef', 0, false, 0, 0);
INSERT INTO public.realm VALUES ('simplywall', 60, 300, 86400, NULL, NULL, NULL, true, false, 0, NULL, 'simplywall', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '1e13d876-f1a0-4a6d-8fac-f0726ec1c55c', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '5b87f440-6495-4c40-b2f4-bf05bfabff75', '0cb8789c-5cc3-4386-8290-a309e51abd15', '18e396c1-7c2f-40cb-94ed-0e84a6907520', 'e8ac0d9b-acd3-4f2a-871b-7daace54f981', '730e5c67-426b-4329-801c-8c00171761c3', 2592000, false, 86400, true, false, '14ab1a5b-3fe4-44f3-919b-e4cd71707536', 0, false, 0, 0);


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'master');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'master');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'master');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'master');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '60', 'master');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'master');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'master');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '30', 'master');
INSERT INTO public.realm_attribute VALUES ('displayName', 'Keycloak', 'master');
INSERT INTO public.realm_attribute VALUES ('displayNameHtml', '<div class="kc-logo-text"><span>Keycloak</span></div>', 'master');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'master');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'master');
INSERT INTO public.realm_attribute VALUES ('bruteForceProtected', 'false', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('permanentLockout', 'false', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('maxFailureWaitSeconds', '900', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('minimumQuickLoginWaitSeconds', '60', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('waitIncrementSeconds', '60', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('quickLoginCheckMilliSeconds', '1000', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('maxDeltaTimeSeconds', '43200', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('failureFactor', '30', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('actionTokenGeneratedByUserLifespan', '300', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('offlineSessionMaxLifespan', '5184000', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('clientSessionIdleTimeout', '0', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('clientSessionMaxLifespan', '0', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionIdleTimeout', '0', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('clientOfflineSessionMaxLifespan', '0', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityName', 'keycloak', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithms', 'ES256', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpId', '', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKey', 'not specified', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirement', 'not specified', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeout', '0', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRpIdPasswordless', '', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '0', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xRobotsTag', 'none', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'simplywall');
INSERT INTO public.realm_attribute VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'simplywall');


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.realm_default_roles VALUES ('master', '56c0c9b8-ce63-42be-a816-10965f38f607');
INSERT INTO public.realm_default_roles VALUES ('master', 'c9020303-35e3-4889-80cf-bfed3551a07a');
INSERT INTO public.realm_default_roles VALUES ('simplywall', '9acc730a-dc8a-415c-991c-3c3a8e90b2b6');
INSERT INTO public.realm_default_roles VALUES ('simplywall', 'e472f42c-7680-4399-968e-adb5928b159c');


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.realm_events_listeners VALUES ('master', 'jboss-logging');
INSERT INTO public.realm_events_listeners VALUES ('simplywall', 'jboss-logging');


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'master');
INSERT INTO public.realm_required_credential VALUES ('password', 'password', true, true, 'simplywall');


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.redirect_uris VALUES ('46be1b9a-6d0d-4923-bf12-de0ee25bd488', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', '/realms/master/account/*');
INSERT INTO public.redirect_uris VALUES ('62064bd3-182d-4043-b272-2984019094a6', '/admin/master/console/*');
INSERT INTO public.redirect_uris VALUES ('b3b41b25-99bc-42d5-a76d-216004e7e84d', '/realms/simplywall/account/*');
INSERT INTO public.redirect_uris VALUES ('7398983c-678e-4702-aada-4803e6effb4b', '/realms/simplywall/account/*');
INSERT INTO public.redirect_uris VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', '/admin/simplywall/console/*');
INSERT INTO public.redirect_uris VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', 'http://localhost:3000/*');


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.required_action_provider VALUES ('7fde72a1-12ce-4fed-84a8-a46d69861540', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('6abeef44-b41c-44cb-bf08-469f9f0b96f1', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('784e2463-2a6a-45d6-ae1e-aee688fb0695', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('15ed0649-a096-4a94-9bc5-e3df85711400', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('3f4f2568-475e-49e8-8a26-93950076d073', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('0cc882d9-66f0-4a05-a006-85607b13a193', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider VALUES ('665bdee1-1730-4298-ad79-0b3f240b68f6', 'VERIFY_EMAIL', 'Verify Email', 'simplywall', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider VALUES ('9dc9de88-8697-4b68-8aa5-a8f71fb3b7ff', 'UPDATE_PROFILE', 'Update Profile', 'simplywall', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider VALUES ('5e01f838-099d-4855-87c8-b44e475efe7f', 'CONFIGURE_TOTP', 'Configure OTP', 'simplywall', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider VALUES ('ebe9e3b5-4442-417c-ab1d-dd0bac10b941', 'UPDATE_PASSWORD', 'Update Password', 'simplywall', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider VALUES ('f8c8b47d-687c-490a-85fa-a64313447bf4', 'terms_and_conditions', 'Terms and Conditions', 'simplywall', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider VALUES ('84868e87-d3a1-472f-bdcb-9103a79635ef', 'update_user_locale', 'Update User Locale', 'simplywall', true, false, 'update_user_locale', 1000);


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.scope_mapping VALUES ('d745efd2-9a7a-4a52-83ec-2537b2750605', 'b562a42b-9322-4743-a5bc-6c6b0f870e12');
INSERT INTO public.scope_mapping VALUES ('7398983c-678e-4702-aada-4803e6effb4b', '4122f892-75f6-46ff-b96c-efd1d68ab02b');


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: sws_company; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.sws_company VALUES ('46b285bc-b25f-4814-985c-390a4bfa2023', 'Afterpay', 'APT', 'ASX', 'ASX:APT', '2020-05-24 11:01:59', 'Ordinary Shares', 'AU', 'AUD', '/stocks/au/software/asx-apt/afterpay-shares', 'asx-apt', 26507, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('4be2c01f-f390-479c-a166-8e0dd73cf7b9', 'BHP Group', 'BHP', 'ASX', 'ASX:BHP', '2020-05-24 10:36:54', 'LTD Ordinary Shares', 'AU', 'AUD', '/stocks/au/materials/asx-bhp/bhp-group-shares', 'asx-bhp', 1895, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('fc7b296b-300b-4710-8f84-d68a5bfbc75b', 'Telstra', 'TLS', 'ASX', 'ASX:TLS', '2020-05-23 14:07:15', 'Ordinary Shares', 'AU', 'AUD', '/stocks/au/telecom/asx-tls/telstra-shares', 'asx-tls', 1, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('743f0744-8987-4339-b565-dee3a93e9934', 'Apple', 'AAPL', 'NasdaqGS', 'NasdaqGS:AAPL', '2020-05-24 02:20:41', 'Common Stock', 'US', 'USD', '/stocks/us/tech/nasdaq-aapl/apple', 'nasdaq-aapl', 162, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('d0665877-9ec5-4568-8a29-e8fff77df072', 'Amazon.com', 'AMZ', 'NasdaqGS', 'NasdaqGS:AMZ', '2020-05-24 02:31:18', 'Common Stock', 'US', 'USD', '/stocks/us/retail/nasdaq-amzn/amazoncom', 'nasdaq-amz', 33, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 'Facebook', 'FB', 'NasdaqGS', 'NasdaqGS:FB', '2020-05-24 04:51:37', 'Class A Common Stock', 'US', 'USD', '/stocks/us/media/nasdaq-fb/facebook', 'nasdaq-fb', 17129, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('424eb65e-8c34-42bf-a107-61f93d4e9e6d', 'Microsoft', 'MSFT', 'NasdaqGS', 'NasdaqGS:MSFT', '2020-05-24 03:39:14', 'Common Stock', 'US', 'USD', '/stocks/us/software/nasdaq-msft/microsoft', 'nasdaq-msft', 81, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 'Tesla', 'TSLA', 'NasdaqGS', 'NasdaqGS:TSLA', '2020-05-23 08:32:49', 'Common Stock', 'US', 'USD', '/stocks/us/automobiles/nasdaq-tsla/tesla', 'nasdaq-tsla', 18906, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('c8250615-877a-4ae1-bef3-636b69cd83e8', 'Alibaba Group Holding', 'BABA', 'NYSE', 'NYSE:BABA', '2020-05-24 06:23:25', 'ADS EACH REPR 1 ORD SHS (SPON) (CDI)', 'US', 'USD', '/stocks/us/retail/nyse-baba/alibaba-group-holding', 'nyse-baba', 21152, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 'Delta Air Lines', 'DAL', 'NYSE', 'NYSE:DAL', '2020-05-23 03:14:10', 'Common Stock', 'US', 'USD', '/stocks/us/transportation/nyse-dal/delta-air-lines', 'nyse-dal', 2038, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('a0a1a293-fda8-48df-9ebf-35556cde3235', 'Walt Disney', 'DIS', 'NYSE', 'NYSE:DIS', '2020-05-24 02:40:27', 'Common Shares', 'US', 'USD', '/stocks/us/media/nyse-dis/walt-disney', 'nyse-dis', 1629, NULL, NULL, NULL);
INSERT INTO public.sws_company VALUES ('3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 'Pfizer', 'PFE', 'NYSE', 'NYSE:PFE', '2020-05-24 02:48:09', 'Common Stock', 'US', 'USD', '/stocks/us/pharmaceuticals-biotech/nyse-pfe/pfizer', 'nyse-pfe', 1471, NULL, NULL, NULL);


--
-- Data for Name: sws_company_score; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.sws_company_score VALUES (26507, '46b285bc-b25f-4814-985c-390a4bfa2023', '2020-05-24 11:06:28', 0, 5, 4, 0, 0, 0, 0, 9, 'High growth potential with adequate balance sheet.');
INSERT INTO public.sws_company_score VALUES (1895, '4be2c01f-f390-479c-a166-8e0dd73cf7b9', '2020-05-24 10:37:17', 4, 0, 3, 0, 4, 1, 0, 12, 'Proven track record average dividend payer.');
INSERT INTO public.sws_company_score VALUES (1, 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', '2020-05-23 23:24:24', 3, 0, 3, 0, 0, 4, 0, 10, 'Good value with mediocre balance sheet.');
INSERT INTO public.sws_company_score VALUES (162, '743f0744-8987-4339-b565-dee3a93e9934', '2020-05-23 08:55:04', 2, 2, 3, 0, 2, 0, 0, 9, 'Mediocre balance sheet with limited growth.');
INSERT INTO public.sws_company_score VALUES (33, 'd0665877-9ec5-4568-8a29-e8fff77df072', '2020-05-24 02:31:42', 0, 5, 6, 0, 2, 0, 0, 13, 'Flawless balance sheet with high growth potential.');
INSERT INTO public.sws_company_score VALUES (17129, '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', '2020-05-24 04:52:01', 0, 2, 6, 0, 3, 0, 0, 11, 'Flawless balance sheet with acceptable track record.');
INSERT INTO public.sws_company_score VALUES (81, '424eb65e-8c34-42bf-a107-61f93d4e9e6d', '2020-05-24 09:46:23', 4, 3, 4, 0, 6, 1, 0, 18, 'Outstanding track record with adequate balance sheet and pays a dividend.');
INSERT INTO public.sws_company_score VALUES (18906, '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', '2020-05-22 17:01:53', 0, 6, 5, 0, 0, 0, 0, 11, 'Exceptional growth potential with excellent balance sheet.');
INSERT INTO public.sws_company_score VALUES (21152, 'c8250615-877a-4ae1-bef3-636b69cd83e8', '2020-05-24 09:59:36', 0, 2, 6, 0, 5, 0, 0, 13, 'Flawless balance sheet with solid track record.');
INSERT INTO public.sws_company_score VALUES (2038, '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', '2020-05-22 02:44:24', 0, 6, 2, 0, 2, 5, 0, 15, 'Exceptional growth potential and undervalued.');
INSERT INTO public.sws_company_score VALUES (1629, 'a0a1a293-fda8-48df-9ebf-35556cde3235', '2020-05-24 03:48:49', 0, 4, 1, 0, 2, 1, 0, 8, 'Reasonable growth potential with questionable track record.');
INSERT INTO public.sws_company_score VALUES (1471, '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', '2020-05-24 02:48:44', 5, 2, 3, 0, 6, 4, 0, 20, 'Outstanding track record established dividend payer.');


--
-- Data for Name: sws_sompany_price_close; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', '46b285bc-b25f-4814-985c-390a4bfa2023', 15, '2020-03-25 01:01:16.796667', 1);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', '46b285bc-b25f-4814-985c-390a4bfa2023', 19.41, '2020-03-26 01:01:16.986667', 2);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', '46b285bc-b25f-4814-985c-390a4bfa2023', 19.1, '2020-03-27 02:45:22.516667', 3);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', '46b285bc-b25f-4814-985c-390a4bfa2023', 18.4, '2020-03-30 01:03:19.143333', 4);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', '46b285bc-b25f-4814-985c-390a4bfa2023', 18.8, '2020-03-31 01:01:12.043333', 5);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', '46b285bc-b25f-4814-985c-390a4bfa2023', 20.66, '2020-04-01 01:01:15.533333', 6);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', '46b285bc-b25f-4814-985c-390a4bfa2023', 20.15, '2020-04-02 01:01:19.06', 7);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', '46b285bc-b25f-4814-985c-390a4bfa2023', 19.55, '2020-04-03 01:01:20.983333', 8);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', '46b285bc-b25f-4814-985c-390a4bfa2023', 20.12, '2020-04-06 02:01:18.14', 9);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', '46b285bc-b25f-4814-985c-390a4bfa2023', 21.06, '2020-04-07 02:01:12.756667', 10);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', '46b285bc-b25f-4814-985c-390a4bfa2023', 19.88, '2020-04-08 02:01:18.533333', 11);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', '46b285bc-b25f-4814-985c-390a4bfa2023', 22, '2020-04-09 02:01:16.683333', 12);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', '46b285bc-b25f-4814-985c-390a4bfa2023', 28.4, '2020-04-14 02:01:56.093333', 13);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', '46b285bc-b25f-4814-985c-390a4bfa2023', 27.88, '2020-04-15 02:01:20.243333', 14);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', '46b285bc-b25f-4814-985c-390a4bfa2023', 27.28, '2020-04-16 02:01:19.78', 15);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', '46b285bc-b25f-4814-985c-390a4bfa2023', 29, '2020-04-17 02:01:09.426667', 16);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', '46b285bc-b25f-4814-985c-390a4bfa2023', 29, '2020-04-20 02:01:03.096667', 17);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', '46b285bc-b25f-4814-985c-390a4bfa2023', 27.32, '2020-04-21 02:00:56.296667', 18);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', '46b285bc-b25f-4814-985c-390a4bfa2023', 26.57, '2020-04-22 02:01:05.396667', 19);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', '46b285bc-b25f-4814-985c-390a4bfa2023', 27.15, '2020-04-23 02:00:23.666667', 20);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', '46b285bc-b25f-4814-985c-390a4bfa2023', 27.01, '2020-04-24 02:00:16.136667', 21);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', '46b285bc-b25f-4814-985c-390a4bfa2023', 27.75, '2020-04-27 02:04:19.753333', 22);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', '46b285bc-b25f-4814-985c-390a4bfa2023', 28.31, '2020-04-28 02:04:39.44', 23);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', '46b285bc-b25f-4814-985c-390a4bfa2023', 28.15, '2020-04-29 02:00:28.84', 24);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', '46b285bc-b25f-4814-985c-390a4bfa2023', 31.2, '2020-04-30 02:00:26.053333', 25);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', '46b285bc-b25f-4814-985c-390a4bfa2023', 29.16, '2020-05-01 02:00:29.416667', 26);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', '46b285bc-b25f-4814-985c-390a4bfa2023', 36.1, '2020-05-04 02:00:58.103333', 27);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', '46b285bc-b25f-4814-985c-390a4bfa2023', 38.18, '2020-05-05 02:00:48.81', 28);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', '46b285bc-b25f-4814-985c-390a4bfa2023', 39.8, '2020-05-06 02:01:00.873333', 29);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', '46b285bc-b25f-4814-985c-390a4bfa2023', 39.5, '2020-05-07 02:00:48.82', 30);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', '46b285bc-b25f-4814-985c-390a4bfa2023', 39.88, '2020-05-08 02:00:56.11', 31);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', '46b285bc-b25f-4814-985c-390a4bfa2023', 42.17, '2020-05-11 02:01:35.3', 32);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', '46b285bc-b25f-4814-985c-390a4bfa2023', 41.68, '2020-05-12 02:01:07.45', 33);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', '46b285bc-b25f-4814-985c-390a4bfa2023', 43.46, '2020-05-13 02:00:32.033333', 34);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', '46b285bc-b25f-4814-985c-390a4bfa2023', 41.65, '2020-05-14 02:00:37.526667', 35);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', '46b285bc-b25f-4814-985c-390a4bfa2023', 41.2, '2020-05-15 02:01:55.5', 36);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', '46b285bc-b25f-4814-985c-390a4bfa2023', 42.31, '2020-05-18 02:01:07.33', 37);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', '46b285bc-b25f-4814-985c-390a4bfa2023', 42, '2020-05-19 02:01:03.533333', 38);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', '46b285bc-b25f-4814-985c-390a4bfa2023', 42.89, '2020-05-20 02:01:21.71', 39);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', '46b285bc-b25f-4814-985c-390a4bfa2023', 44, '2020-05-21 02:00:56.37', 40);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', '46b285bc-b25f-4814-985c-390a4bfa2023', 44.51, '2020-05-22 02:00:54.256667', 41);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.3, '2020-03-25 01:01:33.096667', 42);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.67, '2020-03-26 01:01:29.333333', 43);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 29.03, '2020-03-27 02:45:42.083333', 44);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.2, '2020-03-30 01:03:47.756667', 45);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 28.98, '2020-03-31 01:01:27.796667', 46);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.23, '2020-04-01 01:01:30.5', 47);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 29.85, '2020-04-02 01:01:35.193333', 48);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.33, '2020-04-03 01:01:34.056667', 49);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.79, '2020-04-06 02:01:34.743333', 50);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.7, '2020-04-07 02:01:25.253333', 51);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.32, '2020-04-08 02:01:35.52', 52);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.5, '2020-04-09 02:01:35.063333', 53);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.66, '2020-04-14 02:02:59', 54);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.43, '2020-04-15 02:01:38.68', 55);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.79, '2020-04-16 02:01:40.23', 56);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.28, '2020-04-17 02:01:21.816667', 57);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.82, '2020-04-20 02:01:24.743333', 58);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.05, '2020-04-21 02:01:21.456667', 59);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 28.97, '2020-04-22 02:01:27.03', 60);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 29.75, '2020-04-23 02:00:42.36', 61);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.54, '2020-04-24 02:00:34.366667', 62);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.5, '2020-04-27 02:04:35.876667', 63);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.49, '2020-04-28 02:04:53.593333', 64);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.12, '2020-04-29 02:00:43.57', 65);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 32.35, '2020-04-30 02:00:37.693333', 66);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 29.84, '2020-05-01 02:00:52.12', 67);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 29.88, '2020-05-04 02:01:20.82', 68);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.69, '2020-05-05 02:01:12.22', 69);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.41, '2020-05-06 02:01:23.08', 70);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31, '2020-05-07 02:01:10.763333', 71);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.4, '2020-05-08 02:01:22.58', 72);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.55, '2020-05-11 02:01:51.716667', 73);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.72, '2020-05-12 02:01:29.03', 74);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.01, '2020-05-13 02:00:52.046667', 75);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 30.61, '2020-05-14 02:00:55.743333', 76);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 31.67, '2020-05-15 02:02:20.85', 77);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 33.1, '2020-05-18 02:01:16.42', 78);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 35.05, '2020-05-19 02:01:14.05', 79);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 34.72, '2020-05-20 02:01:51.78', 80);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 34.51, '2020-05-21 02:01:08.363333', 81);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', '4be2c01f-f390-479c-a166-8e0dd73cf7b9', 34.32, '2020-05-22 02:01:05.056667', 82);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.16, '2020-03-25 01:01:46.73', 83);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.16, '2020-03-26 01:01:42.556667', 84);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.04, '2020-03-27 02:45:55.393333', 85);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.25, '2020-03-30 01:04:08.473333', 86);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.07, '2020-03-31 01:01:41.046667', 87);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.2, '2020-04-01 01:01:43.933333', 88);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.16, '2020-04-02 01:01:50.5', 89);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.11, '2020-04-03 01:01:46.076667', 90);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.2, '2020-04-06 02:01:46.86', 91);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.13, '2020-04-07 02:01:39.57', 92);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.1, '2020-04-08 02:01:50.843333', 93);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.14, '2020-04-09 02:01:50.93', 94);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.16, '2020-04-14 02:03:59.95', 95);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.12, '2020-04-15 02:01:58.743333', 96);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.15, '2020-04-16 02:01:56.776667', 97);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.16, '2020-04-17 02:01:42.073333', 98);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.09, '2020-04-20 02:01:39.203333', 99);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.04, '2020-04-21 02:01:37.17', 100);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.03, '2020-04-22 02:01:42.24', 101);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.02, '2020-04-23 02:00:56.876667', 102);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.05, '2020-04-24 02:00:50.573333', 103);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.08, '2020-04-27 02:04:48.75', 104);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.07, '2020-04-28 02:05:04.87', 105);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.05, '2020-04-29 02:00:53', 106);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.05, '2020-04-30 02:00:49.393333', 107);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 2.99, '2020-05-01 02:01:11.333333', 108);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.08, '2020-05-04 02:01:40.86', 109);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.09, '2020-05-05 02:01:28.76', 110);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.06, '2020-05-06 02:01:39.543333', 111);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.06, '2020-05-07 02:01:24.73', 112);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.03, '2020-05-08 02:01:41.22', 113);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.07, '2020-05-11 02:02:03.036667', 114);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.09, '2020-05-12 02:01:49.77', 115);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.13, '2020-05-13 02:01:06.41', 116);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.12, '2020-05-14 02:01:09.3', 117);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.17, '2020-05-15 02:02:32.11', 118);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.12, '2020-05-18 02:01:23.94', 119);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.11, '2020-05-19 02:01:25.21', 120);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.1, '2020-05-20 02:02:19.256667', 121);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.09, '2020-05-21 02:01:17.133333', 122);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', 'fc7b296b-300b-4710-8f84-d68a5bfbc75b', 3.06, '2020-05-22 02:01:14.43', 123);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', '743f0744-8987-4339-b565-dee3a93e9934', 245.52, '2020-03-25 16:02:26.55', 124);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', '743f0744-8987-4339-b565-dee3a93e9934', 258.46, '2020-03-26 16:02:23.846667', 125);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', '743f0744-8987-4339-b565-dee3a93e9934', 247.74, '2020-03-27 16:02:22.606667', 126);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', '743f0744-8987-4339-b565-dee3a93e9934', 254.81, '2020-03-30 16:02:35.123333', 127);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', '743f0744-8987-4339-b565-dee3a93e9934', 253.12, '2020-03-31 16:02:28.543333', 128);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', '743f0744-8987-4339-b565-dee3a93e9934', 240.91, '2020-04-01 16:02:20.433333', 129);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', '743f0744-8987-4339-b565-dee3a93e9934', 244.93, '2020-04-02 16:02:28.976667', 130);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', '743f0744-8987-4339-b565-dee3a93e9934', 241.41, '2020-04-03 16:02:27.29', 131);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', '743f0744-8987-4339-b565-dee3a93e9934', 262.47, '2020-04-06 16:02:36.72', 132);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', '743f0744-8987-4339-b565-dee3a93e9934', 259.43, '2020-04-07 16:02:30.726667', 133);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', '743f0744-8987-4339-b565-dee3a93e9934', 266.07, '2020-04-08 16:02:42.31', 134);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', '743f0744-8987-4339-b565-dee3a93e9934', 267.99, '2020-04-09 16:02:20.71', 135);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', '743f0744-8987-4339-b565-dee3a93e9934', 273.25, '2020-04-13 16:02:55.19', 136);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', '743f0744-8987-4339-b565-dee3a93e9934', 287.05, '2020-04-14 16:02:49.153333', 137);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', '743f0744-8987-4339-b565-dee3a93e9934', 284.43, '2020-04-15 16:02:44.24', 138);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', '743f0744-8987-4339-b565-dee3a93e9934', 286.69, '2020-04-16 16:02:33.123333', 139);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', '743f0744-8987-4339-b565-dee3a93e9934', 282.8, '2020-04-17 16:02:06.143333', 140);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', '743f0744-8987-4339-b565-dee3a93e9934', 276.93, '2020-04-20 16:02:24.67', 141);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', '743f0744-8987-4339-b565-dee3a93e9934', 268.37, '2020-04-21 16:02:11.676667', 142);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', '743f0744-8987-4339-b565-dee3a93e9934', 275.76, '2020-04-22 16:02:11.263333', 143);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', '743f0744-8987-4339-b565-dee3a93e9934', 275.03, '2020-04-23 16:01:32.763333', 144);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', '743f0744-8987-4339-b565-dee3a93e9934', 282.97, '2020-04-24 16:01:31.443333', 145);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', '743f0744-8987-4339-b565-dee3a93e9934', 283.17, '2020-04-27 16:01:31.58', 146);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', '743f0744-8987-4339-b565-dee3a93e9934', 278.58, '2020-04-28 16:01:37.92', 147);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', '743f0744-8987-4339-b565-dee3a93e9934', 287.73, '2020-04-29 16:01:33.95', 148);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', '743f0744-8987-4339-b565-dee3a93e9934', 293.949, '2020-04-30 16:01:36.216667', 149);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', '743f0744-8987-4339-b565-dee3a93e9934', 289.07, '2020-05-01 16:17:13.21', 150);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', '743f0744-8987-4339-b565-dee3a93e9934', 293.16, '2020-05-04 16:02:12.34', 151);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', '743f0744-8987-4339-b565-dee3a93e9934', 297.56, '2020-05-05 16:02:10.523333', 152);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', '743f0744-8987-4339-b565-dee3a93e9934', 300.63, '2020-05-06 16:02:11.45', 153);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', '743f0744-8987-4339-b565-dee3a93e9934', 303.74, '2020-05-07 16:01:52.13', 154);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', '743f0744-8987-4339-b565-dee3a93e9934', 310.13, '2020-05-08 16:02:53.31', 155);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', '743f0744-8987-4339-b565-dee3a93e9934', 315.01, '2020-05-11 16:02:06.98', 156);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', '743f0744-8987-4339-b565-dee3a93e9934', 311.41, '2020-05-12 16:02:46.163333', 157);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', '743f0744-8987-4339-b565-dee3a93e9934', 307.65, '2020-05-13 16:01:53.04', 158);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', '743f0744-8987-4339-b565-dee3a93e9934', 309.54, '2020-05-14 16:02:10.16', 159);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', '743f0744-8987-4339-b565-dee3a93e9934', 307.691, '2020-05-15 16:02:34.253333', 160);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', '743f0744-8987-4339-b565-dee3a93e9934', 314.96, '2020-05-18 16:02:20.626667', 161);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', '743f0744-8987-4339-b565-dee3a93e9934', 313.14, '2020-05-19 16:01:48.72', 162);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', '743f0744-8987-4339-b565-dee3a93e9934', 319.23, '2020-05-20 16:02:11.146667', 163);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', '743f0744-8987-4339-b565-dee3a93e9934', 316.85, '2020-05-21 16:01:18.803333', 164);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', '743f0744-8987-4339-b565-dee3a93e9934', 318.89, '2020-05-22 16:01:37', 165);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1885.84, '2020-03-25 16:02:23.253333', 166);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1955.49, '2020-03-26 16:02:22.586667', 167);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1900.1, '2020-03-27 16:02:24.126667', 168);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1963.95, '2020-03-30 16:02:38.036667', 169);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1948.62, '2020-03-31 16:02:31.936667', 170);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1907.7, '2020-04-01 16:02:21.166667', 171);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1918.83, '2020-04-02 16:02:26.85', 172);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1906.59, '2020-04-03 16:02:28.786667', 173);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', 'd0665877-9ec5-4568-8a29-e8fff77df072', 1997.59, '2020-04-06 16:02:39.956667', 174);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2011.6, '2020-04-07 16:02:32.076667', 175);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2043, '2020-04-08 16:02:43.78', 176);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2042.76, '2020-04-09 16:02:23.036667', 177);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2168.87, '2020-04-13 16:02:56.9', 178);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2283.32, '2020-04-14 16:02:50.65', 179);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2307.68, '2020-04-15 16:02:45.383333', 180);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2408.19, '2020-04-16 16:02:34.013333', 181);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2375, '2020-04-17 16:02:08.546667', 182);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2393.61, '2020-04-20 16:02:26.97', 183);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2328.12, '2020-04-21 16:02:12.846667', 184);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2363.49, '2020-04-22 16:02:16.166667', 185);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2399.45, '2020-04-23 16:01:35.06', 186);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2410.22, '2020-04-24 16:01:34.9', 187);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2376, '2020-04-27 16:01:35.453333', 188);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2314.08, '2020-04-28 16:01:36.536667', 189);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2372.71, '2020-04-29 16:01:36.166667', 190);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2474, '2020-04-30 16:01:34.95', 191);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2286.04, '2020-05-01 16:17:15.666667', 192);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2315.99, '2020-05-04 16:02:14.666667', 193);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2317.8, '2020-05-05 16:02:12.966667', 194);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2351.26, '2020-05-06 16:02:12.926667', 195);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2367.61, '2020-05-07 16:01:55.883333', 196);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2379.61, '2020-05-08 16:02:55.77', 197);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2409, '2020-05-11 16:02:09.533333', 198);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2356.95, '2020-05-12 16:02:49.266667', 199);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2367.92, '2020-05-13 16:01:54.53', 200);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2388.85, '2020-05-14 16:02:11.32', 201);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2409.78, '2020-05-15 16:02:36.646667', 202);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2426.26, '2020-05-18 16:02:22.623333', 203);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2449.33, '2020-05-19 16:01:49.553333', 204);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2497.94, '2020-05-20 16:02:12.623333', 205);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2446.74, '2020-05-21 16:01:19.853333', 206);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', 'd0665877-9ec5-4568-8a29-e8fff77df072', 2436.88, '2020-05-22 16:01:38.18', 207);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 156.21, '2020-03-25 16:02:07.216667', 208);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 163.34, '2020-03-26 16:02:05.653333', 209);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 156.79, '2020-03-27 16:02:02.63', 210);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 165.95, '2020-03-30 16:02:11.75', 211);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 166.4, '2020-03-31 16:02:11.166667', 212);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 159.6, '2020-04-01 16:01:59.96', 213);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 158.19, '2020-04-02 16:02:05.953333', 214);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 154.18, '2020-04-03 16:02:07.13', 215);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 165.55, '2020-04-06 16:02:10.346667', 216);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 168.83, '2020-04-07 16:02:12.833333', 217);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 174.28, '2020-04-08 16:02:25.693333', 218);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 175.19, '2020-04-09 16:02:01.5', 219);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 174.79, '2020-04-13 16:02:29.106667', 220);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 178.17, '2020-04-14 16:02:29.213333', 221);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 176.97, '2020-04-15 16:02:26.03', 222);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 176.25, '2020-04-16 16:02:12.383333', 223);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 179.24, '2020-04-17 16:01:46.866667', 224);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 178.24, '2020-04-20 16:02:01.516667', 225);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 170.8, '2020-04-21 16:01:54.636667', 226);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 182.28, '2020-04-22 16:01:50.196667', 227);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 185.13, '2020-04-23 16:01:13.99', 228);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 190.07, '2020-04-24 16:01:13.246667', 229);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 187.5, '2020-04-27 16:01:13.44', 230);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 182.91, '2020-04-28 16:01:16.29', 231);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 194.19, '2020-04-29 16:01:12.893333', 232);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 204.349, '2020-04-30 16:01:12.126667', 233);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 202.27, '2020-05-01 16:16:54.886667', 234);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 205.26, '2020-05-04 16:01:52.93', 235);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 207.07, '2020-05-05 16:01:49.95', 236);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 208.47, '2020-05-06 16:01:54.333333', 237);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 211.26, '2020-05-07 16:01:35.496667', 238);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 212.35, '2020-05-08 16:02:31.19', 239);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 213.18, '2020-05-11 16:01:50', 240);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 210.1, '2020-05-12 16:02:27.91', 241);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 205.1, '2020-05-13 16:01:32.523333', 242);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 206.81, '2020-05-14 16:01:49.11', 243);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 210.88, '2020-05-15 16:02:20.266667', 244);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 213.19, '2020-05-18 16:02:08.15', 245);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 216.88, '2020-05-19 16:01:39.606667', 246);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 229.97, '2020-05-20 16:01:55.296667', 247);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 231.39, '2020-05-21 16:01:06.91', 248);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', '8acbc59a-0ec5-42d1-9f7b-6d31abd4421e', 234.91, '2020-05-22 16:01:19.283333', 249);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 146.92, '2020-03-25 16:02:04.65', 250);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 155.88, '2020-03-26 16:02:01.176667', 251);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 149.7, '2020-03-27 16:02:00.116667', 252);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 160.23, '2020-03-30 16:02:10.406667', 253);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 157.47, '2020-03-31 16:02:06.446667', 254);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 152.11, '2020-04-01 16:01:57.23', 255);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 155.26, '2020-04-02 16:02:05.033333', 256);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 153.9, '2020-04-03 16:02:05.48', 257);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 165.33, '2020-04-06 16:02:07.496667', 258);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 163.49, '2020-04-07 16:02:10.86', 259);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 165.13, '2020-04-08 16:02:19.95', 260);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 165.14, '2020-04-09 16:01:58.683333', 261);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 165.51, '2020-04-13 16:02:26.566667', 262);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 173.7, '2020-04-14 16:02:26.463333', 263);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 171.88, '2020-04-15 16:02:21.783333', 264);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 177.04, '2020-04-16 16:02:09.006667', 265);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 178.6, '2020-04-17 16:01:44.076667', 266);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 175.06, '2020-04-20 16:01:58.156667', 267);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 167.82, '2020-04-21 16:01:52.656667', 268);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 173.52, '2020-04-22 16:01:47.536667', 269);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 171.42, '2020-04-23 16:01:12.86', 270);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 174.55, '2020-04-24 16:01:10.296667', 271);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 174.05, '2020-04-27 16:01:11.01', 272);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 169.81, '2020-04-28 16:01:12.72', 273);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 177.43, '2020-04-29 16:01:10.4', 274);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 179.129, '2020-04-30 16:01:09.906667', 275);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 174.57, '2020-05-01 16:16:53.443333', 276);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 178.84, '2020-05-04 16:01:50.446667', 277);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 180.76, '2020-05-05 16:01:47.993333', 278);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 182.54, '2020-05-06 16:01:52.436667', 279);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 183.6, '2020-05-07 16:01:33.34', 280);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 184.68, '2020-05-08 16:02:28.603333', 281);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 186.74, '2020-05-11 16:01:46.243333', 282);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 182.51, '2020-05-12 16:02:25.803333', 283);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 179.75, '2020-05-13 16:01:34.99', 284);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 180.53, '2020-05-14 16:01:46.336667', 285);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 183.16, '2020-05-15 16:02:18.616667', 286);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 184.91, '2020-05-18 16:02:07.15', 287);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 183.63, '2020-05-19 16:01:37.06', 288);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 185.66, '2020-05-20 16:01:51.123333', 289);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 183.43, '2020-05-21 16:01:05.293333', 290);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', '424eb65e-8c34-42bf-a107-61f93d4e9e6d', 183.51, '2020-05-22 16:01:15.123333', 291);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 539.25, '2020-03-25 16:01:54.343333', 292);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 528.16, '2020-03-26 16:01:47.12', 293);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 514.36, '2020-03-27 16:01:45.246667', 294);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 502.13, '2020-03-30 16:01:51.13', 295);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 523.8715, '2020-03-31 16:01:49.643333', 296);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 481.56, '2020-04-01 16:01:43.626667', 297);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 454.47, '2020-04-02 16:01:52.243333', 298);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 480.01, '2020-04-03 16:01:54.196667', 299);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 516.24, '2020-04-06 16:01:50.853333', 300);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 545.45, '2020-04-07 16:02:00.656667', 301);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 548.84, '2020-04-08 16:02:10.056667', 302);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 573, '2020-04-09 16:01:47.893333', 303);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 650.95, '2020-04-13 16:02:14.503333', 304);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 709.89, '2020-04-14 16:02:07.63', 305);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 729.83, '2020-04-15 16:02:10.906667', 306);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 745.21, '2020-04-16 16:01:50.46', 307);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 753.89, '2020-04-17 16:01:28.25', 308);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 746.36, '2020-04-20 16:01:47.716667', 309);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 686.72, '2020-04-21 16:01:42.203333', 310);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 732.11, '2020-04-22 16:01:36.616667', 311);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 705.63, '2020-04-23 16:01:03.203333', 312);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 725.15, '2020-04-24 16:00:54.376667', 313);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 798.75, '2020-04-27 16:00:53.43', 314);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 769.12, '2020-04-28 16:01:03.126667', 315);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 800.51, '2020-04-29 16:00:53.643333', 316);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 781.88, '2020-04-30 16:01:00.383333', 317);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 701.32, '2020-05-01 16:16:38.226667', 318);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 761.19, '2020-05-04 16:01:38.126667', 319);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 768.21, '2020-05-05 16:01:37.35', 320);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 782.58, '2020-05-06 16:01:42.033333', 321);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 780.04, '2020-05-07 16:01:13.05', 322);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 819.42, '2020-05-08 16:02:09.366667', 323);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 811.29, '2020-05-11 16:01:32.326667', 324);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 809.41, '2020-05-12 16:02:14.51', 325);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 790.96, '2020-05-13 16:01:22.13', 326);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 803.33, '2020-05-14 16:01:30.26', 327);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 799.17, '2020-05-15 16:02:10.323333', 328);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 813.63, '2020-05-18 16:01:59.293333', 329);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 808, '2020-05-19 16:01:31.04', 330);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 815.56, '2020-05-20 16:01:31.143333', 331);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 827.6, '2020-05-21 16:00:57.963333', 332);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', '65dce5ea-70d6-417f-9cac-1eaa92fb7f1c', 816.88, '2020-05-22 16:01:01.303333', 333);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 188.56, '2020-03-25 16:02:34.466667', 334);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 195.32, '2020-03-26 16:02:19.95', 335);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 188.59, '2020-03-27 16:02:22.92', 336);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 191.27, '2020-03-30 16:02:31.603333', 337);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 194.48, '2020-03-31 16:02:31.513333', 338);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 187.56, '2020-04-01 16:02:23.2', 339);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 188.9, '2020-04-02 16:02:38.983333', 340);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 187.11, '2020-04-03 16:02:38.68', 341);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 196.45, '2020-04-06 16:02:34.723333', 342);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 198, '2020-04-07 16:02:47.32', 343);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 195.98, '2020-04-08 16:02:58.736667', 344);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 196.37, '2020-04-09 16:02:33.046667', 345);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 199.44, '2020-04-13 16:03:23.61', 346);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 204.78, '2020-04-14 16:03:08.57', 347);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 208.17, '2020-04-15 16:03:13.193333', 348);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 212.66, '2020-04-16 16:02:34.19', 349);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 209.5, '2020-04-17 16:02:12.236667', 350);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 212.13, '2020-04-20 16:02:16.356667', 351);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 207.34, '2020-04-21 16:02:29.826667', 352);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 209.96, '2020-04-22 16:02:17.093333', 353);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 205.24, '2020-04-23 16:01:40.203333', 354);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 204.36, '2020-04-24 16:01:34.19', 355);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 203.69, '2020-04-27 16:01:36.853333', 356);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 201.15, '2020-04-28 16:01:55.53', 357);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 206.7, '2020-04-29 16:01:32.79', 358);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 202.67, '2020-04-30 16:01:57.233333', 359);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 194.48, '2020-05-01 16:17:16.203333', 360);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 191.15, '2020-05-04 16:02:15.596667', 361);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 195.02, '2020-05-05 16:02:30.456667', 362);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 195.17, '2020-05-06 16:02:50.3', 363);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 196.49, '2020-05-07 16:01:53.453333', 364);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 201.19, '2020-05-08 16:02:50.14', 365);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 205.4, '2020-05-11 16:02:13.546667', 366);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 200.31, '2020-05-12 16:02:59.21', 367);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 199.46, '2020-05-13 16:02:20.16', 368);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 201.3, '2020-05-14 16:02:04.3', 369);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 203.68, '2020-05-15 16:02:35.996667', 370);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 215.28, '2020-05-18 16:02:27.093333', 371);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 217.2, '2020-05-19 16:02:07.496667', 372);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 216.79, '2020-05-20 16:02:45.763333', 373);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 212.16, '2020-05-21 16:01:26.78', 374);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', 'c8250615-877a-4ae1-bef3-636b69cd83e8', 199.7, '2020-05-22 16:01:26.71', 375);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 31.1, '2020-03-25 16:02:58.31', 376);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 31.7, '2020-03-26 16:02:56.72', 377);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 29.55, '2020-03-27 16:03:02.863333', 378);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 28.67, '2020-03-30 16:03:09.846667', 379);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 28.53, '2020-03-31 16:03:15.966667', 380);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 23.87, '2020-04-01 16:03:01.203333', 381);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.68, '2020-04-02 16:03:18.81', 382);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.48, '2020-04-03 16:03:07.883333', 383);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.32, '2020-04-06 16:03:11.586667', 384);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.25, '2020-04-07 16:03:11.58', 385);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 23.23, '2020-04-08 16:03:25.686667', 386);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 24.39, '2020-04-09 16:03:09.08', 387);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 23.25, '2020-04-13 16:04:09.266667', 388);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 24.54, '2020-04-14 16:03:42.95', 389);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 24.35, '2020-04-15 16:03:42.1', 390);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.78, '2020-04-16 16:03:20.45', 391);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 24.27, '2020-04-17 16:02:50.883333', 392);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 23.64, '2020-04-20 16:03:00.803333', 393);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 23.1, '2020-04-21 16:02:55.26', 394);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.47, '2020-04-22 16:02:56.64', 395);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.48, '2020-04-23 16:02:18.87', 396);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.41, '2020-04-24 16:02:07.486667', 397);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.16, '2020-04-27 16:02:14.553333', 398);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 24.34, '2020-04-28 16:02:22.34', 399);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 27.32, '2020-04-29 16:02:13.67', 400);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 25.91, '2020-04-30 16:02:29.336667', 401);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 24.12, '2020-05-01 16:17:44.04', 402);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.57, '2020-05-04 16:02:54.24', 403);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 21.71, '2020-05-05 16:02:54.723333', 404);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 21, '2020-05-06 16:03:13.79', 405);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 21.68, '2020-05-07 16:02:28.766667', 406);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.72, '2020-05-08 16:03:25.026667', 407);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.01, '2020-05-11 16:02:48.71', 408);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 21.03, '2020-05-12 16:03:24.663333', 409);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 19.41, '2020-05-13 16:02:42.126667', 410);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 19.38, '2020-05-14 16:02:46.766667', 411);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 19.19, '2020-05-15 16:02:55.88', 412);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 21.86, '2020-05-18 16:02:44.113333', 413);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 21.76, '2020-05-19 16:02:28.653333', 414);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.72, '2020-05-20 16:03:24.81', 415);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 23.16, '2020-05-21 16:01:52.19', 416);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', '49a0e7c9-f918-4e97-aeca-d8d37f9a3f4f', 22.69, '2020-05-22 16:01:50.31', 417);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 100.73, '2020-03-25 16:02:25.08', 418);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 105.36, '2020-03-26 16:02:03.26', 419);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 96.4, '2020-03-27 16:02:07.203333', 420);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 99.8, '2020-03-30 16:02:13.706667', 421);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 96.6, '2020-03-31 16:02:18.73', 422);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 94.92, '2020-04-01 16:02:10.136667', 423);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 96.97, '2020-04-02 16:02:21.246667', 424);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 93.88, '2020-04-03 16:02:29.413333', 425);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 99.58, '2020-04-06 16:02:12.496667', 426);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 101.24, '2020-04-07 16:02:36.94', 427);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 101.07, '2020-04-08 16:02:47.623333', 428);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 104.5, '2020-04-09 16:02:19.866667', 429);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 103.5, '2020-04-13 16:03:11.336667', 430);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 106.03, '2020-04-14 16:02:57.496667', 431);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 103.37, '2020-04-15 16:03:06.046667', 432);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 102.02, '2020-04-16 16:02:18.663333', 433);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 106.63, '2020-04-17 16:01:55.786667', 434);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 102.26, '2020-04-20 16:02:02.633333', 435);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 100.54, '2020-04-21 16:02:19.706667', 436);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 100.99, '2020-04-22 16:02:00.09', 437);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 101, '2020-04-23 16:01:23.286667', 438);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 101.19, '2020-04-24 16:01:17.98', 439);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 106.06, '2020-04-27 16:01:22.526667', 440);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 106.21, '2020-04-28 16:01:45.98', 441);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 112.25, '2020-04-29 16:01:19.1', 442);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 108.15, '2020-04-30 16:01:45.396667', 443);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 105.5, '2020-05-01 16:17:01.836667', 444);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 103.18, '2020-05-04 16:02:00.563333', 445);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 101.06, '2020-05-05 16:02:20.92', 446);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 100.88, '2020-05-06 16:02:40.096667', 447);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 105.57, '2020-05-07 16:01:37.85', 448);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 109.16, '2020-05-08 16:02:37.386667', 449);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 107.77, '2020-05-11 16:02:00.466667', 450);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 104.56, '2020-05-12 16:02:50.37', 451);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 102.92, '2020-05-13 16:02:09.04', 452);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 105.91, '2020-05-14 16:01:49.153333', 453);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 109.05, '2020-05-15 16:02:24.98', 454);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 116.85, '2020-05-18 16:02:22.363333', 455);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 114.37, '2020-05-19 16:02:00.396667', 456);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 119.92, '2020-05-20 16:02:30.97', 457);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 117.83, '2020-05-21 16:01:16.923333', 458);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', 'a0a1a293-fda8-48df-9ebf-35556cde3235', 118.02, '2020-05-22 16:01:16.73', 459);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-25', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 29.75, '2020-03-25 16:03:02.026667', 460);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-26', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 31.75, '2020-03-26 16:03:02.5', 461);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-27', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 30.9, '2020-03-27 16:03:06.533333', 462);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-30', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 32.67, '2020-03-30 16:03:11.676667', 463);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-03-31', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 32.64, '2020-03-31 16:03:18.616667', 464);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-01', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 31.75, '2020-04-01 16:03:03.386667', 465);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-02', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 32.87, '2020-04-02 16:03:20.62', 466);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-03', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 33.64, '2020-04-03 16:03:06.446667', 467);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-06', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 34.57, '2020-04-06 16:03:16.326667', 468);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-07', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 33.61, '2020-04-07 16:03:15.363333', 469);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-08', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 34.6, '2020-04-08 16:03:26.926667', 470);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-09', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 35.39, '2020-04-09 16:03:11.696667', 471);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-13', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 35.14, '2020-04-13 16:04:11.4', 472);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-14', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 36.44, '2020-04-14 16:03:41.326667', 473);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-15', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 35.97, '2020-04-15 16:03:43.153333', 474);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-16', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 35.88, '2020-04-16 16:03:22.353333', 475);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-17', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 36.91, '2020-04-17 16:02:53.006667', 476);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-20', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 36.08, '2020-04-20 16:03:04.1', 477);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-21', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 35.62, '2020-04-21 16:02:58.123333', 478);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-22', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 36.25, '2020-04-22 16:02:58.356667', 479);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-23', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 36.69, '2020-04-23 16:02:21.61', 480);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-24', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.38, '2020-04-24 16:02:09.85', 481);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-27', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 38.33, '2020-04-27 16:02:16.953333', 482);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-28', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.91, '2020-04-28 16:02:21.15', 483);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-29', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 38.12, '2020-04-29 16:02:16.256667', 484);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-04-30', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 38.36, '2020-04-30 16:02:31.18', 485);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-01', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.64, '2020-05-01 16:17:45.083333', 486);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-04', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.62, '2020-05-04 16:02:58.11', 487);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-05', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 38.51, '2020-05-05 16:02:56.506667', 488);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-06', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 38.51, '2020-05-06 16:03:15.083333', 489);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-07', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 36.96, '2020-05-07 16:02:30.776667', 490);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-08', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.22, '2020-05-08 16:03:28.95', 491);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-11', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 38.1, '2020-05-11 16:02:52.736667', 492);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-12', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.36, '2020-05-12 16:03:26.47', 493);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-13', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.05, '2020-05-13 16:02:45.173333', 494);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-14', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.92, '2020-05-14 16:02:49.796667', 495);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-15', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.76, '2020-05-15 16:02:56.583333', 496);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-18', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 38.07, '2020-05-18 16:02:43.37', 497);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-19', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.68, '2020-05-19 16:02:29.52', 498);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-20', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.63, '2020-05-20 16:03:25.35', 499);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-21', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.26, '2020-05-21 16:01:54.223333', 500);
INSERT INTO public.sws_sompany_price_close VALUES ('2020-05-22', '3b07801a-1c3a-46e6-a7ff-e1f59f31c466', 37.5, '2020-05-22 16:01:51.993333', 501);


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.user_attribute VALUES ('picture', 'https://scontent.fsyd4-1.fna.fbcdn.net/v/t1.0-9/13925012_10210467995760593_2695768106647215842_n.jpg?_nc_cat=108&ccb=2&_nc_sid=09cbfe&_nc_ohc=rI19opwllngAX90iGPA&_nc_ht=scontent.fsyd4-1.fna&oh=1ed4171b53fbae32a7abe583d808c54f&oe=5FCA3CF9', '751495b7-7495-4aa9-869a-194c6fe0a4cd', 'd37fdbc5-87d3-473b-a709-f6ebfbb31862');


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.user_entity VALUES ('dde8e79d-d39b-4d84-9a90-a3efa7b715ed', NULL, '5feb299f-3464-4864-9c7a-1ee4f0065456', false, true, NULL, NULL, NULL, 'master', 'simplywall', 1604641302382, NULL, 0);
INSERT INTO public.user_entity VALUES ('50d06183-ce53-4294-8422-6a7e77a65f81', NULL, 'bf1b44fd-4e35-4042-8a26-4b6e51d15342', false, true, NULL, 'Simply', 'Wall', 'simplywall', 'simplywall', 1604641802726, NULL, 0);
INSERT INTO public.user_entity VALUES ('23b4014a-bf20-416a-b5aa-1d6fa6d6d45e', NULL, '342da03b-fb6c-4891-a01d-dd4818bd5c05', false, true, NULL, NULL, NULL, 'simplywall', 'service-account-simplywall-service', 1604643029085, 'b16c509f-5b3e-4716-886a-038d49143d2e', 0);
INSERT INTO public.user_entity VALUES ('751495b7-7495-4aa9-869a-194c6fe0a4cd', NULL, '4d25508f-a96a-45a7-8a97-3ccb00201813', false, true, NULL, 'Alex', 'To', 'simplywall', 'alexto', 1604699784690, NULL, 0);


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.user_role_mapping VALUES ('b562a42b-9322-4743-a5bc-6c6b0f870e12', 'dde8e79d-d39b-4d84-9a90-a3efa7b715ed');
INSERT INTO public.user_role_mapping VALUES ('56c0c9b8-ce63-42be-a816-10965f38f607', 'dde8e79d-d39b-4d84-9a90-a3efa7b715ed');
INSERT INTO public.user_role_mapping VALUES ('d1eae49e-e614-45c2-82f0-0cfb27170d5b', 'dde8e79d-d39b-4d84-9a90-a3efa7b715ed');
INSERT INTO public.user_role_mapping VALUES ('c9020303-35e3-4889-80cf-bfed3551a07a', 'dde8e79d-d39b-4d84-9a90-a3efa7b715ed');
INSERT INTO public.user_role_mapping VALUES ('63ac6cb3-c943-4a80-88b0-70c6517742db', 'dde8e79d-d39b-4d84-9a90-a3efa7b715ed');
INSERT INTO public.user_role_mapping VALUES ('4122f892-75f6-46ff-b96c-efd1d68ab02b', '50d06183-ce53-4294-8422-6a7e77a65f81');
INSERT INTO public.user_role_mapping VALUES ('e472f42c-7680-4399-968e-adb5928b159c', '50d06183-ce53-4294-8422-6a7e77a65f81');
INSERT INTO public.user_role_mapping VALUES ('62bd377e-f697-4d2e-bf11-89a39cbf62f7', '50d06183-ce53-4294-8422-6a7e77a65f81');
INSERT INTO public.user_role_mapping VALUES ('9acc730a-dc8a-415c-991c-3c3a8e90b2b6', '50d06183-ce53-4294-8422-6a7e77a65f81');
INSERT INTO public.user_role_mapping VALUES ('4122f892-75f6-46ff-b96c-efd1d68ab02b', '23b4014a-bf20-416a-b5aa-1d6fa6d6d45e');
INSERT INTO public.user_role_mapping VALUES ('e472f42c-7680-4399-968e-adb5928b159c', '23b4014a-bf20-416a-b5aa-1d6fa6d6d45e');
INSERT INTO public.user_role_mapping VALUES ('62bd377e-f697-4d2e-bf11-89a39cbf62f7', '23b4014a-bf20-416a-b5aa-1d6fa6d6d45e');
INSERT INTO public.user_role_mapping VALUES ('9acc730a-dc8a-415c-991c-3c3a8e90b2b6', '23b4014a-bf20-416a-b5aa-1d6fa6d6d45e');
INSERT INTO public.user_role_mapping VALUES ('4122f892-75f6-46ff-b96c-efd1d68ab02b', '751495b7-7495-4aa9-869a-194c6fe0a4cd');
INSERT INTO public.user_role_mapping VALUES ('e472f42c-7680-4399-968e-adb5928b159c', '751495b7-7495-4aa9-869a-194c6fe0a4cd');
INSERT INTO public.user_role_mapping VALUES ('62bd377e-f697-4d2e-bf11-89a39cbf62f7', '751495b7-7495-4aa9-869a-194c6fe0a4cd');
INSERT INTO public.user_role_mapping VALUES ('9acc730a-dc8a-415c-991c-3c3a8e90b2b6', '751495b7-7495-4aa9-869a-194c6fe0a4cd');


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: simplywall
--



--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: simplywall
--

INSERT INTO public.web_origins VALUES ('62064bd3-182d-4043-b272-2984019094a6', '+');
INSERT INTO public.web_origins VALUES ('ba347729-cad6-408f-b536-50a6d6b34a9f', '+');
INSERT INTO public.web_origins VALUES ('b53464f7-5cd3-4358-bca5-bc381ba0fb3f', '*');


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: simplywall
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: swsCompanyPriceClose_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simplywall
--

SELECT pg_catalog.setval('public."swsCompanyPriceClose_id_seq"', 501, true);


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: sws_company swscompany_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.sws_company
    ADD CONSTRAINT swscompany_pk PRIMARY KEY (id);


--
-- Name: sws_sompany_price_close swscompanypriceclose_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.sws_sompany_price_close
    ADD CONSTRAINT swscompanypriceclose_pk PRIMARY KEY (id);


--
-- Name: sws_company_score swscompanyscore_pk; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.sws_company_score
    ADD CONSTRAINT swscompanyscore_pk PRIMARY KEY (id);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: swscompanyscore_id_uindex; Type: INDEX; Schema: public; Owner: simplywall
--

CREATE UNIQUE INDEX swscompanyscore_id_uindex ON public.sws_company_score USING btree (id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_default_roles fk_8aelwnibji49avxsrtuf6xjow; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_8aelwnibji49avxsrtuf6xjow FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_role; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_role; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_default_roles fk_h4wpd7w4hsoolni3h0sw7btje; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_h4wpd7w4hsoolni3h0sw7btje FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_p3rh9grku11kqfrs4fltt7rnq; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_p3rh9grku11kqfrs4fltt7rnq FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- Name: sws_company_score sws_company_score___fk_company_id; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.sws_company_score
    ADD CONSTRAINT sws_company_score___fk_company_id FOREIGN KEY (company_id) REFERENCES public.sws_company(id);


--
-- Name: sws_sompany_price_close sws_sompany_price_close___fk_company_id; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.sws_sompany_price_close
    ADD CONSTRAINT sws_sompany_price_close___fk_company_id FOREIGN KEY (company_id) REFERENCES public.sws_company(id);


--
-- Name: sws_company swscompany___fk_score_id; Type: FK CONSTRAINT; Schema: public; Owner: simplywall
--

ALTER TABLE ONLY public.sws_company
    ADD CONSTRAINT swscompany___fk_score_id FOREIGN KEY (score_id) REFERENCES public.sws_company_score(id);


--
-- PostgreSQL database dump complete
--

