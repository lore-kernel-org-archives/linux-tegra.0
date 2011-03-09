From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH v2 1/3] ARM: tegra: harmony: update PCI-e initialization sequence
Date: Wed,  9 Mar 2011 16:31:17 +0200
Message-ID: <0d5b92a9de105a916e66a544473c9780a51f95a1.1299681036.git.mike@compulab.co.il>
References: <cover.1299681036.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1299681036.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Harmony board PCI-e subsystem can be enabled only after certain
voltage regulators are on. One of the regulators is an internal
regulator on the PMIC and another one is controlled by a PMIC GPIO.
Addition of the voltage control to the Harmony PCI-e initialization
allows booting of kernel with CONFIG_TEGRA_PCI even if the PMIC driver
is not loaded. In this case the PCI-e initialization will fail
gracefully intead of hanging the system.

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony-pcie.c |   24 +++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-tegra/board-harmony-pcie.c
index f7e7d45..9c27b95 100644
--- a/arch/arm/mach-tegra/board-harmony-pcie.c
+++ b/arch/arm/mach-tegra/board-harmony-pcie.c
@@ -27,13 +27,29 @@
 
 #ifdef CONFIG_TEGRA_PCI
 
+/* GPIO 3 of the PMIC */
+#define EN_VDD_1V05_GPIO	(TEGRA_NR_GPIOS + 2)
+
 static int __init harmony_pcie_init(void)
 {
+	struct regulator *regulator = NULL;
 	int err;
 
 	if (!machine_is_harmony())
 		return 0;
 
+	err = gpio_request(EN_VDD_1V05_GPIO, "EN_VDD_1V05");
+	if (err)
+		return err;
+
+	gpio_direction_output(EN_VDD_1V05_GPIO, 1);
+
+	regulator = regulator_get(NULL, "pex_clk");
+	if (IS_ERR_OR_NULL(regulator))
+		goto err_reg;
+
+	regulator_enable(regulator);
+
 	tegra_pinmux_set_tristate(TEGRA_PINGROUP_GPV, TEGRA_TRI_NORMAL);
 	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXA, TEGRA_TRI_NORMAL);
 	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXK, TEGRA_TRI_NORMAL);
@@ -49,9 +65,15 @@ err_pcie:
 	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXA, TEGRA_TRI_TRISTATE);
 	tegra_pinmux_set_tristate(TEGRA_PINGROUP_SLXK, TEGRA_TRI_TRISTATE);
 
+	regulator_disable(regulator);
+	regulator_put(regulator);
+err_reg:
+	gpio_free(EN_VDD_1V05_GPIO);
+
 	return err;
 }
 
-subsys_initcall(harmony_pcie_init);
+/* PCI should be initialized after I2C, mfd and regulators */
+subsys_initcall_sync(harmony_pcie_init);
 
 #endif
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
