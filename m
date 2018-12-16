From: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
Subject: [PATCH] Staging: nvec: nvec: fixed check style issues
Date: Sun, 16 Dec 2018 13:43:54 -0800
Message-ID: <1544996634-10427-1-git-send-email-indigoomega021@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marvin24@gmx.de
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Replaced udelay() by the preferred usleep_range() function.

Signed-off-by: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 08027a3..6f35f92 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -626,7 +626,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(0, 33);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
@@ -713,7 +713,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	 * We experience less incomplete messages with this delay than without
 	 * it, but we don't know why. Help is appreciated.
 	 */
-	udelay(100);
+	usleep_range(0, 100);
 
 	return IRQ_HANDLED;
 }
-- 
2.7.4
