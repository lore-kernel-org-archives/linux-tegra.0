From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 15/37] PM / devfreq: tegra30: Add error messages to tegra_devfreq_target()
Date: Tue,  9 Jun 2020 16:13:42 +0300
Message-ID: <20200609131404.17523-16-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

It's useful to now when something goes wrong instead of failing silently,
so let's add error messages to tegra_devfreq_target() to prevent situation
where it fails silently.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 13f93c6038ab..a03fb16c5c4c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -641,12 +641,16 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 	dev_pm_opp_put(opp);
 
 	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
-	if (err)
+	if (err) {
+		dev_err(dev, "Failed to set min rate: %d\n", err);
 		return err;
+	}
 
 	err = clk_set_rate(tegra->emc_clock, 0);
-	if (err)
+	if (err) {
+		dev_err(dev, "Failed to set rate: %d\n", err);
 		goto restore_min_rate;
+	}
 
 	return 0;
 
-- 
2.26.0
