From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: Tegra: Harmony: Add USB device
Date: Wed, 13 Jul 2011 14:40:18 -0600
Message-ID: <1310589618-16080-2-git-send-email-swarren@nvidia.com>
References: <1310589618-16080-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310589618-16080-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra USB port is attached an an SMSC9514; a combination USB hub
and Ethernet controller.

This change is extracted from a change in the ChromeOS 2.6.38 kernel.

Signed-off-by: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index e4548a5..ecad7cb 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -120,6 +120,7 @@ static struct platform_device *harmony_devices[] __initdata = {
 	&tegra_sdhci_device1,
 	&tegra_sdhci_device2,
 	&tegra_sdhci_device4,
+	&tegra_ehci3_device,
 	&tegra_i2s_device1,
 	&tegra_das_device,
 	&tegra_pcm_device,
@@ -143,6 +144,7 @@ static __initdata struct tegra_clk_init_table harmony_clk_init_table[] = {
 	{ "pll_a_out0",	"pll_a",	11289600,	true },
 	{ "cdev1",	NULL,		0,		true },
 	{ "i2s1",	"pll_a_out0",	11289600,	false},
+	{ "usb3",	"clk_m",	12000000,	true },
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.0.4
