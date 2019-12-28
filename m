From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 16/16] usb: host: ehci-tegra: Remove unused fields from tegra_ehci_hcd
Date: Sat, 28 Dec 2019 23:33:58 +0300
Message-ID: <20191228203358.23490-17-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There are few stale fields in tegra_ehci_hcd structure, let's remove them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/ehci-tegra.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 4d2cdec4cb78..eb82cdfffc3c 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -42,12 +42,10 @@ struct tegra_ehci_soc_config {
 };
 
 struct tegra_ehci_hcd {
-	struct tegra_usb_phy *phy;
 	struct clk *clk;
 	struct reset_control *rst;
 	int port_resuming;
 	bool needs_double_reset;
-	enum tegra_usb_phy_port_speed port_speed;
 };
 
 static int tegra_reset_usb_controller(struct platform_device *pdev)
-- 
2.24.0
