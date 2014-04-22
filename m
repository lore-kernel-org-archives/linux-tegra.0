From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 1/7] mfd: cros_ec: spi: calculate delay between transfers correctly
Date: Tue, 22 Apr 2014 09:45:48 -0700
Message-ID: <1398185154-19404-2-git-send-email-dianders@chromium.org>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398185154-19404-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Hendricks <dhendrix-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: David Hendricks <dhendrix-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

To avoid spamming the EC we calculate the time between the previous
transfer and the current transfer and force a delay if the time delta
is too small.

However, a small miscalculation causes the delay period to be
far too short. Most noticably this impacts commands with a long
turnaround time such as EC firmware reads and writes.

Signed-off-by: David Hendricks <dhendrix-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2: None

 drivers/mfd/cros_ec_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index 84af8d7..c185eb6 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -219,7 +219,7 @@ static int cros_ec_command_spi_xfer(struct cros_ec_device *ec_dev,
 		ktime_get_ts(&ts);
 		delay = timespec_to_ns(&ts) - ec_spi->last_transfer_ns;
 		if (delay < EC_SPI_RECOVERY_TIME_NS)
-			ndelay(delay);
+			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
 	}
 
 	/* Transmit phase - send our message */
-- 
1.9.1.423.g4596e3a
