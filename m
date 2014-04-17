From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/7] mfd: cros_ec: spi: Make the cros_ec_spi timeout more reliable
Date: Thu, 17 Apr 2014 10:59:26 -0700
Message-ID: <1397757570-19750-4-git-send-email-dianders@chromium.org>
References: <1397757570-19750-1-git-send-email-dianders@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397757570-19750-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The cros_ec_spi transfer had two problems with its timeout code:

1. It looked at the timeout even in the case that it found valid data.
2. If the cros_ec_spi code got switched out for a while, it's possible
   it could get a timeout after a single loop.  Let's be paranoid and
   make sure we do one last transfer after the timeout expires.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 drivers/mfd/cros_ec_spi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index a2a605d..4f863c3 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -113,7 +113,9 @@ static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
 
 	/* Receive data until we see the header byte */
 	deadline = jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
-	do {
+	while (true) {
+		unsigned long start_jiffies = jiffies;
+
 		memset(&trans, 0, sizeof(trans));
 		trans.cs_change = 1;
 		trans.rx_buf = ptr = ec_dev->din;
@@ -134,12 +136,19 @@ static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
 				break;
 			}
 		}
+		if (ptr != end)
+			break;
 
-		if (time_after(jiffies, deadline)) {
+		/*
+		 * Use the time at the start of the loop as a timeout.  This
+		 * gives us one last shot at getting the transfer and is useful
+		 * in case we got context switched out for a while.
+		 */
+		if (time_after(start_jiffies, deadline)) {
 			dev_warn(ec_dev->dev, "EC failed to respond in time\n");
 			return -ETIMEDOUT;
 		}
-	} while (ptr == end);
+	}
 
 	/*
 	 * ptr now points to the header byte. Copy any valid data to the
-- 
1.9.1.423.g4596e3a
