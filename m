From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/14] drm/tegra: Do not enable output on .mode_set()
Date: Mon, 13 Oct 2014 12:21:52 +0200
Message-ID: <1413195715-4719-11-git-send-email-thierry.reding@gmail.com>
References: <1413195715-4719-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413195715-4719-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The output is already enabled in .dpms(), doing it in .mode_set() too
can cause noticable flicker.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/output.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 0c67d7eebc94..6b393cfbb5e7 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -167,12 +167,6 @@ static void tegra_encoder_mode_set(struct drm_encoder *encoder,
 				   struct drm_display_mode *mode,
 				   struct drm_display_mode *adjusted)
 {
-	struct tegra_output *output = encoder_to_output(encoder);
-	int err;
-
-	err = tegra_output_enable(output);
-	if (err < 0)
-		dev_err(encoder->dev->dev, "tegra_output_enable(): %d\n", err);
 }
 
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
-- 
2.1.2
