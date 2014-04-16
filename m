From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH v2 3/3] ARM: tegra: fix Venice2 SD card VQMMC supply
Date: Wed, 16 Apr 2014 16:08:39 -0700
Message-ID: <1397689719-28882-4-git-send-email-abrestic@chromium.org>
References: <1397526163-20126-1-git-send-email-abrestic@chromium.org>
 <1397689719-28882-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1397689719-28882-1-git-send-email-abrestic@chromium.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Chris Ball <chris@printf.net>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org

VDDIO_SDMMC3 is the VQMMC (I/O) supply, not the VMMC (core) supply,
for the SD slot on Venice2.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
Changes from v1:
 - removed vqmmc supply for eMMC
---
 arch/arm/boot/dts/tegra124-venice2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index c17283c..91b5916 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -933,7 +933,7 @@
 		power-gpios = <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
 		status = "okay";
 		bus-width = <4>;
-		vmmc-supply = <&vddio_sdmmc3>;
+		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
 	sdhci@0,700b0600 {
-- 
1.9.1.423.g4596e3a

