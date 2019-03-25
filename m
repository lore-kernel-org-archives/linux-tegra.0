From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 3/8] memory: tegra: Add Tegra210 EMC clock driver
Date: Mon, 25 Mar 2019 15:45:18 +0800
Message-ID: <20190325074523.26456-4-josephl@nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325074523.26456-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob
 Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This is the initial patch for Tegra210 EMC clock driver, which doesn't
include the support code and detail sequence for clock scaling yet.

The driver is designed to support LPDDR4 SDRAMs. Because of the LPDDR4
devices need to do initial time training before it can be used, the
firmware will help to do that at early boot stage. The trained table for
the rates that we will support in the kernel will be merged to the
kernel DTB. So the driver can get the trained table for clock scaling
support.

For the higher rate support (above 800MHz), the periodic training is
needed for the timing compensation. So basically, two methodologies for
clock scaling support, one is following the clock changing sequence to
update the EMC table to EMC registers and another is if the rate needs
periodic training, then we will start a timer to do that periodically
until it leaves the rate that doesn't need that.

Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/memory/tegra/Kconfig             |   10 +
 drivers/memory/tegra/Makefile            |    1 +
 drivers/memory/tegra/tegra210-dt-parse.c |  340 +++++++
 drivers/memory/tegra/tegra210-emc-reg.h  | 1083 ++++++++++++++++++++++
 drivers/memory/tegra/tegra210-emc.c      |  886 ++++++++++++++++++
 5 files changed, 2320 insertions(+)
 create mode 100644 drivers/memory/tegra/tegra210-dt-parse.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-reg.h
 create mode 100644 drivers/memory/tegra/tegra210-emc.c

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 34e0b70f5c5f..614e9b370183 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -25,3 +25,13 @@ config TEGRA124_EMC
 	  Tegra124 chips. The EMC controls the external DRAM on the board.
 	  This driver is required to change memory timings / clock rate for
 	  external memory.
+
+config TEGRA210_EMC
+	bool "NVIDIA Tegra210 External Memory Controller driver"
+	default y
+	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
+	help
+	  This driver is for the External Memory Controller (EMC) found on
+	  Tegra210 chips. The EMC controls the external DRAM on the board.
+	  This driver is required to change memory timings / clock rate for
+	  external memory.
diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 3971a6b7c487..36a835620bbd 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -12,4 +12,5 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
 obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
 obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
+obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o tegra210-dt-parse.o
 obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
diff --git a/drivers/memory/tegra/tegra210-dt-parse.c b/drivers/memory/tegra/tegra210-dt-parse.c
new file mode 100644
index 000000000000..6a3a3a28ac64
--- /dev/null
+++ b/drivers/memory/tegra/tegra210-dt-parse.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2013-2019, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <soc/tegra/fuse.h>
+
+#include "tegra210-emc-reg.h"
+
+static struct device_node *tegra_emc_ramcode_devnode(
+	struct device_node *np)
+{
+	struct device_node *iter;
+	u32 reg;
+
+	for_each_child_of_node(np, iter) {
+		if (of_property_read_u32(iter, "nvidia,ram-code", &reg))
+			continue;
+		if (reg == tegra_read_ram_code())
+			return of_node_get(iter);
+	}
+
+	return NULL;
+}
+
+static void *tegra_emc_dt_parse_pdata_comp(const char *emc_mode,
+					   const char *comp,
+					   void *pdata,
+					   struct device_node *tnp,
+					   struct platform_device *pdev,
+					   int num_tables, int *table_count)
+{
+#define PNE_U32(node, entry, tbl_entry)					\
+	do {								\
+		int __ret__;						\
+		u32 __tmp__;						\
+									\
+		__ret__ = of_property_read_u32((node), (entry), &__tmp__); \
+		if (__ret__) {						\
+			dev_err(&pdev->dev, "Failed to parse %s in %s: %d\n", \
+				(entry), (node)->full_name, __ret__);	\
+			continue;					\
+		}							\
+									\
+		tables[i].tbl_entry = __tmp__;				\
+	} while (0)
+
+#define PNE_U32_ARRAY(node, entry, tbl_entry, length)			\
+	do {								\
+		int __ret__;						\
+									\
+		__ret__ = of_property_read_u32_array((node), (entry),	\
+						     (tbl_entry), (length)); \
+		if (__ret__) {						\
+			dev_err(&pdev->dev, "Failed to parse %s in %s: %d\n", \
+				(entry), (node)->full_name, __ret__);	\
+			continue;					\
+		}							\
+	} while (0)
+
+	int i = 0, ret = 0;
+	struct device_node *iter;
+	struct emc_table *tables;
+
+	tables = devm_kzalloc(&pdev->dev, sizeof(*tables) * num_tables,
+			      GFP_KERNEL);
+
+	if (!tables) {
+		of_node_put(tnp);
+		return tables;
+	}
+
+	for_each_child_of_node(tnp, iter) {
+		if (of_device_is_compatible(iter, comp)) {
+			const char *source_name;
+			const char *dvfs_ver;
+
+			ret = of_property_read_string(iter, "nvidia,source",
+						      &source_name);
+			if (ret) {
+				dev_err(&pdev->dev, "no source name in %s\n",
+					iter->full_name);
+				continue;
+			}
+			strlcpy(tables[i].clock_src, source_name,
+				sizeof(tables[i].clock_src));
+
+			ret = of_property_read_string(iter,
+						      "nvidia,dvfs-version",
+						      &dvfs_ver);
+			if (ret) {
+				dev_err(&pdev->dev, "no dvfs version in %s\n",
+					iter->full_name);
+				continue;
+			}
+			strlcpy(tables[i].dvfs_ver, dvfs_ver,
+				sizeof(tables[i].dvfs_ver));
+
+			PNE_U32(iter, "nvidia,revision", rev);
+			PNE_U32(iter, "clock-frequency", rate);
+			PNE_U32(iter, "nvidia,emc-min-mv", min_volt);
+			PNE_U32(iter, "nvidia,gk20a-min-mv", gpu_min_volt);
+			PNE_U32(iter, "nvidia,src-sel-reg", clk_src_emc);
+			PNE_U32(iter, "nvidia,burst-regs-num", num_burst);
+			PNE_U32(iter, "nvidia,emc-cfg-2", emc_cfg_2);
+			PNE_U32(iter, "nvidia,emc-sel-dpd-ctrl",
+				emc_sel_dpd_ctrl);
+			PNE_U32(iter, "nvidia,emc-auto-cal-config",
+				emc_auto_cal_config);
+			PNE_U32(iter, "nvidia,emc-auto-cal-config2",
+				emc_auto_cal_config2);
+			PNE_U32(iter, "nvidia,emc-auto-cal-config3",
+				emc_auto_cal_config3);
+			PNE_U32(iter, "nvidia,emc-clock-latency-change",
+				latency);
+			PNE_U32_ARRAY(iter, "nvidia,emc-registers",
+				      tables[i].burst_regs,
+				      tables[i].num_burst);
+
+			PNE_U32(iter, "nvidia,needs-training", needs_training);
+			PNE_U32(iter, "nvidia,trained", trained);
+			if (tables[i].rev < 0x6)
+				goto skip_periodic_training_params;
+			PNE_U32(iter, "nvidia,periodic_training",
+				periodic_training);
+			PNE_U32(iter, "nvidia,trained_dram_clktree_c0d0u0",
+				trained_dram_clktree_c0d0u0);
+			PNE_U32(iter, "nvidia,trained_dram_clktree_c0d0u1",
+				trained_dram_clktree_c0d0u1);
+			PNE_U32(iter, "nvidia,trained_dram_clktree_c0d1u0",
+				trained_dram_clktree_c0d1u0);
+			PNE_U32(iter, "nvidia,trained_dram_clktree_c0d1u1",
+				trained_dram_clktree_c0d1u1);
+			PNE_U32(iter, "nvidia,trained_dram_clktree_c1d0u0",
+				trained_dram_clktree_c1d0u0);
+			PNE_U32(iter, "nvidia,trained_dram_clktree_c1d0u1",
+				trained_dram_clktree_c1d0u1);
+			PNE_U32(iter, "nvidia,trained_dram_clktree_c1d1u0",
+				trained_dram_clktree_c1d1u0);
+			PNE_U32(iter, "nvidia,trained_dram_clktree_c1d1u1",
+				trained_dram_clktree_c1d1u1);
+			PNE_U32(iter, "nvidia,current_dram_clktree_c0d0u0",
+				current_dram_clktree_c0d0u0);
+			PNE_U32(iter, "nvidia,current_dram_clktree_c0d0u1",
+				current_dram_clktree_c0d0u1);
+			PNE_U32(iter, "nvidia,current_dram_clktree_c0d1u0",
+				current_dram_clktree_c0d1u0);
+			PNE_U32(iter, "nvidia,current_dram_clktree_c0d1u1",
+				current_dram_clktree_c0d1u1);
+			PNE_U32(iter, "nvidia,current_dram_clktree_c1d0u0",
+				current_dram_clktree_c1d0u0);
+			PNE_U32(iter, "nvidia,current_dram_clktree_c1d0u1",
+				current_dram_clktree_c1d0u1);
+			PNE_U32(iter, "nvidia,current_dram_clktree_c1d1u0",
+				current_dram_clktree_c1d1u0);
+			PNE_U32(iter, "nvidia,current_dram_clktree_c1d1u1",
+				current_dram_clktree_c1d1u1);
+			PNE_U32(iter, "nvidia,run_clocks", run_clocks);
+			PNE_U32(iter, "nvidia,tree_margin", tree_margin);
+
+skip_periodic_training_params:
+			PNE_U32(iter, "nvidia,burst-regs-per-ch-num",
+				num_burst_per_ch);
+			PNE_U32(iter, "nvidia,trim-regs-num", num_trim);
+			PNE_U32(iter, "nvidia,trim-regs-per-ch-num",
+				num_trim_per_ch);
+			PNE_U32(iter, "nvidia,burst-mc-regs-num",
+				num_mc_regs);
+			PNE_U32(iter, "nvidia,la-scale-regs-num",
+				num_up_down);
+			PNE_U32(iter, "nvidia,vref-regs-num", vref_num);
+			PNE_U32(iter, "nvidia,dram-timing-regs-num",
+				dram_timing_num);
+			PNE_U32(iter, "nvidia,min-mrs-wait", min_mrs_wait);
+			PNE_U32(iter, "nvidia,emc-mrw", emc_mrw);
+			PNE_U32(iter, "nvidia,emc-mrw2", emc_mrw2);
+			PNE_U32(iter, "nvidia,emc-mrw3", emc_mrw3);
+			PNE_U32(iter, "nvidia,emc-mrw4", emc_mrw4);
+			PNE_U32(iter, "nvidia,emc-mrw9", emc_mrw9);
+			PNE_U32(iter, "nvidia,emc-mrs", emc_mrs);
+			PNE_U32(iter, "nvidia,emc-emrs", emc_emrs);
+			PNE_U32(iter, "nvidia,emc-emrs2", emc_emrs2);
+			PNE_U32(iter, "nvidia,emc-auto-cal-config4",
+				emc_auto_cal_config4);
+			PNE_U32(iter, "nvidia,emc-auto-cal-config5",
+				emc_auto_cal_config5);
+			PNE_U32(iter, "nvidia,emc-auto-cal-config6",
+				emc_auto_cal_config6);
+			PNE_U32(iter, "nvidia,emc-auto-cal-config7",
+				emc_auto_cal_config7);
+			PNE_U32(iter, "nvidia,emc-auto-cal-config8",
+				emc_auto_cal_config8);
+			PNE_U32(iter, "nvidia,emc-fdpd-ctrl-cmd-no-ramp",
+				emc_fdpd_ctrl_cmd_no_ramp);
+			PNE_U32(iter, "nvidia,dll-clk-src", dll_clk_src);
+			PNE_U32(iter, "nvidia,clk-out-enb-x-0-clk-enb-emc-dll",
+				clk_out_enb_x_0_clk_enb_emc_dll);
+
+			if (tables[i].rev >= 0x7)
+				PNE_U32_ARRAY(iter, "nvidia,ptfv",
+					      tables[i].ptfv_list,
+					      sizeof(tables[i].ptfv_list)
+						     / sizeof(u32));
+
+			PNE_U32_ARRAY(iter, "nvidia,emc-burst-regs-per-ch",
+				      tables[i].burst_reg_per_ch,
+				      tables[i].num_burst_per_ch);
+			PNE_U32_ARRAY(iter, "nvidia,emc-shadow-regs-ca-train",
+				      tables[i].shadow_regs_ca_train,
+				      tables[i].num_burst);
+			PNE_U32_ARRAY(iter, "nvidia,emc-shadow-regs-quse-train",
+				      tables[i].shadow_regs_quse_train,
+				      tables[i].num_burst);
+			PNE_U32_ARRAY(iter, "nvidia,emc-shadow-regs-rdwr-train",
+				      tables[i].shadow_regs_rdwr_train,
+				      tables[i].num_burst);
+			PNE_U32_ARRAY(iter, "nvidia,emc-trim-regs",
+				      tables[i].trim_regs,
+				      tables[i].num_trim);
+			PNE_U32_ARRAY(iter, "nvidia,emc-trim-regs-per-ch",
+				      tables[i].trim_perch_regs,
+				      tables[i].num_trim_per_ch);
+			PNE_U32_ARRAY(iter, "nvidia,emc-vref-regs",
+				      tables[i].vref_perch_regs,
+				      tables[i].vref_num);
+			PNE_U32_ARRAY(iter, "nvidia,emc-dram-timing-regs",
+				      tables[i].dram_timings,
+				      tables[i].dram_timing_num);
+			PNE_U32_ARRAY(iter, "nvidia,emc-burst-mc-regs",
+				      tables[i].burst_mc_regs,
+				      tables[i].num_mc_regs);
+			PNE_U32_ARRAY(iter, "nvidia,emc-la-scale-regs",
+				      tables[i].la_scale_regs,
+				      tables[i].num_up_down);
+			i++;
+		}
+	}
+
+	*table_count = i;
+
+	return tables;
+}
+
+static const struct of_device_id emc_table_match[] = {
+	{
+		.compatible = "nvidia,tegra210-emc-table",
+		.data = "nvidia,tegra210-emc-table-derated",
+	},
+	{
+		.compatible = "nvidia,tegra21-emc-table",
+		.data = "nvidia,tegra21-emc-table-derated",
+	},
+	{ },
+};
+
+int tegra_emc_dt_parse_pdata(struct platform_device *pdev,
+			     struct emc_table **tables,
+			     struct emc_table **derated_tables,
+			     int *num_entries)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *tnp, *iter;
+	int num_tables, table_count;
+	u32 tegra_bct_strapping;
+	const char *emc_mode = "nvidia,emc-mode-0";
+	struct tegra21_emc_pdata *pdata = NULL;
+	const char *comp = NULL;
+	const char *comp_derated = NULL;
+
+	if (!np) {
+		dev_err(&pdev->dev,
+			"Unable to find external-memory-controller node\n");
+		return -ENODEV;
+	}
+
+	tegra_bct_strapping = tegra_read_ram_code();
+
+	if (of_find_property(np, "nvidia,use-ram-code", NULL)) {
+		tnp = tegra_emc_ramcode_devnode(np);
+
+		if (!tnp) {
+			dev_warn(&pdev->dev,
+				 "can't find emc table for ram-code 0x%02x\n",
+				 tegra_bct_strapping);
+			return -ENODEV;
+		}
+	} else
+		tnp = of_node_get(np);
+
+	num_tables = 0;
+	for_each_child_of_node(tnp, iter) {
+		if (!comp) {
+			const struct of_device_id *m =
+				of_match_node(emc_table_match, iter);
+			if (m) {
+				comp = m->compatible;
+				comp_derated = m->data;
+				num_tables++;
+			}
+			continue;
+		}
+		if (of_device_is_compatible(iter, comp))
+			num_tables++;
+	}
+
+	if (!num_tables) {
+		*tables = NULL;
+		goto out;
+	}
+
+	*tables = tegra_emc_dt_parse_pdata_comp(emc_mode, comp, pdata, tnp,
+						pdev, num_tables, &table_count);
+	*num_entries = table_count;
+
+	/* populate the derated tables */
+	num_tables = 0;
+	for_each_child_of_node(tnp, iter) {
+		if (of_device_is_compatible(iter, comp_derated))
+			num_tables++;
+	}
+
+	if (!num_tables) {
+		*derated_tables = NULL;
+		goto out;
+	}
+
+	*derated_tables = tegra_emc_dt_parse_pdata_comp(emc_mode,
+							comp_derated,
+							pdata, tnp, pdev,
+							num_tables,
+							&table_count);
+
+out:
+	of_node_put(tnp);
+	return 0;
+}
diff --git a/drivers/memory/tegra/tegra210-emc-reg.h b/drivers/memory/tegra/tegra210-emc-reg.h
new file mode 100644
index 000000000000..84fcc85f3b6d
--- /dev/null
+++ b/drivers/memory/tegra/tegra210-emc-reg.h
@@ -0,0 +1,1083 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#ifndef _TEGRA210_EMC_REG_H
+#define _TEGRA210_EMC_REG_H
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "mc.h"
+
+#define MC_EMEM_ARB_CFG						0x90
+#define MC_EMEM_ARB_OUTSTANDING_REQ				0x94
+#define MC_EMEM_ARB_TIMING_RCD					0x98
+#define MC_EMEM_ARB_TIMING_RP					0x9c
+#define MC_EMEM_ARB_TIMING_RC					0xa0
+#define MC_EMEM_ARB_TIMING_RAS					0xa4
+#define MC_EMEM_ARB_TIMING_FAW					0xa8
+#define MC_EMEM_ARB_TIMING_RRD					0xac
+#define MC_EMEM_ARB_TIMING_RAP2PRE				0xb0
+#define MC_EMEM_ARB_TIMING_WAP2PRE				0xb4
+#define MC_EMEM_ARB_TIMING_R2R					0xb8
+#define MC_EMEM_ARB_TIMING_W2W					0xbc
+#define MC_EMEM_ARB_TIMING_R2W					0xc0
+#define MC_EMEM_ARB_TIMING_W2R					0xc4
+#define MC_EMEM_ARB_MISC2					0xc8
+#define MC_EMEM_ARB_DA_TURNS					0xd0
+#define MC_EMEM_ARB_DA_COVERS					0xd4
+#define MC_EMEM_ARB_MISC0					0xd8
+#define MC_EMEM_ARB_MISC0_EMC_SAME_FREQ				BIT(27)
+#define MC_EMEM_ARB_MISC1					0xdc
+#define MC_EMEM_ARB_RING1_THROTTLE				0xe0
+#define MC_LATENCY_ALLOWANCE_AVPC_0				0x2e4
+#define MC_LATENCY_ALLOWANCE_HC_0				0x310
+#define MC_LATENCY_ALLOWANCE_HC_1				0x314
+#define MC_LATENCY_ALLOWANCE_MPCORE_0				0x320
+#define MC_LATENCY_ALLOWANCE_NVENC_0				0x328
+#define MC_LATENCY_ALLOWANCE_PPCS_0				0x344
+#define MC_LATENCY_ALLOWANCE_PPCS_1				0x348
+#define MC_LATENCY_ALLOWANCE_ISP2_0				0x370
+#define MC_LATENCY_ALLOWANCE_ISP2_1				0x374
+#define MC_LATENCY_ALLOWANCE_XUSB_0				0x37c
+#define MC_LATENCY_ALLOWANCE_XUSB_1				0x380
+#define MC_LATENCY_ALLOWANCE_TSEC_0				0x390
+#define MC_LATENCY_ALLOWANCE_VIC_0				0x394
+#define MC_LATENCY_ALLOWANCE_VI2_0				0x398
+#define MC_LATENCY_ALLOWANCE_GPU_0				0x3ac
+#define MC_LATENCY_ALLOWANCE_SDMMCA_0				0x3b8
+#define MC_LATENCY_ALLOWANCE_SDMMCAA_0				0x3bc
+#define MC_LATENCY_ALLOWANCE_SDMMC_0				0x3c0
+#define MC_LATENCY_ALLOWANCE_SDMMCAB_0				0x3c4
+#define MC_LATENCY_ALLOWANCE_GPU2_0				0x3e8
+#define MC_LATENCY_ALLOWANCE_NVDEC_0				0x3d8
+#define MC_MLL_MPCORER_PTSA_RATE				0x44c
+#define MC_FTOP_PTSA_RATE					0x50c
+#define MC_EMEM_ARB_TIMING_RFCPB				0x6c0
+#define MC_EMEM_ARB_TIMING_CCDMW				0x6c4
+#define MC_EMEM_ARB_REFPB_HP_CTRL				0x6f0
+#define MC_EMEM_ARB_REFPB_BANK_CTRL				0x6f4
+#define MC_PTSA_GRANT_DECREMENT					0x960
+#define MC_EMEM_ARB_DHYST_CTRL					0xbcc
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0			0xbd0
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1			0xbd4
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2			0xbd8
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3			0xbdc
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4			0xbe0
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5			0xbe4
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6			0xbe8
+#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7			0xbec
+
+#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC			0x19c
+#define EMC_CLK_EMC_2X_CLK_SRC_SHIFT				29
+#define EMC_CLK_EMC_2X_CLK_SRC_MASK				\
+	(0x7 << EMC_CLK_EMC_2X_CLK_SRC_SHIFT)
+#define	EMC_CLK_MC_EMC_SAME_FREQ				BIT(16)
+#define EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT			0
+#define EMC_CLK_EMC_2X_CLK_DIVISOR_MASK				\
+	(0xff << EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT)
+
+#define EMC_CFG							0xc
+#define EMC_RC							0x2c
+#define EMC_RFC							0x30
+#define EMC_RAS							0x34
+#define EMC_RP							0x38
+#define EMC_R2W							0x3c
+#define EMC_W2R							0x40
+#define EMC_R2P							0x44
+#define EMC_W2P							0x48
+#define EMC_RD_RCD						0x4c
+#define EMC_WR_RCD						0x50
+#define EMC_RRD							0x54
+#define EMC_REXT						0x58
+#define EMC_WDV							0x5c
+#define EMC_QUSE						0x60
+#define EMC_QRST						0x64
+#define EMC_QSAFE						0x68
+#define EMC_RDV							0x6c
+#define EMC_REFRESH						0x70
+#define EMC_BURST_REFRESH_NUM					0x74
+#define EMC_PDEX2WR						0x78
+#define EMC_PDEX2RD						0x7c
+#define EMC_PCHG2PDEN						0x80
+#define EMC_ACT2PDEN						0x84
+#define EMC_AR2PDEN						0x88
+#define EMC_RW2PDEN						0x8c
+#define EMC_TXSR						0x90
+#define EMC_TCKE						0x94
+#define EMC_TFAW						0x98
+#define EMC_TRPAB						0x9c
+#define EMC_TCLKSTABLE						0xa0
+#define EMC_TCLKSTOP						0xa4
+#define EMC_TREFBW						0xa8
+#define EMC_TPPD						0xac
+#define EMC_ODT_WRITE						0xb0
+#define EMC_PDEX2MRR						0xb4
+#define EMC_WEXT						0xb8
+#define EMC_RFC_SLR						0xc0
+#define EMC_MRS_WAIT_CNT2					0xc4
+#define EMC_MRS_WAIT_CNT					0xc8
+#define EMC_FBIO_SPARE						0x100
+#define EMC_FBIO_CFG5						0x104
+#define EMC_FBIO_CFG5_DRAM_TYPE_SHIFT				0
+#define EMC_FBIO_CFG5_DRAM_TYPE_MASK				\
+	(0x3 <<	EMC_FBIO_CFG5_DRAM_TYPE_SHIFT)
+#define EMC_PDEX2CKE						0x118
+#define EMC_CKE2PDEN						0x11c
+#define EMC_R2R							0x144
+#define EMC_EINPUT						0x14c
+#define EMC_EINPUT_DURATION					0x150
+#define EMC_PUTERM_EXTRA					0x154
+#define EMC_TCKESR						0x158
+#define EMC_TPD							0x15c
+#define EMC_CFG_DIG_DLL						0x2bc
+#define EMC_CFG_DIG_DLL_PERIOD					0x2c0
+#define EMC_RDV_MASK						0x2cc
+#define EMC_WDV_MASK						0x2d0
+#define EMC_RDV_EARLY_MASK					0x2d4
+#define EMC_RDV_EARLY						0x2d8
+#define EMC_ZCAL_INTERVAL					0x2e0
+#define EMC_ZCAL_WAIT_CNT					0x2e4
+#define EMC_FDPD_CTRL_DQ					0x310
+#define EMC_FDPD_CTRL_CMD					0x314
+#define EMC_PMACRO_CMD_BRICK_CTRL_FDPD				0x318
+#define EMC_PMACRO_DATA_BRICK_CTRL_FDPD				0x31c
+#define EMC_PMACRO_BRICK_CTRL_RFU1				0x330
+#define EMC_PMACRO_BRICK_CTRL_RFU2				0x334
+#define EMC_TR_TIMING_0						0x3b4
+#define EMC_TR_CTRL_1						0x3bc
+#define EMC_TR_RDV						0x3c4
+#define EMC_PRE_REFRESH_REQ_CNT					0x3dc
+#define EMC_DYN_SELF_REF_CONTROL				0x3e0
+#define EMC_TXSRDLL						0x3e4
+#define EMC_TR_QPOP						0x3f4
+#define EMC_TR_RDV_MASK						0x3f8
+#define EMC_TR_QSAFE						0x3fc
+#define EMC_TR_QRST						0x400
+#define EMC_TR_DVFS						0x460
+#define EMC_AUTO_CAL_CHANNEL					0x464
+#define EMC_IBDLY						0x468
+#define EMC_OBDLY						0x46c
+#define EMC_TXDSRVTTGEN						0x480
+#define EMC_WE_DURATION						0x48c
+#define EMC_WS_DURATION						0x490
+#define EMC_WEV							0x494
+#define EMC_WSV							0x498
+#define EMC_CFG_3						0x49c
+#define EMC_MRW6						0x4a4
+#define EMC_MRW7						0x4a8
+#define EMC_MRW8						0x4ac
+#define EMC_MRW10						0x4b4
+#define EMC_MRW11						0x4b8
+#define EMC_MRW12						0x4bc
+#define EMC_MRW13						0x4c0
+#define EMC_MRW14						0x4c4
+#define EMC_MRW15						0x4d0
+#define EMC_WDV_CHK						0x4e0
+#define EMC_CFG_PIPE_2						0x554
+#define EMC_CFG_PIPE_1						0x55c
+#define EMC_CFG_PIPE						0x560
+#define EMC_QPOP						0x564
+#define EMC_QUSE_WIDTH						0x568
+#define EMC_PUTERM_WIDTH					0x56c
+#define EMC_REFCTRL2						0x580
+#define EMC_FBIO_CFG7						0x584
+#define EMC_DATA_BRLSHFT_0					0x588
+#define EMC_DATA_BRLSHFT_1					0x58c
+#define EMC_RFCPB						0x590
+#define EMC_DQS_BRLSHFT_0					0x594
+#define EMC_DQS_BRLSHFT_1					0x598
+#define EMC_CMD_BRLSHFT_0					0x59c
+#define EMC_CMD_BRLSHFT_1					0x5a0
+#define EMC_CMD_BRLSHFT_2					0x5a4
+#define EMC_CMD_BRLSHFT_3					0x5a8
+#define EMC_QUSE_BRLSHFT_0					0x5ac
+#define EMC_QUSE_BRLSHFT_1					0x5b8
+#define EMC_QUSE_BRLSHFT_2					0x5bc
+#define EMC_CCDMW						0x5c0
+#define EMC_QUSE_BRLSHFT_3					0x5c4
+#define EMC_DLL_CFG_0						0x5e4
+#define EMC_DLL_CFG_1						0x5e8
+#define EMC_CONFIG_SAMPLE_DELAY					0x5f0
+#define EMC_PMACRO_QUSE_DDLL_RANK0_0				0x600
+#define EMC_PMACRO_QUSE_DDLL_RANK0_1				0x604
+#define EMC_PMACRO_QUSE_DDLL_RANK0_2				0x608
+#define EMC_PMACRO_QUSE_DDLL_RANK0_3				0x60c
+#define EMC_PMACRO_QUSE_DDLL_RANK0_4				0x610
+#define EMC_PMACRO_QUSE_DDLL_RANK0_5				0x614
+#define EMC_PMACRO_QUSE_DDLL_RANK1_0				0x620
+#define EMC_PMACRO_QUSE_DDLL_RANK1_1				0x624
+#define EMC_PMACRO_QUSE_DDLL_RANK1_2				0x628
+#define EMC_PMACRO_QUSE_DDLL_RANK1_3				0x62c
+#define EMC_PMACRO_QUSE_DDLL_RANK1_4				0x630
+#define EMC_PMACRO_QUSE_DDLL_RANK1_5				0x634
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0			0x640
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1			0x644
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2			0x648
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3			0x64c
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4			0x650
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5			0x654
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0			0x660
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1			0x664
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2			0x668
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3			0x66c
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_4			0x670
+#define EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_5			0x674
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_0			0x680
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_1			0x684
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_2			0x688
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_3			0x68c
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_4			0x690
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_5			0x694
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_0			0x6a0
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_1			0x6a4
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_2			0x6a8
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_3			0x6ac
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_4			0x6b0
+#define EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_5			0x6b4
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_0			0x6c0
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_1			0x6c4
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_2			0x6c8
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_3			0x6cc
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_0			0x6e0
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_1			0x6e4
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_2			0x6e8
+#define EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_3			0x6ec
+#define EMC_PMACRO_TX_PWRD_0					0x720
+#define EMC_PMACRO_TX_PWRD_1					0x724
+#define EMC_PMACRO_TX_PWRD_2					0x728
+#define EMC_PMACRO_TX_PWRD_3					0x72c
+#define EMC_PMACRO_TX_PWRD_4					0x730
+#define EMC_PMACRO_TX_PWRD_5					0x734
+#define EMC_PMACRO_TX_SEL_CLK_SRC_0				0x740
+#define EMC_PMACRO_TX_SEL_CLK_SRC_1				0x744
+#define EMC_PMACRO_TX_SEL_CLK_SRC_3				0x74c
+#define EMC_PMACRO_TX_SEL_CLK_SRC_2				0x748
+#define EMC_PMACRO_TX_SEL_CLK_SRC_4				0x750
+#define EMC_PMACRO_TX_SEL_CLK_SRC_5				0x754
+#define EMC_PMACRO_DDLL_BYPASS					0x760
+#define EMC_PMACRO_DDLL_PWRD_0					0x770
+#define EMC_PMACRO_DDLL_PWRD_1					0x774
+#define EMC_PMACRO_DDLL_PWRD_2					0x778
+#define EMC_PMACRO_CMD_CTRL_0					0x780
+#define EMC_PMACRO_CMD_CTRL_1					0x784
+#define EMC_PMACRO_CMD_CTRL_2					0x788
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_0		0x800
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_1		0x804
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_2		0x808
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_3		0x80c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_0		0x810
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_1		0x814
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_2		0x818
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_3		0x81c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_0		0x820
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_1		0x824
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_2		0x828
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_3		0x82c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_0		0x830
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_1		0x834
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_2		0x838
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_3		0x83c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_0		0x840
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_1		0x844
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_2		0x848
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_3		0x84c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_0		0x850
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_1		0x854
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_2		0x858
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_3		0x85c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_0		0x860
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_1		0x864
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_2		0x868
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_3		0x86c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_0		0x870
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_1		0x874
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_2		0x878
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_3		0x87c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_0		0x880
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_1		0x884
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_2		0x888
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_3		0x88c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_0		0x890
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_1		0x894
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_2		0x898
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_3		0x89c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_0		0x8a0
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_1		0x8a4
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_2		0x8a8
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_3		0x8ac
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_0		0x8b0
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_1		0x8b4
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_2		0x8b8
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_3		0x8bc
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_0		0x900
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_1		0x904
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_2		0x908
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_3		0x90c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_0		0x910
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_1		0x914
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_2		0x918
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_3		0x91c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_0		0x920
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_1		0x924
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_2		0x928
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_3		0x92c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_0		0x930
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_1		0x934
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_2		0x938
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_3		0x93c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_0		0x940
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_1		0x944
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_2		0x948
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_3		0x94c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_0		0x950
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_1		0x954
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_2		0x958
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_3		0x95c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_0		0x960
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_1		0x964
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_2		0x968
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_3		0x96c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_0		0x970
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_1		0x974
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_2		0x978
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_3		0x97c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_0		0x980
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_1		0x984
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_2		0x988
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_3		0x98c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_0		0x990
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_1		0x994
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_2		0x998
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_3		0x99c
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_0		0x9a0
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_1		0x9a4
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_2		0x9a8
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_3		0x9ac
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_0		0x9b0
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_1		0x9b4
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_2		0x9b8
+#define EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_3		0x9bc
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_0		0xa00
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_1		0xa04
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_2		0xa08
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_0		0xa10
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_1		0xa14
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_2		0xa18
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_0		0xa20
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_1		0xa24
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_2		0xa28
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_0		0xa30
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_1		0xa34
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_2		0xa38
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_0		0xa40
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_1		0xa44
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_2		0xa48
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_0		0xa50
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_1		0xa54
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_2		0xa58
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_0		0xa60
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_1		0xa64
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_2		0xa68
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_0		0xa70
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_1		0xa74
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_2		0xa78
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_0		0xb00
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_1		0xb04
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_2		0xb08
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_0		0xb10
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_1		0xb14
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_2		0xb18
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_0		0xb20
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_1		0xb24
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_2		0xb28
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_0		0xb30
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_1		0xb34
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_2		0xb38
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_0		0xb40
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_1		0xb44
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_2		0xb48
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_0		0xb50
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_1		0xb54
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_2		0xb58
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_0		0xb60
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_1		0xb64
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_2		0xb68
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_0		0xb70
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_1		0xb74
+#define EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_2		0xb78
+#define EMC_PMACRO_IB_VREF_DQ_0					0xbe0
+#define EMC_PMACRO_IB_VREF_DQ_1					0xbe4
+#define EMC_PMACRO_IB_VREF_DQS_0				0xbf0
+#define EMC_PMACRO_IB_VREF_DQS_1				0xbf4
+#define EMC_PMACRO_DDLL_LONG_CMD_0				0xc00
+#define EMC_PMACRO_DDLL_LONG_CMD_1				0xc04
+#define EMC_PMACRO_DDLL_LONG_CMD_2				0xc08
+#define EMC_PMACRO_DDLL_LONG_CMD_3				0xc0c
+#define EMC_PMACRO_DDLL_LONG_CMD_4				0xc10
+#define EMC_PMACRO_DDLL_LONG_CMD_5				0xc14
+#define EMC_PMACRO_DDLL_SHORT_CMD_0				0xc20
+#define EMC_PMACRO_DDLL_SHORT_CMD_1				0xc24
+#define EMC_PMACRO_DDLL_SHORT_CMD_2				0xc28
+#define EMC_PMACRO_VTTGEN_CTRL_0				0xc34
+#define EMC_PMACRO_VTTGEN_CTRL_1				0xc38
+#define EMC_PMACRO_BG_BIAS_CTRL_0				0xc3c
+#define EMC_PMACRO_PAD_CFG_CTRL					0xc40
+#define EMC_PMACRO_ZCTRL					0xc44
+#define EMC_PMACRO_CMD_PAD_RX_CTRL				0xc50
+#define EMC_PMACRO_DATA_PAD_RX_CTRL				0xc54
+#define EMC_PMACRO_CMD_RX_TERM_MODE				0xc58
+#define EMC_PMACRO_DATA_RX_TERM_MODE				0xc5c
+#define EMC_PMACRO_CMD_PAD_TX_CTRL				0xc60
+#define EMC_PMACRO_DATA_PAD_TX_CTRL				0xc64
+#define EMC_PMACRO_COMMON_PAD_TX_CTRL				0xc68
+#define EMC_PMACRO_AUTOCAL_CFG_COMMON				0xc78
+#define EMC_PMACRO_VTTGEN_CTRL_2				0xcf0
+#define EMC_PMACRO_IB_RXRT					0xcf4
+#define EMC_TRAINING_CTRL					0xe04
+#define EMC_TRAINING_QUSE_CORS_CTRL				0xe0c
+#define EMC_TRAINING_QUSE_FINE_CTRL				0xe10
+#define EMC_TRAINING_QUSE_CTRL_MISC				0xe14
+#define EMC_TRAINING_WRITE_FINE_CTRL				0xe18
+#define EMC_TRAINING_WRITE_CTRL_MISC				0xe1c
+#define EMC_TRAINING_WRITE_VREF_CTRL				0xe20
+#define EMC_TRAINING_READ_FINE_CTRL				0xe24
+#define EMC_TRAINING_READ_CTRL_MISC				0xe28
+#define EMC_TRAINING_READ_VREF_CTRL				0xe2c
+#define EMC_TRAINING_CA_FINE_CTRL				0xe30
+#define EMC_TRAINING_CA_CTRL_MISC				0xe34
+#define EMC_TRAINING_CA_CTRL_MISC1				0xe38
+#define EMC_TRAINING_CA_VREF_CTRL				0xe3c
+#define EMC_TRAINING_SETTLE					0xe44
+#define EMC_TRAINING_MPC					0xe5c
+#define EMC_TRAINING_VREF_SETTLE				0xe6c
+#define EMC_TRAINING_QUSE_VREF_CTRL				0xed0
+#define EMC_TRAINING_OPT_DQS_IB_VREF_RANK0			0xed4
+#define EMC_TRAINING_OPT_DQS_IB_VREF_RANK1			0xed8
+
+#define EMC_COPY_TABLE_PARAM_PERIODIC_FIELDS			BIT(0)
+#define EMC_COPY_TABLE_PARAM_TRIM_REGS				BIT(1)
+
+enum {
+	REG_MC,
+	REG_EMC,
+	REG_EMC0,
+	REG_EMC1,
+};
+
+#define BURST_REGS_PER_CH_LIST						\
+{									\
+	DEFINE_REG(REG_EMC0, EMC_MRW10),				\
+	DEFINE_REG(REG_EMC1, EMC_MRW10),				\
+	DEFINE_REG(REG_EMC0, EMC_MRW11),				\
+	DEFINE_REG(REG_EMC1, EMC_MRW11),				\
+	DEFINE_REG(REG_EMC0, EMC_MRW12),				\
+	DEFINE_REG(REG_EMC1, EMC_MRW12),				\
+	DEFINE_REG(REG_EMC0, EMC_MRW13),				\
+	DEFINE_REG(REG_EMC1, EMC_MRW13),				\
+}
+
+#define BURST_REGS_LIST							\
+{									\
+	DEFINE_REG(REG_EMC, EMC_RC),					\
+	DEFINE_REG(REG_EMC, EMC_RFC),					\
+	DEFINE_REG(REG_EMC, EMC_RFCPB),					\
+	DEFINE_REG(REG_EMC, EMC_REFCTRL2),				\
+	DEFINE_REG(REG_EMC, EMC_RFC_SLR),				\
+	DEFINE_REG(REG_EMC, EMC_RAS),					\
+	DEFINE_REG(REG_EMC, EMC_RP),					\
+	DEFINE_REG(REG_EMC, EMC_R2W),					\
+	DEFINE_REG(REG_EMC, EMC_W2R),					\
+	DEFINE_REG(REG_EMC, EMC_R2P),					\
+	DEFINE_REG(REG_EMC, EMC_W2P),					\
+	DEFINE_REG(REG_EMC, EMC_R2R),					\
+	DEFINE_REG(REG_EMC, EMC_TPPD),					\
+	DEFINE_REG(REG_EMC, EMC_CCDMW),					\
+	DEFINE_REG(REG_EMC, EMC_RD_RCD),				\
+	DEFINE_REG(REG_EMC, EMC_WR_RCD),				\
+	DEFINE_REG(REG_EMC, EMC_RRD),					\
+	DEFINE_REG(REG_EMC, EMC_REXT),					\
+	DEFINE_REG(REG_EMC, EMC_WEXT),					\
+	DEFINE_REG(REG_EMC, EMC_WDV_CHK),				\
+	DEFINE_REG(REG_EMC, EMC_WDV),					\
+	DEFINE_REG(REG_EMC, EMC_WSV),					\
+	DEFINE_REG(REG_EMC, EMC_WEV),					\
+	DEFINE_REG(REG_EMC, EMC_WDV_MASK),				\
+	DEFINE_REG(REG_EMC, EMC_WS_DURATION),				\
+	DEFINE_REG(REG_EMC, EMC_WE_DURATION),				\
+	DEFINE_REG(REG_EMC, EMC_QUSE),					\
+	DEFINE_REG(REG_EMC, EMC_QUSE_WIDTH),				\
+	DEFINE_REG(REG_EMC, EMC_IBDLY),					\
+	DEFINE_REG(REG_EMC, EMC_OBDLY),					\
+	DEFINE_REG(REG_EMC, EMC_EINPUT),				\
+	DEFINE_REG(REG_EMC, EMC_MRW6),					\
+	DEFINE_REG(REG_EMC, EMC_EINPUT_DURATION),			\
+	DEFINE_REG(REG_EMC, EMC_PUTERM_EXTRA),				\
+	DEFINE_REG(REG_EMC, EMC_PUTERM_WIDTH),				\
+	DEFINE_REG(REG_EMC, EMC_QRST),					\
+	DEFINE_REG(REG_EMC, EMC_QSAFE),					\
+	DEFINE_REG(REG_EMC, EMC_RDV),					\
+	DEFINE_REG(REG_EMC, EMC_RDV_MASK),				\
+	DEFINE_REG(REG_EMC, EMC_RDV_EARLY),				\
+	DEFINE_REG(REG_EMC, EMC_RDV_EARLY_MASK),			\
+	DEFINE_REG(REG_EMC, EMC_REFRESH),				\
+	DEFINE_REG(REG_EMC, EMC_BURST_REFRESH_NUM),			\
+	DEFINE_REG(REG_EMC, EMC_PRE_REFRESH_REQ_CNT),			\
+	DEFINE_REG(REG_EMC, EMC_PDEX2WR),				\
+	DEFINE_REG(REG_EMC, EMC_PDEX2RD),				\
+	DEFINE_REG(REG_EMC, EMC_PCHG2PDEN),				\
+	DEFINE_REG(REG_EMC, EMC_ACT2PDEN),				\
+	DEFINE_REG(REG_EMC, EMC_AR2PDEN),				\
+	DEFINE_REG(REG_EMC, EMC_RW2PDEN),				\
+	DEFINE_REG(REG_EMC, EMC_CKE2PDEN),				\
+	DEFINE_REG(REG_EMC, EMC_PDEX2CKE),				\
+	DEFINE_REG(REG_EMC, EMC_PDEX2MRR),				\
+	DEFINE_REG(REG_EMC, EMC_TXSR),					\
+	DEFINE_REG(REG_EMC, EMC_TXSRDLL),				\
+	DEFINE_REG(REG_EMC, EMC_TCKE),					\
+	DEFINE_REG(REG_EMC, EMC_TCKESR),				\
+	DEFINE_REG(REG_EMC, EMC_TPD),					\
+	DEFINE_REG(REG_EMC, EMC_TFAW),					\
+	DEFINE_REG(REG_EMC, EMC_TRPAB),					\
+	DEFINE_REG(REG_EMC, EMC_TCLKSTABLE),				\
+	DEFINE_REG(REG_EMC, EMC_TCLKSTOP),				\
+	DEFINE_REG(REG_EMC, EMC_MRW7),					\
+	DEFINE_REG(REG_EMC, EMC_TREFBW),				\
+	DEFINE_REG(REG_EMC, EMC_ODT_WRITE),				\
+	DEFINE_REG(REG_EMC, EMC_FBIO_CFG5),				\
+	DEFINE_REG(REG_EMC, EMC_FBIO_CFG7),				\
+	DEFINE_REG(REG_EMC, EMC_CFG_DIG_DLL),				\
+	DEFINE_REG(REG_EMC, EMC_CFG_DIG_DLL_PERIOD),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_RXRT),			\
+	DEFINE_REG(REG_EMC, EMC_CFG_PIPE_1),				\
+	DEFINE_REG(REG_EMC, EMC_CFG_PIPE_2),				\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK0_4),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK0_5),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK1_4),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK1_5),		\
+	DEFINE_REG(REG_EMC, EMC_MRW8),					\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_4),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_5),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_4),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK0_5),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_4),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQS_RANK1_5),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_LONG_CMD_0),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_LONG_CMD_1),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_LONG_CMD_2),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_LONG_CMD_3),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_LONG_CMD_4),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_SHORT_CMD_0),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_SHORT_CMD_1),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_SHORT_CMD_2),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD0_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD1_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD2_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_CMD3_3),	\
+	DEFINE_REG(REG_EMC, EMC_TXDSRVTTGEN),				\
+	DEFINE_REG(REG_EMC, EMC_FDPD_CTRL_DQ),				\
+	DEFINE_REG(REG_EMC, EMC_FDPD_CTRL_CMD),				\
+	DEFINE_REG(REG_EMC, EMC_FBIO_SPARE),				\
+	DEFINE_REG(REG_EMC, EMC_ZCAL_INTERVAL),				\
+	DEFINE_REG(REG_EMC, EMC_ZCAL_WAIT_CNT),				\
+	DEFINE_REG(REG_EMC, EMC_MRS_WAIT_CNT),				\
+	DEFINE_REG(REG_EMC, EMC_MRS_WAIT_CNT2),				\
+	DEFINE_REG(REG_EMC, EMC_AUTO_CAL_CHANNEL),			\
+	DEFINE_REG(REG_EMC, EMC_DLL_CFG_0),				\
+	DEFINE_REG(REG_EMC, EMC_DLL_CFG_1),				\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_AUTOCAL_CFG_COMMON),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_ZCTRL),				\
+	DEFINE_REG(REG_EMC, EMC_CFG),					\
+	DEFINE_REG(REG_EMC, EMC_CFG_PIPE),				\
+	DEFINE_REG(REG_EMC, EMC_DYN_SELF_REF_CONTROL),			\
+	DEFINE_REG(REG_EMC, EMC_QPOP),					\
+	DEFINE_REG(REG_EMC, EMC_DQS_BRLSHFT_0),				\
+	DEFINE_REG(REG_EMC, EMC_DQS_BRLSHFT_1),				\
+	DEFINE_REG(REG_EMC, EMC_CMD_BRLSHFT_2),				\
+	DEFINE_REG(REG_EMC, EMC_CMD_BRLSHFT_3),				\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_PAD_CFG_CTRL),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DATA_PAD_RX_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_CMD_PAD_RX_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DATA_RX_TERM_MODE),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_CMD_RX_TERM_MODE),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_CMD_PAD_TX_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DATA_PAD_TX_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_COMMON_PAD_TX_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_VTTGEN_CTRL_0),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_VTTGEN_CTRL_1),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_VTTGEN_CTRL_2),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_BRICK_CTRL_RFU1),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_CMD_BRICK_CTRL_FDPD),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_BRICK_CTRL_RFU2),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DATA_BRICK_CTRL_FDPD),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_BG_BIAS_CTRL_0),			\
+	DEFINE_REG(REG_EMC, EMC_CFG_3),					\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_PWRD_0),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_PWRD_1),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_PWRD_2),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_PWRD_3),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_PWRD_4),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_PWRD_5),			\
+	DEFINE_REG(REG_EMC, EMC_CONFIG_SAMPLE_DELAY),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_SEL_CLK_SRC_0),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_SEL_CLK_SRC_1),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_SEL_CLK_SRC_2),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_SEL_CLK_SRC_3),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_SEL_CLK_SRC_4),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_TX_SEL_CLK_SRC_5),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_BYPASS),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_PWRD_0),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_PWRD_1),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_DDLL_PWRD_2),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_CMD_CTRL_0),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_CMD_CTRL_1),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_CMD_CTRL_2),			\
+	DEFINE_REG(REG_EMC, EMC_TR_TIMING_0),				\
+	DEFINE_REG(REG_EMC, EMC_TR_DVFS),				\
+	DEFINE_REG(REG_EMC, EMC_TR_CTRL_1),				\
+	DEFINE_REG(REG_EMC, EMC_TR_RDV),				\
+	DEFINE_REG(REG_EMC, EMC_TR_QPOP),				\
+	DEFINE_REG(REG_EMC, EMC_TR_RDV_MASK),				\
+	DEFINE_REG(REG_EMC, EMC_MRW14),					\
+	DEFINE_REG(REG_EMC, EMC_TR_QSAFE),				\
+	DEFINE_REG(REG_EMC, EMC_TR_QRST),				\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_CTRL),				\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_SETTLE),			\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_VREF_SETTLE),			\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_CA_FINE_CTRL),			\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_CA_CTRL_MISC),			\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_CA_CTRL_MISC1),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_CA_VREF_CTRL),			\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_QUSE_CORS_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_QUSE_FINE_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_QUSE_CTRL_MISC),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_QUSE_VREF_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_READ_FINE_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_READ_CTRL_MISC),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_READ_VREF_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_WRITE_FINE_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_WRITE_CTRL_MISC),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_WRITE_VREF_CTRL),		\
+	DEFINE_REG(REG_EMC, EMC_TRAINING_MPC),				\
+	DEFINE_REG(REG_EMC, EMC_MRW15),					\
+}
+
+#define TRIM_REGS_PER_CH_LIST						\
+{									\
+	DEFINE_REG(REG_EMC0, EMC_CMD_BRLSHFT_0),			\
+	DEFINE_REG(REG_EMC1, EMC_CMD_BRLSHFT_1),			\
+	DEFINE_REG(REG_EMC0, EMC_DATA_BRLSHFT_0),			\
+	DEFINE_REG(REG_EMC1, EMC_DATA_BRLSHFT_0),			\
+	DEFINE_REG(REG_EMC0, EMC_DATA_BRLSHFT_1),			\
+	DEFINE_REG(REG_EMC1, EMC_DATA_BRLSHFT_1),			\
+	DEFINE_REG(REG_EMC0, EMC_QUSE_BRLSHFT_0),			\
+	DEFINE_REG(REG_EMC1, EMC_QUSE_BRLSHFT_1),			\
+	DEFINE_REG(REG_EMC0, EMC_QUSE_BRLSHFT_2),			\
+	DEFINE_REG(REG_EMC1, EMC_QUSE_BRLSHFT_3),			\
+}
+
+#define TRIM_REGS_LIST							\
+{									\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_LONG_DQS_RANK0_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_LONG_DQS_RANK1_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE2_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE3_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE4_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE5_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE6_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK0_BYTE7_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE2_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE3_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE4_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE5_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE6_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_DDLL_SHORT_DQ_RANK1_BYTE7_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_VREF_DQS_0),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_VREF_DQS_1),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_VREF_DQ_0),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_IB_VREF_DQ_1),			\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_4),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK0_5),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_LONG_DQ_RANK1_3),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE2_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE3_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE4_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE5_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE6_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_BYTE7_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD2_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK0_CMD3_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE0_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE1_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE2_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE3_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE4_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE5_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE6_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_0),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_1),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_OB_DDLL_SHORT_DQ_RANK1_BYTE7_2),	\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK0_0),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK0_1),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK0_2),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK0_3),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK1_0),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK1_1),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK1_2),		\
+	DEFINE_REG(REG_EMC, EMC_PMACRO_QUSE_DDLL_RANK1_3),		\
+}
+
+#define BURST_MC_REGS_LIST						\
+{									\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_CFG),				\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_OUTSTANDING_REQ),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_REFPB_HP_CTRL),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_REFPB_BANK_CTRL),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_RCD),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_RP),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_RC),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_RAS),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_FAW),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_RRD),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_RAP2PRE),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_WAP2PRE),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_R2R),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_W2W),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_R2W),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_CCDMW),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_W2R),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_TIMING_RFCPB),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DA_TURNS),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DA_COVERS),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_MISC0),				\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_MISC1),				\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_MISC2),				\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_RING1_THROTTLE),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_CTRL),			\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6),		\
+	DEFINE_REG(REG_MC, MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7),		\
+}
+
+#define BURST_UP_DOWN_REGS_LIST						\
+{									\
+	DEFINE_REG(REG_MC, MC_MLL_MPCORER_PTSA_RATE),			\
+	DEFINE_REG(REG_MC, MC_FTOP_PTSA_RATE),				\
+	DEFINE_REG(REG_MC, MC_PTSA_GRANT_DECREMENT),			\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_XUSB_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_XUSB_1),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_TSEC_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_SDMMCA_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_SDMMCAA_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_SDMMC_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_SDMMCAB_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_PPCS_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_PPCS_1),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_MPCORE_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_HC_0),			\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_HC_1),			\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_AVPC_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_GPU_0),			\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_GPU2_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_NVENC_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_NVDEC_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_VIC_0),			\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_VI2_0),			\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_ISP2_0),		\
+	DEFINE_REG(REG_MC, MC_LATENCY_ALLOWANCE_ISP2_1),		\
+}
+
+#define VREF_REGS_PER_CH_LIST						\
+{									\
+	DEFINE_REG(REG_EMC0, EMC_TRAINING_OPT_DQS_IB_VREF_RANK0),	\
+	DEFINE_REG(REG_EMC1, EMC_TRAINING_OPT_DQS_IB_VREF_RANK0),	\
+	DEFINE_REG(REG_EMC0, EMC_TRAINING_OPT_DQS_IB_VREF_RANK1),	\
+	DEFINE_REG(REG_EMC1, EMC_TRAINING_OPT_DQS_IB_VREF_RANK1),	\
+}
+
+#define DEFINE_REG(type, reg)	reg##_INDEX
+enum BURST_REGS_LIST;
+enum TRIM_REGS_LIST;
+enum BURST_MC_REGS_LIST;
+enum BURST_UP_DOWN_REGS_LIST;
+#undef DEFINE_REG
+
+#define DEFINE_REG(type, reg)	type##_##reg##_INDEX
+enum BURST_REGS_PER_CH_LIST;
+enum TRIM_REGS_PER_CH_LIST;
+enum VREF_REGS_PER_CH_LIST;
+#undef DEFINE_REG
+
+enum {
+	DRAM_TYPE_DDR3   = 0,
+	DRAM_TYPE_LPDDR4 = 1,
+	DRAM_TYPE_LPDDR2 = 2,
+	DRAM_TYPE_DDR2 = 3,
+};
+
+struct emc_table {
+	u32 rev;
+	char dvfs_ver[60];
+	u32 rate;
+	u32 min_volt;
+	u32 gpu_min_volt;
+	char clock_src[32];
+	u32 clk_src_emc;
+	u32 needs_training;
+	u32 training_parttern;
+	u32 trained;
+
+	u32 periodic_training;
+	u32 trained_dram_clktree_c0d0u0;
+	u32 trained_dram_clktree_c0d0u1;
+	u32 trained_dram_clktree_c0d1u0;
+	u32 trained_dram_clktree_c0d1u1;
+	u32 trained_dram_clktree_c1d0u0;
+	u32 trained_dram_clktree_c1d0u1;
+	u32 trained_dram_clktree_c1d1u0;
+	u32 trained_dram_clktree_c1d1u1;
+	u32 current_dram_clktree_c0d0u0;
+	u32 current_dram_clktree_c0d0u1;
+	u32 current_dram_clktree_c0d1u0;
+	u32 current_dram_clktree_c0d1u1;
+	u32 current_dram_clktree_c1d0u0;
+	u32 current_dram_clktree_c1d0u1;
+	u32 current_dram_clktree_c1d1u0;
+	u32 current_dram_clktree_c1d1u1;
+	u32 run_clocks;
+	u32 tree_margin;
+
+	u32 num_burst;
+	u32 num_burst_per_ch;
+	u32 num_trim;
+	u32 num_trim_per_ch;
+	u32 num_mc_regs;
+	u32 num_up_down;
+	u32 vref_num;
+	u32 training_mod_num;
+	u32 dram_timing_num;
+
+	u32  ptfv_list[12];
+
+	u32 burst_regs[221];
+	u32 burst_reg_per_ch[8];
+	u32 shadow_regs_ca_train[221];
+	u32 shadow_regs_quse_train[221];
+	u32 shadow_regs_rdwr_train[221];
+
+	u32 trim_regs[138];
+	u32 trim_perch_regs[10];
+
+	u32 vref_perch_regs[4];
+
+	u32 dram_timings[5];
+	u32 training_mod_regs[20];
+	u32 save_restore_mod_regs[12];
+	u32 burst_mc_regs[33];
+	u32 la_scale_regs[24];
+
+	u32 min_mrs_wait;
+	u32 emc_mrw;
+	u32 emc_mrw2;
+	u32 emc_mrw3;
+	u32 emc_mrw4;
+	u32 emc_mrw9;
+	u32 emc_mrs;
+	u32 emc_emrs;
+	u32 emc_emrs2;
+	u32 emc_auto_cal_config;
+	u32 emc_auto_cal_config2;
+	u32 emc_auto_cal_config3;
+	u32 emc_auto_cal_config4;
+	u32 emc_auto_cal_config5;
+	u32 emc_auto_cal_config6;
+	u32 emc_auto_cal_config7;
+	u32 emc_auto_cal_config8;
+	u32 emc_cfg_2;
+	u32 emc_sel_dpd_ctrl;
+	u32 emc_fdpd_ctrl_cmd_no_ramp;
+	u32 dll_clk_src;
+	u32 clk_out_enb_x_0_clk_enb_emc_dll;
+	u32 latency;
+};
+
+struct tegra_emc {
+	struct clk_hw hw;
+	struct clk *emc_clk;
+	struct device *dev;
+
+	struct tegra_mc *mc;
+
+	void __iomem *emc_base;
+	void __iomem *emc0_base;
+	void __iomem *emc1_base;
+
+	struct emc_table *current_timing;
+	struct emc_table *next_timing;
+	struct emc_table start_timing;
+
+	struct emc_table *emc_table;
+	struct emc_table *emc_table_normal;
+	struct emc_table *emc_table_derated;
+
+	unsigned int emc_table_size;
+
+	int dram_dev_num;
+	u32 dram_type;
+	u32 ram_code;
+	u32 clk_setting;
+};
+#define to_emc(_hw) container_of(_hw, struct tegra_emc, hw)
+
+struct supported_sequence {
+	u8     table_rev;
+	void (*set_clock)(struct tegra_emc *emc, u32 clksrc);
+	u32  (*periodic_compensation)(struct tegra_emc *emc);
+	char  *seq_rev;
+};
+
+int tegra_emc_dt_parse_pdata(struct platform_device *pdev,
+			     struct emc_table **tables,
+			     struct emc_table **derated_tables,
+			     int *num_entries);
+
+#endif
diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/tegra210-emc.c
new file mode 100644
index 000000000000..0c20bcd0e6de
--- /dev/null
+++ b/drivers/memory/tegra/tegra210-emc.c
@@ -0,0 +1,886 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk/tegra.h>
+#include <linux/clk-provider.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <soc/tegra/fuse.h>
+#include <soc/tegra/mc.h>
+
+#include "mc.h"
+#include "tegra210-emc-reg.h"
+
+#define TEGRA_EMC_TABLE_MAX_SIZE		16
+#define TEGRA210_EMC_SUSPEND_RATE		204000000
+
+enum TEGRA_EMC_SOURCE {
+	TEGRA_EMC_SRC_PLLM,
+	TEGRA_EMC_SRC_PLLC,
+	TEGRA_EMC_SRC_PLLP,
+	TEGRA_EMC_SRC_CLKM,
+	TEGRA_EMC_SRC_PLLM_UD,
+	TEGRA_EMC_SRC_PLLMB_UD,
+	TEGRA_EMC_SRC_PLLMB,
+	TEGRA_EMC_SRC_PLLP_UD,
+	TEGRA_EMC_SRC_COUNT,
+};
+
+struct emc_sel {
+	struct clk *input;
+	u32 value;
+	unsigned long input_rate;
+
+	struct clk *input_b;
+	u32 value_b;
+	unsigned long input_rate_b;
+};
+
+struct emc_stats {
+	u64 time_at_clock[TEGRA_EMC_TABLE_MAX_SIZE];
+	int last_sel;
+	u64 last_update;
+	u64 clkchange_count;
+	spinlock_t spinlock;
+};
+
+static struct emc_sel *emc_clk_sel;
+static struct clk *emc_src[TEGRA_EMC_SRC_COUNT];
+static const char *emc_src_names[TEGRA_EMC_SRC_COUNT] = {
+	[TEGRA_EMC_SRC_PLLM] = "pll_m",
+	[TEGRA_EMC_SRC_PLLC] = "pll_c",
+	[TEGRA_EMC_SRC_PLLP] = "pll_p",
+	[TEGRA_EMC_SRC_CLKM] = "clk_m",
+	[TEGRA_EMC_SRC_PLLM_UD] = "pll_m_ud",
+	[TEGRA_EMC_SRC_PLLMB_UD] = "pll_mb_ud",
+	[TEGRA_EMC_SRC_PLLMB] = "pll_mb",
+	[TEGRA_EMC_SRC_PLLP_UD] = "pll_p_ud",
+};
+static struct emc_stats emc_stats;
+static struct supported_sequence supported_seqs[] = {
+	{
+		0,
+		NULL,
+		NULL,
+		NULL
+	}
+};
+static struct supported_sequence *seq;
+static struct tegra_emc *tegra_emc;
+static DEFINE_SPINLOCK(emc_access_lock);
+static ktime_t clkchange_time;
+static int clkchange_delay = 100;
+
+static void emc_train(struct timer_list *tmr);
+DEFINE_TIMER(emc_training_timer, emc_train);
+static u32 timer_period_training = 100;
+
+#define DEFINE_REG(type, reg) (reg)
+u32 burst_regs_per_ch_off[] = BURST_REGS_PER_CH_LIST;
+u32 burst_regs_off[] = BURST_REGS_LIST;
+u32 burst_mc_regs_off[] = BURST_MC_REGS_LIST;
+u32 la_scale_regs_off[] = BURST_UP_DOWN_REGS_LIST;
+u32 trim_regs_per_ch_off[] = TRIM_REGS_PER_CH_LIST;
+u32 trim_regs_off[] = TRIM_REGS_LIST;
+u32 vref_regs_per_ch_off[] = VREF_REGS_PER_CH_LIST;
+#undef DEFINE_REG
+
+#define DEFINE_REG(type, reg) (type)
+u32 burst_regs_per_ch_type[] = BURST_REGS_PER_CH_LIST;
+u32 trim_regs_per_ch_type[] = TRIM_REGS_PER_CH_LIST;
+u32 vref_regs_per_ch_type[] = VREF_REGS_PER_CH_LIST;
+#undef DEFINE_REG
+
+#ifdef CONFIG_PM_SLEEP
+static bool emc_suspend;
+static unsigned long emc_resume_rate;
+#endif
+
+inline u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
+{
+	return readl(emc->emc_base + offset);
+}
+
+inline u32 emc_readl_per_ch(struct tegra_emc *emc, int type,
+			    unsigned long offset)
+{
+	u32 val = 0;
+
+	switch (type) {
+	case REG_EMC:
+	case REG_EMC0:
+		val = readl(emc->emc_base + offset);
+		break;
+	case REG_EMC1:
+		val = readl(emc->emc1_base + offset);
+		break;
+	}
+
+	return val;
+}
+
+static inline u32 emc_src_val(u32 val)
+{
+	return (val & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
+		EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
+}
+
+static inline u32 emc_div_val(u32 val)
+{
+	return (val & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
+		EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
+}
+
+static void emc_train(struct timer_list *tmr)
+{
+	unsigned long flags;
+	struct tegra_emc *emc = tegra_emc;
+
+	if (!emc->current_timing)
+		return;
+
+	spin_lock_irqsave(&emc_access_lock, flags);
+	if (seq->periodic_compensation)
+		seq->periodic_compensation(emc);
+	spin_unlock_irqrestore(&emc_access_lock, flags);
+
+	mod_timer(&emc_training_timer,
+		  jiffies + msecs_to_jiffies(timer_period_training));
+}
+
+static void emc_training_timer_start(void)
+{
+	mod_timer(&emc_training_timer,
+		  jiffies + msecs_to_jiffies(timer_period_training));
+}
+
+static void emc_training_timer_stop(void)
+{
+	del_timer(&emc_training_timer);
+}
+
+static void emc_set_clock(struct tegra_emc *emc, u32 clksrc)
+{
+	seq->set_clock(emc, clksrc);
+
+	if (emc->next_timing->periodic_training)
+		emc_training_timer_start();
+	else
+		emc_training_timer_stop();
+}
+
+static inline void emc_get_timing(struct tegra_emc *emc,
+				  struct emc_table *timing)
+{
+	int i, div;
+	u32 val;
+	unsigned long rate;
+
+	for (i = 0; i < timing->num_burst; i++) {
+		if (burst_regs_off[i])
+			timing->burst_regs[i] = emc_readl(emc,
+							  burst_regs_off[i]);
+		else
+			timing->burst_regs[i] = 0;
+	}
+
+	for (i = 0; i < timing->num_burst_per_ch; i++)
+		timing->burst_reg_per_ch[i] = emc_readl_per_ch(emc,
+			burst_regs_per_ch_type[i], burst_regs_per_ch_off[i]);
+
+	for (i = 0; i < timing->num_trim; i++)
+		timing->trim_regs[i] = emc_readl(emc, trim_regs_off[i]);
+
+	for (i = 0; i < timing->num_trim_per_ch; i++)
+		timing->trim_perch_regs[i] = emc_readl_per_ch(emc,
+			trim_regs_per_ch_type[i], trim_regs_per_ch_off[i]);
+
+	for (i = 0; i < timing->vref_num; i++)
+		timing->vref_perch_regs[i] = emc_readl_per_ch(emc,
+			vref_regs_per_ch_type[i], vref_regs_per_ch_off[i]);
+
+	for (i = 0; i < timing->num_mc_regs; i++)
+		timing->burst_mc_regs[i] = mc_readl(emc->mc,
+						    burst_mc_regs_off[i]);
+
+	for (i = 0; i < timing->num_up_down; i++)
+		timing->la_scale_regs[i] = mc_readl(emc->mc,
+						    la_scale_regs_off[i]);
+
+	val = tegra210_clk_emc_get_setting();
+	rate = clk_get_rate(emc_src[emc_src_val(val)]);
+	div = emc_div_val(val);
+	div += 2;
+	rate *= 2;
+	rate += div - 1;
+	do_div(rate, div);
+	timing->rate = rate / 1000;
+}
+
+static void __emc_copy_table_params(struct emc_table *src,
+				    struct emc_table *dst, int flags)
+{
+	int i;
+
+	if (flags & EMC_COPY_TABLE_PARAM_PERIODIC_FIELDS) {
+		dst->trained_dram_clktree_c0d0u0 =
+			src->trained_dram_clktree_c0d0u0;
+		dst->trained_dram_clktree_c0d0u1 =
+			src->trained_dram_clktree_c0d0u1;
+		dst->trained_dram_clktree_c0d1u0 =
+			src->trained_dram_clktree_c0d1u0;
+		dst->trained_dram_clktree_c0d1u1 =
+			src->trained_dram_clktree_c0d1u1;
+		dst->trained_dram_clktree_c1d0u0 =
+			src->trained_dram_clktree_c1d0u0;
+		dst->trained_dram_clktree_c1d0u1 =
+			src->trained_dram_clktree_c1d0u1;
+		dst->trained_dram_clktree_c1d1u0 =
+			src->trained_dram_clktree_c1d1u0;
+		dst->trained_dram_clktree_c1d1u1 =
+			src->trained_dram_clktree_c1d1u1;
+		dst->current_dram_clktree_c0d0u0 =
+			src->current_dram_clktree_c0d0u0;
+		dst->current_dram_clktree_c0d0u1 =
+			src->current_dram_clktree_c0d0u1;
+		dst->current_dram_clktree_c0d1u0 =
+			src->current_dram_clktree_c0d1u0;
+		dst->current_dram_clktree_c0d1u1 =
+			src->current_dram_clktree_c0d1u1;
+		dst->current_dram_clktree_c1d0u0 =
+			src->current_dram_clktree_c1d0u0;
+		dst->current_dram_clktree_c1d0u1 =
+			src->current_dram_clktree_c1d0u1;
+		dst->current_dram_clktree_c1d1u0 =
+			src->current_dram_clktree_c1d1u0;
+		dst->current_dram_clktree_c1d1u1 =
+			src->current_dram_clktree_c1d1u1;
+	}
+
+	if (flags & EMC_COPY_TABLE_PARAM_TRIM_REGS) {
+		for (i = 0; i < src->num_trim_per_ch; i++)
+			dst->trim_perch_regs[i] = src->trim_perch_regs[i];
+
+		for (i = 0; i < src->num_trim; i++)
+			dst->trim_regs[i] = src->trim_regs[i];
+
+		for (i = 0; i < src->num_burst_per_ch; i++)
+			dst->burst_reg_per_ch[i] = src->burst_reg_per_ch[i];
+
+		dst->trained = src->trained;
+	}
+}
+
+static void emc_copy_table_params(struct emc_table *src,
+				  struct emc_table *dst,
+				  int table_size,
+				  int flags)
+{
+	int i;
+
+	for (i = 0; i < table_size; i++)
+		__emc_copy_table_params(&src[i], &dst[i], flags);
+}
+
+static void emc_last_stats_update(int last_sel)
+{
+	unsigned long flags;
+	u64 cur_jiffies = get_jiffies_64();
+
+	spin_lock_irqsave(&emc_stats.spinlock, flags);
+
+	if (emc_stats.last_sel < TEGRA_EMC_TABLE_MAX_SIZE)
+		emc_stats.time_at_clock[emc_stats.last_sel] =
+			emc_stats.time_at_clock[emc_stats.last_sel]
+			+ (cur_jiffies - emc_stats.last_update);
+
+	emc_stats.last_update = cur_jiffies;
+
+	if (last_sel < TEGRA_EMC_TABLE_MAX_SIZE) {
+		emc_stats.clkchange_count++;
+		emc_stats.last_sel = last_sel;
+	}
+
+	spin_unlock_irqrestore(&emc_stats.spinlock, flags);
+}
+
+static int emc_table_lookup(struct tegra_emc *emc, unsigned long rate)
+{
+	int i;
+
+	for (i = 0; i < emc->emc_table_size; i++) {
+		if (emc_clk_sel[i].input == NULL)
+			continue;
+
+		if (emc->emc_table[i].rate == rate)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static struct clk *emc_predict_parent(struct tegra_emc *emc,
+				      unsigned long rate)
+{
+	struct clk *old_parent, *new_parent;
+	unsigned long parent_rate;
+	int idx;
+
+	idx = emc_table_lookup(emc, rate / 1000);
+	if (idx < 0)
+		return ERR_PTR(-EINVAL);
+
+	parent_rate = emc_clk_sel[idx].input_rate * 1000;
+	new_parent = emc_clk_sel[idx].input;
+	old_parent = clk_get_parent(emc->emc_clk);
+
+	if (parent_rate == clk_get_rate(old_parent))
+		return old_parent;
+
+	if (clk_is_match(new_parent, old_parent))
+		new_parent = emc_clk_sel[idx].input_b;
+
+	if (parent_rate != clk_get_rate(new_parent))
+		clk_set_rate(new_parent, parent_rate);
+
+	return new_parent;
+}
+
+static int emc_set_rate(struct tegra_emc *emc, unsigned long rate)
+{
+	int i;
+	unsigned long flags;
+	s64 last_change_delay;
+	struct clk *parent;
+
+	if (emc_suspend)
+		rate = TEGRA210_EMC_SUSPEND_RATE;
+
+	if (rate == emc->current_timing->rate)
+		return 0;
+
+	i = emc_table_lookup(emc, rate / 1000);
+
+	if (i < 0)
+		return i;
+
+	if (rate > 204000000 && !emc->emc_table[i].trained)
+		return -EINVAL;
+
+	parent = emc_predict_parent(emc, rate);
+	if (clk_is_match(parent, emc_clk_sel[i].input))
+		emc->clk_setting = emc_clk_sel[i].value;
+	else
+		emc->clk_setting = emc_clk_sel[i].value_b;
+
+	emc->next_timing = &emc->emc_table[i];
+	last_change_delay = ktime_us_delta(ktime_get(), clkchange_time);
+	if ((last_change_delay >= 0) && (last_change_delay < clkchange_delay))
+		udelay(clkchange_delay - (int)last_change_delay);
+
+	spin_lock_irqsave(&emc_access_lock, flags);
+	emc_set_clock(emc, emc->clk_setting);
+	clkchange_time = ktime_get();
+	emc->current_timing = &emc->emc_table[i];
+	spin_unlock_irqrestore(&emc_access_lock, flags);
+
+	emc_last_stats_update(i);
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int emc_stats_show(struct seq_file *s, void *data)
+{
+	int i;
+	struct tegra_emc *emc = (struct tegra_emc *)s->private;
+
+	if (!emc->emc_table_size || !seq)
+		return 0;
+
+	emc_last_stats_update(TEGRA_EMC_TABLE_MAX_SIZE);
+
+	seq_printf(s, "%-10s %-10s\n", "rate kHz", "time");
+	for (i = 0; i < emc->emc_table_size; i++) {
+		if (emc_clk_sel[i].input == NULL)
+			continue;
+
+		seq_printf(s, "%-10u %-10llu\n",
+			   emc->emc_table[i].rate,
+			   jiffies_64_to_clock_t(
+			   emc_stats.time_at_clock[i]));
+	}
+	seq_printf(s, "%-15s %llu\n", "transitions:",
+		   emc_stats.clkchange_count);
+	seq_printf(s, "%-15s %llu\n", "time-stamp:",
+		   jiffies_64_to_clock_t(emc_stats.last_update));
+
+	return 0;
+}
+
+static int emc_stats_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, emc_stats_show, inode->i_private);
+}
+
+static const struct file_operations emc_stats_fops = {
+	.open		= emc_stats_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int debug_emc_get_rate(void *data, u64 *val)
+{
+	struct clk *c = data;
+
+	*val = clk_get_rate(c);
+
+	return 0;
+}
+
+static int debug_emc_set_rate(void *data, u64 val)
+{
+	struct clk *c = data;
+
+	return clk_set_rate(c, val);
+}
+DEFINE_SIMPLE_ATTRIBUTE(emc_rate_fops, debug_emc_get_rate,
+			debug_emc_set_rate, "%llu\n");
+
+static int tegra_emc_debug_init(struct tegra_emc *emc)
+{
+	struct dentry *emc_debugfs_root;
+
+	emc_debugfs_root = debugfs_create_dir("tegra_emc", NULL);
+	if (!emc_debugfs_root)
+		return -ENOMEM;
+
+	if (!debugfs_create_file("stats", 0444, emc_debugfs_root, emc,
+				 &emc_stats_fops))
+		goto err_out;
+
+	if (!debugfs_create_file("rate", 0644, emc_debugfs_root, emc->emc_clk,
+				 &emc_rate_fops))
+		goto err_out;
+
+	return 0;
+
+err_out:
+	debugfs_remove_recursive(emc_debugfs_root);
+	return -ENOMEM;
+}
+#endif /* CONFIG_DEBUG_FS */
+
+static u8 clk_emc_get_parent(struct clk_hw *hw)
+{
+	struct tegra_emc *emc = to_emc(hw);
+
+	if (!emc->clk_setting)
+		emc->clk_setting = tegra210_clk_emc_get_setting();
+
+	return emc_src_val(emc->clk_setting);
+}
+
+static unsigned long clk_emc_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct tegra_emc *emc = to_emc(hw);
+
+	if (!emc->emc_table_size || !seq) {
+		u32 emc_setting = tegra210_clk_emc_get_setting();
+
+		return clk_get_rate(emc_src[emc_src_val(emc_setting)]);
+	}
+
+	return emc->current_timing->rate * 1000;
+}
+
+static long clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *prate)
+{
+	struct tegra_emc *emc = to_emc(hw);
+	int i;
+
+	if (!emc->emc_table_size || !seq) {
+		u32 emc_setting = tegra210_clk_emc_get_setting();
+
+		return clk_get_rate(emc_src[emc_src_val(emc_setting)]);
+	}
+
+	if (emc_suspend)
+		return TEGRA210_EMC_SUSPEND_RATE;
+
+	rate /= 1000;
+
+	for (i = 0; i < emc->emc_table_size; i++) {
+		if (emc->emc_table[i].rate >= rate)
+			return emc->emc_table[i].rate * 1000;
+	}
+
+	return emc->emc_table[i - 1].rate * 1000;
+}
+
+static int clk_emc_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct tegra_emc *emc = to_emc(hw);
+	struct clk *old_parent, *new_parent;
+	int ret = -EINVAL;
+
+	if (!emc->emc_table_size || !seq)
+		return ret;
+
+	if (emc_suspend)
+		rate = TEGRA210_EMC_SUSPEND_RATE;
+
+	old_parent = clk_get_parent(hw->clk);
+	new_parent = emc_predict_parent(emc, rate);
+	if (IS_ERR(new_parent))
+		goto out;
+
+	if (!clk_is_match(new_parent, old_parent))
+		clk_prepare_enable(new_parent);
+
+	ret = emc_set_rate(emc, rate);
+	if (ret) {
+		if (new_parent != old_parent)
+			clk_disable_unprepare(new_parent);
+		goto out;
+	}
+
+	if (!clk_is_match(new_parent, old_parent)) {
+		clk_hw_reparent(hw, __clk_get_hw(new_parent));
+		clk_disable_unprepare(old_parent);
+	}
+
+out:
+	return ret;
+}
+
+static const struct clk_ops tegra_clk_emc_ops = {
+	.get_parent = clk_emc_get_parent,
+	.recalc_rate = clk_emc_recalc_rate,
+	.round_rate = clk_emc_round_rate,
+	.set_rate = clk_emc_set_rate,
+};
+
+static int find_matching_input(struct emc_table *table, struct emc_sel *sel)
+{
+	u32 div_value;
+	u32 src_value;
+	unsigned long input_rate = 0;
+	struct clk *input_clk;
+
+	div_value = emc_div_val(table->clk_src_emc);
+	src_value = emc_src_val(table->clk_src_emc);
+
+	if (div_value & 0x1) {
+		pr_warn("Tegra EMC: invalid odd divider for EMC rate %u\n",
+			table->rate);
+		return -EINVAL;
+	}
+
+	if (!(table->clk_src_emc & EMC_CLK_MC_EMC_SAME_FREQ) !=
+	    !(MC_EMEM_ARB_MISC0_EMC_SAME_FREQ &
+	    table->burst_regs[MC_EMEM_ARB_MISC0_INDEX])) {
+		pr_warn("Tegra EMC: ambiguous EMC to MC ratio for rate %u\n",
+			table->rate);
+		return -EINVAL;
+	}
+
+	input_clk = emc_src[src_value];
+	if (input_clk == emc_src[TEGRA_EMC_SRC_PLLM]
+		|| input_clk == emc_src[TEGRA_EMC_SRC_PLLM_UD]) {
+		input_rate = table->rate * (1 + div_value / 2);
+	} else {
+		input_rate = clk_get_rate(input_clk) / 1000;
+		if (input_rate != (table->rate * (1 + div_value / 2))) {
+			pr_warn("Tegra EMC: rate %u doesn't match input\n",
+				table->rate);
+			return -EINVAL;
+		}
+	}
+
+	sel->input = input_clk;
+	sel->input_rate = input_rate;
+	sel->value = table->clk_src_emc;
+	sel->input_b = input_clk;
+	sel->input_rate_b = input_rate;
+	sel->value_b = table->clk_src_emc;
+
+	if (input_clk == emc_src[TEGRA_EMC_SRC_PLLM]) {
+		sel->input_b = emc_src[TEGRA_EMC_SRC_PLLMB];
+		sel->value_b = table->clk_src_emc &
+			       ~EMC_CLK_EMC_2X_CLK_SRC_MASK;
+		sel->value_b |= TEGRA_EMC_SRC_PLLMB <<
+				EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
+	}
+
+	if (input_clk == emc_src[TEGRA_EMC_SRC_PLLM_UD]) {
+		sel->input_b = emc_src[TEGRA_EMC_SRC_PLLMB_UD];
+		sel->value_b = table->clk_src_emc &
+			       ~EMC_CLK_EMC_2X_CLK_SRC_MASK;
+		sel->value_b |= TEGRA_EMC_SRC_PLLMB_UD <<
+				EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
+	}
+
+	return 0;
+}
+
+static int tegra210_emc_probe(struct platform_device *pdev)
+{
+	int i, div;
+	unsigned long table_rate;
+	unsigned long current_rate;
+	struct device_node *np;
+	struct platform_device *mc;
+	struct tegra_emc *emc;
+	struct clk_init_data init;
+	struct clk *clk;
+	struct resource *r;
+	u32 emc_setting;
+
+	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
+	if (!emc)
+		return -ENOMEM;
+
+	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
+	if (!np) {
+		dev_err(&pdev->dev, "could not get memory controller\n");
+		return -ENOENT;
+	}
+
+	mc = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!mc)
+		return -ENOENT;
+
+	emc->mc = platform_get_drvdata(mc);
+	if (!emc->mc)
+		return -EPROBE_DEFER;
+
+	emc->ram_code = tegra_read_ram_code();
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	emc->emc_base = devm_ioremap_resource(&pdev->dev, r);
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	emc->emc0_base = devm_ioremap_resource(&pdev->dev, r);
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+	emc->emc1_base = devm_ioremap_resource(&pdev->dev, r);
+
+	for (i = 0; i < TEGRA_EMC_SRC_COUNT; i++) {
+		emc_src[i] = devm_clk_get(&pdev->dev,
+						emc_src_names[i]);
+		if (IS_ERR(emc_src[i])) {
+			dev_err(&pdev->dev, "Can not find EMC source clock\n");
+			return -ENODATA;
+		}
+	}
+
+	/* Init EMC rate statistic data */
+	emc_stats.clkchange_count = 0;
+	spin_lock_init(&emc_stats.spinlock);
+	emc_stats.last_update = get_jiffies_64();
+	emc_stats.last_sel = TEGRA_EMC_TABLE_MAX_SIZE;
+
+	emc->dram_type = (emc_readl(emc, EMC_FBIO_CFG5) &
+			  EMC_FBIO_CFG5_DRAM_TYPE_MASK) >>
+			  EMC_FBIO_CFG5_DRAM_TYPE_SHIFT;
+	if (emc->dram_type != DRAM_TYPE_DDR3 &&
+	    emc->dram_type != DRAM_TYPE_LPDDR2 &&
+	    emc->dram_type != DRAM_TYPE_LPDDR4) {
+		dev_err(&pdev->dev, "DRAM not supported\n");
+		return -ENODATA;
+	}
+
+	emc->dram_dev_num = tegra_mc_get_emem_device_count(emc->mc);
+
+	tegra_emc_dt_parse_pdata(pdev, &emc->emc_table_normal,
+				 &emc->emc_table_derated,
+				 &emc->emc_table_size);
+	if (!emc->emc_table_size ||
+	    emc->emc_table_size > TEGRA_EMC_TABLE_MAX_SIZE) {
+		dev_err(&pdev->dev, "Invalid table size %d\n",
+			emc->emc_table_size);
+		goto emc_clk_register;
+	}
+	emc->emc_table = emc->emc_table_normal;
+
+	/*
+	 * Copy trained trimmers from the normal table to the derated
+	 * table for LP4. Bootloader trains only the normal table.
+	 * Trimmers are the same for derated and normal tables.
+	 */
+	if (emc->emc_table_derated && emc->dram_type == DRAM_TYPE_LPDDR4)
+		emc_copy_table_params(emc->emc_table_normal,
+				      emc->emc_table_derated,
+				      emc->emc_table_size,
+				      EMC_COPY_TABLE_PARAM_PERIODIC_FIELDS |
+				      EMC_COPY_TABLE_PARAM_TRIM_REGS);
+
+	seq = supported_seqs;
+	while (seq->table_rev) {
+		if (seq->table_rev == emc->emc_table[0].rev)
+			break;
+		seq++;
+	}
+	if (!seq->set_clock) {
+		seq = NULL;
+		dev_err(&pdev->dev, "Invalid EMC sequence for table Rev. %d\n",
+			emc->emc_table[0].rev);
+		goto emc_clk_register;
+	}
+
+	emc_clk_sel = devm_kcalloc(&pdev->dev,
+				   emc->emc_table_size,
+				   sizeof(struct emc_sel),
+				   GFP_KERNEL);
+	if (!emc_clk_sel) {
+		dev_err(&pdev->dev, "Memory allocation failed\n");
+		return -ENOMEM;
+	}
+
+	/* calculate the rate from source clock */
+	emc_setting = tegra210_clk_emc_get_setting();
+	current_rate = clk_get_rate(emc_src[emc_src_val(emc_setting)]);
+	div = emc_div_val(emc_setting);
+	div += 2;
+	current_rate *= 2;
+	current_rate += div - 1;
+	do_div(current_rate, div);
+	current_rate /=  1000;
+
+	for (i = 0; i < emc->emc_table_size; i++) {
+		table_rate = emc->emc_table[i].rate;
+		if (!table_rate)
+			continue;
+
+		if (i && ((table_rate <= emc->emc_table[i-1].rate) ||
+		   (emc->emc_table[i].min_volt <
+		    emc->emc_table[i-1].min_volt)))
+			continue;
+
+		if (emc->emc_table[i].rev != emc->emc_table[0].rev)
+			continue;
+
+		if (find_matching_input(&emc->emc_table[i], &emc_clk_sel[i]))
+			continue;
+
+		if (table_rate == current_rate)
+			emc_stats.last_sel = i;
+	}
+
+	dev_info(&pdev->dev, "validated EMC DFS table\n");
+
+	/* Update the start_timing base on the settings from firmware */
+	emc->start_timing.num_burst = emc->emc_table[0].num_burst;
+	emc->start_timing.num_burst_per_ch =
+		emc->emc_table[0].num_burst_per_ch;
+	emc->start_timing.num_trim = emc->emc_table[0].num_trim;
+	emc->start_timing.num_trim_per_ch =
+		emc->emc_table[0].num_trim_per_ch;
+	emc->start_timing.num_mc_regs = emc->emc_table[0].num_mc_regs;
+	emc->start_timing.num_up_down = emc->emc_table[0].num_up_down;
+	emc->start_timing.vref_num = emc->emc_table[0].vref_num;
+
+	emc_get_timing(emc, &emc->start_timing);
+	emc->current_timing = &emc->start_timing;
+	emc->clk_setting = emc_setting;
+
+emc_clk_register:
+	init.name = "emc";
+	init.ops = &tegra_clk_emc_ops;
+	init.flags = CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE;
+	init.parent_names = emc_src_names;
+	init.num_parents = ARRAY_SIZE(emc_src_names);
+	emc->hw.init = &init;
+
+	clk = clk_register(&pdev->dev, &emc->hw);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	emc->emc_clk = clk;
+	emc->dev = &pdev->dev;
+	tegra_emc = emc;
+	dev_set_drvdata(emc->dev, emc);
+
+	if (emc->emc_table_size && seq) {
+		for (i = 0; i < emc->emc_table_size; i++) {
+			table_rate = emc->emc_table[i].rate * 1000;
+			if (clk_set_rate(clk, table_rate))
+				dev_info(&pdev->dev,
+					 "rate: %lu validation fail\n",
+					 table_rate);
+
+			dev_info(&pdev->dev, "rate: %lu validation success\n",
+				 table_rate);
+		}
+	}
+
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+		tegra_emc_debug_init(emc);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int tegra210_emc_suspend(struct device *dev)
+{
+	struct tegra_emc *emc = dev_get_drvdata(dev);
+
+	if (!IS_ERR(emc->emc_clk)) {
+		emc_suspend = true;
+		emc_resume_rate = clk_get_rate(emc->emc_clk);
+		clk_set_rate(emc->emc_clk, TEGRA210_EMC_SUSPEND_RATE);
+
+		pr_debug("%s at rate %lu\n", __func__,
+			 clk_get_rate(emc->emc_clk));
+	}
+
+	return 0;
+}
+
+static int tegra210_emc_resume(struct device *dev)
+{
+	struct tegra_emc *emc = dev_get_drvdata(dev);
+
+	if (!IS_ERR(emc->emc_clk)) {
+		emc_suspend = false;
+		clk_set_rate(emc->emc_clk, emc_resume_rate);
+
+		pr_debug("%s at rate %lu\n", __func__,
+			 clk_get_rate(emc->emc_clk));
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra210_emc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(tegra210_emc_suspend, tegra210_emc_resume)
+};
+#endif
+
+static const struct of_device_id tegra210_emc_of_match[] = {
+	{ .compatible = "nvidia,tegra210-emc", },
+	{ },
+};
+
+static struct platform_driver tegra210_emc_driver = {
+	.driver	= {
+		.name = "tegra210-emc",
+		.of_match_table = tegra210_emc_of_match,
+		.pm = &tegra210_emc_pm_ops,
+	},
+	.probe = tegra210_emc_probe,
+};
+
+static int __init tegra210_emc_init(void)
+{
+	return platform_driver_register(&tegra210_emc_driver);
+}
+subsys_initcall(tegra210_emc_init);
-- 
2.21.0
