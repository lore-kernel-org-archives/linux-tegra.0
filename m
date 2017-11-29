From: Joshua Abraham <j.abraham1776@gmail.com>
Subject: [PATCH] staging: nvec: Fix usleep_range is preferred over udelay
Date: Wed, 29 Nov 2017 11:00:02 -0500
Message-ID: <20171129160002.GA26462@josharch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Joshua Abraham <j.abraham1776@gmail.com>

This patch fixes the issue:

CHECK: usleep_range is preferred over udelay; see
Documentation/timers/timers-howto.txt

---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 4ff8f47385da..2a01ef4b54ff 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -631,7 +631,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(30, 35);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
-- 
2.15.0
