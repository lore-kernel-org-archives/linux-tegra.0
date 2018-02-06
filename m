From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/7] soc/tegra: Add Tegra194 SoC configuration option
Date: Tue, 6 Feb 2018 09:22:32 +0200
Message-ID: <1517901757-15353-3-git-send-email-mperttunen@nvidia.com>
References: <1517901757-15353-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517901757-15353-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the configuration option to enable support for the Tegra194
system-on-chip, and enable it by default in the arm64 defconfig.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/configs/defconfig |  1 +
 drivers/soc/tegra/Kconfig    | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 78f669a21a9b..5a8f15baa850 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -537,6 +537,7 @@ CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y
+CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 89ebe22a3e27..fe4481676da6 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -104,6 +104,16 @@ config ARCH_TEGRA_186_SOC
 	  multi-format support, ISP for image capture processing and BPMP for
 	  power management.
 
+config ARCH_TEGRA_194_SOC
+	bool "NVIDIA Tegra194 SoC"
+	select MAILBOX
+	select TEGRA_BPMP
+	select TEGRA_HSP_MBOX
+	select TEGRA_IVC
+	select SOC_TEGRA_PMC
+	help
+	  Enable support for the NVIDIA Tegra194 SoC.
+
 endif
 endif
 
-- 
2.1.4
