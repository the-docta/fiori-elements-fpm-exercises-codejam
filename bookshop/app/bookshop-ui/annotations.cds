using CatalogService as service from '../../srv/cat-service';

annotate service.Books with @(
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
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'title',
            Value: title,
        },
        {
            $Type                : 'UI.DataField',
            Label                : 'descr',
            Value                : descr,
            ![@HTML5.CssDefaults]: {width: '100%'}
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
    ],
);

annotate service.Books with {
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
