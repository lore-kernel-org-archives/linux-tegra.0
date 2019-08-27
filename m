From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] arm/arm64: defconfig: Update configs to use the new CROS_EC options
Date: Tue, 27 Aug 2019 17:48:51 +0200
Message-ID: <20190827154851.10486-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: soc@kernel.org
Cc: gwendal@chromium.org, bleung@chromium.org, linux-kernel@vger.kernel.org, groeck@chromium.org, kernel@collabora.com, lee.jones@linaro.org, Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Leonard Crestez <leonard.crestez@nxp.com>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Chanwoo Choi <cw00.choi@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Recently we refactored the CrOS EC drivers moving part of the code from
the MFD subsystem to the platform chrome subsystem. During this change
we needed to rename some config options, so, update the defconfigs
accordingly.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Gwendal Grignou <gwendal@chromium.org>
---
Dear all,

This is basically a resend of [1] in order to get patch into the arm-soc
patchwork and can be merged independently of the series. The patch was
originally sent as part of the these series [2] but as defconfig changes
often cause merge conflicts the maintainers prefer to have this merged
through the arm-soc tree. My bad was not including the soc ML from the
begining, so sorry about that.

Thanks,
 Enric

[1] https://lkml.org/lkml/2019/8/23/518
[2] https://lkml.org/lkml/2019/8/23/475

 arch/arm/configs/exynos_defconfig   | 6 +++++-
 arch/arm/configs/multi_v7_defconfig | 6 ++++--
 arch/arm/configs/pxa_defconfig      | 4 +++-
 arch/arm/configs/tegra_defconfig    | 2 +-
 arch/arm64/configs/defconfig        | 6 ++++--
 5 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 2e6a863d25aa..d29029f534ec 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -154,7 +154,11 @@ CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
-CONFIG_MFD_CROS_EC=y
+CONFIG_MFD_CROS_EC_DEV=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=y
+CONFIG_CROS_EC_I2C=y
+CONFIG_CROS_EC_SPI=y
 CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6a40bc2ef271..0e9e70badf88 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -511,10 +511,12 @@ CONFIG_MFD_BCM590XX=y
 CONFIG_MFD_AC100=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
-CONFIG_MFD_CROS_EC=m
+CONFIG_MFD_CROS_EC_DEV=m
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=m
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
-CONFIG_MFD_CROS_EC_CHARDEV=m
+CONFIG_CROS_EC_CHARDEV=m
 CONFIG_MFD_DA9063=m
 CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77686=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 787c3f9be414..635bf7dec53c 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -393,7 +393,9 @@ CONFIG_SA1100_WATCHDOG=m
 CONFIG_MFD_AS3711=y
 CONFIG_MFD_BCM590XX=m
 CONFIG_MFD_AXP20X=y
-CONFIG_MFD_CROS_EC=m
+CONFIG_MFD_CROS_EC_DEV=m
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=m
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
 CONFIG_MFD_ASIC3=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 8f5c6a5b444c..061037012335 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -147,7 +147,7 @@ CONFIG_SENSORS_LM95245=y
 CONFIG_WATCHDOG=y
 CONFIG_TEGRA_WATCHDOG=y
 CONFIG_MFD_AS3722=y
-CONFIG_MFD_CROS_EC=y
+CONFIG_MFD_CROS_EC_DEV=y
 CONFIG_MFD_MAX8907=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0e58ef02880c..c4df1999fe0d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -457,8 +457,7 @@ CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
-CONFIG_MFD_CROS_EC=y
-CONFIG_MFD_CROS_EC_CHARDEV=m
+CONFIG_MFD_CROS_EC_DEV=y
 CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
@@ -668,8 +667,11 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
 CONFIG_CROS_EC_SPI=y
+CONFIG_CROS_EC_CHARDEV=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCPI=y
 CONFIG_COMMON_CLK_CS2000_CP=y
-- 
2.20.1
