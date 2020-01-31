From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] drm/tegra: sor: Suspend on clock registration failure
Date: Fri, 31 Jan 2020 17:59:08 +0100
Message-ID: <20200131165910.3443936-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Make sure the SOR module is suspenden after we fail to register the SOR
pad output clock.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 41d24949478e..96cd89bb2e82 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3922,15 +3922,16 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (!sor->clk_pad) {
 		char *name;
 
-		err = host1x_client_resume(&sor->client);
-		if (err < 0) {
-			dev_err(sor->dev, "failed to resume: %d\n", err);
+		name = devm_kasprintf(sor->dev, GFP_KERNEL, "sor%u_pad_clkout",
+				      sor->index);
+		if (!name) {
+			err = -ENOMEM;
 			goto remove;
 		}
 
-		name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "sor%u_pad_clkout", sor->index);
-		if (!name) {
-			err = -ENOMEM;
+		err = host1x_client_resume(&sor->client);
+		if (err < 0) {
+			dev_err(sor->dev, "failed to resume: %d\n", err);
 			goto remove;
 		}
 
-- 
2.24.1
