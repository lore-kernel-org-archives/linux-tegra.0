From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 18/20] PM / devfreq: tegra30: Define ACTMON_DEV_CTRL_STOP
Date: Tue, 30 Jul 2019 19:22:34 +0300
Message-ID: <20190730162236.6063-19-digetx@gmail.com>
References: <20190730162236.6063-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730162236.6063-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add verbose definition for the client's device control register value that
makes ACTMON to stop monitoring of the device.

Suggested-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 3543fba74b52..8adc0ff48b45 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -35,6 +35,8 @@
 #define ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN		BIT(30)
 #define ACTMON_DEV_CTRL_ENB					BIT(31)
 
+#define ACTMON_DEV_CTRL_STOP					0x00000000
+
 #define ACTMON_DEV_UPPER_WMARK					0x4
 #define ACTMON_DEV_LOWER_WMARK					0x8
 #define ACTMON_DEV_INIT_AVG					0xc
@@ -714,7 +716,7 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
 
 static void tegra_actmon_stop_device(struct tegra_devfreq_device *dev)
 {
-	device_writel(dev, 0x00000000, ACTMON_DEV_CTRL);
+	device_writel(dev, ACTMON_DEV_CTRL_STOP, ACTMON_DEV_CTRL);
 	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
 }
 
-- 
2.22.0
