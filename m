From: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
Subject: [PATCH 2/2] Staging: nvec: nvec: fixed check style issues
Date: Sun, 16 Dec 2018 08:57:43 -0800
Message-ID: <1544979463-10126-1-git-send-email-indigoomega021@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marvin24@gmx.de
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fixed an endline open parenthesis issue and replaced udelay() by the
preferred usleep_range() function.

Signed-off-by: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
---
 drivers/staging/nvec/nvec.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 08027a3..69eef7d 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -382,8 +382,10 @@ static void nvec_request_master(struct work_struct *work)
 		msg = list_first_entry(&nvec->tx_data, struct nvec_msg, node);
 		spin_unlock_irqrestore(&nvec->tx_lock, flags);
 		nvec_gpio_set_value(nvec, 0);
-		err = wait_for_completion_interruptible_timeout(
-				&nvec->ec_transfer, msecs_to_jiffies(5000));
+		done = &nvec->ec_transfer;
+		timeout = msecs_to_jiffies(5000);
+		err = wait_for_completion_interruptible_timeout(done,
+								timeout);
 
 		if (err == 0) {
 			dev_warn(nvec->dev, "timeout waiting for ec transfer\n");
@@ -626,7 +628,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(0, 33);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
@@ -713,7 +715,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	 * We experience less incomplete messages with this delay than without
 	 * it, but we don't know why. Help is appreciated.
 	 */
-	udelay(100);
+	usleep_range(0, 100);
 
 	return IRQ_HANDLED;
 }
-- 
2.7.4
