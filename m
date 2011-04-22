From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] arm: tegra: ventana: Enable HDMI +5V for DDC
Date: Fri, 22 Apr 2011 10:57:40 -0700
Message-ID: <1303495060-22906-2-git-send-email-rmorell@nvidia.com>
References: <1303353108-8755-1-git-send-email-rmorell@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303353108-8755-1-git-send-email-rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The HDMI specification says that +5V must be enabled when using DDC or
TMDS signals.  This change fills in the hook for Ventana to set the
correct GPIO to provide this power during DDC transactions.

Additionally, initialize the +5V gpio to disabled, to save power until
it's needed.

Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I actually only tested this with Seaboard, but they should be electrically the
same as far as HDMI goes and Seaboard support doesn't exist in this branch.

Version 2 removes some silliness in the gpio init due to my misunderstanding of
gpio_direction_output()'s second argument.

This patchset applies to the linux-tegra-2.6.36 branch.

 arch/arm/mach-tegra/board-ventana-panel.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/board-ventana-panel.c b/arch/arm/mach-tegra/board-ventana-panel.c
index f3e75e2..8af4308 100644
--- a/arch/arm/mach-tegra/board-ventana-panel.c
+++ b/arch/arm/mach-tegra/board-ventana-panel.c
@@ -109,16 +109,14 @@ static int ventana_panel_disable(void)
 	return 0;
 }
 
-static int ventana_hdmi_enable(void)
+static void ventana_hdmi_enable_ddc(void)
 {
 	gpio_set_value(ventana_hdmi_enb, 1);
-	return 0;
 }
 
-static int ventana_hdmi_disable(void)
+static void ventana_hdmi_disable_ddc(void)
 {
 	gpio_set_value(ventana_hdmi_enb, 0);
-	return 0;
 }
 
 static struct resource ventana_disp1_resources[] = {
@@ -222,8 +220,8 @@ static struct tegra_dc_out ventana_disp2_out = {
 	.align		= TEGRA_DC_ALIGN_MSB,
 	.order		= TEGRA_DC_ORDER_RED_BLUE,
 
-	.enable		= ventana_hdmi_enable,
-	.disable	= ventana_hdmi_disable,
+	.enable_ddc	= ventana_hdmi_enable_ddc,
+	.disable_ddc	= ventana_hdmi_disable_ddc,
 };
 
 static struct tegra_dc_platform_data ventana_disp1_pdata = {
-- 
1.7.3.4
