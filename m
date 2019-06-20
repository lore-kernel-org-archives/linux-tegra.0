From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] bus: tegra-aconnect: remove PM_CLK dependency
Date: Thu, 20 Jun 2019 21:21:59 +0530
Message-ID: <1561045919-15449-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

aconnect bus driver does not use pm-clk interface now and hence the
dependency is removed from Kconfig.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/bus/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 1851112..4587ef2 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -128,7 +128,6 @@ config TEGRA_ACONNECT
 	tristate "Tegra ACONNECT Bus Driver"
 	depends on ARCH_TEGRA_210_SOC
 	depends on OF && PM
-	select PM_CLK
 	help
 	  Driver for the Tegra ACONNECT bus which is used to interface with
 	  the devices inside the Audio Processing Engine (APE) for Tegra210.
-- 
2.7.4
