From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH V7 2/9] mailbox: Make struct mbox_controller's ops field const
Date: Mon, 27 Apr 2015 15:37:15 -0700
Message-ID: <1430174242-29465-3-git-send-email-abrestic@chromium.org>
References: <1430174242-29465-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430174242-29465-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The mailbox controller's channel ops ought to be read-only.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
No changes from v5/v6.
New for v5.
---
 include/linux/mailbox_controller.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index d4cf96f..68c4245 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -72,7 +72,7 @@ struct mbox_chan_ops {
  */
 struct mbox_controller {
 	struct device *dev;
-	struct mbox_chan_ops *ops;
+	const struct mbox_chan_ops *ops;
 	struct mbox_chan *chans;
 	int num_chans;
 	bool txdone_irq;
-- 
2.2.0.rc0.207.ga3a616c
