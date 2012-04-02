From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Mon, 2 Apr 2012 11:29:42 +0530
Message-ID: <7A0BFCFE3DA5CD47B0FB7984326F201A136BDCC35E@BGMAIL01.nvidia.com>
References: <1333345982-16595-1-git-send-email-alokc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333345982-16595-1-git-send-email-alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen,

I've updated the commit message and comment in the code as per your suggestion. Tegra I2C controller doesn't have idle bit so delay is required before reset the controller in case of NACK error.  This delay is calculated purely based on clock period of that particular i2c bus and not passed as hardcoded value. I2C SCL clock-stretching won't affect this calculated delay.

Thanks
Alok


-----Original Message-----
From: Alok Chauhan [mailto:alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org] 
Sent: Monday, April 02, 2012 11:23 AM
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org; ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; Stephen Warren; olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org; bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org; Laxman Dewangan; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: Alok Chauhan; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: [PATCH v2] i2c: tegra: Add delay before reset the controller

NACK interrupt generated before I2C controller generates the STOP condition on bus. In Software, because of this reset of controller is happening before I2C controller could complete STOP condition. So wait for some time before resetting the controller so that STOP condition has delivered properly on bus.

Added delay of 2 clock period before reset the controller in case of NACK error.

Signed-off-by: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Added the more descriptive commit message about issue in case of NACK error condition. Changed the comment in code also

 drivers/i2c/busses/i2c-tegra.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c index e978635..dfb850a8 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -516,6 +516,14 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
 		return 0;
 
+	/*
+	 * NACK interrupt generated before I2C controller generates the STOP
+	 * condition on bus. So wait for some time before reset the controller
+	 * so that STOP condition has delivered properly on bus.
+	 */
+	if (i2c_dev->msg_err == I2C_ERR_NO_ACK)
+		udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
+
 	tegra_i2c_init(i2c_dev);
 	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
 		if (msg->flags & I2C_M_IGNORE_NAK)
--
1.7.4.1
