From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 3/7] clk: tegra: correct afi parent
Date: Wed, 22 Feb 2017 17:13:58 +0200
Message-ID: <1487776444-4701-4-git-send-email-pdeschrijver@nvidia.com>
References: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The parent for afi is actually mselect, not clk_m.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 19b00b7..c9e795b 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -815,7 +815,7 @@
 	GATE("usb2", "clk_m", 58, 0, tegra_clk_usb2, 0),
 	GATE("usb3", "clk_m", 59, 0, tegra_clk_usb3, 0),
 	GATE("csi", "pll_p_out3", 52, 0, tegra_clk_csi, 0),
-	GATE("afi", "clk_m", 72, 0, tegra_clk_afi, 0),
+	GATE("afi", "mselect", 72, 0, tegra_clk_afi, 0),
 	GATE("csus", "clk_m", 92, TEGRA_PERIPH_NO_RESET, tegra_clk_csus, 0),
 	GATE("dds", "clk_m", 150, TEGRA_PERIPH_ON_APB, tegra_clk_dds, 0),
 	GATE("dp2", "clk_m", 152, TEGRA_PERIPH_ON_APB, tegra_clk_dp2, 0),
-- 
1.9.1
