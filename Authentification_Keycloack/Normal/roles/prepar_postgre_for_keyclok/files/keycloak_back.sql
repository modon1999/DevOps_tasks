--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-1.pgdg20.04+1)

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
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
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
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


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
add19960-00ed-4efa-9909-4dc5ea6050bd	\N	auth-cookie	b667d691-5b73-48d2-bd66-7650fe75f19c	da561aa6-423f-45f1-b542-6396eda3e08a	2	10	f	\N	\N
4d5c8d09-45b9-4537-a4de-f832a422a484	\N	auth-spnego	b667d691-5b73-48d2-bd66-7650fe75f19c	da561aa6-423f-45f1-b542-6396eda3e08a	3	20	f	\N	\N
782fe577-d543-472b-bc7f-73dd5e18fb56	\N	identity-provider-redirector	b667d691-5b73-48d2-bd66-7650fe75f19c	da561aa6-423f-45f1-b542-6396eda3e08a	2	25	f	\N	\N
16d4d743-5927-484f-8d6e-a91337a4ddf8	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	da561aa6-423f-45f1-b542-6396eda3e08a	2	30	t	f16ea11e-f7c6-4e4f-8efb-8078a4fe8372	\N
e67c0797-8e2c-4aa7-acb8-6175d5acd73c	\N	auth-username-password-form	b667d691-5b73-48d2-bd66-7650fe75f19c	f16ea11e-f7c6-4e4f-8efb-8078a4fe8372	0	10	f	\N	\N
259187f7-d92e-41e6-b0d3-b8b6ff9e564a	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	f16ea11e-f7c6-4e4f-8efb-8078a4fe8372	1	20	t	e9aaef71-fd28-4c1c-a164-d19801ca3778	\N
379dcf88-42af-4d95-b311-70555df1e80c	\N	conditional-user-configured	b667d691-5b73-48d2-bd66-7650fe75f19c	e9aaef71-fd28-4c1c-a164-d19801ca3778	0	10	f	\N	\N
981fa69f-ca9d-49e8-985d-5b04d197da0a	\N	auth-otp-form	b667d691-5b73-48d2-bd66-7650fe75f19c	e9aaef71-fd28-4c1c-a164-d19801ca3778	0	20	f	\N	\N
a40ab516-ae3f-47a1-b8ba-31c3e9b5ac5c	\N	direct-grant-validate-username	b667d691-5b73-48d2-bd66-7650fe75f19c	fd59f351-b1ce-4a6f-84e9-37812031370a	0	10	f	\N	\N
81758e9c-7ab3-4ad0-b7af-175c04ea038e	\N	direct-grant-validate-password	b667d691-5b73-48d2-bd66-7650fe75f19c	fd59f351-b1ce-4a6f-84e9-37812031370a	0	20	f	\N	\N
d9c0b79a-ad26-4659-a1e0-f1475258d3c1	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	fd59f351-b1ce-4a6f-84e9-37812031370a	1	30	t	9c3e35a6-e413-4a31-be1f-1a67a6da7404	\N
1f96eebb-7fda-4e4f-976c-fec21a06fa3a	\N	conditional-user-configured	b667d691-5b73-48d2-bd66-7650fe75f19c	9c3e35a6-e413-4a31-be1f-1a67a6da7404	0	10	f	\N	\N
c18906f8-157d-4b34-9a59-1095e65934a4	\N	direct-grant-validate-otp	b667d691-5b73-48d2-bd66-7650fe75f19c	9c3e35a6-e413-4a31-be1f-1a67a6da7404	0	20	f	\N	\N
0c20a504-a2bd-4b2c-a061-776d3b04a090	\N	registration-page-form	b667d691-5b73-48d2-bd66-7650fe75f19c	fb0759b0-062c-409b-bd4d-17ba3ae2490c	0	10	t	a21c5cfa-76ad-4145-af43-d080d87c6068	\N
fd3c9685-8ef8-42e4-998d-69f09765129a	\N	registration-user-creation	b667d691-5b73-48d2-bd66-7650fe75f19c	a21c5cfa-76ad-4145-af43-d080d87c6068	0	20	f	\N	\N
4a29f2d7-1a99-40da-b175-51508d257fca	\N	registration-profile-action	b667d691-5b73-48d2-bd66-7650fe75f19c	a21c5cfa-76ad-4145-af43-d080d87c6068	0	40	f	\N	\N
c1be2bc6-e7f9-4298-8076-3eb0bb1927c0	\N	registration-password-action	b667d691-5b73-48d2-bd66-7650fe75f19c	a21c5cfa-76ad-4145-af43-d080d87c6068	0	50	f	\N	\N
f0bb0950-7af7-4a5d-98a6-9785c904d2ae	\N	registration-recaptcha-action	b667d691-5b73-48d2-bd66-7650fe75f19c	a21c5cfa-76ad-4145-af43-d080d87c6068	3	60	f	\N	\N
aba77606-ac72-4dd9-af53-ea0dd7657d30	\N	reset-credentials-choose-user	b667d691-5b73-48d2-bd66-7650fe75f19c	719ca543-a53e-49ef-b407-a4d47b24ebd4	0	10	f	\N	\N
063b46c9-d166-4398-9597-0b6f2551cd87	\N	reset-credential-email	b667d691-5b73-48d2-bd66-7650fe75f19c	719ca543-a53e-49ef-b407-a4d47b24ebd4	0	20	f	\N	\N
3fa33446-a5ac-415d-be22-e2aa485e560c	\N	reset-password	b667d691-5b73-48d2-bd66-7650fe75f19c	719ca543-a53e-49ef-b407-a4d47b24ebd4	0	30	f	\N	\N
2461ea17-d9b4-40da-909d-051a85bd24cb	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	719ca543-a53e-49ef-b407-a4d47b24ebd4	1	40	t	2a360785-2a83-4a8e-8a23-3c08dab0f38e	\N
88f294fb-9b88-4d3a-a36a-cdebf527c46a	\N	conditional-user-configured	b667d691-5b73-48d2-bd66-7650fe75f19c	2a360785-2a83-4a8e-8a23-3c08dab0f38e	0	10	f	\N	\N
f26a58a7-66fe-43a2-b183-322cc9fecd33	\N	reset-otp	b667d691-5b73-48d2-bd66-7650fe75f19c	2a360785-2a83-4a8e-8a23-3c08dab0f38e	0	20	f	\N	\N
9f2bb9c1-8589-43f6-bd34-602b5a7f1f26	\N	client-secret	b667d691-5b73-48d2-bd66-7650fe75f19c	80e8c27b-e840-4dae-9588-36082f7f7253	2	10	f	\N	\N
d264dc93-3582-4058-b43f-0f8677731e3a	\N	client-jwt	b667d691-5b73-48d2-bd66-7650fe75f19c	80e8c27b-e840-4dae-9588-36082f7f7253	2	20	f	\N	\N
43b14cac-7ea1-4dfe-8236-10f9bed10b33	\N	client-secret-jwt	b667d691-5b73-48d2-bd66-7650fe75f19c	80e8c27b-e840-4dae-9588-36082f7f7253	2	30	f	\N	\N
32e2ef11-b7e6-46f6-a9ab-afc0773315cf	\N	client-x509	b667d691-5b73-48d2-bd66-7650fe75f19c	80e8c27b-e840-4dae-9588-36082f7f7253	2	40	f	\N	\N
847c6e6c-6079-49ed-a84d-5a4082edddfd	\N	idp-review-profile	b667d691-5b73-48d2-bd66-7650fe75f19c	daf0e4ba-711a-415d-8190-44392dc0f834	0	10	f	\N	38e0ff91-e5e5-4742-a1e5-907756516973
0ca105ca-d4f5-4e72-9ace-111e7e237186	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	daf0e4ba-711a-415d-8190-44392dc0f834	0	20	t	fcd5ff65-1cf7-4978-8029-ed0c517a7c4b	\N
28625690-aa92-44a4-b232-a9da38e8106f	\N	idp-create-user-if-unique	b667d691-5b73-48d2-bd66-7650fe75f19c	fcd5ff65-1cf7-4978-8029-ed0c517a7c4b	2	10	f	\N	caeb042d-ac9b-46f0-b1d5-edd7e1827eae
9af1ee86-a9e6-463b-b336-e8ba3037ebb6	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	fcd5ff65-1cf7-4978-8029-ed0c517a7c4b	2	20	t	071137a3-c1ce-4a76-b4f4-7788e9f8cf3d	\N
572c8569-a56d-4eec-9846-4a1d2c752d22	\N	idp-confirm-link	b667d691-5b73-48d2-bd66-7650fe75f19c	071137a3-c1ce-4a76-b4f4-7788e9f8cf3d	0	10	f	\N	\N
3d5887cd-c3ff-4dbb-981b-54845f616a1b	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	071137a3-c1ce-4a76-b4f4-7788e9f8cf3d	0	20	t	2407914e-c0ff-4d13-9336-f9045a3ce38c	\N
e6a3b758-5e87-49f3-b717-284c308e2929	\N	idp-email-verification	b667d691-5b73-48d2-bd66-7650fe75f19c	2407914e-c0ff-4d13-9336-f9045a3ce38c	2	10	f	\N	\N
4a99a182-da8c-4b9e-bb47-9c8efd79bc34	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	2407914e-c0ff-4d13-9336-f9045a3ce38c	2	20	t	ec7194d3-f47b-4162-a1eb-f56a38ea219a	\N
bf77494b-ad75-4ad5-b2e8-e407f8b0f4db	\N	idp-username-password-form	b667d691-5b73-48d2-bd66-7650fe75f19c	ec7194d3-f47b-4162-a1eb-f56a38ea219a	0	10	f	\N	\N
87d1c275-d35c-418a-8c62-32ae3c81062d	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	ec7194d3-f47b-4162-a1eb-f56a38ea219a	1	20	t	329e2e70-c6aa-43ab-a563-b1d5bfb0c8f2	\N
9e6ef7d2-11f0-4a9b-9877-3e601c28ac85	\N	conditional-user-configured	b667d691-5b73-48d2-bd66-7650fe75f19c	329e2e70-c6aa-43ab-a563-b1d5bfb0c8f2	0	10	f	\N	\N
eb6efa83-8deb-4af8-b25e-fdd4e748a1e4	\N	auth-otp-form	b667d691-5b73-48d2-bd66-7650fe75f19c	329e2e70-c6aa-43ab-a563-b1d5bfb0c8f2	0	20	f	\N	\N
ac1d16b9-ec85-4194-af02-46973cfa0ea8	\N	http-basic-authenticator	b667d691-5b73-48d2-bd66-7650fe75f19c	d9cbaf56-51c3-4166-aabd-88b3792d959f	0	10	f	\N	\N
eb7c81f0-c50f-43c5-8643-080d0947cefb	\N	docker-http-basic-authenticator	b667d691-5b73-48d2-bd66-7650fe75f19c	fa126f7e-1d64-490b-848d-410718890841	0	10	f	\N	\N
63f709ca-eb5e-42c4-b9ac-ef60a811a1fd	\N	no-cookie-redirect	b667d691-5b73-48d2-bd66-7650fe75f19c	543409fc-b604-48ce-87d2-90453d0cf156	0	10	f	\N	\N
3168dd05-89a1-4d8b-850e-0dce0213cd69	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	543409fc-b604-48ce-87d2-90453d0cf156	0	20	t	1d70b555-dbd5-4708-b84b-f7fc00f26613	\N
59ea3761-39ee-4350-9a83-a8895556414f	\N	basic-auth	b667d691-5b73-48d2-bd66-7650fe75f19c	1d70b555-dbd5-4708-b84b-f7fc00f26613	0	10	f	\N	\N
279c6c68-b12b-4de2-bef5-a96645c4d74b	\N	basic-auth-otp	b667d691-5b73-48d2-bd66-7650fe75f19c	1d70b555-dbd5-4708-b84b-f7fc00f26613	3	20	f	\N	\N
72d0db0e-a614-43e6-ae34-6634fdfb8e34	\N	auth-spnego	b667d691-5b73-48d2-bd66-7650fe75f19c	1d70b555-dbd5-4708-b84b-f7fc00f26613	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
da561aa6-423f-45f1-b542-6396eda3e08a	browser	browser based authentication	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	t	t
f16ea11e-f7c6-4e4f-8efb-8078a4fe8372	forms	Username, password, otp and other auth forms.	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
e9aaef71-fd28-4c1c-a164-d19801ca3778	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
fd59f351-b1ce-4a6f-84e9-37812031370a	direct grant	OpenID Connect Resource Owner Grant	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	t	t
9c3e35a6-e413-4a31-be1f-1a67a6da7404	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
fb0759b0-062c-409b-bd4d-17ba3ae2490c	registration	registration flow	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	t	t
a21c5cfa-76ad-4145-af43-d080d87c6068	registration form	registration form	b667d691-5b73-48d2-bd66-7650fe75f19c	form-flow	f	t
719ca543-a53e-49ef-b407-a4d47b24ebd4	reset credentials	Reset credentials for a user if they forgot their password or something	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	t	t
2a360785-2a83-4a8e-8a23-3c08dab0f38e	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
80e8c27b-e840-4dae-9588-36082f7f7253	clients	Base authentication for clients	b667d691-5b73-48d2-bd66-7650fe75f19c	client-flow	t	t
daf0e4ba-711a-415d-8190-44392dc0f834	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	t	t
fcd5ff65-1cf7-4978-8029-ed0c517a7c4b	User creation or linking	Flow for the existing/non-existing user alternatives	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
071137a3-c1ce-4a76-b4f4-7788e9f8cf3d	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
2407914e-c0ff-4d13-9336-f9045a3ce38c	Account verification options	Method with which to verity the existing account	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
ec7194d3-f47b-4162-a1eb-f56a38ea219a	Verify Existing Account by Re-authentication	Reauthentication of existing account	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
329e2e70-c6aa-43ab-a563-b1d5bfb0c8f2	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
d9cbaf56-51c3-4166-aabd-88b3792d959f	saml ecp	SAML ECP Profile Authentication Flow	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	t	t
fa126f7e-1d64-490b-848d-410718890841	docker auth	Used by Docker clients to authenticate against the IDP	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	t	t
543409fc-b604-48ce-87d2-90453d0cf156	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	t	t
1d70b555-dbd5-4708-b84b-f7fc00f26613	Authentication Options	Authentication options.	b667d691-5b73-48d2-bd66-7650fe75f19c	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
38e0ff91-e5e5-4742-a1e5-907756516973	review profile config	b667d691-5b73-48d2-bd66-7650fe75f19c
caeb042d-ac9b-46f0-b1d5-edd7e1827eae	create unique user config	b667d691-5b73-48d2-bd66-7650fe75f19c
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
38e0ff91-e5e5-4742-a1e5-907756516973	missing	update.profile.on.first.login
caeb042d-ac9b-46f0-b1d5-edd7e1827eae	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
e3d046ad-5b16-4742-b680-7dc1b7108473	t	f	master-realm	0	f	\N	\N	t	\N	f	b667d691-5b73-48d2-bd66-7650fe75f19c	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	b667d691-5b73-48d2-bd66-7650fe75f19c	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5a7a33d8-141e-4e72-88ae-e89b238d93c9	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	b667d691-5b73-48d2-bd66-7650fe75f19c	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
c53583db-c846-4b89-9d93-9c55a4f1edeb	t	f	broker	0	f	\N	\N	t	\N	f	b667d691-5b73-48d2-bd66-7650fe75f19c	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
45f35b4c-c63d-40b6-af0b-b6b6a328485f	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	b667d691-5b73-48d2-bd66-7650fe75f19c	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
9ebed162-c88b-40d5-906e-c3986720199e	t	f	admin-cli	0	t	\N	\N	f	\N	f	b667d691-5b73-48d2-bd66-7650fe75f19c	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	post.logout.redirect.uris	+
5a7a33d8-141e-4e72-88ae-e89b238d93c9	post.logout.redirect.uris	+
5a7a33d8-141e-4e72-88ae-e89b238d93c9	pkce.code.challenge.method	S256
45f35b4c-c63d-40b6-af0b-b6b6a328485f	post.logout.redirect.uris	+
45f35b4c-c63d-40b6-af0b-b6b6a328485f	pkce.code.challenge.method	S256
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
305f5ad4-3877-4e7e-b44f-746f77ab6a94	offline_access	b667d691-5b73-48d2-bd66-7650fe75f19c	OpenID Connect built-in scope: offline_access	openid-connect
37ca1b38-b757-42bf-916a-16edc06ee74f	role_list	b667d691-5b73-48d2-bd66-7650fe75f19c	SAML role list	saml
30705c95-6a75-4c6b-9886-a6c1fc6d60c0	profile	b667d691-5b73-48d2-bd66-7650fe75f19c	OpenID Connect built-in scope: profile	openid-connect
88bc54e8-3899-4f1f-b089-ec5160facbe9	email	b667d691-5b73-48d2-bd66-7650fe75f19c	OpenID Connect built-in scope: email	openid-connect
9a3186f8-14fb-4952-afbb-94fb017251da	address	b667d691-5b73-48d2-bd66-7650fe75f19c	OpenID Connect built-in scope: address	openid-connect
44dc0265-da66-4723-9817-0abe23539ca3	phone	b667d691-5b73-48d2-bd66-7650fe75f19c	OpenID Connect built-in scope: phone	openid-connect
8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	roles	b667d691-5b73-48d2-bd66-7650fe75f19c	OpenID Connect scope for add user roles to the access token	openid-connect
ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	web-origins	b667d691-5b73-48d2-bd66-7650fe75f19c	OpenID Connect scope for add allowed web origins to the access token	openid-connect
76cd9e62-5261-4ea9-bb41-761dfba37d71	microprofile-jwt	b667d691-5b73-48d2-bd66-7650fe75f19c	Microprofile - JWT built-in scope	openid-connect
3dc58afb-1664-448c-ae68-9d1f5e830c16	acr	b667d691-5b73-48d2-bd66-7650fe75f19c	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
305f5ad4-3877-4e7e-b44f-746f77ab6a94	true	display.on.consent.screen
305f5ad4-3877-4e7e-b44f-746f77ab6a94	${offlineAccessScopeConsentText}	consent.screen.text
37ca1b38-b757-42bf-916a-16edc06ee74f	true	display.on.consent.screen
37ca1b38-b757-42bf-916a-16edc06ee74f	${samlRoleListScopeConsentText}	consent.screen.text
30705c95-6a75-4c6b-9886-a6c1fc6d60c0	true	display.on.consent.screen
30705c95-6a75-4c6b-9886-a6c1fc6d60c0	${profileScopeConsentText}	consent.screen.text
30705c95-6a75-4c6b-9886-a6c1fc6d60c0	true	include.in.token.scope
88bc54e8-3899-4f1f-b089-ec5160facbe9	true	display.on.consent.screen
88bc54e8-3899-4f1f-b089-ec5160facbe9	${emailScopeConsentText}	consent.screen.text
88bc54e8-3899-4f1f-b089-ec5160facbe9	true	include.in.token.scope
9a3186f8-14fb-4952-afbb-94fb017251da	true	display.on.consent.screen
9a3186f8-14fb-4952-afbb-94fb017251da	${addressScopeConsentText}	consent.screen.text
9a3186f8-14fb-4952-afbb-94fb017251da	true	include.in.token.scope
44dc0265-da66-4723-9817-0abe23539ca3	true	display.on.consent.screen
44dc0265-da66-4723-9817-0abe23539ca3	${phoneScopeConsentText}	consent.screen.text
44dc0265-da66-4723-9817-0abe23539ca3	true	include.in.token.scope
8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	true	display.on.consent.screen
8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	${rolesScopeConsentText}	consent.screen.text
8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	false	include.in.token.scope
ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	false	display.on.consent.screen
ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd		consent.screen.text
ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	false	include.in.token.scope
76cd9e62-5261-4ea9-bb41-761dfba37d71	false	display.on.consent.screen
76cd9e62-5261-4ea9-bb41-761dfba37d71	true	include.in.token.scope
3dc58afb-1664-448c-ae68-9d1f5e830c16	false	display.on.consent.screen
3dc58afb-1664-448c-ae68-9d1f5e830c16	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	30705c95-6a75-4c6b-9886-a6c1fc6d60c0	t
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	t
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	88bc54e8-3899-4f1f-b089-ec5160facbe9	t
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	3dc58afb-1664-448c-ae68-9d1f5e830c16	t
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	t
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	44dc0265-da66-4723-9817-0abe23539ca3	f
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	76cd9e62-5261-4ea9-bb41-761dfba37d71	f
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	305f5ad4-3877-4e7e-b44f-746f77ab6a94	f
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	9a3186f8-14fb-4952-afbb-94fb017251da	f
5a7a33d8-141e-4e72-88ae-e89b238d93c9	30705c95-6a75-4c6b-9886-a6c1fc6d60c0	t
5a7a33d8-141e-4e72-88ae-e89b238d93c9	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	t
5a7a33d8-141e-4e72-88ae-e89b238d93c9	88bc54e8-3899-4f1f-b089-ec5160facbe9	t
5a7a33d8-141e-4e72-88ae-e89b238d93c9	3dc58afb-1664-448c-ae68-9d1f5e830c16	t
5a7a33d8-141e-4e72-88ae-e89b238d93c9	ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	t
5a7a33d8-141e-4e72-88ae-e89b238d93c9	44dc0265-da66-4723-9817-0abe23539ca3	f
5a7a33d8-141e-4e72-88ae-e89b238d93c9	76cd9e62-5261-4ea9-bb41-761dfba37d71	f
5a7a33d8-141e-4e72-88ae-e89b238d93c9	305f5ad4-3877-4e7e-b44f-746f77ab6a94	f
5a7a33d8-141e-4e72-88ae-e89b238d93c9	9a3186f8-14fb-4952-afbb-94fb017251da	f
9ebed162-c88b-40d5-906e-c3986720199e	30705c95-6a75-4c6b-9886-a6c1fc6d60c0	t
9ebed162-c88b-40d5-906e-c3986720199e	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	t
9ebed162-c88b-40d5-906e-c3986720199e	88bc54e8-3899-4f1f-b089-ec5160facbe9	t
9ebed162-c88b-40d5-906e-c3986720199e	3dc58afb-1664-448c-ae68-9d1f5e830c16	t
9ebed162-c88b-40d5-906e-c3986720199e	ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	t
9ebed162-c88b-40d5-906e-c3986720199e	44dc0265-da66-4723-9817-0abe23539ca3	f
9ebed162-c88b-40d5-906e-c3986720199e	76cd9e62-5261-4ea9-bb41-761dfba37d71	f
9ebed162-c88b-40d5-906e-c3986720199e	305f5ad4-3877-4e7e-b44f-746f77ab6a94	f
9ebed162-c88b-40d5-906e-c3986720199e	9a3186f8-14fb-4952-afbb-94fb017251da	f
c53583db-c846-4b89-9d93-9c55a4f1edeb	30705c95-6a75-4c6b-9886-a6c1fc6d60c0	t
c53583db-c846-4b89-9d93-9c55a4f1edeb	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	t
c53583db-c846-4b89-9d93-9c55a4f1edeb	88bc54e8-3899-4f1f-b089-ec5160facbe9	t
c53583db-c846-4b89-9d93-9c55a4f1edeb	3dc58afb-1664-448c-ae68-9d1f5e830c16	t
c53583db-c846-4b89-9d93-9c55a4f1edeb	ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	t
c53583db-c846-4b89-9d93-9c55a4f1edeb	44dc0265-da66-4723-9817-0abe23539ca3	f
c53583db-c846-4b89-9d93-9c55a4f1edeb	76cd9e62-5261-4ea9-bb41-761dfba37d71	f
c53583db-c846-4b89-9d93-9c55a4f1edeb	305f5ad4-3877-4e7e-b44f-746f77ab6a94	f
c53583db-c846-4b89-9d93-9c55a4f1edeb	9a3186f8-14fb-4952-afbb-94fb017251da	f
e3d046ad-5b16-4742-b680-7dc1b7108473	30705c95-6a75-4c6b-9886-a6c1fc6d60c0	t
e3d046ad-5b16-4742-b680-7dc1b7108473	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	t
e3d046ad-5b16-4742-b680-7dc1b7108473	88bc54e8-3899-4f1f-b089-ec5160facbe9	t
e3d046ad-5b16-4742-b680-7dc1b7108473	3dc58afb-1664-448c-ae68-9d1f5e830c16	t
e3d046ad-5b16-4742-b680-7dc1b7108473	ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	t
e3d046ad-5b16-4742-b680-7dc1b7108473	44dc0265-da66-4723-9817-0abe23539ca3	f
e3d046ad-5b16-4742-b680-7dc1b7108473	76cd9e62-5261-4ea9-bb41-761dfba37d71	f
e3d046ad-5b16-4742-b680-7dc1b7108473	305f5ad4-3877-4e7e-b44f-746f77ab6a94	f
e3d046ad-5b16-4742-b680-7dc1b7108473	9a3186f8-14fb-4952-afbb-94fb017251da	f
45f35b4c-c63d-40b6-af0b-b6b6a328485f	30705c95-6a75-4c6b-9886-a6c1fc6d60c0	t
45f35b4c-c63d-40b6-af0b-b6b6a328485f	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	t
45f35b4c-c63d-40b6-af0b-b6b6a328485f	88bc54e8-3899-4f1f-b089-ec5160facbe9	t
45f35b4c-c63d-40b6-af0b-b6b6a328485f	3dc58afb-1664-448c-ae68-9d1f5e830c16	t
45f35b4c-c63d-40b6-af0b-b6b6a328485f	ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	t
45f35b4c-c63d-40b6-af0b-b6b6a328485f	44dc0265-da66-4723-9817-0abe23539ca3	f
45f35b4c-c63d-40b6-af0b-b6b6a328485f	76cd9e62-5261-4ea9-bb41-761dfba37d71	f
45f35b4c-c63d-40b6-af0b-b6b6a328485f	305f5ad4-3877-4e7e-b44f-746f77ab6a94	f
45f35b4c-c63d-40b6-af0b-b6b6a328485f	9a3186f8-14fb-4952-afbb-94fb017251da	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
305f5ad4-3877-4e7e-b44f-746f77ab6a94	2c0c9a3c-f1cc-4675-bc72-bac662e1a75b
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
d0575b68-949f-4d60-b527-1bc391d3e86a	Trusted Hosts	b667d691-5b73-48d2-bd66-7650fe75f19c	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	anonymous
ef836666-ce78-448f-b6b9-40d22dc4f8c8	Consent Required	b667d691-5b73-48d2-bd66-7650fe75f19c	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	anonymous
acdefd75-c0d2-4c4b-8a91-7f2eb8604b81	Full Scope Disabled	b667d691-5b73-48d2-bd66-7650fe75f19c	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	anonymous
75ab6d67-6395-4c93-becc-d56b97d06b8f	Max Clients Limit	b667d691-5b73-48d2-bd66-7650fe75f19c	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	anonymous
96d630dc-3a60-4629-aa51-2c4fb36dc4ba	Allowed Protocol Mapper Types	b667d691-5b73-48d2-bd66-7650fe75f19c	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	anonymous
2acb50ff-e14f-4ff8-9fe7-47d6c8c1e295	Allowed Client Scopes	b667d691-5b73-48d2-bd66-7650fe75f19c	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	anonymous
2726fa8e-d68b-4bd8-abc8-387bc9c559a7	Allowed Protocol Mapper Types	b667d691-5b73-48d2-bd66-7650fe75f19c	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	authenticated
3936f2ef-a22c-4b7d-be78-a9b54aa04e2e	Allowed Client Scopes	b667d691-5b73-48d2-bd66-7650fe75f19c	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	authenticated
17087d62-7061-4aac-adea-50f653ebe276	rsa-generated	b667d691-5b73-48d2-bd66-7650fe75f19c	rsa-generated	org.keycloak.keys.KeyProvider	b667d691-5b73-48d2-bd66-7650fe75f19c	\N
8ba7d48c-042d-4afc-acc9-62a6b04f7e34	rsa-enc-generated	b667d691-5b73-48d2-bd66-7650fe75f19c	rsa-enc-generated	org.keycloak.keys.KeyProvider	b667d691-5b73-48d2-bd66-7650fe75f19c	\N
d630e036-6ddc-4c39-960b-47c25045d4a8	hmac-generated	b667d691-5b73-48d2-bd66-7650fe75f19c	hmac-generated	org.keycloak.keys.KeyProvider	b667d691-5b73-48d2-bd66-7650fe75f19c	\N
22ff9db9-5d20-45be-838e-891e183b79da	aes-generated	b667d691-5b73-48d2-bd66-7650fe75f19c	aes-generated	org.keycloak.keys.KeyProvider	b667d691-5b73-48d2-bd66-7650fe75f19c	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
58fd8902-fcac-4b4a-9060-abba9d4d5879	96d630dc-3a60-4629-aa51-2c4fb36dc4ba	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9d18c032-3654-43eb-890e-32d6b6342424	96d630dc-3a60-4629-aa51-2c4fb36dc4ba	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
7c162d6e-c2f0-4dd9-bef1-d4d529a6258c	96d630dc-3a60-4629-aa51-2c4fb36dc4ba	allowed-protocol-mapper-types	oidc-address-mapper
c5804815-a1e9-42eb-9e95-07911150b254	96d630dc-3a60-4629-aa51-2c4fb36dc4ba	allowed-protocol-mapper-types	saml-user-attribute-mapper
8ec92664-e8cc-4e56-b3d1-6a9a10368f1a	96d630dc-3a60-4629-aa51-2c4fb36dc4ba	allowed-protocol-mapper-types	oidc-full-name-mapper
51f2606a-2d8c-4610-902a-5b1542a6973b	96d630dc-3a60-4629-aa51-2c4fb36dc4ba	allowed-protocol-mapper-types	saml-role-list-mapper
372c14ee-0769-4bc2-a823-5e37ae27062b	96d630dc-3a60-4629-aa51-2c4fb36dc4ba	allowed-protocol-mapper-types	saml-user-property-mapper
1865fd65-3594-4dd8-a4f5-4ce35f5f32f9	96d630dc-3a60-4629-aa51-2c4fb36dc4ba	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
cf1d2f29-8fba-4d04-a301-194016983477	2acb50ff-e14f-4ff8-9fe7-47d6c8c1e295	allow-default-scopes	true
050ccea4-10dc-4211-b41b-4f547385a772	d0575b68-949f-4d60-b527-1bc391d3e86a	client-uris-must-match	true
4bbf5be3-0ed0-4aae-ba4b-025681a404a5	d0575b68-949f-4d60-b527-1bc391d3e86a	host-sending-registration-request-must-match	true
dcff2191-f064-4161-9ca7-942f3c166299	3936f2ef-a22c-4b7d-be78-a9b54aa04e2e	allow-default-scopes	true
d31f836e-66db-4139-9e84-3f6b6b2bbce7	75ab6d67-6395-4c93-becc-d56b97d06b8f	max-clients	200
1d29d388-dff7-4ceb-8449-fe9b70483d68	2726fa8e-d68b-4bd8-abc8-387bc9c559a7	allowed-protocol-mapper-types	saml-role-list-mapper
decc48b4-61f4-42f9-827c-868c2b93a4a3	2726fa8e-d68b-4bd8-abc8-387bc9c559a7	allowed-protocol-mapper-types	oidc-address-mapper
bd1424aa-9613-490b-817b-02b01a24a7f1	2726fa8e-d68b-4bd8-abc8-387bc9c559a7	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
0245089e-7962-461e-a0f5-bdd7db086842	2726fa8e-d68b-4bd8-abc8-387bc9c559a7	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
5f4d149e-86fa-479d-a56b-c09276b44ad4	2726fa8e-d68b-4bd8-abc8-387bc9c559a7	allowed-protocol-mapper-types	saml-user-property-mapper
dc3ca537-6d37-4e27-bda0-9323c4833295	2726fa8e-d68b-4bd8-abc8-387bc9c559a7	allowed-protocol-mapper-types	saml-user-attribute-mapper
ebc3c6f7-159e-4050-a89e-90fdf3fd0844	2726fa8e-d68b-4bd8-abc8-387bc9c559a7	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
e9ab75b1-d2f9-4d1b-9e54-8ee6e1961d53	2726fa8e-d68b-4bd8-abc8-387bc9c559a7	allowed-protocol-mapper-types	oidc-full-name-mapper
869e4cfd-e630-4e50-9bdd-b1f86d00351b	22ff9db9-5d20-45be-838e-891e183b79da	secret	gWXqw9C6qSyHKlQB0j2Kbg
fb0195e6-5bf8-4fc1-b239-aeebcd92646d	22ff9db9-5d20-45be-838e-891e183b79da	priority	100
55d0a4c0-014c-48b7-8c53-3343cf1036b1	22ff9db9-5d20-45be-838e-891e183b79da	kid	72af7ae3-86c2-4a95-b532-04b6cda24645
0d055f06-f6d8-4dca-8288-ece1b76a6f5d	8ba7d48c-042d-4afc-acc9-62a6b04f7e34	keyUse	ENC
428add76-cb3b-43a6-b9d1-ec8f4f5bbd97	8ba7d48c-042d-4afc-acc9-62a6b04f7e34	certificate	MIICmzCCAYMCBgGHI60SCzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMzI3MTUyNDE3WhcNMzMwMzI3MTUyNTU3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDL27ibvb4fMuj0SF/4CUhNlZhi3uCfoHp47gHxXnKjr1CvY69AcZu9CZeRjkmEu63pcxz4HOPWGyjlhsqL6iQ0B4nP8hYWr30wkKEWGjxCcpvLAne5vfXiGgTYtO3gPC+jNlfcrAKok6rYKh3p3vwbmYaAk85smx1B0NttCsgZOn6GB0NkDm6ULmQe+UeyNhqOvh0XDc3Xw72xmPVV6Bd7DtyIBiDXNSkrWFpyLqEZ4bkJnWdrQgqlLiwuIgUu+4cLwkiy4K7ug8mSBS1TvgCiYGi+O8WXSXR1NmBKiq+0hB+sJEaJXdSgcOMqKg1AFQOvAS6MKKoLs4yezEsETrJnAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAMM2+nLJXWe393WJhpNMOtYjh+KitkFykLa3KgigJt+dMB82tezWFvJyKJQ6t6TyP7Hrr6bXs+MujL2sJjYtS8mTAM+nV51kTNypvp8LOLTlvpApU+JQvLzHC9njBrdDV5e5jBwnT6BH4TVKSSxTZaWNMwOdcLoVLcP/L9CsT3sFzjQBYmDoopkZCx4EA/VAlRXR63Pff85Mmv7YndvWmcw/O/gZHhfzSk2GHC7+NMrPiTojqRCDLXRrVVKndqJKiOO3BU+nJNEOUFxrEqluxPFtToTAr/26Q2p4HW5Tvq3/0qSfmdRyqleECCeTr6q3pW3efIImjiChA/eCxPSx9y0=
9f9efa86-14da-4d38-a7f9-5fe32f0fbb49	8ba7d48c-042d-4afc-acc9-62a6b04f7e34	algorithm	RSA-OAEP
9b9abd70-c41c-432f-b812-76ea1ed33a0c	8ba7d48c-042d-4afc-acc9-62a6b04f7e34	priority	100
ec19f30b-c24d-4a46-9e3f-fb4b35d1aec5	8ba7d48c-042d-4afc-acc9-62a6b04f7e34	privateKey	MIIEpAIBAAKCAQEAy9u4m72+HzLo9Ehf+AlITZWYYt7gn6B6eO4B8V5yo69Qr2OvQHGbvQmXkY5JhLut6XMc+Bzj1hso5YbKi+okNAeJz/IWFq99MJChFho8QnKbywJ3ub314hoE2LTt4DwvozZX3KwCqJOq2Cod6d78G5mGgJPObJsdQdDbbQrIGTp+hgdDZA5ulC5kHvlHsjYajr4dFw3N18O9sZj1VegXew7ciAYg1zUpK1haci6hGeG5CZ1na0IKpS4sLiIFLvuHC8JIsuCu7oPJkgUtU74AomBovjvFl0l0dTZgSoqvtIQfrCRGiV3UoHDjKioNQBUDrwEujCiqC7OMnsxLBE6yZwIDAQABAoIBABGox84B+qQUPRba5X6vOyqxYKEr98m21UqAKlNA4G2/2Z2f5TC6xrLHpRrFoyZoOvwD7fNWTqxKRQQrutmySjmRmkVqY1x1Y5hfPFJq/7kChEQVQ3l9Hv2GTdDXTNtFthti2+tF9qL+IRNsWT6xriWBP/ldFHQsXwqdBO0QvTMQyiVMmxaIOU7DYUor8wn8pHG6hRdC8IVV6kEhh+0pXis42VrmlAL6gqBrVK4KSt5aTcu7ZCwujAY4gdCp9Y3GDirHmKYaL4p65viOz7nkQaudqTpt4sw4PgiAAdqzqqRMh6nZFyhDlD+EnjPamRim8l08YFtXSG1YB0aqPAmk5/kCgYEA/tAdOTh4m/oWznSrxbe8k0eqCc9jSQ4aJKf//msunuFRd6vNyBZA2g97GEuKdRBcL7o1zaGxV2AY2OAHAzDb7HPv/fznpSA9nUxj//70M3U7K1LKObOPVnjOmlPZ9YIaQ5Q/wJIEE20ziBKdlb2RssiQUdcViGBUqJvowIw0XY8CgYEAzM7W2aqmiWyZlcppxYAbXrjuoFNOY38sAKD923oIE2C/w/FCSyuyH3a+U+Svx7D/F7gxM093XSFcXDQHiGljFo2r0sMh4tKuRasqhlm6C9TJNlnf7HVzUyttjT/3I7NskxQQN9WSp2UmBnvhxRS1svgRoRWuFMwUfzo3pSO6oakCgYEAjat9o/OusuHPzkd1vT7TXHtKoZupUtPBW0IAhR5oVDNnzQY7KhSdR9+1i6NsPnuzFWINSd+tLqwiBGpB29dNXuByvR7gV6FeQFdZfdntQbLbC9JC1uPrPKN8EreuBd6o5YvGCjXkiDx9mxjmfntgRytVefsAYMtWJkxQksUg1CcCgYEAo0j87kkpwUK+KDhan8WFDL3wMg543saTNGUmP4dJTPnDqdp9eiT6PC+Vipk2s8SffC+zui7PAYcJddFdeBpdj6ufo8dDCu3hV1Yh7z82Hxyk1xpMdt8k9NgY3ZZz2RjBpXlHfNxfsenoqR63X0Mloew5Ue5Q/e+/H7gwiQ61SxECgYBGOkcG3DppVYMH7fpsYVmr7ChTxgwywBitY1m8sohI1To63LiocS/kFuo1XYCH0PPZt08vEWi/9lzmztwdKgFv4hsXz2gM2oblMhZWeHfDWu4gTEYznHX5bSgdEIqp/VIBZTaC8m/1Wpr9ddAX07wZyzrdj4Q+dkBPa/go73Krmw==
45acf175-32d2-495e-a15a-2b3ffef194fa	17087d62-7061-4aac-adea-50f653ebe276	priority	100
8110b188-7d9f-4513-aca4-b22d5e6588de	17087d62-7061-4aac-adea-50f653ebe276	keyUse	SIG
24619386-08ce-4404-a6de-c48fb301f877	17087d62-7061-4aac-adea-50f653ebe276	privateKey	MIIEpAIBAAKCAQEA2SJEVQLXfEFQit2EJYycaZMLrec9cN687vlLsRh13X4H2halNdNJVj3w3UJeTAEPbuJXKNAAqpQq9nybzTipYc6zl26JikAWLDtT/RGXs4wIPW1dxTS0uhD8PD0t7snDrw61Uxv4fJuvd8MtrEWth1bGuCxhJDtt+ZC0KUL9XsN68kLn2VYH58kmWqs0y8J8ei46B996ZAleKfnxHjLeXvsO93aCcjMMDKh8DFdY0OL56QuZFJwY8jYHEfvzFuHTMC+t+7EJK4Ge+Yq5BYLmXfa+tkqURanBpOJo3t0hK1M4XH94ibaWHot2Y9/AN/zNk2i2bYnxtPDHuLmBpNWLgwIDAQABAoIBAA+Za7sg+dX8vUQUt2Zl/5cbUAbKd6DXWulFclL2FM9FiCitx5wiPBqpild8nQvgNNMjCKvI2Cg15Kl4eOfMyJwOi3SqjANC9Zs85Ry0k43IvPWb/1VOvL/0JQlQ3eI4KMpRVLHBVZNIl6atGE42Y7A28EGrOPL8IAg10kB3bLHoWG1Dboj14v/v1zTT4yOwwhVQY2fY5dsqTaR2YzvPNgcyhGrU3Uf3CLyyNMoyfACMFBU5QKpH8BHBTijRPZCml9WH8fF1E1NiyDTCKZ5gU54NS3SLI3QG86CLRK6nMcrNI7um9MmBIFTV/ohJiG7ybRtshhUZlU2//6nZSPMOFWUCgYEA9H1W5VsXQvIjwxixHkq0xC0FDlsRNXyauxx3upzHRJ5T2WWwedneQBAav6qiACN/QuVHQ8Yp/u0JAoiYAinl+E2ocyVhmks5Sw6s2FDbbhAyyxM93UwapLWPDInB2m1JlDjaal1yOSCbzMX5hvPG7sa1gemdioajQU0o6fwNjPcCgYEA41s6WV6HXn5+LuCc+j+HqsJDc/dYHlQ9AtjrGMqXgQYP5Bh+Avt0xHniZNkP2UbCAr/cFsg7yWGjDaHD8P8zYtMZPI4f+mQ4q0kk5ljudV0ITtEZA43oUuIQhQjCMNB2bq++7zA8SBfnI4Uc675supGbVeBx4BpAEpxLvb1ETtUCgYEAgCnQSo0UxZhPXO9tsbZxykDbXKoqfEJkjl+e9+lFoFfrFpRzDX1DP4vxqbXWFIKHLNcqI4IW87boOTbHkKLMFf0Hp8zZvFtgnlMEEqVYUfsV1VSx4ncJpHw0j9sLDuipYJTpEkcIIKBSa+cAJllWWEc8UOzZFAv+OrYrE3V42QMCgYEAj7ZQ0cDw7IgkltkgIQcbaJLXNGx65OD2l+Ap60fUMJh2XwYkURpFmxQ4SOr0G7GgXUCNjFERiaAQA0PnqWSHRMaPQznLeOj08UCQ9JHuWX1vDPMbTqXa3tlK++ynY1fCJQEuPd9Nm3yQfGFeAJ4j+GKlv8jZ8oBlU947+jmy/ekCgYA+PHrXw61B6nBrBhdKvBBDJ5Ml53rf2CA8Fi8FlNI+RBkHBcyHzlpPrzQVLzxUFzk3KQ2rYOCVRtZyOG5NU8R4/Ko9gvoKYRrr93wpBYLgaxLsDVCK/m7csRVpFO3b9nnDgLv4ARUaSk4iQy85KN65+fj8p/+5ANDwvldKh0WbAA==
8ff9bdbd-828f-46e1-9192-050b4c44daac	17087d62-7061-4aac-adea-50f653ebe276	certificate	MIICmzCCAYMCBgGHI60RSjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwMzI3MTUyNDE3WhcNMzMwMzI3MTUyNTU3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDZIkRVAtd8QVCK3YQljJxpkwut5z1w3rzu+UuxGHXdfgfaFqU100lWPfDdQl5MAQ9u4lco0ACqlCr2fJvNOKlhzrOXbomKQBYsO1P9EZezjAg9bV3FNLS6EPw8PS3uycOvDrVTG/h8m693wy2sRa2HVsa4LGEkO235kLQpQv1ew3ryQufZVgfnySZaqzTLwnx6LjoH33pkCV4p+fEeMt5e+w73doJyMwwMqHwMV1jQ4vnpC5kUnBjyNgcR+/MW4dMwL637sQkrgZ75irkFguZd9r62SpRFqcGk4mje3SErUzhcf3iJtpYei3Zj38A3/M2TaLZtifG08Me4uYGk1YuDAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKQg1gx7P48qjWQeiU3iX295sPUYiyakcka4at3aBBZDgocdcDyvT/QBOMairNkQJCIOo6cb3HmpG0bopDU2d3fzbiBakhhkLcdZZ44QwUvzFjek26/rL/vG5q6cJfPspitJQ2DulRTZcJ7xGgO5QJ21kLt9N0Vv+bUFlrVN7peswwJmFCYkTCBsaeACm4rPOprDhK8EQKpBU6W6EE+Iuo6StZkt1nDMCEHLjvnyLjvyy4nImCtOvzfI0GZnA4fMpqt6Gr565wv3g9m6oShHZicDI5iBsaX6Jq8WNjUoqX+CmnKpYq+avBaQ5AoEF3vnMOtt2S78E4MzojEc2zCt1w4=
e41573db-11b2-441d-81e5-e1635f6d9f55	d630e036-6ddc-4c39-960b-47c25045d4a8	priority	100
a4db8483-11c6-4bb7-9093-51ea0dd82670	d630e036-6ddc-4c39-960b-47c25045d4a8	kid	0b596a9c-46d1-4982-9e44-b0b882331459
03a6cf31-f1fe-477b-bc2d-5374bb1f6a38	d630e036-6ddc-4c39-960b-47c25045d4a8	secret	bx8dh8iSEt_cl19AcIVXp-xniZdYfLKW5s2XOcaeirMSU2FkQvu_-YnRB0ZMKGfGGbaV5cKiJGzpHUfJfBb6lA
02f7f2fa-a9e6-4e0e-93c9-e760adb144a0	d630e036-6ddc-4c39-960b-47c25045d4a8	algorithm	HS256
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
4d56468a-286e-4c7b-8295-222de400d51f	4d90d419-a4e2-4ebc-97b2-e16ffcb84ae3
4d56468a-286e-4c7b-8295-222de400d51f	1efc0d7f-ba0d-4c81-a184-5f18681a455b
4d56468a-286e-4c7b-8295-222de400d51f	1581da7c-d7a1-47ef-9160-d82a453c4102
4d56468a-286e-4c7b-8295-222de400d51f	58ec75b8-32b5-4dd6-b840-fc53ea5579f5
4d56468a-286e-4c7b-8295-222de400d51f	6757aa82-d0c8-4378-a48e-d0ddab28053d
4d56468a-286e-4c7b-8295-222de400d51f	40d4fe06-90ad-4596-9565-2c40e3a0c039
4d56468a-286e-4c7b-8295-222de400d51f	a459da9c-6a8c-46c8-983f-e2cd7737b9eb
4d56468a-286e-4c7b-8295-222de400d51f	ac837ace-2619-4c4b-89de-32cdadc1cfaa
4d56468a-286e-4c7b-8295-222de400d51f	b1c81ba6-7ee7-482f-9c59-53c55679fad0
4d56468a-286e-4c7b-8295-222de400d51f	acb230cc-5bd5-4f0b-b441-10dc98fedf7a
4d56468a-286e-4c7b-8295-222de400d51f	f50ecea3-c1d0-4299-b508-65dcfe81bb01
4d56468a-286e-4c7b-8295-222de400d51f	2490ce30-eeae-41ba-a3b0-039876ba3067
4d56468a-286e-4c7b-8295-222de400d51f	c0c85c1d-1159-48bb-9861-6bb09c27a22e
4d56468a-286e-4c7b-8295-222de400d51f	2294aa6d-82ef-4e56-bb31-2675799bd418
4d56468a-286e-4c7b-8295-222de400d51f	23595c50-89a1-48e9-b2d0-2f6fd3d01fa9
4d56468a-286e-4c7b-8295-222de400d51f	f0fefad2-576e-45c1-869d-e48b6cc91a4d
4d56468a-286e-4c7b-8295-222de400d51f	70eb1e0e-0b13-4a52-ae79-cb4c6ed2bb0b
4d56468a-286e-4c7b-8295-222de400d51f	29ec62d2-6fdb-4abd-97a3-ecf77ce3c5e1
58ec75b8-32b5-4dd6-b840-fc53ea5579f5	23595c50-89a1-48e9-b2d0-2f6fd3d01fa9
58ec75b8-32b5-4dd6-b840-fc53ea5579f5	29ec62d2-6fdb-4abd-97a3-ecf77ce3c5e1
6757aa82-d0c8-4378-a48e-d0ddab28053d	f0fefad2-576e-45c1-869d-e48b6cc91a4d
a4a23b4e-d45c-4887-9101-fe9f496fe8f6	ebd0c45b-c932-4b22-bb6a-980e4666903d
a4a23b4e-d45c-4887-9101-fe9f496fe8f6	ac6f1a89-fd3c-4e98-812b-3d9edc69cc67
ac6f1a89-fd3c-4e98-812b-3d9edc69cc67	2874a60a-2d44-4b8b-8eb3-eafb15fe7000
f784fcc7-db04-4498-9400-eaf418ce6c12	a08f10fc-dee6-4903-b8f9-6e10a34c0bcb
4d56468a-286e-4c7b-8295-222de400d51f	bcb80c46-fcf7-495c-9db2-3b3e5a3d1042
a4a23b4e-d45c-4887-9101-fe9f496fe8f6	2c0c9a3c-f1cc-4675-bc72-bac662e1a75b
a4a23b4e-d45c-4887-9101-fe9f496fe8f6	65e84a44-cd92-47be-924c-11209e9d1622
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
751fddc3-c83c-4acd-a2c5-7109c2a25cbb	\N	password	61145494-d7be-46fb-b3de-4def26c2c145	1680010822409	\N	{"value":"JJwjdzD8eUbWsyvcP4PYr6e2wGVVPx99Ocwru+IGZsM=","salt":"KOAGiAQVDJv4ydNaCmYfYQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-03-27 15:25:53.020177	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.16.1	\N	\N	9930752339
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-03-27 15:25:53.040732	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.16.1	\N	\N	9930752339
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-03-27 15:25:53.109395	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.16.1	\N	\N	9930752339
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-03-27 15:25:53.124608	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.16.1	\N	\N	9930752339
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-03-27 15:25:53.283455	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.16.1	\N	\N	9930752339
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-03-27 15:25:53.2857	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.16.1	\N	\N	9930752339
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-03-27 15:25:53.448281	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.16.1	\N	\N	9930752339
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-03-27 15:25:53.450998	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.16.1	\N	\N	9930752339
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-03-27 15:25:53.463365	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.16.1	\N	\N	9930752339
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-03-27 15:25:53.5807	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.16.1	\N	\N	9930752339
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-03-27 15:25:53.667805	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	9930752339
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-03-27 15:25:53.671909	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	9930752339
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-03-27 15:25:53.821796	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	9930752339
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-03-27 15:25:53.84917	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.16.1	\N	\N	9930752339
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-03-27 15:25:53.850882	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	9930752339
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-03-27 15:25:53.853135	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.16.1	\N	\N	9930752339
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-03-27 15:25:53.86493	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.16.1	\N	\N	9930752339
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-03-27 15:25:53.931649	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.16.1	\N	\N	9930752339
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-03-27 15:25:53.989942	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.16.1	\N	\N	9930752339
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-03-27 15:25:53.994608	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.16.1	\N	\N	9930752339
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-03-27 15:25:54.003254	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.16.1	\N	\N	9930752339
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-03-27 15:25:54.005932	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.16.1	\N	\N	9930752339
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-03-27 15:25:54.044535	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.16.1	\N	\N	9930752339
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-03-27 15:25:54.051083	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.16.1	\N	\N	9930752339
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-03-27 15:25:54.052674	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.16.1	\N	\N	9930752339
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-03-27 15:25:54.081716	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.16.1	\N	\N	9930752339
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-03-27 15:25:54.146048	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.16.1	\N	\N	9930752339
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-03-27 15:25:54.150066	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.16.1	\N	\N	9930752339
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-03-27 15:25:54.211846	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.16.1	\N	\N	9930752339
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-03-27 15:25:54.231012	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.16.1	\N	\N	9930752339
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-03-27 15:25:54.248702	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.16.1	\N	\N	9930752339
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-03-27 15:25:54.253988	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.16.1	\N	\N	9930752339
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-03-27 15:25:54.260559	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	9930752339
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-03-27 15:25:54.268652	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.16.1	\N	\N	9930752339
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-03-27 15:25:54.305069	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.16.1	\N	\N	9930752339
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-03-27 15:25:54.311756	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.16.1	\N	\N	9930752339
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-03-27 15:25:54.31922	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	9930752339
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-03-27 15:25:54.324389	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.16.1	\N	\N	9930752339
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-03-27 15:25:54.329642	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.16.1	\N	\N	9930752339
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-03-27 15:25:54.331142	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.16.1	\N	\N	9930752339
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-03-27 15:25:54.333909	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.16.1	\N	\N	9930752339
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-03-27 15:25:54.341945	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.16.1	\N	\N	9930752339
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-03-27 15:25:54.427746	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.16.1	\N	\N	9930752339
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-03-27 15:25:54.432503	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.16.1	\N	\N	9930752339
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-03-27 15:25:54.437805	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.16.1	\N	\N	9930752339
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-03-27 15:25:54.444051	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.16.1	\N	\N	9930752339
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-03-27 15:25:54.445348	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.16.1	\N	\N	9930752339
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-03-27 15:25:54.48571	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.16.1	\N	\N	9930752339
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-03-27 15:25:54.490069	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.16.1	\N	\N	9930752339
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-03-27 15:25:54.526761	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.16.1	\N	\N	9930752339
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-03-27 15:25:54.547195	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.16.1	\N	\N	9930752339
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-03-27 15:25:54.550683	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	9930752339
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-03-27 15:25:54.553664	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.16.1	\N	\N	9930752339
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-03-27 15:25:54.55713	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.16.1	\N	\N	9930752339
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-03-27 15:25:54.570571	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.16.1	\N	\N	9930752339
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-03-27 15:25:54.575156	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.16.1	\N	\N	9930752339
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-03-27 15:25:54.592169	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.16.1	\N	\N	9930752339
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-03-27 15:25:54.689112	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.16.1	\N	\N	9930752339
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-03-27 15:25:54.713493	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.16.1	\N	\N	9930752339
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-03-27 15:25:54.719531	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.16.1	\N	\N	9930752339
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-03-27 15:25:54.728794	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.16.1	\N	\N	9930752339
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-03-27 15:25:54.733491	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.16.1	\N	\N	9930752339
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-03-27 15:25:54.73742	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.16.1	\N	\N	9930752339
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-03-27 15:25:54.740383	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.16.1	\N	\N	9930752339
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-03-27 15:25:54.743539	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.16.1	\N	\N	9930752339
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-03-27 15:25:54.752966	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.16.1	\N	\N	9930752339
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-03-27 15:25:54.756718	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.16.1	\N	\N	9930752339
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-03-27 15:25:54.76123	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.16.1	\N	\N	9930752339
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-03-27 15:25:54.780976	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.16.1	\N	\N	9930752339
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-03-27 15:25:54.786726	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.16.1	\N	\N	9930752339
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-03-27 15:25:54.79113	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.16.1	\N	\N	9930752339
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-03-27 15:25:54.798267	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	9930752339
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-03-27 15:25:54.807254	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	9930752339
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-03-27 15:25:54.808642	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	9930752339
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-03-27 15:25:54.830268	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.16.1	\N	\N	9930752339
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-03-27 15:25:54.836153	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.16.1	\N	\N	9930752339
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-03-27 15:25:54.839702	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.16.1	\N	\N	9930752339
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-03-27 15:25:54.840896	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.16.1	\N	\N	9930752339
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-03-27 15:25:54.858111	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.16.1	\N	\N	9930752339
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-03-27 15:25:54.859605	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.16.1	\N	\N	9930752339
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-03-27 15:25:54.864414	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.16.1	\N	\N	9930752339
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-03-27 15:25:54.865568	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	9930752339
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-03-27 15:25:54.870204	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	9930752339
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-03-27 15:25:54.871372	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	9930752339
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-03-27 15:25:54.875804	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.16.1	\N	\N	9930752339
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-03-27 15:25:54.880655	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.16.1	\N	\N	9930752339
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-03-27 15:25:54.888732	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.16.1	\N	\N	9930752339
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-03-27 15:25:54.894644	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.16.1	\N	\N	9930752339
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-03-27 15:25:54.90054	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.16.1	\N	\N	9930752339
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-03-27 15:25:54.905808	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.16.1	\N	\N	9930752339
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-03-27 15:25:54.910012	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	9930752339
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-03-27 15:25:54.91796	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.16.1	\N	\N	9930752339
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-03-27 15:25:54.919334	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.16.1	\N	\N	9930752339
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-03-27 15:25:54.92638	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.16.1	\N	\N	9930752339
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-03-27 15:25:54.927826	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.16.1	\N	\N	9930752339
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-03-27 15:25:54.933853	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.16.1	\N	\N	9930752339
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-03-27 15:25:54.940754	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	9930752339
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-03-27 15:25:54.94198	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	9930752339
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-03-27 15:25:54.957223	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	9930752339
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-03-27 15:25:54.962746	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	9930752339
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-03-27 15:25:54.964379	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	9930752339
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-03-27 15:25:54.970171	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.16.1	\N	\N	9930752339
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-03-27 15:25:54.975799	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.16.1	\N	\N	9930752339
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-03-27 15:25:54.981693	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.16.1	\N	\N	9930752339
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-03-27 15:25:54.985652	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.16.1	\N	\N	9930752339
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-03-27 15:25:54.989404	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.16.1	\N	\N	9930752339
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-03-27 15:25:54.994371	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.16.1	\N	\N	9930752339
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-03-27 15:25:54.99823	108	EXECUTED	8:05c99fc610845ef66ee812b7921af0ef	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.16.1	\N	\N	9930752339
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-03-27 15:25:54.9995	109	MARK_RAN	8:314e803baf2f1ec315b3464e398b8247	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.16.1	\N	\N	9930752339
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-03-27 15:25:55.005719	110	EXECUTED	8:56e4677e7e12556f70b604c573840100	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	9930752339
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
b667d691-5b73-48d2-bd66-7650fe75f19c	305f5ad4-3877-4e7e-b44f-746f77ab6a94	f
b667d691-5b73-48d2-bd66-7650fe75f19c	37ca1b38-b757-42bf-916a-16edc06ee74f	t
b667d691-5b73-48d2-bd66-7650fe75f19c	30705c95-6a75-4c6b-9886-a6c1fc6d60c0	t
b667d691-5b73-48d2-bd66-7650fe75f19c	88bc54e8-3899-4f1f-b089-ec5160facbe9	t
b667d691-5b73-48d2-bd66-7650fe75f19c	9a3186f8-14fb-4952-afbb-94fb017251da	f
b667d691-5b73-48d2-bd66-7650fe75f19c	44dc0265-da66-4723-9817-0abe23539ca3	f
b667d691-5b73-48d2-bd66-7650fe75f19c	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12	t
b667d691-5b73-48d2-bd66-7650fe75f19c	ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd	t
b667d691-5b73-48d2-bd66-7650fe75f19c	76cd9e62-5261-4ea9-bb41-761dfba37d71	f
b667d691-5b73-48d2-bd66-7650fe75f19c	3dc58afb-1664-448c-ae68-9d1f5e830c16	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
a4a23b4e-d45c-4887-9101-fe9f496fe8f6	b667d691-5b73-48d2-bd66-7650fe75f19c	f	${role_default-roles}	default-roles-master	b667d691-5b73-48d2-bd66-7650fe75f19c	\N	\N
4d56468a-286e-4c7b-8295-222de400d51f	b667d691-5b73-48d2-bd66-7650fe75f19c	f	${role_admin}	admin	b667d691-5b73-48d2-bd66-7650fe75f19c	\N	\N
4d90d419-a4e2-4ebc-97b2-e16ffcb84ae3	b667d691-5b73-48d2-bd66-7650fe75f19c	f	${role_create-realm}	create-realm	b667d691-5b73-48d2-bd66-7650fe75f19c	\N	\N
1efc0d7f-ba0d-4c81-a184-5f18681a455b	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_create-client}	create-client	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
1581da7c-d7a1-47ef-9160-d82a453c4102	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_view-realm}	view-realm	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
58ec75b8-32b5-4dd6-b840-fc53ea5579f5	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_view-users}	view-users	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
6757aa82-d0c8-4378-a48e-d0ddab28053d	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_view-clients}	view-clients	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
40d4fe06-90ad-4596-9565-2c40e3a0c039	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_view-events}	view-events	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
a459da9c-6a8c-46c8-983f-e2cd7737b9eb	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_view-identity-providers}	view-identity-providers	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
ac837ace-2619-4c4b-89de-32cdadc1cfaa	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_view-authorization}	view-authorization	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
b1c81ba6-7ee7-482f-9c59-53c55679fad0	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_manage-realm}	manage-realm	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
acb230cc-5bd5-4f0b-b441-10dc98fedf7a	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_manage-users}	manage-users	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
f50ecea3-c1d0-4299-b508-65dcfe81bb01	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_manage-clients}	manage-clients	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
2490ce30-eeae-41ba-a3b0-039876ba3067	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_manage-events}	manage-events	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
c0c85c1d-1159-48bb-9861-6bb09c27a22e	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_manage-identity-providers}	manage-identity-providers	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
2294aa6d-82ef-4e56-bb31-2675799bd418	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_manage-authorization}	manage-authorization	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
23595c50-89a1-48e9-b2d0-2f6fd3d01fa9	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_query-users}	query-users	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
f0fefad2-576e-45c1-869d-e48b6cc91a4d	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_query-clients}	query-clients	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
70eb1e0e-0b13-4a52-ae79-cb4c6ed2bb0b	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_query-realms}	query-realms	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
29ec62d2-6fdb-4abd-97a3-ecf77ce3c5e1	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_query-groups}	query-groups	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
ebd0c45b-c932-4b22-bb6a-980e4666903d	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	${role_view-profile}	view-profile	b667d691-5b73-48d2-bd66-7650fe75f19c	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	\N
ac6f1a89-fd3c-4e98-812b-3d9edc69cc67	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	${role_manage-account}	manage-account	b667d691-5b73-48d2-bd66-7650fe75f19c	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	\N
2874a60a-2d44-4b8b-8eb3-eafb15fe7000	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	${role_manage-account-links}	manage-account-links	b667d691-5b73-48d2-bd66-7650fe75f19c	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	\N
21397628-5dd8-4dec-905e-5df38b2b7fbd	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	${role_view-applications}	view-applications	b667d691-5b73-48d2-bd66-7650fe75f19c	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	\N
a08f10fc-dee6-4903-b8f9-6e10a34c0bcb	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	${role_view-consent}	view-consent	b667d691-5b73-48d2-bd66-7650fe75f19c	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	\N
f784fcc7-db04-4498-9400-eaf418ce6c12	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	${role_manage-consent}	manage-consent	b667d691-5b73-48d2-bd66-7650fe75f19c	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	\N
ce858c23-0329-44b3-a76d-694084c86ea3	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	${role_view-groups}	view-groups	b667d691-5b73-48d2-bd66-7650fe75f19c	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	\N
3abfb3cc-117b-4770-8091-d6e7f066e4b4	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	t	${role_delete-account}	delete-account	b667d691-5b73-48d2-bd66-7650fe75f19c	dcd0222b-a39b-4c6c-aef6-9cfda2299c26	\N
63f48c39-e551-4d43-88f6-ecbbee5bf3f2	c53583db-c846-4b89-9d93-9c55a4f1edeb	t	${role_read-token}	read-token	b667d691-5b73-48d2-bd66-7650fe75f19c	c53583db-c846-4b89-9d93-9c55a4f1edeb	\N
bcb80c46-fcf7-495c-9db2-3b3e5a3d1042	e3d046ad-5b16-4742-b680-7dc1b7108473	t	${role_impersonation}	impersonation	b667d691-5b73-48d2-bd66-7650fe75f19c	e3d046ad-5b16-4742-b680-7dc1b7108473	\N
2c0c9a3c-f1cc-4675-bc72-bac662e1a75b	b667d691-5b73-48d2-bd66-7650fe75f19c	f	${role_offline-access}	offline_access	b667d691-5b73-48d2-bd66-7650fe75f19c	\N	\N
65e84a44-cd92-47be-924c-11209e9d1622	b667d691-5b73-48d2-bd66-7650fe75f19c	f	${role_uma_authorization}	uma_authorization	b667d691-5b73-48d2-bd66-7650fe75f19c	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
rt481	21.0.1	1679930755
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
0c6693b3-778f-402f-9132-5535b3287f53	audience resolve	openid-connect	oidc-audience-resolve-mapper	5a7a33d8-141e-4e72-88ae-e89b238d93c9	\N
68bcf527-2072-4ec3-b086-ecb9d705a905	locale	openid-connect	oidc-usermodel-attribute-mapper	45f35b4c-c63d-40b6-af0b-b6b6a328485f	\N
d1f0609f-296f-4165-b8ad-b8938e0089c0	role list	saml	saml-role-list-mapper	\N	37ca1b38-b757-42bf-916a-16edc06ee74f
cbfe023a-4526-4130-a5e9-c0bac16d0936	full name	openid-connect	oidc-full-name-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
608e73af-f5dc-4766-ad15-78e16ec177a3	family name	openid-connect	oidc-usermodel-property-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
9cca8abe-b32c-4825-a0f9-43016fd6b94a	given name	openid-connect	oidc-usermodel-property-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
61a2236a-6a3e-43a7-8114-b0ded8c2afb4	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
d3ab608d-bfba-4c73-a405-00d99b23081a	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
c2babb47-0563-4aa8-9599-bddbf9ffbf56	username	openid-connect	oidc-usermodel-property-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
93784567-6715-4f99-bbde-60415d5bf234	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
98878bd5-7b55-46d6-b2b9-c34e33649cd1	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
1898ee2d-0918-4aef-ad02-be252fe2775d	website	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
15da03b3-605d-4ba1-9e8c-dd4576cd1302	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
7ed5727b-4b18-4a9d-b0b6-c470f774589f	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
f3f61f1f-04b7-4e2b-8042-91e66cd943a1	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
15a8ffdc-221d-413f-bb62-dab0823b1d6e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
0ac2b8e7-df0b-40c3-a28c-29d032515319	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	30705c95-6a75-4c6b-9886-a6c1fc6d60c0
0375f686-d83d-4be2-a145-97cfe752dd52	email	openid-connect	oidc-usermodel-property-mapper	\N	88bc54e8-3899-4f1f-b089-ec5160facbe9
c0e4e6d7-4c21-40f6-9cf1-578938c150a1	email verified	openid-connect	oidc-usermodel-property-mapper	\N	88bc54e8-3899-4f1f-b089-ec5160facbe9
890432a2-c3da-4557-a6c5-30ee85cc7a86	address	openid-connect	oidc-address-mapper	\N	9a3186f8-14fb-4952-afbb-94fb017251da
35d72ff7-7963-4fc9-a983-b94138cb9867	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	44dc0265-da66-4723-9817-0abe23539ca3
5f020b0e-cfdc-4671-981d-62030719660b	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	44dc0265-da66-4723-9817-0abe23539ca3
d153eceb-eaf1-42b6-866d-89a351a89dea	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12
d608e7cf-54cf-47a7-bd4c-30972e9f8447	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12
c11fe280-2f2b-4fa8-b0eb-8d62c179d0d1	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	8f397e3c-e8c5-4078-8ac8-ce8f1ccd3f12
fc918d6c-7157-488f-bf6d-d4821cd2a83c	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	ac2545ec-4b2a-4db1-9a2a-7615ef8de3fd
fc7b18c7-54c9-400c-aeef-df191767b621	upn	openid-connect	oidc-usermodel-property-mapper	\N	76cd9e62-5261-4ea9-bb41-761dfba37d71
bf6d8827-b4e2-4ffe-bb86-9c9bb5c58cfa	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	76cd9e62-5261-4ea9-bb41-761dfba37d71
3a480b9a-1571-41ae-9d4c-d0f2353d34a0	acr loa level	openid-connect	oidc-acr-mapper	\N	3dc58afb-1664-448c-ae68-9d1f5e830c16
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
68bcf527-2072-4ec3-b086-ecb9d705a905	true	userinfo.token.claim
68bcf527-2072-4ec3-b086-ecb9d705a905	locale	user.attribute
68bcf527-2072-4ec3-b086-ecb9d705a905	true	id.token.claim
68bcf527-2072-4ec3-b086-ecb9d705a905	true	access.token.claim
68bcf527-2072-4ec3-b086-ecb9d705a905	locale	claim.name
68bcf527-2072-4ec3-b086-ecb9d705a905	String	jsonType.label
d1f0609f-296f-4165-b8ad-b8938e0089c0	false	single
d1f0609f-296f-4165-b8ad-b8938e0089c0	Basic	attribute.nameformat
d1f0609f-296f-4165-b8ad-b8938e0089c0	Role	attribute.name
0ac2b8e7-df0b-40c3-a28c-29d032515319	true	userinfo.token.claim
0ac2b8e7-df0b-40c3-a28c-29d032515319	updatedAt	user.attribute
0ac2b8e7-df0b-40c3-a28c-29d032515319	true	id.token.claim
0ac2b8e7-df0b-40c3-a28c-29d032515319	true	access.token.claim
0ac2b8e7-df0b-40c3-a28c-29d032515319	updated_at	claim.name
0ac2b8e7-df0b-40c3-a28c-29d032515319	long	jsonType.label
15a8ffdc-221d-413f-bb62-dab0823b1d6e	true	userinfo.token.claim
15a8ffdc-221d-413f-bb62-dab0823b1d6e	locale	user.attribute
15a8ffdc-221d-413f-bb62-dab0823b1d6e	true	id.token.claim
15a8ffdc-221d-413f-bb62-dab0823b1d6e	true	access.token.claim
15a8ffdc-221d-413f-bb62-dab0823b1d6e	locale	claim.name
15a8ffdc-221d-413f-bb62-dab0823b1d6e	String	jsonType.label
15da03b3-605d-4ba1-9e8c-dd4576cd1302	true	userinfo.token.claim
15da03b3-605d-4ba1-9e8c-dd4576cd1302	gender	user.attribute
15da03b3-605d-4ba1-9e8c-dd4576cd1302	true	id.token.claim
15da03b3-605d-4ba1-9e8c-dd4576cd1302	true	access.token.claim
15da03b3-605d-4ba1-9e8c-dd4576cd1302	gender	claim.name
15da03b3-605d-4ba1-9e8c-dd4576cd1302	String	jsonType.label
1898ee2d-0918-4aef-ad02-be252fe2775d	true	userinfo.token.claim
1898ee2d-0918-4aef-ad02-be252fe2775d	website	user.attribute
1898ee2d-0918-4aef-ad02-be252fe2775d	true	id.token.claim
1898ee2d-0918-4aef-ad02-be252fe2775d	true	access.token.claim
1898ee2d-0918-4aef-ad02-be252fe2775d	website	claim.name
1898ee2d-0918-4aef-ad02-be252fe2775d	String	jsonType.label
608e73af-f5dc-4766-ad15-78e16ec177a3	true	userinfo.token.claim
608e73af-f5dc-4766-ad15-78e16ec177a3	lastName	user.attribute
608e73af-f5dc-4766-ad15-78e16ec177a3	true	id.token.claim
608e73af-f5dc-4766-ad15-78e16ec177a3	true	access.token.claim
608e73af-f5dc-4766-ad15-78e16ec177a3	family_name	claim.name
608e73af-f5dc-4766-ad15-78e16ec177a3	String	jsonType.label
61a2236a-6a3e-43a7-8114-b0ded8c2afb4	true	userinfo.token.claim
61a2236a-6a3e-43a7-8114-b0ded8c2afb4	middleName	user.attribute
61a2236a-6a3e-43a7-8114-b0ded8c2afb4	true	id.token.claim
61a2236a-6a3e-43a7-8114-b0ded8c2afb4	true	access.token.claim
61a2236a-6a3e-43a7-8114-b0ded8c2afb4	middle_name	claim.name
61a2236a-6a3e-43a7-8114-b0ded8c2afb4	String	jsonType.label
7ed5727b-4b18-4a9d-b0b6-c470f774589f	true	userinfo.token.claim
7ed5727b-4b18-4a9d-b0b6-c470f774589f	birthdate	user.attribute
7ed5727b-4b18-4a9d-b0b6-c470f774589f	true	id.token.claim
7ed5727b-4b18-4a9d-b0b6-c470f774589f	true	access.token.claim
7ed5727b-4b18-4a9d-b0b6-c470f774589f	birthdate	claim.name
7ed5727b-4b18-4a9d-b0b6-c470f774589f	String	jsonType.label
93784567-6715-4f99-bbde-60415d5bf234	true	userinfo.token.claim
93784567-6715-4f99-bbde-60415d5bf234	profile	user.attribute
93784567-6715-4f99-bbde-60415d5bf234	true	id.token.claim
93784567-6715-4f99-bbde-60415d5bf234	true	access.token.claim
93784567-6715-4f99-bbde-60415d5bf234	profile	claim.name
93784567-6715-4f99-bbde-60415d5bf234	String	jsonType.label
98878bd5-7b55-46d6-b2b9-c34e33649cd1	true	userinfo.token.claim
98878bd5-7b55-46d6-b2b9-c34e33649cd1	picture	user.attribute
98878bd5-7b55-46d6-b2b9-c34e33649cd1	true	id.token.claim
98878bd5-7b55-46d6-b2b9-c34e33649cd1	true	access.token.claim
98878bd5-7b55-46d6-b2b9-c34e33649cd1	picture	claim.name
98878bd5-7b55-46d6-b2b9-c34e33649cd1	String	jsonType.label
9cca8abe-b32c-4825-a0f9-43016fd6b94a	true	userinfo.token.claim
9cca8abe-b32c-4825-a0f9-43016fd6b94a	firstName	user.attribute
9cca8abe-b32c-4825-a0f9-43016fd6b94a	true	id.token.claim
9cca8abe-b32c-4825-a0f9-43016fd6b94a	true	access.token.claim
9cca8abe-b32c-4825-a0f9-43016fd6b94a	given_name	claim.name
9cca8abe-b32c-4825-a0f9-43016fd6b94a	String	jsonType.label
c2babb47-0563-4aa8-9599-bddbf9ffbf56	true	userinfo.token.claim
c2babb47-0563-4aa8-9599-bddbf9ffbf56	username	user.attribute
c2babb47-0563-4aa8-9599-bddbf9ffbf56	true	id.token.claim
c2babb47-0563-4aa8-9599-bddbf9ffbf56	true	access.token.claim
c2babb47-0563-4aa8-9599-bddbf9ffbf56	preferred_username	claim.name
c2babb47-0563-4aa8-9599-bddbf9ffbf56	String	jsonType.label
cbfe023a-4526-4130-a5e9-c0bac16d0936	true	userinfo.token.claim
cbfe023a-4526-4130-a5e9-c0bac16d0936	true	id.token.claim
cbfe023a-4526-4130-a5e9-c0bac16d0936	true	access.token.claim
d3ab608d-bfba-4c73-a405-00d99b23081a	true	userinfo.token.claim
d3ab608d-bfba-4c73-a405-00d99b23081a	nickname	user.attribute
d3ab608d-bfba-4c73-a405-00d99b23081a	true	id.token.claim
d3ab608d-bfba-4c73-a405-00d99b23081a	true	access.token.claim
d3ab608d-bfba-4c73-a405-00d99b23081a	nickname	claim.name
d3ab608d-bfba-4c73-a405-00d99b23081a	String	jsonType.label
f3f61f1f-04b7-4e2b-8042-91e66cd943a1	true	userinfo.token.claim
f3f61f1f-04b7-4e2b-8042-91e66cd943a1	zoneinfo	user.attribute
f3f61f1f-04b7-4e2b-8042-91e66cd943a1	true	id.token.claim
f3f61f1f-04b7-4e2b-8042-91e66cd943a1	true	access.token.claim
f3f61f1f-04b7-4e2b-8042-91e66cd943a1	zoneinfo	claim.name
f3f61f1f-04b7-4e2b-8042-91e66cd943a1	String	jsonType.label
0375f686-d83d-4be2-a145-97cfe752dd52	true	userinfo.token.claim
0375f686-d83d-4be2-a145-97cfe752dd52	email	user.attribute
0375f686-d83d-4be2-a145-97cfe752dd52	true	id.token.claim
0375f686-d83d-4be2-a145-97cfe752dd52	true	access.token.claim
0375f686-d83d-4be2-a145-97cfe752dd52	email	claim.name
0375f686-d83d-4be2-a145-97cfe752dd52	String	jsonType.label
c0e4e6d7-4c21-40f6-9cf1-578938c150a1	true	userinfo.token.claim
c0e4e6d7-4c21-40f6-9cf1-578938c150a1	emailVerified	user.attribute
c0e4e6d7-4c21-40f6-9cf1-578938c150a1	true	id.token.claim
c0e4e6d7-4c21-40f6-9cf1-578938c150a1	true	access.token.claim
c0e4e6d7-4c21-40f6-9cf1-578938c150a1	email_verified	claim.name
c0e4e6d7-4c21-40f6-9cf1-578938c150a1	boolean	jsonType.label
890432a2-c3da-4557-a6c5-30ee85cc7a86	formatted	user.attribute.formatted
890432a2-c3da-4557-a6c5-30ee85cc7a86	country	user.attribute.country
890432a2-c3da-4557-a6c5-30ee85cc7a86	postal_code	user.attribute.postal_code
890432a2-c3da-4557-a6c5-30ee85cc7a86	true	userinfo.token.claim
890432a2-c3da-4557-a6c5-30ee85cc7a86	street	user.attribute.street
890432a2-c3da-4557-a6c5-30ee85cc7a86	true	id.token.claim
890432a2-c3da-4557-a6c5-30ee85cc7a86	region	user.attribute.region
890432a2-c3da-4557-a6c5-30ee85cc7a86	true	access.token.claim
890432a2-c3da-4557-a6c5-30ee85cc7a86	locality	user.attribute.locality
35d72ff7-7963-4fc9-a983-b94138cb9867	true	userinfo.token.claim
35d72ff7-7963-4fc9-a983-b94138cb9867	phoneNumber	user.attribute
35d72ff7-7963-4fc9-a983-b94138cb9867	true	id.token.claim
35d72ff7-7963-4fc9-a983-b94138cb9867	true	access.token.claim
35d72ff7-7963-4fc9-a983-b94138cb9867	phone_number	claim.name
35d72ff7-7963-4fc9-a983-b94138cb9867	String	jsonType.label
5f020b0e-cfdc-4671-981d-62030719660b	true	userinfo.token.claim
5f020b0e-cfdc-4671-981d-62030719660b	phoneNumberVerified	user.attribute
5f020b0e-cfdc-4671-981d-62030719660b	true	id.token.claim
5f020b0e-cfdc-4671-981d-62030719660b	true	access.token.claim
5f020b0e-cfdc-4671-981d-62030719660b	phone_number_verified	claim.name
5f020b0e-cfdc-4671-981d-62030719660b	boolean	jsonType.label
d153eceb-eaf1-42b6-866d-89a351a89dea	true	multivalued
d153eceb-eaf1-42b6-866d-89a351a89dea	foo	user.attribute
d153eceb-eaf1-42b6-866d-89a351a89dea	true	access.token.claim
d153eceb-eaf1-42b6-866d-89a351a89dea	realm_access.roles	claim.name
d153eceb-eaf1-42b6-866d-89a351a89dea	String	jsonType.label
d608e7cf-54cf-47a7-bd4c-30972e9f8447	true	multivalued
d608e7cf-54cf-47a7-bd4c-30972e9f8447	foo	user.attribute
d608e7cf-54cf-47a7-bd4c-30972e9f8447	true	access.token.claim
d608e7cf-54cf-47a7-bd4c-30972e9f8447	resource_access.${client_id}.roles	claim.name
d608e7cf-54cf-47a7-bd4c-30972e9f8447	String	jsonType.label
bf6d8827-b4e2-4ffe-bb86-9c9bb5c58cfa	true	multivalued
bf6d8827-b4e2-4ffe-bb86-9c9bb5c58cfa	foo	user.attribute
bf6d8827-b4e2-4ffe-bb86-9c9bb5c58cfa	true	id.token.claim
bf6d8827-b4e2-4ffe-bb86-9c9bb5c58cfa	true	access.token.claim
bf6d8827-b4e2-4ffe-bb86-9c9bb5c58cfa	groups	claim.name
bf6d8827-b4e2-4ffe-bb86-9c9bb5c58cfa	String	jsonType.label
fc7b18c7-54c9-400c-aeef-df191767b621	true	userinfo.token.claim
fc7b18c7-54c9-400c-aeef-df191767b621	username	user.attribute
fc7b18c7-54c9-400c-aeef-df191767b621	true	id.token.claim
fc7b18c7-54c9-400c-aeef-df191767b621	true	access.token.claim
fc7b18c7-54c9-400c-aeef-df191767b621	upn	claim.name
fc7b18c7-54c9-400c-aeef-df191767b621	String	jsonType.label
3a480b9a-1571-41ae-9d4c-d0f2353d34a0	true	id.token.claim
3a480b9a-1571-41ae-9d4c-d0f2353d34a0	true	access.token.claim
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
b667d691-5b73-48d2-bd66-7650fe75f19c	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	e3d046ad-5b16-4742-b680-7dc1b7108473	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	da561aa6-423f-45f1-b542-6396eda3e08a	fb0759b0-062c-409b-bd4d-17ba3ae2490c	fd59f351-b1ce-4a6f-84e9-37812031370a	719ca543-a53e-49ef-b407-a4d47b24ebd4	80e8c27b-e840-4dae-9588-36082f7f7253	2592000	f	900	t	f	fa126f7e-1d64-490b-848d-410718890841	0	f	0	0	a4a23b4e-d45c-4887-9101-fe9f496fe8f6
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	b667d691-5b73-48d2-bd66-7650fe75f19c	
_browser_header.xContentTypeOptions	b667d691-5b73-48d2-bd66-7650fe75f19c	nosniff
_browser_header.xRobotsTag	b667d691-5b73-48d2-bd66-7650fe75f19c	none
_browser_header.xFrameOptions	b667d691-5b73-48d2-bd66-7650fe75f19c	SAMEORIGIN
_browser_header.contentSecurityPolicy	b667d691-5b73-48d2-bd66-7650fe75f19c	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	b667d691-5b73-48d2-bd66-7650fe75f19c	1; mode=block
_browser_header.strictTransportSecurity	b667d691-5b73-48d2-bd66-7650fe75f19c	max-age=31536000; includeSubDomains
bruteForceProtected	b667d691-5b73-48d2-bd66-7650fe75f19c	false
permanentLockout	b667d691-5b73-48d2-bd66-7650fe75f19c	false
maxFailureWaitSeconds	b667d691-5b73-48d2-bd66-7650fe75f19c	900
minimumQuickLoginWaitSeconds	b667d691-5b73-48d2-bd66-7650fe75f19c	60
waitIncrementSeconds	b667d691-5b73-48d2-bd66-7650fe75f19c	60
quickLoginCheckMilliSeconds	b667d691-5b73-48d2-bd66-7650fe75f19c	1000
maxDeltaTimeSeconds	b667d691-5b73-48d2-bd66-7650fe75f19c	43200
failureFactor	b667d691-5b73-48d2-bd66-7650fe75f19c	30
realmReusableOtpCode	b667d691-5b73-48d2-bd66-7650fe75f19c	false
displayName	b667d691-5b73-48d2-bd66-7650fe75f19c	Keycloak
displayNameHtml	b667d691-5b73-48d2-bd66-7650fe75f19c	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	b667d691-5b73-48d2-bd66-7650fe75f19c	RS256
offlineSessionMaxLifespanEnabled	b667d691-5b73-48d2-bd66-7650fe75f19c	false
offlineSessionMaxLifespan	b667d691-5b73-48d2-bd66-7650fe75f19c	5184000
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
b667d691-5b73-48d2-bd66-7650fe75f19c	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	b667d691-5b73-48d2-bd66-7650fe75f19c
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
dcd0222b-a39b-4c6c-aef6-9cfda2299c26	/realms/master/account/*
5a7a33d8-141e-4e72-88ae-e89b238d93c9	/realms/master/account/*
45f35b4c-c63d-40b6-af0b-b6b6a328485f	/admin/master/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
410d84c0-c77e-4856-b34b-f9c94093dc8e	VERIFY_EMAIL	Verify Email	b667d691-5b73-48d2-bd66-7650fe75f19c	t	f	VERIFY_EMAIL	50
e2bfd26f-cb15-4a58-a3c2-a99607a3ffc6	UPDATE_PROFILE	Update Profile	b667d691-5b73-48d2-bd66-7650fe75f19c	t	f	UPDATE_PROFILE	40
2a78bd0a-75d4-462c-b07c-b6d8b7702f54	CONFIGURE_TOTP	Configure OTP	b667d691-5b73-48d2-bd66-7650fe75f19c	t	f	CONFIGURE_TOTP	10
6da0bbc7-1ec5-44df-803d-e4d29d9dc907	UPDATE_PASSWORD	Update Password	b667d691-5b73-48d2-bd66-7650fe75f19c	t	f	UPDATE_PASSWORD	30
0878a4f0-97a0-4ef6-a5ba-f0d80a8ce0d5	TERMS_AND_CONDITIONS	Terms and Conditions	b667d691-5b73-48d2-bd66-7650fe75f19c	f	f	TERMS_AND_CONDITIONS	20
055fc8ae-b842-4ff2-a1f9-01c7a80377ee	delete_account	Delete Account	b667d691-5b73-48d2-bd66-7650fe75f19c	f	f	delete_account	60
1faa01c7-ba17-4e14-a4e1-847a0b41edda	update_user_locale	Update User Locale	b667d691-5b73-48d2-bd66-7650fe75f19c	t	f	update_user_locale	1000
3eb730b2-eacf-4d19-a70f-6eea6fed8229	webauthn-register	Webauthn Register	b667d691-5b73-48d2-bd66-7650fe75f19c	t	f	webauthn-register	70
4cd3e8cc-b161-49cf-88e6-219a3f7b73db	webauthn-register-passwordless	Webauthn Register Passwordless	b667d691-5b73-48d2-bd66-7650fe75f19c	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
5a7a33d8-141e-4e72-88ae-e89b238d93c9	ac6f1a89-fd3c-4e98-812b-3d9edc69cc67
5a7a33d8-141e-4e72-88ae-e89b238d93c9	ce858c23-0329-44b3-a76d-694084c86ea3
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
61145494-d7be-46fb-b3de-4def26c2c145	\N	eca34823-bc1a-4ed0-929f-c920b230fa94	f	t	\N	\N	\N	b667d691-5b73-48d2-bd66-7650fe75f19c	modon	1680010822086	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
a4a23b4e-d45c-4887-9101-fe9f496fe8f6	61145494-d7be-46fb-b3de-4def26c2c145
4d56468a-286e-4c7b-8295-222de400d51f	61145494-d7be-46fb-b3de-4def26c2c145
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
45f35b4c-c63d-40b6-af0b-b6b6a328485f	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

