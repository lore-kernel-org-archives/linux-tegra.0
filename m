From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 7/7] clk: tegra: fix type for m field
Date: Thu, 23 Feb 2017 12:44:44 +0200
Message-ID: <1487846686-6388-8-git-send-email-pdeschrijver@nvidia.com>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

When used as part of fractional ndiv calculations, the current range is not
enough because the denominator of the fraction is multiplied with m.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 6ba82ec..a62ea73 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -116,7 +116,7 @@ struct tegra_clk_pll_freq_table {
 	unsigned long	input_rate;
 	unsigned long	output_rate;
 	u32		n;
-	u16		m;
+	u32		m;
 	u8		p;
 	u8		cpcon;
 	u16		sdm_data;
-- 
1.9.1

