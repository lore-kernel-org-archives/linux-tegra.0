From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v5 09/11] drm/tegra: Reset the SOR on probe
Date: Thu, 12 Feb 2015 09:51:03 +0100
Message-ID: <1423731078-26681-10-git-send-email-tomeu.vizoso@collabora.com>
References: <1423731078-26681-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423731078-26681-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Simon Glass <sjg@chromium.org>, Dylan Reid <dgreid@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, Alexandre Courbot <gnurou@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

As there isn't a way for the firmware on the Nyan chromebooks to hand
over the display to the kernel.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/tegra/sor.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 2afe478..e6caacc 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1458,6 +1458,20 @@ static int tegra_sor_probe(struct platform_device *pdev)
 
 	mutex_init(&sor->lock);
 
+	err = reset_control_assert(sor->rst);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to assert SOR reset: %d\n", err);
+		return err;
+	}
+
+	msleep(20);
+
+	err = reset_control_deassert(sor->rst);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to deassert SOR reset: %d\n", err);
+		return err;
+	}
+
 	err = host1x_client_register(&sor->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
-- 
1.9.3
