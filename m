From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 08/15] memory: tegra: Remove unused headers inclusions
Date: Mon,  9 Apr 2018 22:28:30 +0300
Message-ID: <1edd1ed575d21c96f0810bd226bee4b5c315f3db.1523301400.git.digetx@gmail.com>
References: <cover.1523301400.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1523301400.git.digetx@gmail.com>
In-Reply-To: <cover.1523301400.git.digetx@gmail.com>
References: <cover.1523301400.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 contains some unused leftover headers, remove them for
consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra210.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 3b8d0100088c..b729f49ffc8f 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -6,11 +6,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/of.h>
-#include <linux/mm.h>
-
-#include <asm/cacheflush.h>
-
 #include <dt-bindings/memory/tegra210-mc.h>
 
 #include "mc.h"
-- 
2.16.3
