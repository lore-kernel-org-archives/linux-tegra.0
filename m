From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] drm/tegra: gr3d: Assert reset before power-gating
Date: Sat, 16 May 2020 18:41:15 +0300
Message-ID: <20200516154115.14510-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra TRM documentation states that hardware should be in a default state
when power partition is turned off, i.e. reset should be asserted. This
patch adds the missing reset assertions.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/gr3d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index c0a528be0369..b0b8154e8104 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -381,10 +381,12 @@ static int gr3d_remove(struct platform_device *pdev)
 	}
 
 	if (gr3d->clk_secondary) {
+		reset_control_assert(gr3d->rst_secondary);
 		tegra_powergate_power_off(TEGRA_POWERGATE_3D1);
 		clk_disable_unprepare(gr3d->clk_secondary);
 	}
 
+	reset_control_assert(gr3d->rst);
 	tegra_powergate_power_off(TEGRA_POWERGATE_3D);
 	clk_disable_unprepare(gr3d->clk);
 
-- 
2.26.0
