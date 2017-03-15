From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] clk: tegra: fix disable unused for clocks sharing enable bit
Date: Wed, 15 Mar 2017 16:10:54 +0200
Message-ID: <1489587055-23722-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

In case 2 clocks share an enable bit and one of them is enabled by a driver
and the other one is not, CCF will think it's enabled because it will only
look at the hw state. Therefor it will disable the clock and thus also
disable the other clock which was enabled. Solve this by reading the
initial state of the enable bit and incrementing the refcount if it's set.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-periph-gate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
index 8812782..303ef32 100644
--- a/drivers/clk/tegra/clk-periph-gate.c
+++ b/drivers/clk/tegra/clk-periph-gate.c
@@ -159,6 +159,9 @@ struct clk *tegra_clk_register_periph_gate(const char *name,
 	gate->enable_refcnt = enable_refcnt;
 	gate->regs = pregs;
 
+	if (read_enb(gate) & periph_clk_to_bit(gate))
+		enable_refcnt[clk_num]++;
+
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	gate->hw.init = &init;
 
-- 
1.9.1
