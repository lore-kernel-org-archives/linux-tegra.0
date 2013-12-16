From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Add IO rail support
Date: Mon, 16 Dec 2013 21:42:28 +0100
Message-ID: <1387226548-11631-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add tegra_io_rail_power_off() and tegra_io_rail_power_on() functions to
put IO rails into or out of deep powerdown mode, respectively.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/powergate.c | 132 ++++++++++++++++++++++++++++++++++++++++
 include/linux/tegra-powergate.h |  45 ++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
index 0026fb6c984b..3d0c537d9b94 100644
--- a/arch/arm/mach-tegra/powergate.c
+++ b/arch/arm/mach-tegra/powergate.c
@@ -34,6 +34,10 @@
 #include "fuse.h"
 #include "iomap.h"
 
+#define DPD_SAMPLE		0x020
+#define  DPD_SAMPLE_ENABLE	(1 << 0)
+#define  DPD_SAMPLE_DISABLE	(0 << 0)
+
 #define PWRGATE_TOGGLE		0x30
 #define  PWRGATE_TOGGLE_START	(1 << 8)
 
@@ -41,6 +45,17 @@
 
 #define PWRGATE_STATUS		0x38
 
+#define IO_DPD_REQ		0x1b8
+#define  IO_DPD_REQ_CODE_IDLE	(0 << 30)
+#define  IO_DPD_REQ_CODE_OFF	(1 << 30)
+#define  IO_DPD_REQ_CODE_ON	(2 << 30)
+#define  IO_DPD_REQ_CODE_MASK	(3 << 30)
+
+#define IO_DPD_STATUS		0x1bc
+#define IO_DPD2_REQ		0x1c0
+#define IO_DPD2_STATUS		0x1c4
+#define SEL_DPD_TIM		0x1c8
+
 #define GPU_RG_CNTRL		0x2d4
 
 static int tegra_num_powerdomains;
@@ -379,3 +394,120 @@ int __init tegra_powergate_debugfs_init(void)
 }
 
 #endif
+
+static int tegra_io_rail_prepare(int id, unsigned long *request,
+				 unsigned long *status, unsigned int *bit)
+{
+	unsigned long rate, value;
+	struct clk *clk;
+
+	*bit = id % 32;
+
+	/*
+	 * There are two sets of 30 bits to select IO rails, but bits 30 and
+	 * 31 are control bits rather than IO rail selection bits.
+	 */
+	if (id > 63 || *bit == 30 || *bit == 31)
+		return -EINVAL;
+
+	if (id < 32) {
+		*status = IO_DPD_STATUS;
+		*request = IO_DPD_REQ;
+	} else {
+		*status = IO_DPD2_STATUS;
+		*request = IO_DPD2_REQ;
+	}
+
+	clk = clk_get_sys(NULL, "pclk");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	rate = clk_get_rate(clk);
+	clk_put(clk);
+
+	pmc_write(DPD_SAMPLE_ENABLE, DPD_SAMPLE);
+
+	/* must be at least 200 ns, in APB (PCLK) clock cycles */
+	value = DIV_ROUND_UP(1000000000, rate);
+	value = DIV_ROUND_UP(200, value);
+	pmc_write(value, SEL_DPD_TIM);
+
+	return 0;
+}
+
+static int tegra_io_rail_poll(unsigned long offset, unsigned long mask,
+			      unsigned long val, unsigned long timeout)
+{
+	unsigned long value;
+
+	timeout = jiffies + msecs_to_jiffies(timeout);
+
+	while (time_after(timeout, jiffies)) {
+		value = pmc_read(offset);
+		if ((value & mask) == val)
+			return 0;
+
+		usleep_range(250, 1000);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static void tegra_io_rail_unprepare(void)
+{
+	pmc_write(DPD_SAMPLE_DISABLE, DPD_SAMPLE);
+}
+
+int tegra_io_rail_power_on(int id)
+{
+	unsigned long request, status, value;
+	unsigned int bit, mask;
+	int err;
+
+	err = tegra_io_rail_prepare(id, &request, &status, &bit);
+	if (err < 0)
+		return err;
+
+	mask = 1 << bit;
+
+	value = pmc_read(request);
+	value |= mask;
+	value &= ~IO_DPD_REQ_CODE_MASK;
+	value |= IO_DPD_REQ_CODE_OFF;
+	pmc_write(value, request);
+
+	err = tegra_io_rail_poll(status, mask, 0, 250);
+	if (err < 0)
+		return err;
+
+	tegra_io_rail_unprepare();
+
+	return 0;
+}
+
+int tegra_io_rail_power_off(int id)
+{
+	unsigned long request, status, value;
+	unsigned int bit, mask;
+	int err;
+
+	err = tegra_io_rail_prepare(id, &request, &status, &bit);
+	if (err < 0)
+		return err;
+
+	mask = 1 << bit;
+
+	value = pmc_read(request);
+	value |= mask;
+	value &= ~IO_DPD_REQ_CODE_MASK;
+	value |= IO_DPD_REQ_CODE_ON;
+	pmc_write(value, request);
+
+	err = tegra_io_rail_poll(status, mask, mask, 250);
+	if (err < 0)
+		return err;
+
+	tegra_io_rail_unprepare();
+
+	return 0;
+}
diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-powergate.h
index bccad3cfff87..e6f2ab3014a7 100644
--- a/include/linux/tegra-powergate.h
+++ b/include/linux/tegra-powergate.h
@@ -49,6 +49,38 @@ struct reset_control;
 
 #define TEGRA_POWERGATE_3D0	TEGRA_POWERGATE_3D
 
+#define TEGRA_IO_RAIL_CSIA	0
+#define TEGRA_IO_RAIL_CSIB	1
+#define TEGRA_IO_RAIL_DSI	2
+#define TEGRA_IO_RAIL_MIPI_BIAS	3
+#define TEGRA_IO_RAIL_PEX_BIAS	4
+#define TEGRA_IO_RAIL_PEX_CLK1	5
+#define TEGRA_IO_RAIL_PEX_CLK2	6
+#define TEGRA_IO_RAIL_USB0	9
+#define TEGRA_IO_RAIL_USB1	10
+#define TEGRA_IO_RAIL_USB2	11
+#define TEGRA_IO_RAIL_USB_BIAS	12
+#define TEGRA_IO_RAIL_NAND	13
+#define TEGRA_IO_RAIL_UART	14
+#define TEGRA_IO_RAIL_BB	15
+#define TEGRA_IO_RAIL_AUDIO	17
+#define TEGRA_IO_RAIL_HSIC	19
+#define TEGRA_IO_RAIL_COMP	22
+#define TEGRA_IO_RAIL_HDMI	28
+#define TEGRA_IO_RAIL_PEX_CNTRL	32
+#define TEGRA_IO_RAIL_SDMMC1	33
+#define TEGRA_IO_RAIL_SDMMC3	34
+#define TEGRA_IO_RAIL_SDMMC4	35
+#define TEGRA_IO_RAIL_CAM	36
+#define TEGRA_IO_RAIL_RES	37
+#define TEGRA_IO_RAIL_HV	38
+#define TEGRA_IO_RAIL_DSIB	39
+#define TEGRA_IO_RAIL_DSIC	40
+#define TEGRA_IO_RAIL_DSID	41
+#define TEGRA_IO_RAIL_CSIE	44
+#define TEGRA_IO_RAIL_LVDS	57
+#define TEGRA_IO_RAIL_SYS_DDC	58
+
 #ifdef CONFIG_ARCH_TEGRA
 int tegra_powergate_is_powered(int id);
 int tegra_powergate_power_on(int id);
@@ -58,6 +90,9 @@ int tegra_powergate_remove_clamping(int id);
 /* Must be called with clk disabled, and returns with clk enabled */
 int tegra_powergate_sequence_power_up(int id, struct clk *clk,
 				      struct reset_control *rst);
+
+int tegra_io_rail_power_on(int id);
+int tegra_io_rail_power_off(int id);
 #else
 static inline int tegra_powergate_is_powered(int id)
 {
@@ -84,6 +119,16 @@ static inline int tegra_powergate_sequence_power_up(int id, struct clk *clk,
 {
 	return -ENOSYS;
 }
+
+static inline int tegra_io_rail_power_on(int id)
+{
+	return -ENOSYS;
+}
+
+static inline int tegra_io_rail_power_off(int id)
+{
+	return -ENOSYS;
+}
 #endif
 
 #endif /* _MACH_TEGRA_POWERGATE_H_ */
-- 
1.8.4.2
