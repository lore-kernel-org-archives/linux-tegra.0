From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] irqchip/gic-pm: remove PM_CLK dependency
Date: Thu, 20 Jun 2019 21:27:48 +0530
Message-ID: <1561046268-16329-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

gic-pm driver does not use pm-clk interface now and hence the dependency
is removed from Kconfig.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/irqchip/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 2d3b5a2..6346d6f 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -15,7 +15,6 @@ config ARM_GIC_PM
 	bool
 	depends on PM
 	select ARM_GIC
-	select PM_CLK
 
 config ARM_GIC_MAX_NR
 	int
-- 
2.7.4
