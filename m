From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 5/8] clk: tegra: build clk-dfll.c for Tegra124 and Tegra210
Date: Thu, 16 Nov 2017 17:33:06 +0200
Message-ID: <1510846389-28712-6-git-send-email-pdeschrijver@nvidia.com>
References: <1510846389-28712-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1510846389-28712-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra210 has a DFLL as well and can share the majority of the code with
the Tegra124 implementation. So build the same code for both platforms.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/Kconfig  | 5 +++++
 drivers/clk/tegra/Makefile | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
index 7ddacae..57902ab 100644
--- a/drivers/clk/tegra/Kconfig
+++ b/drivers/clk/tegra/Kconfig
@@ -5,3 +5,8 @@ config TEGRA_CLK_EMC
 config CLK_TEGRA_BPMP
 	def_bool y
 	depends on TEGRA_BPMP
+
+config TEGRA_CLK_DFLL
+	depends on (ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC)
+	select PM_OPP
+	def_bool y
diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index b716923..fc7f4b4 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -19,7 +19,7 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
-obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124-dfll-fcpu.o
+obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
 obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
 obj-y					+= cvb.o
 obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
-- 
1.9.1

