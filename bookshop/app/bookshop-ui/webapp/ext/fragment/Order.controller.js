sap.ui.define(
    ["sap/ui/core/mvc/ControllerExtension", "sap/ui/core/mvc/OverrideExecution", "sap/ui/model/json/JSONModel"],
    function (ControllerExtension, OverrideExecution, JSONModel) {
        return ControllerExtension.extend("bookshopui.ext.fragment.Order", {
            metadata: {
                // extension can declare the public methods
                // in general methods that start with "_" are private
                methods: {
                    loremIpsum: {
                        public: true /*default*/,
                        final: false /*default*/,
                        overrideExecution: OverrideExecution.Instead /*default*/
                    }
                }
            },

            loremIpsum: function () {
                console.warn("*** loremIpsum method in .../ext/fragment/Order.controller.js ***");
            },

            override: {
                onInit: function () {
                    this.getView().setModel(new JSONModel({ selectedQuantity: 1 }), "userInput");
                }
            }
        });
    }
);
