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
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Value: descr,
            },
            {
                $Type: 'UI.DataField',
                Value: author_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: genre_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: stock,
            },
            {
                $Type: 'UI.DataField',
                Value: criticality,
            },
            {
                $Type: 'UI.DataField',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Value: currency_code,
            },
            {
                $Type: 'UI.DataField',
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

    title  @title : 'Title';
    author @title : 'Author';
    genre  @title : 'Genre';
    price  @title : 'Price';
    stock  @title : 'Stock';

    author @Common: {
        ValueListWithFixedValues: true, // dropdown instead of dialog
        ValueList               : {
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

// value help for Authors: display name instead of ID
annotate CatalogService.Authors with {
    ID @Common.Text: {
        $value                : name,
        ![@UI.TextArrangement]: #TextOnly,
    }
};
