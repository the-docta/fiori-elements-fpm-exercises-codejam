/* eslint-disable no-unused-vars */

const RULE_LEVEL_DISABLE = 0;
const RULE_LEVEL_WARN = 1;
const RULE_LEVEL_ERROR = 2;

const RULE_APPLICABLE_ALWAYS = "always";
const RULE_APPLICABLE_NEVER = "never";

// eslint-disable-next-line no-undef
module.exports = {
    extends: ["@commitlint/config-conventional"],
    ignores: [(message) => /wip/i.test(message)],
    rules: {
        // disable subject-case check, as we frequently start wirh jira ticket names, like VISIT-123
        "subject-case": [RULE_LEVEL_DISABLE, RULE_APPLICABLE_NEVER, []],
        "scope-enum": [
            RULE_LEVEL_ERROR, // 0 => disable, 1 => warn, 2 => error
            RULE_APPLICABLE_ALWAYS,
            [
                // for generic project setup, etc.
                "general",
                "release",
                // type of sub-project
                "i18n",
                "ui5",
                // business-level sub-project/topic
                "inbox"
            ]
        ]
    }
};
