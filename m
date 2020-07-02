From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 06/40] drm/tegra: hub: Do not enable orphaned window group
Date: Wed,  1 Jul 2020 21:23:27 -0400
Message-ID: <20200702012402.2701121-6-sashal@kernel.org>
References: <20200702012402.2701121-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200702012402.2701121-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Thierry Reding <treding@nvidia.com>, Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Nicolin Chen <nicoleotsuka@gmail.com>

[ Upstream commit ef4e417eb3ec7fe657928f10ac1d2154d8a5fb38 ]

Though the unconditional enable/disable code is not a final solution,
we don't want to run into a NULL pointer situation when window group
doesn't link to its DC parent if the DC is disabled in Device Tree.

So this patch simply adds a check to make sure that window group has
a valid parent before running into tegra_windowgroup_enable/disable.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/hub.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 839b49c40e514..767fb440a79d9 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -141,7 +141,9 @@ int tegra_display_hub_prepare(struct tegra_display_hub *hub)
 	for (i = 0; i < hub->soc->num_wgrps; i++) {
 		struct tegra_windowgroup *wgrp = &hub->wgrps[i];
 
-		tegra_windowgroup_enable(wgrp);
+		/* Skip orphaned window group whose parent DC is disabled */
+		if (wgrp->parent)
+			tegra_windowgroup_enable(wgrp);
 	}
 
 	return 0;
@@ -158,7 +160,9 @@ void tegra_display_hub_cleanup(struct tegra_display_hub *hub)
 	for (i = 0; i < hub->soc->num_wgrps; i++) {
 		struct tegra_windowgroup *wgrp = &hub->wgrps[i];
 
-		tegra_windowgroup_disable(wgrp);
+		/* Skip orphaned window group whose parent DC is disabled */
+		if (wgrp->parent)
+			tegra_windowgroup_disable(wgrp);
 	}
 }
 
-- 
2.25.1
