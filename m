From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 12/16] usb: phy: tegra: Move utmip_pad_count checking under lock
Date: Sat, 28 Dec 2019 23:33:54 +0300
Message-ID: <20191228203358.23490-13-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

It's unlikely that two drivers could manage PHY's state simultaneously in
practice, nevertheless the utmip_pad_count checking should be under lock,
for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index f7e7df812f83..72825d207840 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -351,30 +351,31 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 	void __iomem *base = phy->pad_regs;
 	unsigned long flags;
 	u32 val;
-	int err;
+	int ret;
+
+	ret = clk_prepare_enable(phy->pad_clk);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&utmip_pad_lock, flags);
 
 	if (!utmip_pad_count) {
 		dev_err(phy->u_phy.dev, "UTMIP pad already powered off\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto ulock;
 	}
 
-	err = clk_prepare_enable(phy->pad_clk);
-	if (err)
-		return err;
-
-	spin_lock_irqsave(&utmip_pad_lock, flags);
-
 	if (--utmip_pad_count == 0) {
 		val = readl_relaxed(base + UTMIP_BIAS_CFG0);
 		val |= UTMIP_OTGPD | UTMIP_BIASPD;
 		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
 	}
-
+ulock:
 	spin_unlock_irqrestore(&utmip_pad_lock, flags);
 
 	clk_disable_unprepare(phy->pad_clk);
 
-	return 0;
+	return ret;
 }
 
 static int utmi_wait_register(void __iomem *reg, u32 mask, u32 result)
-- 
2.24.0
