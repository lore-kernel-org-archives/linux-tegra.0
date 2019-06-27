From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 12/22] PM / devfreq: tegra30: Inline all one-line functions
Date: Fri, 28 Jun 2019 00:11:05 +0300
Message-ID: <20190627211115.21138-13-digetx@gmail.com>
References: <20190627211115.21138-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627211115.21138-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Depending on a kernel's configuration, a single line functions may not be
inlined by compiler (like enabled ftracing for example). Let's inline such
functions explicitly for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 47a47be276ee..ecbd58504cd8 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -181,28 +181,29 @@ static struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
 	{  250000,    100000 },
 };
 
-static u32 actmon_readl(struct tegra_devfreq *tegra, u32 offset)
+static inline u32 actmon_readl(struct tegra_devfreq *tegra, u32 offset)
 {
 	return readl_relaxed(tegra->regs + offset);
 }
 
-static void actmon_writel(struct tegra_devfreq *tegra, u32 val, u32 offset)
+static inline void actmon_writel(struct tegra_devfreq *tegra,
+				 u32 val, u32 offset)
 {
 	writel_relaxed(val, tegra->regs + offset);
 }
 
-static u32 device_readl(struct tegra_devfreq_device *dev, u32 offset)
+static inline u32 device_readl(struct tegra_devfreq_device *dev, u32 offset)
 {
 	return readl_relaxed(dev->regs + offset);
 }
 
-static void device_writel(struct tegra_devfreq_device *dev, u32 val,
-			  u32 offset)
+static inline void device_writel(struct tegra_devfreq_device *dev,
+				 u32 val, u32 offset)
 {
 	writel_relaxed(val, dev->regs + offset);
 }
 
-static unsigned long do_percent(unsigned long val, unsigned int pct)
+static inline unsigned long do_percent(unsigned long val, unsigned int pct)
 {
 	return val * pct / 100;
 }
-- 
2.22.0
