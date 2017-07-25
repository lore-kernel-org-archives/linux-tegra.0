From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 03/14] clk: tegra: disable SSC for PLL_D2
Date: Tue, 25 Jul 2017 13:34:04 +0300
Message-ID: <1500978856-5981-4-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

PLLD2 is used for HDMI which does not allowe Spread Spectrum clocking.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 1024e85..facd6ee 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -146,7 +146,7 @@
 #define PLLD_SDM_EN_MASK BIT(16)
 
 #define PLLD2_SDM_EN_MASK BIT(31)
-#define PLLD2_SSC_EN_MASK BIT(30)
+#define PLLD2_SSC_EN_MASK 0
 
 #define PLLDP_SS_CFG	0x598
 #define PLLDP_SDM_EN_MASK BIT(31)
-- 
1.9.1
