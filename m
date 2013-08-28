From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 4/6] clk: tegra114: Initialize clocks needed for HDMI
Date: Wed, 28 Aug 2013 18:48:40 +0300
Message-ID: <1377704922-2824-5-git-send-email-mperttunen@nvidia.com>
References: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: tbergstrom@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add host1x, disp1 and disp2 clocks to the clock initialization table.
These clocks are required for HDMI support.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra114.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index cd94b0c..a491dea 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -2211,6 +2211,9 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{i2s4, pll_a_out0, 11289600, 0},
 	{dfll_soc, pll_p, 51000000, 1},
 	{dfll_ref, pll_p, 51000000, 1},
+	{host1x, pll_c, 150000000, 0},
+	{disp1, pll_p, 600000000, 0},
+	{disp2, pll_p, 600000000, 0},
 	{clk_max, clk_max, 0, 0}, /* This MUST be the last entry. */
 };
 
-- 
1.8.1.5
