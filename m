From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 2/7] mfd: cros_ec: spi: Add mutex to cros_ec_spi
Date: Wed, 30 Apr 2014 10:44:05 -0700
Message-ID: <1398879850-9111-3-git-send-email-dianders@chromium.org>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398879850-9111-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The main transfer function for cros_ec_spi can be called by more than
one client at a time.  Make sure that those clients don't stomp on
each other by locking the bus for the duration of the transfer
function.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3: None
Changes in v2: None

 drivers/mfd/cros_ec_spi.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index c185eb6..a2a605d 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -65,11 +65,13 @@
  *	if no record
  * @end_of_msg_delay: used to set the delay_usecs on the spi_transfer that
  *      is sent when we want to turn off CS at the end of a transaction.
+ * @lock: mutex to ensure only one user of cros_ec_command_spi_xfer at a time
  */
 struct cros_ec_spi {
 	struct spi_device *spi;
 	s64 last_transfer_ns;
 	unsigned int end_of_msg_delay;
+	struct mutex lock;
 };
 
 static void debug_packet(struct device *dev, const char *name, u8 *ptr,
@@ -208,6 +210,13 @@ static int cros_ec_command_spi_xfer(struct cros_ec_device *ec_dev,
 	int ret = 0, final_ret;
 	struct timespec ts;
 
+	/*
+	 * We have the shared ec_dev buffer plus we do lots of separate spi_sync
+	 * calls, so we need to make sure only one person is using this at a
+	 * time.
+	 */
+	mutex_lock(&ec_spi->lock);
+
 	len = cros_ec_prepare_tx(ec_dev, ec_msg);
 	dev_dbg(ec_dev->dev, "prepared, len=%d\n", len);
 
@@ -260,7 +269,7 @@ static int cros_ec_command_spi_xfer(struct cros_ec_device *ec_dev,
 		ret = final_ret;
 	if (ret < 0) {
 		dev_err(ec_dev->dev, "spi transfer failed: %d\n", ret);
-		return ret;
+		goto exit;
 	}
 
 	/* check response error code */
@@ -269,14 +278,16 @@ static int cros_ec_command_spi_xfer(struct cros_ec_device *ec_dev,
 		dev_warn(ec_dev->dev, "command 0x%02x returned an error %d\n",
 			 ec_msg->cmd, ptr[0]);
 		debug_packet(ec_dev->dev, "in_err", ptr, len);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto exit;
 	}
 	len = ptr[1];
 	sum = ptr[0] + ptr[1];
 	if (len > ec_msg->in_len) {
 		dev_err(ec_dev->dev, "packet too long (%d bytes, expected %d)",
 			len, ec_msg->in_len);
-		return -ENOSPC;
+		ret = -ENOSPC;
+		goto exit;
 	}
 
 	/* copy response packet payload and compute checksum */
@@ -293,10 +304,14 @@ static int cros_ec_command_spi_xfer(struct cros_ec_device *ec_dev,
 		dev_err(ec_dev->dev,
 			"bad packet checksum, expected %02x, got %02x\n",
 			sum, ptr[len + 2]);
-		return -EBADMSG;
+		ret = -EBADMSG;
+		goto exit;
 	}
 
-	return 0;
+	ret = 0;
+exit:
+	mutex_unlock(&ec_spi->lock);
+	return ret;
 }
 
 static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
@@ -327,6 +342,7 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	if (ec_spi == NULL)
 		return -ENOMEM;
 	ec_spi->spi = spi;
+	mutex_init(&ec_spi->lock);
 	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
 	if (!ec_dev)
 		return -ENOMEM;
-- 
1.9.1.423.g4596e3a
