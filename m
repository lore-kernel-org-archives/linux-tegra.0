From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/5] phy: tegra: xusb: Skip single function lane programming
Date: Fri, 25 Jan 2019 12:25:22 +0100
Message-ID: <20190125112525.10697-2-thierry.reding@gmail.com>
References: <20190125112525.10697-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125112525.10697-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

Tegra186 USB2 pads and USB3 pads do not have hardware mux for changing
the pad function. For such "lanes", we can skip the lane mux register
programming.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 5b3b8863363e..e3bc60cfe6a1 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2014-2015, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2016, NVIDIA CORPORATION.  All rights reserved.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -313,6 +313,10 @@ static void tegra_xusb_lane_program(struct tegra_xusb_lane *lane)
 	const struct tegra_xusb_lane_soc *soc = lane->soc;
 	u32 value;
 
+	/* skip single function lanes */
+	if (soc->num_funcs < 2)
+		return;
+
 	/* choose function */
 	value = padctl_readl(padctl, soc->offset);
 	value &= ~(soc->mask << soc->shift);
-- 
2.19.1
