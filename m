From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V7 3/3] soc/tegra: pmc: Add support for IO pads power state and voltage
Date: Fri, 20 May 2016 20:15:30 +0530
Message-ID: <1463755530-20941-4-git-send-email-ldewangan@nvidia.com>
References: <1463755530-20941-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463755530-20941-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, jonathanh@nvidia.com
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The IO pins of Tegra SoCs are grouped for common control of IO
interface like setting voltage signal levels and power state of
the interface. The group is generally referred as IO pads. The
power state and voltage control of IO pins can be done at IO pads
level.

Tegra generation SoC supports the power down of IO pads when it
is not used even in the active state of system. This saves power
from that IO interface. Also it supports multiple voltage level
in IO pins for interfacing on some of pads. The IO pad voltage is
automatically detected till T124, hence SW need not to configure
this. But from T210, the automatically detection logic has been
removed, hence SW need to explicitly set the IO pad voltage into
IO pad configuration registers.

Add support to set the power states and voltage level of the IO pads
from client driver. The implementation for the APIs are in generic
which is applicable for all generation os Tegra SoC.

IO pads ID and information of bit field for power state and voltage
level controls are added for Tegra124, Tegra132 and Tegra210. The SOR
driver is modified to use the new APIs.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
Changes from V1:
This is reworked on earlier path to have separation between IO rails and
io pads and add power state and voltage control APIs in single call.

Changes from V2:
- Remove the tegra_io_rail_power_off/on() apis and change client (sor) driver
to use the new APIs for IO pad power.
- Remove the TEGRA_IO_RAIL_ macros.

Changes from V3:
- Make all pad_id/io_pad_id to id.
- tegra_io_pad_ -> tegra_io_pads
- dpd_bit -> bit, pwr_mask/bit to mask/bit.
- Rename function to tegra_io_pads_{set,get}_voltage_config
- Make the io pad tables common for all SoC.
- Make io_pads enums.
- Add enums for voltage.

Changes from V4:
- IO_PAD->IO_PADS
- TEGRA_IO_PADS_POWER_SOURCE_ -> TEGRA_IO_PADS_VCONF_

Changes from V5:
- Fix comment style to multi-line format.
- Use -EINVAL instead of -1 to refactor some of function as suggested by Jon.

Changes from V6:
- Doc style formatting.
- io pads id checks.
- Documenting public functions.
- Corrected error numbers.
---
 drivers/gpu/drm/tegra/sor.c |   8 +-
 drivers/soc/tegra/pmc.c     | 280 +++++++++++++++++++++++++++++++++++++++-----
 include/soc/tegra/pmc.h     | 133 +++++++++++++++------
 3 files changed, 350 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 757c6e8..3ce547a 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1134,7 +1134,7 @@ static void tegra_sor_edp_disable(struct drm_encoder *encoder)
 			dev_err(sor->dev, "failed to disable DP: %d\n", err);
 	}
 
-	err = tegra_io_rail_power_off(TEGRA_IO_RAIL_LVDS);
+	err = tegra_io_pads_power_disable(TEGRA_IO_PADS_LVDS);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power off I/O rail: %d\n", err);
 
@@ -1296,7 +1296,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
 	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
 
 	/* step 2 */
-	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_LVDS);
+	err = tegra_io_pads_power_enable(TEGRA_IO_PADS_LVDS);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power on I/O rail: %d\n", err);
 
@@ -1748,7 +1748,7 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
 	if (err < 0)
 		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
 
-	err = tegra_io_rail_power_off(TEGRA_IO_RAIL_HDMI);
+	err = tegra_io_pads_power_disable(TEGRA_IO_PADS_HDMI);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power off HDMI rail: %d\n", err);
 
@@ -1787,7 +1787,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
 
 	div = clk_get_rate(sor->clk) / 1000000 * 4;
 
-	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_HDMI);
+	err = tegra_io_pads_power_enable(TEGRA_IO_PADS_HDMI);
 	if (err < 0)
 		dev_err(sor->dev, "failed to power on HDMI rail: %d\n", err);
 
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 09c2b97..ad4d903 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -76,6 +76,10 @@
 
 #define PMC_SCRATCH41			0x140
 
+/* Power detect for pad voltage */
+#define PMC_PWR_DET			0x48
+#define PMC_PWR_DET_VAL			0xe4
+
 #define PMC_SENSOR_CTRL			0x1b0
 #define PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
 #define PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
@@ -105,6 +109,15 @@
 
 #define GPU_RG_CNTRL			0x2d4
 
+/**
+ * Define the IO_PADS SOC for SOC mask to find out that IO pads supported
+ * or not in given SoC.
+ */
+#define TEGRA_IO_PADS_T124		0x1
+#define TEGRA_IO_PADS_T210		0x2
+#define TEGRA_IO_PADS_T124_T210		(TEGRA_IO_PADS_T124 |	\
+					TEGRA_IO_PADS_T210)
+
 struct tegra_powergate {
 	struct generic_pm_domain genpd;
 	struct tegra_pmc *pmc;
@@ -115,12 +128,27 @@ struct tegra_powergate {
 	unsigned int num_resets;
 };
 
+/**
+ * tegra_io_pads_config_info - Tegra IO pads bit config info.
+ * @dpd_config_bit:	DPD configuration bit position. -ENOTSUPP if not
+ *			supported.
+ * @voltage_config_bit: Voltage configuration bit position. -ENOTSUPP if not
+			supported.
+ * @soc_mask:		Bitwise OR of SoC masks if IO pads supported on that
+ *			SoC.
+ */
+struct tegra_io_pads_config_info {
+	int dpd_config_bit;
+	int voltage_config_bit;
+	int soc_mask;
+};
+
 struct tegra_pmc_soc {
 	unsigned int num_powergates;
 	const char *const *powergates;
 	unsigned int num_cpu_powergates;
 	const u8 *cpu_powergates;
-
+	int io_pads_soc_mask;
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
 };
@@ -196,6 +224,14 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
 	writel(value, pmc->base + offset);
 }
 
+static void tegra_pmc_rmw(unsigned long offset, u32 mask, u32 val)
+{
+	u32 pmc_reg = tegra_pmc_readl(offset);
+
+	pmc_reg = (pmc_reg & ~mask) | (val & mask);
+	tegra_pmc_writel(pmc_reg, offset);
+}
+
 static inline bool tegra_powergate_state(int id)
 {
 	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
@@ -841,21 +877,104 @@ static void tegra_powergate_init(struct tegra_pmc *pmc)
 	of_node_put(np);
 }
 
-static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
-				 unsigned long *status, unsigned int *bit)
+#define TEGRA_IO_PADS_CONFIG(_id, _dpd, _volt, _soc)		\
+[TEGRA_IO_PADS_##_id] = {					\
+	.dpd_config_bit = (_dpd),				\
+	.voltage_config_bit = (_volt),				\
+	.soc_mask = (_soc),					\
+}
+
+static struct tegra_io_pads_config_info
+tegra_io_pads_configs[TEGRA_IO_PADS_MAX] = {
+	TEGRA_IO_PADS_CONFIG(CSIA, 0, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(CSIB, 1, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(DSI, 2, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(MIPI_BIAS, 3, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(PEX_BIAS, 4, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(PEX_CLK1, 5, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(PEX_CLK2, 6, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(USB0, 9, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(USB1, 10, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(USB2, 11, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(USB_BIAS, 12, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(NAND, 13, -ENOTSUPP, TEGRA_IO_PADS_T124),
+	TEGRA_IO_PADS_CONFIG(UART, 14, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(BB, 15, -ENOTSUPP, TEGRA_IO_PADS_T124),
+	TEGRA_IO_PADS_CONFIG(AUDIO, 17, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(USB3, 18, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(HSIC, 19, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(COMP, 22, -ENOTSUPP, TEGRA_IO_PADS_T124),
+	TEGRA_IO_PADS_CONFIG(DBG, 25, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(DEBUG_NONAO, 26, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(GPIO, 27, 21, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(HDMI, 28, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(PEX_CNTRL, 32, -ENOTSUPP, TEGRA_IO_PADS_T124),
+	TEGRA_IO_PADS_CONFIG(SDMMC1, 33, 12, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(SDMMC3, 34, 13, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(SDMMC4, 35, -ENOTSUPP, TEGRA_IO_PADS_T124),
+	TEGRA_IO_PADS_CONFIG(EMMC, 35, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(CAM, 36, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(EMMC2, 37, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(HV, 38, -ENOTSUPP, TEGRA_IO_PADS_T124),
+	TEGRA_IO_PADS_CONFIG(DSIB, 39, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(DSIC, 40, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(DSID, 41, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(CSIC, 42, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(CSID, 43, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(CSIE, 44, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(CSIF, 45, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(SPI, 46, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(SPI_HV, 47, 23, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(DMIC, 50, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(DP, 51, -ENOTSUPP, TEGRA_IO_PADS_T210),
+	TEGRA_IO_PADS_CONFIG(LVDS, 57, -ENOTSUPP, TEGRA_IO_PADS_T124_T210),
+	TEGRA_IO_PADS_CONFIG(SYS_DDC, 58, -ENOTSUPP, TEGRA_IO_PADS_T124),
+	TEGRA_IO_PADS_CONFIG(AUDIO_HV, 61, 18, TEGRA_IO_PADS_T210),
+};
+
+static int tegra_io_pads_to_dpd_bit(const struct tegra_pmc_soc *soc,
+				    enum tegra_io_pads id)
 {
-	unsigned long rate, value;
+	if (id >= TEGRA_IO_PADS_MAX)
+		return -EINVAL;
 
-	*bit = id % 32;
+	if (tegra_io_pads_configs[id].soc_mask & soc->io_pads_soc_mask)
+		return tegra_io_pads_configs[id].dpd_config_bit;
 
-	/*
-	 * There are two sets of 30 bits to select IO rails, but bits 30 and
-	 * 31 are control bits rather than IO rail selection bits.
-	 */
-	if (id > 63 || *bit == 30 || *bit == 31)
+	return -ENOTSUPP;
+}
+
+static int tegra_io_pads_to_voltage_bit(const struct tegra_pmc_soc *soc,
+					enum tegra_io_pads id)
+{
+	if (id >= TEGRA_IO_PADS_MAX)
 		return -EINVAL;
 
-	if (id < 32) {
+	/* T210 only supports io-pad voltage config bit */
+	if (soc->io_pads_soc_mask != TEGRA_IO_PADS_T210)
+		return -ENOTSUPP;
+
+	if (tegra_io_pads_configs[id].soc_mask & soc->io_pads_soc_mask)
+		return tegra_io_pads_configs[id].voltage_config_bit;
+
+	return -ENOTSUPP;
+}
+
+static int tegra_io_pads_dpd_prepare(enum tegra_io_pads id,
+				     unsigned long *request,
+				     unsigned long *status,
+				     unsigned int *bit)
+{
+	unsigned long rate, value;
+	int ret;
+
+	ret = tegra_io_pads_to_dpd_bit(pmc->soc, id);
+	if (ret < 0)
+		return ret;
+
+	*bit = ret % 32;
+
+	if (ret < 32) {
 		*status = IO_DPD_STATUS;
 		*request = IO_DPD_REQ;
 	} else {
@@ -875,8 +994,8 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
 	return 0;
 }
 
-static int tegra_io_rail_poll(unsigned long offset, u32 mask,
-			      u32 val, unsigned long timeout)
+static int tegra_io_pads_dpd_poll(unsigned long offset, u32 mask,
+				  u32 val, unsigned long timeout)
 {
 	u32 value;
 
@@ -893,12 +1012,19 @@ static int tegra_io_rail_poll(unsigned long offset, u32 mask,
 	return -ETIMEDOUT;
 }
 
-static void tegra_io_rail_unprepare(void)
+static void tegra_io_pads_dpd_unprepare(void)
 {
 	tegra_pmc_writel(DPD_SAMPLE_DISABLE, DPD_SAMPLE);
 }
 
-int tegra_io_rail_power_on(unsigned int id)
+/**
+ * tegra_io_pads_power_enablei() - Enable the power to IO pads.
+ * @id: Tegra IO pad ID for which power need to be enable.
+ *
+ * Return 0 if successfully enabled the power of IO pads otherwise
+ * error number in negative.
+ */
+int tegra_io_pads_power_enable(enum tegra_io_pads id)
 {
 	unsigned long request, status;
 	unsigned int bit;
@@ -907,8 +1033,8 @@ int tegra_io_rail_power_on(unsigned int id)
 
 	mutex_lock(&pmc->powergates_lock);
 
-	err = tegra_io_rail_prepare(id, &request, &status, &bit);
-	if (err)
+	err = tegra_io_pads_dpd_prepare(id, &request, &status, &bit);
+	if (err < 0)
 		goto error;
 
 	mask = 1 << bit;
@@ -919,22 +1045,29 @@ int tegra_io_rail_power_on(unsigned int id)
 	value |= IO_DPD_REQ_CODE_OFF;
 	tegra_pmc_writel(value, request);
 
-	err = tegra_io_rail_poll(status, mask, 0, 250);
-	if (err) {
-		pr_info("tegra_io_rail_poll() failed: %d\n", err);
+	err = tegra_io_pads_dpd_poll(status, mask, 0, 250);
+	if (err < 0) {
+		pr_info("tegra_io_pads_dpd_poll() failed: %d\n", err);
 		goto error;
 	}
 
-	tegra_io_rail_unprepare();
+	tegra_io_pads_dpd_unprepare();
 
 error:
 	mutex_unlock(&pmc->powergates_lock);
 
 	return err;
 }
-EXPORT_SYMBOL(tegra_io_rail_power_on);
+EXPORT_SYMBOL(tegra_io_pads_power_enable);
 
-int tegra_io_rail_power_off(unsigned int id)
+/**
+ * tegra_io_pads_power_disable() - Disable the power to IO pads.
+ * @id: Tegra IO pad ID for which power need to be disable.
+ *
+ * Return 0 if successfully disabled the power of IO pads otherwise
+ * error number in negative.
+ */
+int tegra_io_pads_power_disable(enum tegra_io_pads id)
 {
 	unsigned long request, status;
 	unsigned int bit;
@@ -943,9 +1076,9 @@ int tegra_io_rail_power_off(unsigned int id)
 
 	mutex_lock(&pmc->powergates_lock);
 
-	err = tegra_io_rail_prepare(id, &request, &status, &bit);
-	if (err) {
-		pr_info("tegra_io_rail_prepare() failed: %d\n", err);
+	err = tegra_io_pads_dpd_prepare(id, &request, &status, &bit);
+	if (err < 0) {
+		pr_info("tegra_io_pads_dpd_prepare() failed: %d\n", err);
 		goto error;
 	}
 
@@ -957,18 +1090,103 @@ int tegra_io_rail_power_off(unsigned int id)
 	value |= IO_DPD_REQ_CODE_ON;
 	tegra_pmc_writel(value, request);
 
-	err = tegra_io_rail_poll(status, mask, mask, 250);
-	if (err)
+	err = tegra_io_pads_dpd_poll(status, mask, mask, 250);
+	if (err < 0)
 		goto error;
 
-	tegra_io_rail_unprepare();
+	tegra_io_pads_dpd_unprepare();
 
 error:
 	mutex_unlock(&pmc->powergates_lock);
 
 	return err;
 }
-EXPORT_SYMBOL(tegra_io_rail_power_off);
+EXPORT_SYMBOL(tegra_io_pads_power_disable);
+
+/**
+ * tegra_io_pads_power_is_enabled() - Get power status of the IO pad power.
+ * @id: Tegra IO pad ID.
+ *
+ * Returns:
+ *	0 if power is disabled.
+ *	1 if power is enabled.
+ *	Error number in negative if IO pad not supported.
+ */
+int tegra_io_pads_power_is_enabled(enum tegra_io_pads id)
+{
+	unsigned long status_reg;
+	u32 status;
+	int bit;
+
+	bit = tegra_io_pads_to_dpd_bit(pmc->soc, id);
+	if (bit < 0)
+		return bit;
+
+	status_reg = (bit < 32) ? IO_DPD_STATUS : IO_DPD2_STATUS;
+	status = tegra_pmc_readl(status_reg);
+
+	return !!(status & BIT(bit % 32));
+}
+EXPORT_SYMBOL(tegra_io_pads_power_is_enabled);
+
+/**
+ * tegra_io_pads_set_voltage_config() - Configure the IO pad voltage.
+ * @id:	     Tegra IO pad ID.
+ * @rail_uv: IO Rail voltage which need to be configure.
+ *
+ * Return 0 if successfully configured the voltage of IO pads.
+ * Otherwise returns negative error number.
+ */
+int tegra_io_pads_set_voltage_config(enum tegra_io_pads id,
+				     enum tegra_io_pads_vconf_voltage rail_uv)
+{
+	int bit;
+	u32 mask;
+	u32 bval;
+
+	bit = tegra_io_pads_to_voltage_bit(pmc->soc, id);
+	if (bit < 0)
+		return bit;
+
+	mask = BIT(bit);
+	bval = (rail_uv == TEGRA_IO_PADS_VCONF_3300000UV) ? mask : 0;
+
+	mutex_lock(&pmc->powergates_lock);
+	tegra_pmc_rmw(PMC_PWR_DET, mask, mask);
+	tegra_pmc_rmw(PMC_PWR_DET_VAL, mask, bval);
+	mutex_unlock(&pmc->powergates_lock);
+
+	usleep_range(100, 250);
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_io_pads_set_voltage_config);
+
+/**
+ * tegra_io_pads_get_voltage_config() - Get configured IO pad voltage.
+ * @id: Tegra IO pad ID.
+ *
+ * Returns:
+ *	0 if IO pad power is 1.8V
+ *	1 if IO pad power is 3.3V.
+ *	Error number in negative if voltage config of IO pads not supported
+ *		on given SoC.
+ */
+int tegra_io_pads_get_voltage_config(enum tegra_io_pads id)
+{
+	int bit;
+	u32 val;
+
+	bit = tegra_io_pads_to_voltage_bit(pmc->soc, id);
+	if (bit < 0)
+		return bit;
+
+	val = tegra_pmc_readl(PMC_PWR_DET_VAL);
+
+	return (val & BIT(bit)) ? TEGRA_IO_PADS_VCONF_3300000UV :
+				  TEGRA_IO_PADS_VCONF_1800000UV;
+}
+EXPORT_SYMBOL(tegra_io_pads_get_voltage_config);
 
 #ifdef CONFIG_PM_SLEEP
 enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
@@ -1400,6 +1618,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc = {
 	.powergates = tegra124_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra124_cpu_powergates),
 	.cpu_powergates = tegra124_cpu_powergates,
+	.io_pads_soc_mask = TEGRA_IO_PADS_T124,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
 };
@@ -1443,6 +1662,7 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.powergates = tegra210_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra210_cpu_powergates),
 	.cpu_powergates = tegra210_cpu_powergates,
+	.io_pads_soc_mask = TEGRA_IO_PADS_T210,
 	.has_tsense_reset = true,
 	.has_gpu_clamps = true,
 };
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index e9e5347..7b547bc 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -76,37 +76,71 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
 
 #define TEGRA_POWERGATE_3D0	TEGRA_POWERGATE_3D
 
-#define TEGRA_IO_RAIL_CSIA	0
-#define TEGRA_IO_RAIL_CSIB	1
-#define TEGRA_IO_RAIL_DSI	2
-#define TEGRA_IO_RAIL_MIPI_BIAS	3
-#define TEGRA_IO_RAIL_PEX_BIAS	4
-#define TEGRA_IO_RAIL_PEX_CLK1	5
-#define TEGRA_IO_RAIL_PEX_CLK2	6
-#define TEGRA_IO_RAIL_USB0	9
-#define TEGRA_IO_RAIL_USB1	10
-#define TEGRA_IO_RAIL_USB2	11
-#define TEGRA_IO_RAIL_USB_BIAS	12
-#define TEGRA_IO_RAIL_NAND	13
-#define TEGRA_IO_RAIL_UART	14
-#define TEGRA_IO_RAIL_BB	15
-#define TEGRA_IO_RAIL_AUDIO	17
-#define TEGRA_IO_RAIL_HSIC	19
-#define TEGRA_IO_RAIL_COMP	22
-#define TEGRA_IO_RAIL_HDMI	28
-#define TEGRA_IO_RAIL_PEX_CNTRL	32
-#define TEGRA_IO_RAIL_SDMMC1	33
-#define TEGRA_IO_RAIL_SDMMC3	34
-#define TEGRA_IO_RAIL_SDMMC4	35
-#define TEGRA_IO_RAIL_CAM	36
-#define TEGRA_IO_RAIL_RES	37
-#define TEGRA_IO_RAIL_HV	38
-#define TEGRA_IO_RAIL_DSIB	39
-#define TEGRA_IO_RAIL_DSIC	40
-#define TEGRA_IO_RAIL_DSID	41
-#define TEGRA_IO_RAIL_CSIE	44
-#define TEGRA_IO_RAIL_LVDS	57
-#define TEGRA_IO_RAIL_SYS_DDC	58
+/*
+ * TEGRA_IO_PAD: The IO pins of Tegra SoCs are grouped for common control
+ * of IO interface like setting voltage signal levels, power state of the
+ * interface. The group is generally referred as io-pads. The power and
+ * voltage control of IO pins are available at io-pads level.
+ * The following macros make the super list all IO pads found on Tegra SoC
+ * generations.
+ */
+enum tegra_io_pads {
+	TEGRA_IO_PADS_AUDIO,
+	TEGRA_IO_PADS_AUDIO_HV,
+	TEGRA_IO_PADS_BB,
+	TEGRA_IO_PADS_CAM,
+	TEGRA_IO_PADS_COMP,
+	TEGRA_IO_PADS_CSIA,
+	TEGRA_IO_PADS_CSIB,
+	TEGRA_IO_PADS_CSIC,
+	TEGRA_IO_PADS_CSID,
+	TEGRA_IO_PADS_CSIE,
+	TEGRA_IO_PADS_CSIF,
+	TEGRA_IO_PADS_DBG,
+	TEGRA_IO_PADS_DEBUG_NONAO,
+	TEGRA_IO_PADS_DMIC,
+	TEGRA_IO_PADS_DP,
+	TEGRA_IO_PADS_DSI,
+	TEGRA_IO_PADS_DSIB,
+	TEGRA_IO_PADS_DSIC,
+	TEGRA_IO_PADS_DSID,
+	TEGRA_IO_PADS_EMMC,
+	TEGRA_IO_PADS_EMMC2,
+	TEGRA_IO_PADS_GPIO,
+	TEGRA_IO_PADS_HDMI,
+	TEGRA_IO_PADS_HSIC,
+	TEGRA_IO_PADS_HV,
+	TEGRA_IO_PADS_LVDS,
+	TEGRA_IO_PADS_MIPI_BIAS,
+	TEGRA_IO_PADS_NAND,
+	TEGRA_IO_PADS_PEX_BIAS,
+	TEGRA_IO_PADS_PEX_CLK1,
+	TEGRA_IO_PADS_PEX_CLK2,
+	TEGRA_IO_PADS_PEX_CNTRL,
+	TEGRA_IO_PADS_SDMMC1,
+	TEGRA_IO_PADS_SDMMC3,
+	TEGRA_IO_PADS_SDMMC4,
+	TEGRA_IO_PADS_SPI,
+	TEGRA_IO_PADS_SPI_HV,
+	TEGRA_IO_PADS_SYS_DDC,
+	TEGRA_IO_PADS_UART,
+	TEGRA_IO_PADS_USB0,
+	TEGRA_IO_PADS_USB1,
+	TEGRA_IO_PADS_USB2,
+	TEGRA_IO_PADS_USB3,
+	TEGRA_IO_PADS_USB_BIAS,
+
+	/* Last entry */
+	TEGRA_IO_PADS_MAX,
+};
+
+/* tegra_io_pads_vconf_voltage: The voltage level of IO rails which source
+ *				the IO pads.
+ */
+enum tegra_io_pads_vconf_voltage {
+	TEGRA_IO_PADS_VCONF_1800000UV,
+	TEGRA_IO_PADS_VCONF_3300000UV,
+};
 
 #ifdef CONFIG_ARCH_TEGRA
 int tegra_powergate_is_powered(unsigned int id);
@@ -118,8 +152,16 @@ int tegra_powergate_remove_clamping(unsigned int id);
 int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 				      struct reset_control *rst);
 
-int tegra_io_rail_power_on(unsigned int id);
-int tegra_io_rail_power_off(unsigned int id);
+/* Power enable/disable of the IO pads */
+int tegra_io_pads_power_enable(enum tegra_io_pads id);
+int tegra_io_pads_power_disable(enum tegra_io_pads id);
+int tegra_io_pads_power_is_enabled(enum tegra_io_pads id);
+
+/* Set/get Tegra IO pads voltage config registers */
+int tegra_io_pads_set_voltage_config(enum tegra_io_pads id,
+				     enum tegra_io_pads_vconf_voltage rail_uv);
+int tegra_io_pads_get_voltage_config(enum tegra_io_pads id);
+
 #else
 static inline int tegra_powergate_is_powered(unsigned int id)
 {
@@ -148,14 +190,31 @@ static inline int tegra_powergate_sequence_power_up(unsigned int id,
 	return -ENOSYS;
 }
 
-static inline int tegra_io_rail_power_on(unsigned int id)
+static inline int tegra_io_pads_power_enable(enum tegra_io_pads id)
 {
-	return -ENOSYS;
+	return -ENOTSUPP;
 }
 
-static inline int tegra_io_rail_power_off(unsigned int id)
+static inline int tegra_io_pads_power_disable(enum tegra_io_pads id)
 {
-	return -ENOSYS;
+	return -ENOTSUPP;
+}
+
+static inline int tegra_io_pads_power_is_enabled(enum tegra_io_pads id)
+{
+	return -ENOTSUPP;
+}
+
+static inline int tegra_io_pads_set_voltage_config(
+			enum tegra_io_pads id,
+			enum tegra_io_pads_vconf_voltage rail_uv)
+{
+	return -ENOTSUPP;
+}
+
+static inline int tegra_io_pads_get_voltage_config(enum tegra_io_pads id)
+{
+	return -ENOTSUPP;
 }
 #endif /* CONFIG_ARCH_TEGRA */
 
-- 
2.1.4
