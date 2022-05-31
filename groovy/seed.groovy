categorizedJobsView('Hema - DEV') {  

jobs {
        regex('.*-flow|.*-tmpl|mip-.*(?<!(mapper|ear|sqls|logging|msba|properties|test))|Hema-mapper-utils|BAL')
    }
    categorizationCriteria {
        regexGroupingRule(/Hema-.*(?<!(mapper|ear|sqls|logging|msba|properties|flow|test|tmpl))|Hema-mapper-utils/, 'DEV - Core')
        regexGroupingRule(/^.*-flow/, 'DEV - Flows')
        regexGroupingRule(/^.*-tmpl/, 'DEV - Templates')
         
         
    }
    columns {
        status()
        weather()
        name()
        lastSuccess()
        lastFailure()
        lastDuration()
        buildButton()
    }
}
