From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH v6 1/4] clk: tegra: Fix includes required by fence_udelay()
Date: Thu, 12 Jul 2018 14:52:59 +0300
Message-ID: <1531396382-5579-2-git-send-email-avienamo@nvidia.com>
References: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Aapo Vienamo <avienamo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add the missing linux/delay.h include statement for udelay() used by
fence_udelay() macro.

Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index e1f8846..e3b9c22 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -19,6 +19,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <linux/delay.h>
 
 /**
  * struct tegra_clk_sync_source - external clock source from codec
-- 
2.7.4
