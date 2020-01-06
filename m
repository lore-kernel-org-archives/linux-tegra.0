From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 16/20] usb: phy: tegra: Keep CPU interrupts enabled
Date: Mon,  6 Jan 2020 04:34:12 +0300
Message-ID: <20200106013416.9604-17-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no good reason for disabling of CPU interrupts in order to
protect the utmip_pad_count modification.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 1b9667b0aa11..037e8eee737d 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -310,7 +310,6 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 {
 	struct tegra_utmip_config *config = phy->config;
 	void __iomem *base = phy->pad_regs;
-	unsigned long flags;
 	u32 val;
 	int err;
 
@@ -318,7 +317,7 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 	if (err)
 		return err;
 
-	spin_lock_irqsave(&utmip_pad_lock, flags);
+	spin_lock(&utmip_pad_lock);
 
 	if (utmip_pad_count++ == 0) {
 		val = readl_relaxed(base + UTMIP_BIAS_CFG0);
@@ -336,7 +335,7 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
 	}
 
-	spin_unlock_irqrestore(&utmip_pad_lock, flags);
+	spin_unlock(&utmip_pad_lock);
 
 	clk_disable_unprepare(phy->pad_clk);
 
@@ -346,7 +345,6 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 {
 	void __iomem *base = phy->pad_regs;
-	unsigned long flags;
 	u32 val;
 	int ret;
 
@@ -354,7 +352,7 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&utmip_pad_lock, flags);
+	spin_lock(&utmip_pad_lock);
 
 	if (!utmip_pad_count) {
 		dev_err(phy->u_phy.dev, "UTMIP pad already powered off\n");
@@ -368,7 +366,7 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
 	}
 ulock:
-	spin_unlock_irqrestore(&utmip_pad_lock, flags);
+	spin_unlock(&utmip_pad_lock);
 
 	clk_disable_unprepare(phy->pad_clk);
 
-- 
2.24.0
