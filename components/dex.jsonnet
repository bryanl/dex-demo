local dex = import("part-demos/dex/dex.jsonnet");

local issuer = "https://192.168.107.102:32000/dex";

local staticClients = [
    dex.staticClient.gangway('http://192.168.107.102:31284/callback', 'ZXhhbXBsZS1hcHAtc2VjcmV0'),
];

local connectors = [
    dex.connectors.saml(
        "http://192.168.107.10:8084/simplesaml/saml2/idp/SSOService.php",
        "/tmp/saml-ca.pem",
        "https://192.168.107.102:32000/dex/callback",
        "https://192.168.107.102:32000/dex",
        "http://192.168.107.10:8084/simplesaml/saml2/idp/metadata.php",
        "name",
        "email",
    ),
];

dex.generate(issuer, staticClients, connectors)