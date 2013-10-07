From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 15/27] gpu: host1x: Add support for Tegra114
Date: Mon,  7 Oct 2013 10:34:32 +0200
Message-ID: <1381134884-5816-16-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra114 uses a slightly updated version of host1x with an additional
syncpoint.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- fix register fields changed from host1x01

 drivers/gpu/host1x/Makefile                 |   3 +-
 drivers/gpu/host1x/dev.c                    |  11 ++
 drivers/gpu/host1x/hw/host1x02.c            |  42 +++++
 drivers/gpu/host1x/hw/host1x02.h            |  26 +++
 drivers/gpu/host1x/hw/hw_host1x02_channel.h | 121 ++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x02_sync.h    | 243 ++++++++++++++++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h  | 175 ++++++++++++++++++++
 7 files changed, 620 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/host1x/hw/host1x02.c
 create mode 100644 drivers/gpu/host1x/hw/host1x02.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_sync.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x02_uclass.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 889217c..afa1e9e 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -7,6 +7,7 @@ host1x-y = \
 	channel.o \
 	job.o \
 	debug.o \
-	hw/host1x01.o
+	hw/host1x01.o \
+	hw/host1x02.o
 
 obj-$(CONFIG_TEGRA_HOST1X) += host1x.o
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index de0fd55..ab402a5 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -33,6 +33,7 @@
 #include "channel.h"
 #include "debug.h"
 #include "hw/host1x01.h"
+#include "hw/host1x02.h"
 
 void host1x_sync_writel(struct host1x *host1x, u32 v, u32 r)
 {
@@ -67,7 +68,17 @@ static const struct host1x_info host1x01_info = {
 	.sync_offset	= 0x3000,
 };
 
+static const struct host1x_info host1x02_info = {
+	.nb_channels = 9,
+	.nb_pts = 32,
+	.nb_mlocks = 16,
+	.nb_bases = 12,
+	.init = host1x02_init,
+	.sync_offset = 0x3000,
+};
+
 static struct of_device_id host1x_of_match[] = {
+	{ .compatible = "nvidia,tegra114-host1x", .data = &host1x02_info, },
 	{ .compatible = "nvidia,tegra30-host1x", .data = &host1x01_info, },
 	{ .compatible = "nvidia,tegra20-host1x", .data = &host1x01_info, },
 	{ },
diff --git a/drivers/gpu/host1x/hw/host1x02.c b/drivers/gpu/host1x/hw/host1x02.c
new file mode 100644
index 0000000..52c0467
--- /dev/null
+++ b/drivers/gpu/host1x/hw/host1x02.c
@@ -0,0 +1,42 @@
+/*
+ * Host1x init for Tegra114 SoCs
+ *
+ * Copyright (c) 2013 NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+/* include hw specification */
+#include "hw/host1x01.h"
+#include "hw/host1x01_hardware.h"
+
+/* include code */
+#include "hw/cdma_hw.c"
+#include "hw/channel_hw.c"
+#include "hw/debug_hw.c"
+#include "hw/intr_hw.c"
+#include "hw/syncpt_hw.c"
+
+#include "dev.h"
+
+int host1x02_init(struct host1x *host)
+{
+	host->channel_op = &host1x_channel_ops;
+	host->cdma_op = &host1x_cdma_ops;
+	host->cdma_pb_op = &host1x_pushbuffer_ops;
+	host->syncpt_op = &host1x_syncpt_ops;
+	host->intr_op = &host1x_intr_ops;
+	host->debug_op = &host1x_debug_ops;
+
+	return 0;
+}
diff --git a/drivers/gpu/host1x/hw/host1x02.h b/drivers/gpu/host1x/hw/host1x02.h
new file mode 100644
index 0000000..f748660
--- /dev/null
+++ b/drivers/gpu/host1x/hw/host1x02.h
@@ -0,0 +1,26 @@
+/*
+ * Host1x init for Tegra114 SoCs
+ *
+ * Copyright (c) 2013 NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HOST1X_HOST1X02_H
+#define HOST1X_HOST1X02_H
+
+struct host1x;
+
+int host1x02_init(struct host1x *host);
+
+#endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x02_channel.h b/drivers/gpu/host1x/hw/hw_host1x02_channel.h
new file mode 100644
index 0000000..e490bcd
--- /dev/null
+++ b/drivers/gpu/host1x/hw/hw_host1x02_channel.h
@@ -0,0 +1,121 @@
+/*
+ * Copyright (c) 2013 NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+ /*
+  * Function naming determines intended use:
+  *
+  *     <x>_r(void) : Returns the offset for register <x>.
+  *
+  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
+  *
+  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
+  *
+  *     <x>_<y>_f(u32 v) : Returns a value based on 'v' which has been shifted
+  *         and masked to place it at field <y> of register <x>.  This value
+  *         can be |'d with others to produce a full register value for
+  *         register <x>.
+  *
+  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
+  *         value can be ~'d and then &'d to clear the value of field <y> for
+  *         register <x>.
+  *
+  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
+  *         to place it at field <y> of register <x>.  This value can be |'d
+  *         with others to produce a full register value for <x>.
+  *
+  *     <x>_<y>_v(u32 r) : Returns the value of field <y> from a full register
+  *         <x> value 'r' after being shifted to place its LSB at bit 0.
+  *         This value is suitable for direct comparison with other unshifted
+  *         values appropriate for use in field <y> of register <x>.
+  *
+  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
+  *         field <y> of register <x>.  This value is suitable for direct
+  *         comparison with unshifted values appropriate for use in field <y>
+  *         of register <x>.
+  */
+
+#ifndef HOST1X_HW_HOST1X02_CHANNEL_H
+#define HOST1X_HW_HOST1X02_CHANNEL_H
+
+static inline u32 host1x_channel_fifostat_r(void)
+{
+	return 0x0;
+}
+#define HOST1X_CHANNEL_FIFOSTAT \
+	host1x_channel_fifostat_r()
+static inline u32 host1x_channel_fifostat_cfempty_v(u32 r)
+{
+	return (r >> 11) & 0x1;
+}
+#define HOST1X_CHANNEL_FIFOSTAT_CFEMPTY_V(r) \
+	host1x_channel_fifostat_cfempty_v(r)
+static inline u32 host1x_channel_dmastart_r(void)
+{
+	return 0x14;
+}
+#define HOST1X_CHANNEL_DMASTART \
+	host1x_channel_dmastart_r()
+static inline u32 host1x_channel_dmaput_r(void)
+{
+	return 0x18;
+}
+#define HOST1X_CHANNEL_DMAPUT \
+	host1x_channel_dmaput_r()
+static inline u32 host1x_channel_dmaget_r(void)
+{
+	return 0x1c;
+}
+#define HOST1X_CHANNEL_DMAGET \
+	host1x_channel_dmaget_r()
+static inline u32 host1x_channel_dmaend_r(void)
+{
+	return 0x20;
+}
+#define HOST1X_CHANNEL_DMAEND \
+	host1x_channel_dmaend_r()
+static inline u32 host1x_channel_dmactrl_r(void)
+{
+	return 0x24;
+}
+#define HOST1X_CHANNEL_DMACTRL \
+	host1x_channel_dmactrl_r()
+static inline u32 host1x_channel_dmactrl_dmastop(void)
+{
+	return 1 << 0;
+}
+#define HOST1X_CHANNEL_DMACTRL_DMASTOP \
+	host1x_channel_dmactrl_dmastop()
+static inline u32 host1x_channel_dmactrl_dmastop_v(u32 r)
+{
+	return (r >> 0) & 0x1;
+}
+#define HOST1X_CHANNEL_DMACTRL_DMASTOP_V(r) \
+	host1x_channel_dmactrl_dmastop_v(r)
+static inline u32 host1x_channel_dmactrl_dmagetrst(void)
+{
+	return 1 << 1;
+}
+#define HOST1X_CHANNEL_DMACTRL_DMAGETRST \
+	host1x_channel_dmactrl_dmagetrst()
+static inline u32 host1x_channel_dmactrl_dmainitget(void)
+{
+	return 1 << 2;
+}
+#define HOST1X_CHANNEL_DMACTRL_DMAINITGET \
+	host1x_channel_dmactrl_dmainitget()
+
+#endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x02_sync.h b/drivers/gpu/host1x/hw/hw_host1x02_sync.h
new file mode 100644
index 0000000..4495401
--- /dev/null
+++ b/drivers/gpu/host1x/hw/hw_host1x02_sync.h
@@ -0,0 +1,243 @@
+/*
+ * Copyright (c) 2013 NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+ /*
+  * Function naming determines intended use:
+  *
+  *     <x>_r(void) : Returns the offset for register <x>.
+  *
+  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
+  *
+  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
+  *
+  *     <x>_<y>_f(u32 v) : Returns a value based on 'v' which has been shifted
+  *         and masked to place it at field <y> of register <x>.  This value
+  *         can be |'d with others to produce a full register value for
+  *         register <x>.
+  *
+  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
+  *         value can be ~'d and then &'d to clear the value of field <y> for
+  *         register <x>.
+  *
+  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
+  *         to place it at field <y> of register <x>.  This value can be |'d
+  *         with others to produce a full register value for <x>.
+  *
+  *     <x>_<y>_v(u32 r) : Returns the value of field <y> from a full register
+  *         <x> value 'r' after being shifted to place its LSB at bit 0.
+  *         This value is suitable for direct comparison with other unshifted
+  *         values appropriate for use in field <y> of register <x>.
+  *
+  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
+  *         field <y> of register <x>.  This value is suitable for direct
+  *         comparison with unshifted values appropriate for use in field <y>
+  *         of register <x>.
+  */
+
+#ifndef HOST1X_HW_HOST1X02_SYNC_H
+#define HOST1X_HW_HOST1X02_SYNC_H
+
+#define REGISTER_STRIDE	4
+
+static inline u32 host1x_sync_syncpt_r(unsigned int id)
+{
+	return 0x400 + id * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_SYNCPT(id) \
+	host1x_sync_syncpt_r(id)
+static inline u32 host1x_sync_syncpt_thresh_cpu0_int_status_r(unsigned int id)
+{
+	return 0x40 + id * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(id) \
+	host1x_sync_syncpt_thresh_cpu0_int_status_r(id)
+static inline u32 host1x_sync_syncpt_thresh_int_disable_r(unsigned int id)
+{
+	return 0x60 + id * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(id) \
+	host1x_sync_syncpt_thresh_int_disable_r(id)
+static inline u32 host1x_sync_syncpt_thresh_int_enable_cpu0_r(unsigned int id)
+{
+	return 0x68 + id * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_SYNCPT_THRESH_INT_ENABLE_CPU0(id) \
+	host1x_sync_syncpt_thresh_int_enable_cpu0_r(id)
+static inline u32 host1x_sync_cf_setup_r(unsigned int channel)
+{
+	return 0x80 + channel * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_CF_SETUP(channel) \
+	host1x_sync_cf_setup_r(channel)
+static inline u32 host1x_sync_cf_setup_base_v(u32 r)
+{
+	return (r >> 0) & 0x3ff;
+}
+#define HOST1X_SYNC_CF_SETUP_BASE_V(r) \
+	host1x_sync_cf_setup_base_v(r)
+static inline u32 host1x_sync_cf_setup_limit_v(u32 r)
+{
+	return (r >> 16) & 0x3ff;
+}
+#define HOST1X_SYNC_CF_SETUP_LIMIT_V(r) \
+	host1x_sync_cf_setup_limit_v(r)
+static inline u32 host1x_sync_cmdproc_stop_r(void)
+{
+	return 0xac;
+}
+#define HOST1X_SYNC_CMDPROC_STOP \
+	host1x_sync_cmdproc_stop_r()
+static inline u32 host1x_sync_ch_teardown_r(void)
+{
+	return 0xb0;
+}
+#define HOST1X_SYNC_CH_TEARDOWN \
+	host1x_sync_ch_teardown_r()
+static inline u32 host1x_sync_usec_clk_r(void)
+{
+	return 0x1a4;
+}
+#define HOST1X_SYNC_USEC_CLK \
+	host1x_sync_usec_clk_r()
+static inline u32 host1x_sync_ctxsw_timeout_cfg_r(void)
+{
+	return 0x1a8;
+}
+#define HOST1X_SYNC_CTXSW_TIMEOUT_CFG \
+	host1x_sync_ctxsw_timeout_cfg_r()
+static inline u32 host1x_sync_ip_busy_timeout_r(void)
+{
+	return 0x1bc;
+}
+#define HOST1X_SYNC_IP_BUSY_TIMEOUT \
+	host1x_sync_ip_busy_timeout_r()
+static inline u32 host1x_sync_mlock_owner_r(unsigned int id)
+{
+	return 0x340 + id * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_MLOCK_OWNER(id) \
+	host1x_sync_mlock_owner_r(id)
+static inline u32 host1x_sync_mlock_owner_chid_f(u32 v)
+{
+	return (v & 0xf) << 8;
+}
+#define HOST1X_SYNC_MLOCK_OWNER_CHID_F(v) \
+	host1x_sync_mlock_owner_chid_f(v)
+static inline u32 host1x_sync_mlock_owner_cpu_owns_v(u32 r)
+{
+	return (r >> 1) & 0x1;
+}
+#define HOST1X_SYNC_MLOCK_OWNER_CPU_OWNS_V(r) \
+	host1x_sync_mlock_owner_cpu_owns_v(r)
+static inline u32 host1x_sync_mlock_owner_ch_owns_v(u32 r)
+{
+	return (r >> 0) & 0x1;
+}
+#define HOST1X_SYNC_MLOCK_OWNER_CH_OWNS_V(r) \
+	host1x_sync_mlock_owner_ch_owns_v(r)
+static inline u32 host1x_sync_syncpt_int_thresh_r(unsigned int id)
+{
+	return 0x500 + id * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_SYNCPT_INT_THRESH(id) \
+	host1x_sync_syncpt_int_thresh_r(id)
+static inline u32 host1x_sync_syncpt_base_r(unsigned int id)
+{
+	return 0x600 + id * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_SYNCPT_BASE(id) \
+	host1x_sync_syncpt_base_r(id)
+static inline u32 host1x_sync_syncpt_cpu_incr_r(unsigned int id)
+{
+	return 0x700 + id * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_SYNCPT_CPU_INCR(id) \
+	host1x_sync_syncpt_cpu_incr_r(id)
+static inline u32 host1x_sync_cbread_r(unsigned int channel)
+{
+	return 0x720 + channel * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_CBREAD(channel) \
+	host1x_sync_cbread_r(channel)
+static inline u32 host1x_sync_cfpeek_ctrl_r(void)
+{
+	return 0x74c;
+}
+#define HOST1X_SYNC_CFPEEK_CTRL \
+	host1x_sync_cfpeek_ctrl_r()
+static inline u32 host1x_sync_cfpeek_ctrl_addr_f(u32 v)
+{
+	return (v & 0x3ff) << 0;
+}
+#define HOST1X_SYNC_CFPEEK_CTRL_ADDR_F(v) \
+	host1x_sync_cfpeek_ctrl_addr_f(v)
+static inline u32 host1x_sync_cfpeek_ctrl_channr_f(u32 v)
+{
+	return (v & 0xf) << 16;
+}
+#define HOST1X_SYNC_CFPEEK_CTRL_CHANNR_F(v) \
+	host1x_sync_cfpeek_ctrl_channr_f(v)
+static inline u32 host1x_sync_cfpeek_ctrl_ena_f(u32 v)
+{
+	return (v & 0x1) << 31;
+}
+#define HOST1X_SYNC_CFPEEK_CTRL_ENA_F(v) \
+	host1x_sync_cfpeek_ctrl_ena_f(v)
+static inline u32 host1x_sync_cfpeek_read_r(void)
+{
+	return 0x750;
+}
+#define HOST1X_SYNC_CFPEEK_READ \
+	host1x_sync_cfpeek_read_r()
+static inline u32 host1x_sync_cfpeek_ptrs_r(void)
+{
+	return 0x754;
+}
+#define HOST1X_SYNC_CFPEEK_PTRS \
+	host1x_sync_cfpeek_ptrs_r()
+static inline u32 host1x_sync_cfpeek_ptrs_cf_rd_ptr_v(u32 r)
+{
+	return (r >> 0) & 0x3ff;
+}
+#define HOST1X_SYNC_CFPEEK_PTRS_CF_RD_PTR_V(r) \
+	host1x_sync_cfpeek_ptrs_cf_rd_ptr_v(r)
+static inline u32 host1x_sync_cfpeek_ptrs_cf_wr_ptr_v(u32 r)
+{
+	return (r >> 16) & 0x3ff;
+}
+#define HOST1X_SYNC_CFPEEK_PTRS_CF_WR_PTR_V(r) \
+	host1x_sync_cfpeek_ptrs_cf_wr_ptr_v(r)
+static inline u32 host1x_sync_cbstat_r(unsigned int channel)
+{
+	return 0x758 + channel * REGISTER_STRIDE;
+}
+#define HOST1X_SYNC_CBSTAT(channel) \
+	host1x_sync_cbstat_r(channel)
+static inline u32 host1x_sync_cbstat_cboffset_v(u32 r)
+{
+	return (r >> 0) & 0xffff;
+}
+#define HOST1X_SYNC_CBSTAT_CBOFFSET_V(r) \
+	host1x_sync_cbstat_cboffset_v(r)
+static inline u32 host1x_sync_cbstat_cbclass_v(u32 r)
+{
+	return (r >> 16) & 0x3ff;
+}
+#define HOST1X_SYNC_CBSTAT_CBCLASS_V(r) \
+	host1x_sync_cbstat_cbclass_v(r)
+
+#endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x02_uclass.h b/drivers/gpu/host1x/hw/hw_host1x02_uclass.h
new file mode 100644
index 0000000..a3b3c98
--- /dev/null
+++ b/drivers/gpu/host1x/hw/hw_host1x02_uclass.h
@@ -0,0 +1,175 @@
+/*
+ * Copyright (c) 2013 NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+ /*
+  * Function naming determines intended use:
+  *
+  *     <x>_r(void) : Returns the offset for register <x>.
+  *
+  *     <x>_w(void) : Returns the word offset for word (4 byte) element <x>.
+  *
+  *     <x>_<y>_s(void) : Returns size of field <y> of register <x> in bits.
+  *
+  *     <x>_<y>_f(u32 v) : Returns a value based on 'v' which has been shifted
+  *         and masked to place it at field <y> of register <x>.  This value
+  *         can be |'d with others to produce a full register value for
+  *         register <x>.
+  *
+  *     <x>_<y>_m(void) : Returns a mask for field <y> of register <x>.  This
+  *         value can be ~'d and then &'d to clear the value of field <y> for
+  *         register <x>.
+  *
+  *     <x>_<y>_<z>_f(void) : Returns the constant value <z> after being shifted
+  *         to place it at field <y> of register <x>.  This value can be |'d
+  *         with others to produce a full register value for <x>.
+  *
+  *     <x>_<y>_v(u32 r) : Returns the value of field <y> from a full register
+  *         <x> value 'r' after being shifted to place its LSB at bit 0.
+  *         This value is suitable for direct comparison with other unshifted
+  *         values appropriate for use in field <y> of register <x>.
+  *
+  *     <x>_<y>_<z>_v(void) : Returns the constant value for <z> defined for
+  *         field <y> of register <x>.  This value is suitable for direct
+  *         comparison with unshifted values appropriate for use in field <y>
+  *         of register <x>.
+  */
+
+#ifndef HOST1X_HW_HOST1X02_UCLASS_H
+#define HOST1X_HW_HOST1X02_UCLASS_H
+
+static inline u32 host1x_uclass_incr_syncpt_r(void)
+{
+	return 0x0;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT \
+	host1x_uclass_incr_syncpt_r()
+static inline u32 host1x_uclass_incr_syncpt_cond_f(u32 v)
+{
+	return (v & 0xff) << 8;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT_COND_F(v) \
+	host1x_uclass_incr_syncpt_cond_f(v)
+static inline u32 host1x_uclass_incr_syncpt_indx_f(u32 v)
+{
+	return (v & 0xff) << 0;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT_INDX_F(v) \
+	host1x_uclass_incr_syncpt_indx_f(v)
+static inline u32 host1x_uclass_wait_syncpt_r(void)
+{
+	return 0x8;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT \
+	host1x_uclass_wait_syncpt_r()
+static inline u32 host1x_uclass_wait_syncpt_indx_f(u32 v)
+{
+	return (v & 0xff) << 24;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_INDX_F(v) \
+	host1x_uclass_wait_syncpt_indx_f(v)
+static inline u32 host1x_uclass_wait_syncpt_thresh_f(u32 v)
+{
+	return (v & 0xffffff) << 0;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_THRESH_F(v) \
+	host1x_uclass_wait_syncpt_thresh_f(v)
+static inline u32 host1x_uclass_wait_syncpt_base_r(void)
+{
+	return 0x9;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_BASE \
+	host1x_uclass_wait_syncpt_base_r()
+static inline u32 host1x_uclass_wait_syncpt_base_indx_f(u32 v)
+{
+	return (v & 0xff) << 24;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_BASE_INDX_F(v) \
+	host1x_uclass_wait_syncpt_base_indx_f(v)
+static inline u32 host1x_uclass_wait_syncpt_base_base_indx_f(u32 v)
+{
+	return (v & 0xff) << 16;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_BASE_BASE_INDX_F(v) \
+	host1x_uclass_wait_syncpt_base_base_indx_f(v)
+static inline u32 host1x_uclass_wait_syncpt_base_offset_f(u32 v)
+{
+	return (v & 0xffff) << 0;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_BASE_OFFSET_F(v) \
+	host1x_uclass_wait_syncpt_base_offset_f(v)
+static inline u32 host1x_uclass_load_syncpt_base_base_indx_f(u32 v)
+{
+	return (v & 0xff) << 24;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_BASE_BASE_INDX_F(v) \
+	host1x_uclass_load_syncpt_base_base_indx_f(v)
+static inline u32 host1x_uclass_load_syncpt_base_value_f(u32 v)
+{
+	return (v & 0xffffff) << 0;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_BASE_VALUE_F(v) \
+	host1x_uclass_load_syncpt_base_value_f(v)
+static inline u32 host1x_uclass_incr_syncpt_base_base_indx_f(u32 v)
+{
+	return (v & 0xff) << 24;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT_BASE_BASE_INDX_F(v) \
+	host1x_uclass_incr_syncpt_base_base_indx_f(v)
+static inline u32 host1x_uclass_incr_syncpt_base_offset_f(u32 v)
+{
+	return (v & 0xffffff) << 0;
+}
+#define HOST1X_UCLASS_INCR_SYNCPT_BASE_OFFSET_F(v) \
+	host1x_uclass_incr_syncpt_base_offset_f(v)
+static inline u32 host1x_uclass_indoff_r(void)
+{
+	return 0x2d;
+}
+#define HOST1X_UCLASS_INDOFF \
+	host1x_uclass_indoff_r()
+static inline u32 host1x_uclass_indoff_indbe_f(u32 v)
+{
+	return (v & 0xf) << 28;
+}
+#define HOST1X_UCLASS_INDOFF_INDBE_F(v) \
+	host1x_uclass_indoff_indbe_f(v)
+static inline u32 host1x_uclass_indoff_autoinc_f(u32 v)
+{
+	return (v & 0x1) << 27;
+}
+#define HOST1X_UCLASS_INDOFF_AUTOINC_F(v) \
+	host1x_uclass_indoff_autoinc_f(v)
+static inline u32 host1x_uclass_indoff_indmodid_f(u32 v)
+{
+	return (v & 0xff) << 18;
+}
+#define HOST1X_UCLASS_INDOFF_INDMODID_F(v) \
+	host1x_uclass_indoff_indmodid_f(v)
+static inline u32 host1x_uclass_indoff_indroffset_f(u32 v)
+{
+	return (v & 0xffff) << 2;
+}
+#define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
+	host1x_uclass_indoff_indroffset_f(v)
+static inline u32 host1x_uclass_indoff_rwn_read_v(void)
+{
+	return 1;
+}
+#define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
+	host1x_uclass_indoff_indroffset_f(v)
+
+#endif
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
