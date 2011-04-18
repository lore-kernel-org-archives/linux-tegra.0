From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] arm: tegra: ventana: fix display depth, dithering
Date: Mon, 18 Apr 2011 10:28:36 -0700
Message-ID: <1303147716-21153-2-git-send-email-rmorell@nvidia.com>
References: <1302923939-374-1-git-send-email-rmorell@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302923939-374-1-git-send-email-rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mayureshjanorkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Ventana has a 6-bit-per-component panel, so set the bit depth to 18, and
enable ordered dithering for smoother gradients.

Signed-off-by: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Varun Colbert <vcolbert-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Robert Morell<rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I was going to add this to harmony as well, but harmonay doesn't even have
tegra_dc_out platform data in linux-tegra, so it needs some more love before
this can be added.

Version 2 is unchanged.

 arch/arm/mach-tegra/board-ventana-panel.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-ventana-panel.c b/arch/arm/mach-tegra/board-ventana-panel.c
index f3e75e2..07919a4 100644
--- a/arch/arm/mach-tegra/board-ventana-panel.c
+++ b/arch/arm/mach-tegra/board-ventana-panel.c
@@ -204,6 +204,8 @@ static struct tegra_dc_out ventana_disp1_out = {
 
 	.align		= TEGRA_DC_ALIGN_MSB,
 	.order		= TEGRA_DC_ORDER_RED_BLUE,
+	.depth		= 18,
+	.dither		= TEGRA_DC_ORDERED_DITHER,
 
 	.modes	 	= ventana_panel_modes,
 	.n_modes 	= ARRAY_SIZE(ventana_panel_modes),
-- 
1.7.3.4
