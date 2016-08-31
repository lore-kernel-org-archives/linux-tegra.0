From: Shardar Mohammed <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/5] i2c: tegra: use readl_poll_timeout after config_load
 reg programmed
Date: Wed, 31 Aug 2016 13:30:53 +0000
Message-ID: <1472650254799.24331@nvidia.com>
References: <1472649758-5608-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472649758-5608-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org" <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Sorry ignore this series, forgot to mention patch series version.
Pushed v11 series, please review v11 series.

Thanks,
Shardar
________________________________________
From: Shardar Mohammed
Sent: Wednesday, August 31, 2016 6:52 PM
To: Shardar Mohammed; wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org; swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jonathan Hunter
Subject: [PATCH 1/5] i2c: tegra: use readl_poll_timeout after config_load reg programmed

After CONFIG_LOAD register is programmed instead of explicitly waiting
for timeout, use readl_poll_timeout() to check for register value to get
updated or wait till timeout.

Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes in v4:
- Split timeout calculation to separate patch

Changes in v5:
- Move disabling of clock to separate patch

Changes in v8:
- 1st change of [PATCH v7] series is merged, v8 is rebased on top of
  merged change, here patch series is changed accordingly.
- Updated the commit message as per review to properly reflect change.
- calculate the register offset seperately to make code more readable.

Changes in v9:
- Use readl_poll_timeout() instead of readx_poll_timeout()

Changes in V10:
- Rebase on top of [PATCH V2 0/9] Some Tegra I2C Updates

Changes in V11:
- Fix sparse error
---
---
 drivers/i2c/busses/i2c-tegra.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d86a993..e93c72a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -30,6 +30,7 @@
 #include <linux/reset.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
+#include <linux/iopoll.h>

 #include <asm/unaligned.h>

@@ -112,6 +113,8 @@
 #define I2C_CLKEN_OVERRIDE                     0x090
 #define I2C_MST_CORE_CLKEN_OVR                 BIT(0)

+#define I2C_CONFIG_LOAD_TIMEOUT                        1000000
+
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
  * @MSG_END_STOP: Send stop pulse at end of transfer.
@@ -448,7 +451,6 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
        u32 val;
        int err;
        u32 clk_divisor;
-       unsigned long timeout = jiffies + HZ;

        err = pm_runtime_get_sync(i2c_dev->dev);
        if (err < 0) {
@@ -497,15 +499,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
                i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);

        if (i2c_dev->hw->has_config_load_reg) {
+               unsigned long reg_offset;
+               void __iomem *addr;
+
+               reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
+               addr = i2c_dev->base + reg_offset;
                i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-               while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
-                       if (time_after(jiffies, timeout)) {
-                               dev_warn(i2c_dev->dev,
-                                       "timeout waiting for config load\n");
-                               err = -ETIMEDOUT;
-                               goto err;
-                       }
-                       msleep(1);
+               err = readl_poll_timeout(addr, val, val == 0, 1000,
+                                        I2C_CONFIG_LOAD_TIMEOUT);
+               if (err) {
+                       dev_warn(i2c_dev->dev,
+                                "timeout waiting for config load\n");
+                       goto err;
                }
        }

--
1.8.1.5
