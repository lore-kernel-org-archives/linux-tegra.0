From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] drm/tegra: Use common error handling code in
 tegra_output_probe()
Date: Tue, 24 Oct 2017 19:34:14 +0200
Message-ID: <f9cc525e-7367-f4d8-d41f-dd35ce9a2c34@users.sourceforge.net>
References: <bfac49e0-8948-e62f-1876-567605f1e2c8@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bfac49e0-8948-e62f-1876-567605f1e2c8@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 19:12:09 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tegra/output.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 595d1ec3e02e..1e0915e213b4 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -139,8 +139,7 @@ int tegra_output_probe(struct tegra_output *output)
 		err = gpio_to_irq(output->hpd_gpio);
 		if (err < 0) {
 			dev_err(output->dev, "gpio_to_irq(): %d\n", err);
-			gpio_free(output->hpd_gpio);
-			return err;
+			goto free_gpio;
 		}
 
 		output->hpd_irq = err;
@@ -153,8 +152,7 @@ int tegra_output_probe(struct tegra_output *output)
 		if (err < 0) {
 			dev_err(output->dev, "failed to request IRQ#%u: %d\n",
 				output->hpd_irq, err);
-			gpio_free(output->hpd_gpio);
-			return err;
+			goto free_gpio;
 		}
 
 		output->connector.polled = DRM_CONNECTOR_POLL_HPD;
@@ -168,6 +166,10 @@ int tegra_output_probe(struct tegra_output *output)
 	}
 
 	return 0;
+
+free_gpio:
+	gpio_free(output->hpd_gpio);
+	return err;
 }
 
 void tegra_output_remove(struct tegra_output *output)
-- 
2.14.3
