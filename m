From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 3/3] drm/tegra: dc: Silence RGB output deferred-probe error
Date: Mon,  9 Mar 2020 01:38:09 +0300
Message-ID: <20200308223809.23549-3-digetx@gmail.com>
References: <20200308223809.23549-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200308223809.23549-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Driver fails to probe with -EPROBE_DEFER if display output isn't ready
yet. This produces a bit noisy error message in KMSG during kernel's boot
up on Tegra20 and Tegra30 because RGB output tends to be probed earlier
than a corresponding voltage regulator driver.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 56d933e81797..d7f2c4654b6b 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2571,7 +2571,11 @@ static int tegra_dc_probe(struct platform_device *pdev)
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
-		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
+		if (err == -EPROBE_DEFER)
+			dev_dbg(&pdev->dev, "RGB output probe deferred\n");
+		else
+			dev_err(&pdev->dev, "failed to probe RGB output: %d\n",
+				err);
 		return err;
 	}
 
-- 
2.25.1
