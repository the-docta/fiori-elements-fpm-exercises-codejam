using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
    UI.SelectionFields           : [
        genre_ID,
        author_ID
    ],
    UI.HeaderInfo                : {
        TypeName      : 'Book',
        TypeNamePlural: 'Books',
        Title         : {Value: title},
        Description   : {Value: author.name}
    },
    UI.Identification            : [{Value: ID}],

    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'title',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'descr',
                Value: descr,
            },
            {
                $Type: 'UI.DataField',
                Label: 'author_ID',
                Value: author_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'genre_ID',
                Value: genre_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'stock',
                Value: stock,
            },
            {
                $Type: 'UI.DataField',
                Label: 'criticality',
                Value: criticality,
            },
            {
                $Type: 'UI.DataField',
                Label: 'price',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Label: 'currency_code',
                Value: currency_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'image',
                Value: image,
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Author',
            ID    : 'Author',
            Target: '@UI.FieldGroup#Author',
        },
    ],
    UI.LineItem                  : {
        // criticality for whole line item
        ![@UI.Criticality]: criticality,

        // actual line items
        $value            : [
            {
                $Type                : 'UI.DataField',
                ![@UI.Importance]    : #High,
                Value                : title,
                ![@HTML5.CssDefaults]: {width: '100%'}
            },
            {
                $Type            : 'UI.DataField',
                Value            : author.name,
                ![@UI.Importance]: #High
            },
            {
                $Type            : 'UI.DataField',
                Value            : genre.name,
                ![@UI.Importance]: #Medium
            },
            {
                $Type            : 'UI.DataField',
                Value            : price,
                ![@UI.Importance]: #Medium
            },
            {
                $Type                    : 'UI.DataField',
                Value                    : stock,
                Criticality              : criticality,
                CriticalityRepresentation: #WithoutIcon,
                ![@UI.Importance]        : #Medium
            }
        ]
    },
) {

    title  @title           : 'Title';
    author @title           : 'Author';
    genre  @title           : 'Genre';
    price  @title           : 'Price';
    stock  @title           : 'Stock';

    author @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Authors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: author_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'dateOfBirth',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'dateOfDeath',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'placeOfBirth',
            },
        ],
    }
};


annotate service.Books with @(UI.FieldGroup #Author: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: author.name,
            Label: 'name',
        },
        {
            $Type: 'UI.DataField',
            Value: author.placeOfBirth,
            Label: 'placeOfBirth',
        },
        {
            $Type: 'UI.DataField',
            Value: author.dateOfBirth,
            Label: 'dateOfBirth',
        },
    ],
});
