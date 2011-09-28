From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v5 1/3] arm/tegra: prepare Seaboard pinmux code for derived
	boards
Date: Thu, 29 Sep 2011 01:29:34 +0300
Message-ID: <1317248978-10829-2-git-send-email-pdeschrijver@nvidia.com>
References: <1317248978-10829-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317248978-10829-1-git-send-email-pdeschrijver@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: pdeschrijver@nvidia.com
Cc: Russell King <linux@arm.linux.org.uk>, Erik Gilling <konkers@android.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

This patch splits out the common part of pinmux and GPIO initialization for
seaboard and derived boards. This code is based on work done by Jong Kim
<jongk@nvidia.com>.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 arch/arm/mach-tegra/board-seaboard-pinmux.c |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/board-seaboard-pinmux.c b/arch/arm/mach-tegra/board-seaboard-pinmux.c
index 74f78b7..b31c765 100644
--- a/arch/arm/mach-tegra/board-seaboard-pinmux.c
+++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2010 NVIDIA Corporation
+ * Copyright (C) 2010,2011 NVIDIA Corporation
+ * Copyright (C) 2011 Google, Inc.
  *
  * This software is licensed under the terms of the GNU General Public
  * License version 2, as published by the Free Software Foundation, and
@@ -160,7 +161,7 @@ static __initdata struct tegra_pingroup_config seaboard_pinmux[] = {
 
 
 
-static struct tegra_gpio_table gpio_table[] = {
+static struct tegra_gpio_table common_gpio_table[] = {
 	{ .gpio = TEGRA_GPIO_SD2_CD,		.enable = true },
 	{ .gpio = TEGRA_GPIO_SD2_WP,		.enable = true },
 	{ .gpio = TEGRA_GPIO_SD2_POWER,		.enable = true },
@@ -171,12 +172,17 @@ static struct tegra_gpio_table gpio_table[] = {
 	{ .gpio = TEGRA_GPIO_USB1,		.enable = true },
 };
 
-void __init seaboard_pinmux_init(void)
+static void __init seaboard_common_pinmux_init(void)
 {
 	tegra_pinmux_config_table(seaboard_pinmux, ARRAY_SIZE(seaboard_pinmux));
 
 	tegra_drive_pinmux_config_table(seaboard_drive_pinmux,
 					ARRAY_SIZE(seaboard_drive_pinmux));
 
-	tegra_gpio_config(gpio_table, ARRAY_SIZE(gpio_table));
+	tegra_gpio_config(common_gpio_table, ARRAY_SIZE(common_gpio_table));
+}
+
+void __init seaboard_pinmux_init(void)
+{
+	seaboard_common_pinmux_init();
 }
-- 
1.7.0.4
