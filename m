From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 4/5] PM / devfreq: tegra30: Use clk_round_rate_unboundly()
Date: Tue, 31 Mar 2020 02:16:16 +0300
Message-ID: <20200330231617.17079-5-digetx@gmail.com>
References: <20200330231617.17079-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200330231617.17079-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The clk_round_rate() doesn't work for us properly if clock rate is bounded
by a min/max rate that is requested by some other clk-user because we're
building devfreq's OPP table based on the rounding.

In particular this becomes a problem if display driver is probed earlier
than devfreq, and thus, display adds a memory bandwidth request using
interconnect API, which results in a minimum clock-rate being set for
the memory clk. In a result, the lowest devfreq OPP rate is getting
limited to the minimum rate imposed by the display driver.

Let's use new clk_round_rate_unboundly() that resolves the problem by
rounding clock rate without taking into account min/max limits imposed by
active clk users.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 28b2c7ca416e..34f6291e880c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -834,7 +834,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 
 	reset_control_deassert(tegra->reset);
 
-	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
+	rate = clk_round_rate_unboundly(tegra->emc_clock, ULONG_MAX);
 	if (rate < 0) {
 		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
 		return rate;
@@ -849,7 +849,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 	}
 
 	for (rate = 0; rate <= tegra->max_freq * KHZ; rate++) {
-		rate = clk_round_rate(tegra->emc_clock, rate);
+		rate = clk_round_rate_unboundly(tegra->emc_clock, rate);
 
 		if (rate < 0) {
 			dev_err(&pdev->dev,
-- 
2.25.1
