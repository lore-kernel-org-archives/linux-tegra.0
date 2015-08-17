From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [patch] drm/tegra: checking for IS_ERR() instead of NULL
Date: Mon, 17 Aug 2015 17:37:03 +0300
Message-ID: <20150817143703.GB23820@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The tegra_sor_hdmi_find_settings() function returns NULL on error and
not an ERR_PTR.

Fixes: 459cc2c6800b ('drm/tegra: sor: Add HDMI support')
Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index da1715e..08c5461 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1961,9 +1961,9 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 
 	/* production settings */
 	settings = tegra_sor_hdmi_find_settings(sor, mode->clock * 1000);
-	if (IS_ERR(settings)) {
-		dev_err(sor->dev, "no settings for pixel clock %d Hz: %ld\n",
-			mode->clock * 1000, PTR_ERR(settings));
+	if (!settings) {
+		dev_err(sor->dev, "no settings for pixel clock %d Hz\n",
+			mode->clock * 1000);
 		return;
 	}
 
