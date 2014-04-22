From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 4/7] mfd: cros_ec: spi: Increase cros_ec_spi deadline from 5ms to 100ms
Date: Tue, 22 Apr 2014 09:45:51 -0700
Message-ID: <1398185154-19404-5-git-send-email-dianders@chromium.org>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398185154-19404-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

We're adding i2c tunneling to the list of things that goes over
cros_ec.  i2c tunneling can be slooooooow, so increase our deadline to
100ms to account for that.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2: None

 drivers/mfd/cros_ec_spi.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 4f863c3..0b8d328 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -39,14 +39,22 @@
 #define EC_MSG_PREAMBLE_COUNT		32
 
 /*
-  * We must get a response from the EC in 5ms. This is a very long
-  * time, but the flash write command can take 2-3ms. The EC command
-  * processing is currently not very fast (about 500us). We could
-  * look at speeding this up and making the flash write command a
-  * 'slow' command, requiring a GET_STATUS wait loop, like flash
-  * erase.
-  */
-#define EC_MSG_DEADLINE_MS		5
+ * Allow for a long time for the EC to respond.  We support i2c
+ * tunneling and support fairly long messages for the tunnel (249
+ * bytes long at the moment).  If we're talking to a 100 kHz device
+ * on the other end and need to transfer ~256 bytes, then we need:
+ *  10 us/bit * ~10 bits/byte * ~256 bytes = ~25ms
+ *
+ * We'll wait 4 times that to handle clock stretching and other
+ * paranoia.
+ *
+ * It's pretty unlikely that we'll really see a 249 byte tunnel in
+ * anything other than testing.  If this was more common we might
+ * consider having slow commands like this require a GET_STATUS
+ * wait loop.  The 'flash write' command would be another candidate
+ * for this, clocking in at 2-3ms.
+ */
+#define EC_MSG_DEADLINE_MS		100
 
 /*
   * Time between raising the SPI chip select (for the end of a
-- 
1.9.1.423.g4596e3a
