# テーブル設計

## Users
| Column       | Type       | Options     |
| name         | string     | null: false |
| name_reading | string     | null: false |
| nickname     | string     | null: false |
| profile      | text       | null: false |

### Users_association
has_many :recipes
has_many :favorite_recipes
has_many :comment_recipes
has_many :relationships
has_many :products
has_many :favorite_products
has_many :comment_products
has_attached :image

## Products
| Column     | Type       | Options                        |
| user       | references | null: false, foreign_key: true |
| catch_copy | string     | null: false                    |
| text       | text       | null: false                    |

### Products_association
belongs_to :user
has_many :favorite_products
has_many :comment_products
has_many :orders
has_attached :product_image

## Orders
| Column     | Type       | Options                        |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Orders_association
belongs_to :product
has_one :address

## Addresses
| Column     | Type       | Options                        |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |
| postcode   | string     | null: false                    |
| addresses  | string     | null: false                    |
| name       | string     | null: false                    |

### Addresses_association
belongs_to :order

## FavoriteProducts
| Column     | Type       | Options                        |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### FavoriteProducts_association
belongs_to :user
belongs_to :product

## CommentProducts
| Column     | Type       | Options                        |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |
| comment    | text       | null: false                    |

### CommentProducts_association
belongs_to :user
belongs_to :product

## Recipes
| Column     | Type       | Options                        |
| user       | references | null: false, foreign_key: true |
| title      | string     | null: false                    |
| text       | text       | null: false                    |

### Recipes_association
belongs_to :user
has_many :comment_recipes
has_many :favorite_recipes

## FavoriteRecipes
| Column     | Type       | Options                        |
| user       | references | null: false, foreign_key: true |
| recipe     | references | null: false, foreign_key: true |

### FavoriteRecipes_association
belongs_to :user
belongs_to :recipe

## CommentRecipes
| Column     | Type       | Options                        |
| user       | references | null: false, foreign_key: true |
| recipe     | references | null: false, foreign_key: true |
| comment    | text       | null: false                    |

### CommentRecipes_association
belongs_to :user
belongs_to :recipe

## Relationships
| Column     | Type       | Options                        |
| follow     | references | null: false, foreign_key: true |
| follower   | references | null: false, foreign_key: true |

### Relationships_association
belongs_to :user