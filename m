From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] drm/tegra: switch to using devm_gpiod_get_optional
Date: Sun, 15 Sep 2019 00:13:23 -0700
Message-ID: <20190915071323.GA36596@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

We do not really need to use API that fetches GPIO data from an
arbitrary device tree node, as we are dealing with device tree node
assigned to the device structure. We can easily switch to
devm_gpiod_get_optional() plus gpiod_set_consumer_name() and clean up
the code.

Note this is part of efforts to get rid of [devm_]gpiod_get_from_of_node
in drivers so that gpiolib can be cleaned up.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpu/drm/tegra/output.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index bdcaa4c7168c..b4248125b844 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -121,19 +121,15 @@ int tegra_output_probe(struct tegra_output *output)
 		of_node_put(ddc);
 	}
 
-	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-						       output->of_node,
-						       "nvidia,hpd-gpio", 0,
-						       GPIOD_IN,
-						       "HDMI hotplug detect");
-	if (IS_ERR(output->hpd_gpio)) {
-		if (PTR_ERR(output->hpd_gpio) != -ENOENT)
-			return PTR_ERR(output->hpd_gpio);
-
-		output->hpd_gpio = NULL;
-	}
+	output->hpd_gpio = devm_gpiod_get_optional(output->dev,
+						   "nvidia,hpd", GPIOD_IN);
+	if (IS_ERR(output->hpd_gpio))
+		return PTR_ERR(output->hpd_gpio);
 
 	if (output->hpd_gpio) {
+		gpiod_set_consumer_name(output->hpd_gpio,
+					"HDMI hotplug detect");
+
 		err = gpiod_to_irq(output->hpd_gpio);
 		if (err < 0) {
 			dev_err(output->dev, "gpiod_to_irq(): %d\n", err);
-- 
2.23.0.237.gc6a4ce50a0-goog


-- 
Dmitry
