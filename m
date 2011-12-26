From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Mon, 26 Dec 2011 16:44:41 +0530
Message-ID: <1324898081-10308-1-git-send-email-alokc@nvidia.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In NACK error condition, I2C controller violates
clock-to-data setup time before stop. In Software,
because of this reset of controller is happening
before I2C controller could complete STOP condition.

Added delay of 2 clock period before reset the
controller in case of NACK error.

Signed-off-by: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Instead of setting constant value for delay as was in previous patch, now in
the current modification delay will be calculated based on clock frequency of the bus.
 drivers/i2c/busses/i2c-tegra.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6381604..62e197c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -517,6 +517,14 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
 		return 0;
 
+	/*
+	 * In NACK error condition resetting of I2C controller happens
+	 * before STOP condition is properly completed by I2C controller,
+	 * so wait for 2 clock cycle to complete STOP condition.
+	 */
+	if (i2c_dev->msg_err == I2C_ERR_NO_ACK)
+		udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
+
 	tegra_i2c_init(i2c_dev);
 	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
 		if (msg->flags & I2C_M_IGNORE_NAK)
-- 
1.7.4.1
