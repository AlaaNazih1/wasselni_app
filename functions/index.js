const {setGlobalOptions} = require("firebase-functions");
const {onDocumentUpdated} = require("firebase-functions/v2/firestore");
const admin = require("firebase-admin");

admin.initializeApp();

const db = admin.firestore();

setGlobalOptions({
  maxInstances: 10,
});

exports.createOrderNotification = onDocumentUpdated(
    "users/{userId}/orders/{orderId}",
    async (event) => {
      const before = event.data.before.data();
      const after = event.data.after.data();

      if (before.status === after.status) {
        console.log("Status did not change.");
        return null;
      }

      const userId = event.params.userId;
      const orderId = event.params.orderId;
      const orderNumber = after.orderNumber || orderId;

      let title;
      let message;
      let type;

      if (
        after.status === "inProgress" ||
      after.status === "في الطريق"
      ) {
        title = "طلبك في الطريق 🚚";
        message = `طلبك رقم ${orderNumber} في الطريق إليك.`;
        type = "delivery";
      } else if (
        after.status === "delivered" ||
      after.status === "تم التسليم"
      ) {
        title = "تم تسليم طلبك ✅";
        message = `تم تسليم طلبك رقم ${orderNumber} بنجاح.`;
        type = "delivered";
      } else {
        console.log(`Ignored status: ${after.status}`);
        return null;
      }

      await db
          .collection("users")
          .doc(userId)
          .collection("notifications")
          .add({
            title: title,
            message: message,
            type: type,
            orderId: orderId,
            orderNumber: orderNumber,
            isRead: false,
            createdAt: admin.firestore.FieldValue.serverTimestamp(),
          });

      console.log(
          `Notification created for user ${userId}, order ${orderId}`,
      );

      return null;
    },
);
