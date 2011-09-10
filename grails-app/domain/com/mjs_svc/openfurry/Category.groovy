package com.mjs_svc.openfurry

class Category {
    String categoryName
    Category parent

    static constraints = {
        categoryName(maxSize: 60)
        parent(nullable: true)
    }

    static hasMany = [subcategories: Category]

    static belongsTo = Category
}
