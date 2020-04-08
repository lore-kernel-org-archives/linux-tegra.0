From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/tegra: Use i2c_put_adapter() instead of put_device()
Date: Wed,  8 Apr 2020 20:02:44 +0200
Message-ID: <20200408180244.3079849-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In order to properly release the I2C adapter used for DDC/CI, use the
i2c_put_adapter() function provided by the I2C subsystem rather than the
put_device() function which doesn't include code to drop a reference to
the adapter's owner module.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index a264259b97a2..136fd2f56af0 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -177,7 +177,7 @@ void tegra_output_remove(struct tegra_output *output)
 		free_irq(output->hpd_irq, output);
 
 	if (output->ddc)
-		put_device(&output->ddc->dev);
+		i2c_put_adapter(output->ddc);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
-- 
2.24.1
