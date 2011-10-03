From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v7 1/3] arm/tegra: prepare Seaboard pinmux code for derived boards
Date: Mon, 3 Oct 2011 16:18:36 +0300
Message-ID: <1317647918-22694-2-git-send-email-pdeschrijver@nvidia.com>
References: <1317647918-22694-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317647918-22694-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch splits out the common part of pinmux and GPIO initialization for
seaboard and derived boards. This code is based on work done by Jong Kim
<jongk-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
1.7.7.rc0.72.g4b5ea.dirty
