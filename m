From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/7] soc/tegra: pmc: Add new Tegra210 IO rails
Date: Tue, 12 Apr 2016 20:26:42 +0530
Message-ID: <1460473007-11535-3-git-send-email-ldewangan@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra210 has extended the IO rails for new IO pads
and added some new IO rails on top of its previous SoC.

Add all supported IO rails from Tegra210 to the Tegra PMC header.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 include/soc/tegra/pmc.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 07e332d..58fadc5 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -90,22 +90,36 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
 #define TEGRA_IO_RAIL_UART	14
 #define TEGRA_IO_RAIL_BB	15
 #define TEGRA_IO_RAIL_AUDIO	17
+#define TEGRA_IO_RAIL_USB3	18
 #define TEGRA_IO_RAIL_HSIC	19
 #define TEGRA_IO_RAIL_COMP	22
+#define TEGRA_IO_RAIL_DBG	25
+#define TEGRA_IO_RAIL_DBG_NONAO	26
+#define TEGRA_IO_RAIL_GPIO	27
 #define TEGRA_IO_RAIL_HDMI	28
 #define TEGRA_IO_RAIL_PEX_CNTRL	32
 #define TEGRA_IO_RAIL_SDMMC1	33
 #define TEGRA_IO_RAIL_SDMMC3	34
 #define TEGRA_IO_RAIL_SDMMC4	35
+#define TEGRA_IO_RAIL_EMMC	35
 #define TEGRA_IO_RAIL_CAM	36
 #define TEGRA_IO_RAIL_RES	37
+#define TEGRA_IO_RAIL_EMMC2	37
 #define TEGRA_IO_RAIL_HV	38
 #define TEGRA_IO_RAIL_DSIB	39
 #define TEGRA_IO_RAIL_DSIC	40
 #define TEGRA_IO_RAIL_DSID	41
+#define TEGRA_IO_RAIL_CSIC	42
+#define TEGRA_IO_RAIL_CSID	43
 #define TEGRA_IO_RAIL_CSIE	44
+#define TEGRA_IO_RAIL_CSIF	45
+#define TEGRA_IO_RAIL_SPI	46
+#define TEGRA_IO_RAIL_SPI_HV	47
+#define TEGRA_IO_RAIL_DMIC	50
+#define TEGRA_IO_RAIL_DP	51
 #define TEGRA_IO_RAIL_LVDS	57
 #define TEGRA_IO_RAIL_SYS_DDC	58
+#define TEGRA_IO_RAIL_AUDIO_HV	61
 
 #ifdef CONFIG_ARCH_TEGRA
 int tegra_powergate_is_powered(unsigned int id);
-- 
2.1.4
