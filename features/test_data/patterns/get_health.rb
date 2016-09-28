$PATTERNS ||= {}
$PATTERNS[File.basename(__FILE__, '.rb')] =

    {
        startedAt: JsonExpressions::WILDCARD_MATCHER,
        uptime: JsonExpressions::WILDCARD_MATCHER,
        builtAt: JsonExpressions::WILDCARD_MATCHER,
        commit: JsonExpressions::WILDCARD_MATCHER,
        version: JsonExpressions::WILDCARD_MATCHER,
        environment: /\A(jenkins|development|production)\z/i,
    }

