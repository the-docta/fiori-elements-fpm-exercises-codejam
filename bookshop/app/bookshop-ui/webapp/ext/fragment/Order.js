sap.ui.define(["sap/m/MessageToast", "sap/m/Dialog", "sap/m/Button", "sap/m/Text"], function (MessageToast, Dialog, Button, Text) {
    return {
        onSubmitOrder: function (oEvent) {
            const oContext = oEvent.getSource().getBindingContext();
            const oModel = oContext.getModel();

            const selectedBookTitle = oContext.getProperty("title");
            const selectedBookID = oContext.getProperty("ID");
            const selectedQuantity = this.byId("stepInput").getValue();

            const oAction = oModel.bindContext("/submitOrder(...)");
            oAction.setParameter("book", selectedBookID);
            oAction.setParameter("quantity", selectedQuantity);

            oAction.execute().then(
                () => {
                    const sText = `Order successful (${selectedBookTitle}, ${selectedQuantity} pcs.)`;
                    MessageToast.show(sText);
                    this.refresh();
                },

                (oError) => {
                    this.oErrorMessageDialog = new Dialog({
                        type: "Standard",
                        title: "Error",
                        state: "Error",
                        content: new Text({ text: oError.error.message }).addStyleClass("sapUiTinyMargin"),
                        beginButton: new Button({
                            text: "Close",
                            press: () => {
                                this.oErrorMessageDialog.close().destroy();
                                delete this.oErrorMessageDialog;
                            }
                        })
                    });
                    this.oErrorMessageDialog.open();
                }
            );
        }
    };
});
