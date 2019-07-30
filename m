From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 15/20] PM / devfreq: tegra30: Constify structs
Date: Tue, 30 Jul 2019 19:22:31 +0300
Message-ID: <20190730162236.6063-16-digetx@gmail.com>
References: <20190730162236.6063-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730162236.6063-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Constify unmodifiable structs, for consistency.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index d0e971e51faf..81efc3ddb486 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -107,7 +107,7 @@ enum tegra_actmon_device {
 	MCCPU,
 };
 
-static struct tegra_devfreq_device_config actmon_device_configs[] = {
+static const struct tegra_devfreq_device_config actmon_device_configs[] = {
 	{
 		/* MCALL: All memory accesses (including from the CPUs) */
 		.offset = 0x1c0,
@@ -175,7 +175,7 @@ struct tegra_actmon_emc_ratio {
 	unsigned long emc_freq;
 };
 
-static struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
+static const struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
 	{ 1400000,    KHZ_MAX },
 	{ 1200000,    750000 },
 	{ 1100000,    600000 },
@@ -214,7 +214,7 @@ static unsigned long do_percent(unsigned long val, unsigned int pct)
 static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
 					    unsigned int cpu_freq)
 {
-	struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
+	const struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++) {
-- 
2.22.0
