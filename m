From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 20/20] usb: host: ehci-tegra: Remove unused fields from tegra_ehci_hcd
Date: Mon,  6 Jan 2020 04:34:16 +0300
Message-ID: <20200106013416.9604-21-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There are few stale fields in tegra_ehci_hcd structure, let's remove them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/ehci-tegra.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 1eb94205a5ac..d6433f206c17 100644
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
