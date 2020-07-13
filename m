From: Sumit Gupta <sumitg@nvidia.com>
Subject: [TEGRA194_CPUFREQ PATCH v5 4/4] soc/tegra: cpufreq: select cpufreq for Tegra194
Date: Mon, 13 Jul 2020 19:36:49 +0530
Message-ID: <1594649209-29394-5-git-send-email-sumitg@nvidia.com>
References: <1594649209-29394-1-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1594649209-29394-1-git-send-email-sumitg@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rjw@rjwysocki.net, viresh.kumar@linaro.org, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org, mirq-linux@rere.qmqm.pl, devicetree@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bbasu@nvidia.com, sumitg@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Select ARM_TEGRA194_CPUFREQ by default to enable CPU frequency
scaling support for Tegra194 SOC.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 2e95809..6955cee 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -117,6 +117,7 @@ config ARCH_TEGRA_194_SOC
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
 	select SOC_TEGRA_PMC
+	select ARM_TEGRA194_CPUFREQ
 	help
 	  Enable support for the NVIDIA Tegra194 SoC.
 
-- 
2.7.4
