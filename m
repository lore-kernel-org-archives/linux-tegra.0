From: Wei Ni <wni@nvidia.com>
Subject: [PATCH V1 01/10] thermal: tegra: move tegra thermal files into tegra directory
Date: Wed, 13 Jan 2016 15:58:40 +0800
Message-ID: <1452671929-32740-2-git-send-email-wni@nvidia.com>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452671929-32740-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, mikko.perttunen@kapsi.fi, swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Move tegra soctherm driver to tegra directory, it's easy to maintain
and add more new function support for tegra platforms.
This will also help to split soctherm driver into common parts and
chip specific data related parts.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/thermal/Kconfig                      | 15 +++++----------
 drivers/thermal/Makefile                     |  2 +-
 drivers/thermal/tegra/Kconfig                |  9 +++++++++
 drivers/thermal/tegra/Makefile               |  6 ++++++
 drivers/thermal/{ => tegra}/tegra_soctherm.c |  0
 5 files changed, 21 insertions(+), 11 deletions(-)
 create mode 100644 drivers/thermal/tegra/Kconfig
 create mode 100644 drivers/thermal/tegra/Makefile
 rename drivers/thermal/{ => tegra}/tegra_soctherm.c (100%)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index c463c89b90ef..7984cba6b340 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -254,16 +254,6 @@ config ARMADA_THERMAL
 	  Enable this option if you want to have support for thermal management
 	  controller present in Armada 370 and Armada XP SoC.
 
-config TEGRA_SOCTHERM
-	tristate "Tegra SOCTHERM thermal management"
-	depends on ARCH_TEGRA
-	help
-	  Enable this option for integrated thermal management support on NVIDIA
-	  Tegra124 systems-on-chip. The driver supports four thermal zones
-	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the thermal
-	  zones to manage temperatures. This option is also required for the
-	  emergency thermal reset (thermtrip) feature to function.
-
 config DB8500_CPUFREQ_COOLING
 	tristate "DB8500 cpufreq cooling"
 	depends on ARCH_U8500
@@ -380,6 +370,11 @@ depends on ARCH_STI && OF
 source "drivers/thermal/st/Kconfig"
 endmenu
 
+menu "Tegra thermal drivers"
+depends on ARCH_TEGRA
+source "drivers/thermal/tegra/Kconfig"
+endmenu
+
 config QCOM_SPMI_TEMP_ALARM
 	tristate "Qualcomm SPMI PMIC Temperature Alarm"
 	depends on OF && (SPMI || COMPILE_TEST) && IIO
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index cfae6a654793..119e25cdcc66 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -46,5 +46,5 @@ obj-$(CONFIG_TI_SOC_THERMAL)	+= ti-soc-thermal/
 obj-$(CONFIG_INT340X_THERMAL)  += int340x_thermal/
 obj-$(CONFIG_INTEL_PCH_THERMAL)	+= intel_pch_thermal.o
 obj-$(CONFIG_ST_THERMAL)	+= st/
-obj-$(CONFIG_TEGRA_SOCTHERM)	+= tegra_soctherm.o
+obj-$(CONFIG_TEGRA_SOCTHERM)	+= tegra/
 obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
diff --git a/drivers/thermal/tegra/Kconfig b/drivers/thermal/tegra/Kconfig
new file mode 100644
index 000000000000..a6e6cd4528dc
--- /dev/null
+++ b/drivers/thermal/tegra/Kconfig
@@ -0,0 +1,9 @@
+config TEGRA_SOCTHERM
+	tristate "Tegra SOCTHERM thermal management"
+	depends on ARCH_TEGRA
+	help
+	  Enable this option for integrated thermal management support on NVIDIA
+	  Tegra124 systems-on-chip. The driver supports four thermal zones
+	  (CPU, GPU, MEM, PLLX). Cooling devices can be bound to the thermal
+	  zones to manage temperatures. This option is also required for the
+	  emergency thermal reset (thermtrip) feature to function.
diff --git a/drivers/thermal/tegra/Makefile b/drivers/thermal/tegra/Makefile
new file mode 100644
index 000000000000..8c51076e4b1e
--- /dev/null
+++ b/drivers/thermal/tegra/Makefile
@@ -0,0 +1,6 @@
+#
+# Tegra thermal specific Makefile
+#
+
+# Tegra soc thermal drivers
+obj-$(CONFIG_TEGRA_SOCTHERM)	+= tegra_soctherm.o
diff --git a/drivers/thermal/tegra_soctherm.c b/drivers/thermal/tegra/tegra_soctherm.c
similarity index 100%
rename from drivers/thermal/tegra_soctherm.c
rename to drivers/thermal/tegra/tegra_soctherm.c
-- 
1.9.1
