From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v8] drm/tegra: Reset the SOR during initialization
Date: Mon, 30 Mar 2015 10:33:03 +0200
Message-ID: <1427704383-23780-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

As there isn't a way for the firmware on the Nyan chromebooks to hand
over the display to the kernel, and the kernel isn't redoing the whole
configuration at present.

With this patch, the SOR is brought to a known state and we get correct
display on every boot.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

---

v8:	* Use usleep_range instead of msleep as suggested by Dmitry
	Osipenko

v7:	* Move the reset to the host1x_client_ops.init callback as
	suggested by Thierry
	* Reduced the time during which the reset line is asserted from
	20ms to 2ms
---
 drivers/gpu/drm/tegra/sor.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 2afe478..dc51a8e 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1354,12 +1354,30 @@ static int tegra_sor_init(struct host1x_client *client)
 		}
 	}
 
+	/*
+	 * XXX: Remove this reset once proper hand-over from firmware to
+	 * kernel is possible.
+	 */
+	err = reset_control_assert(sor->rst);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to assert SOR reset: %d\n", err);
+		return err;
+	}
+
 	err = clk_prepare_enable(sor->clk);
 	if (err < 0) {
 		dev_err(sor->dev, "failed to enable clock: %d\n", err);
 		return err;
 	}
 
+	usleep_range(1000, 3000);
+
+	err = reset_control_deassert(sor->rst);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to deassert SOR reset: %d\n", err);
+		return err;
+	}
+
 	err = clk_prepare_enable(sor->clk_safe);
 	if (err < 0)
 		return err;
-- 
2.1.0
