From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH V5 03/12] mailbox: Fix up error handling in mbox_request_channel()
Date: Mon, 17 Nov 2014 14:41:33 -0800
Message-ID: <1416264102-1323-4-git-send-email-abrestic@chromium.org>
References: <1416264102-1323-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416264102-1323-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

mbox_request_channel() currently returns EBUSY in the event the controller
is not present or if of_xlate() fails, but in neither case is EBUSY really
appropriate.  Return EPROBE_DEFER if the controller is not yet present
and change of_xlate() to return an ERR_PTR instead of NULL so that the
error can be propagated back to the caller of mbox_request_channel().

Signed-off-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
New for v5.
---
 drivers/mailbox/mailbox.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index c281e55..7b1e258 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -318,7 +318,7 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 		return ERR_PTR(-ENODEV);
 	}
 
-	chan = NULL;
+	chan = ERR_PTR(-EPROBE_DEFER);
 	list_for_each_entry(mbox, &mbox_cons, node)
 		if (mbox->dev->of_node == spec.np) {
 			chan = mbox->of_xlate(mbox, &spec);
@@ -327,7 +327,12 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 
 	of_node_put(spec.np);
 
-	if (!chan || chan->cl || !try_module_get(mbox->dev->driver->owner)) {
+	if (IS_ERR(chan)) {
+		mutex_unlock(&con_mutex);
+		return chan;
+	}
+
+	if (chan->cl || !try_module_get(mbox->dev->driver->owner)) {
 		dev_dbg(dev, "%s: mailbox not free\n", __func__);
 		mutex_unlock(&con_mutex);
 		return ERR_PTR(-EBUSY);
@@ -390,7 +395,7 @@ of_mbox_index_xlate(struct mbox_controller *mbox,
 	int ind = sp->args[0];
 
 	if (ind >= mbox->num_chans)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	return &mbox->chans[ind];
 }
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
