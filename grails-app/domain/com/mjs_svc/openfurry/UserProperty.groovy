package com.mjs_svc.openfurry

class UserProperty {
    User user
    String key
    String value

    static constraints = {
    }

    static mapping = {
        columns {
            key column: 'property_key'
            value column: 'property_value'
        }
    }
}
