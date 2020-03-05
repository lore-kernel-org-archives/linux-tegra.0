From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [RESEND RESEND PATCH] arm/arm64: defconfig: Update configs to use the new CROS_EC options
Date: Thu,  5 Mar 2020 12:10:47 +0100
Message-ID: <20200305111047.147355-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, linux-tegra@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, Leonard Crestez <leonard.crestez@nxp.com>, linux-samsung-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Bastien Nocera <hadess@hadess.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Lubomir Rintel <lkundrak@v3.sk>, Daniel
List-Id: linux-tegra@vger.kernel.org

We refactored the CrOS EC drivers moving part of the code from the MFD
subsystem to the platform chrome subsystem. During this change we needed
to rename some config options, so, update the defconfigs accordingly.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
Tested-by: Gwendal Grignou <gwendal@chromium.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
Dear all,

This is a resend of a resend patch [3]. In some previous discussions
maintainers would prefer to have this merged through the arm-soc tree
but wasn't merged yet and I forget to ping again, hence, sending a new
resend.

To give some context to some discussions that can arise again (i.e
whether some symbols should be built-in or not) please look at the
previous resends [1] and [2].

Thanks,
 Enric

[1] https://lkml.org/lkml/2019/8/23/518
[2] https://lkml.org/lkml/2019/8/23/475
[3] https://patchwork.kernel.org/patch/11267741/

 arch/arm/configs/exynos_defconfig   | 4 +++-
 arch/arm/configs/multi_v7_defconfig | 5 ++++-
 arch/arm/configs/pxa_defconfig      | 4 +++-
 arch/arm/configs/tegra_defconfig    | 2 +-
 arch/arm64/configs/defconfig        | 5 ++++-
 5 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index c8e0c14092e8..cb030549dd69 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -160,7 +160,9 @@ CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
-CONFIG_MFD_CROS_EC=y
+CONFIG_MFD_CROS_EC_DEV=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=y
 CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 017d65f86eba..9099787ccf70 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -938,7 +938,7 @@ CONFIG_SERIO_NVEC_PS2=y
 CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
 CONFIG_STAGING_BOARD=y
-CONFIG_MFD_CROS_EC=m
+CONFIG_MFD_CROS_EC_DEV=m
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
 CONFIG_COMMON_CLK_MAX77686=y
@@ -1118,3 +1118,6 @@ CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=m
+CONFIG_CROS_EC_CHARDEV=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index b817c57f05f1..f1b084ace88d 100644
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
index a27592d3b1fa..7bfae67d2016 100644
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
index 905109f6814f..2095e61c8665 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -705,9 +705,12 @@ CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
-CONFIG_MFD_CROS_EC=y
+CONFIG_MFD_CROS_EC_DEV=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
 CONFIG_CROS_EC_SPI=y
+CONFIG_CROS_EC_CHARDEV=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCPI=y
 CONFIG_COMMON_CLK_CS2000_CP=y
-- 
2.25.1
