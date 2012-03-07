From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 5/9] tegra: i2c: Add I2C driver
Date: Tue,  6 Mar 2012 21:00:23 -0800
Message-ID: <1331096428-6317-6-git-send-email-sjg@chromium.org>
References: <1331096428-6317-5-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331096428-6317-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add basic i2c driver for Tegra2 with 8- and 16-bit address support.
The driver requires CONFIG_OF_CONTROL to obtain its configuration
from the device tree.

(Simon Glass: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org modified for upstream)

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Adjust definitions to fit new peripheral clock bindings
- Change i2c array to static
- Make i2c/dvc decision come from fdt
- Remove i2c configuring using CONFIG (use fdt instead)
- Return an error if an unavailable i2c bus is selected
- Simplify code in i2c_addr_ok()
- Tidy comment style
- Use DIV_ROUND_UP() instead of a home-grown macro
- Use new fdtdec alias decode function

Changes in v3:
- Add TEGRA_I2C_NUM_CONTROLLERS to select number of I2C ports
- Add comment on how to select pinmux for I2C2
- Change i2c_init() to reset speed and override the fdt setting
- Fix i2c_addr_ok() function to check addresses correctly
- Rename driver to tegra_i2c since it will later be shared with Tegra3
- Tidy up I2C speed selection to use the peripheral clock

Changes in v4:
- Update to use new clock_fdecode_periph_id() function

Changes in v5:
- #include i2c.h in i2c driver
- Fix #include file order in i2c driver
- Fix i2c driver header guard nit
- Fix i2c_init_board() function signature
- Fix style nit on send_recv_packets()
- Remove I2C_ADDR_ON_BUS() macro which isn't really needed
- Update i2c driver copyright to 2012

 arch/arm/include/asm/arch-tegra2/tegra_i2c.h |  157 +++++++
 drivers/i2c/Makefile                         |    1 +
 drivers/i2c/tegra_i2c.c                      |  569 ++++++++++++++++++++++++++
 include/fdtdec.h                             |    2 +
 lib/fdtdec.c                                 |    2 +
 5 files changed, 731 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-tegra2/tegra_i2c.h
 create mode 100644 drivers/i2c/tegra_i2c.c

diff --git a/arch/arm/include/asm/arch-tegra2/tegra_i2c.h b/arch/arm/include/asm/arch-tegra2/tegra_i2c.h
new file mode 100644
index 0000000..0a7d99c
--- /dev/null
+++ b/arch/arm/include/asm/arch-tegra2/tegra_i2c.h
@@ -0,0 +1,157 @@
+/*
+ * NVIDIA Tegra2 I2C controller
+ *
+ * Copyright 2010-2011 NVIDIA Corporation
+ *
+ * This software may be used and distributed according to the
+ * terms of the GNU Public License, Version 2, incorporated
+ * herein by reference.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * Version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#ifndef _TEGRA_I2C_H_
+#define _TEGRA_I2C_H_
+
+#include <asm/types.h>
+
+enum {
+	I2C_TIMEOUT_USEC = 10000,	/* Wait time for completion */
+	I2C_FIFO_DEPTH = 8,		/* I2C fifo depth */
+};
+
+enum i2c_transaction_flags {
+	I2C_IS_WRITE = 0x1,		/* for I2C write operation */
+	I2C_IS_10_BIT_ADDRESS = 0x2,	/* for 10-bit I2C slave address */
+	I2C_USE_REPEATED_START = 0x4,	/* for repeat start */
+	I2C_NO_ACK = 0x8,		/* for slave that won't generate ACK */
+	I2C_SOFTWARE_CONTROLLER	= 0x10,	/* for I2C transfer using GPIO */
+	I2C_NO_STOP = 0x20,
+};
+
+/* Contians the I2C transaction details */
+struct i2c_trans_info {
+	/* flags to indicate the transaction details */
+	enum i2c_transaction_flags flags;
+	u32 address;	/* I2C slave device address */
+	u32 num_bytes;	/* number of bytes to be transferred */
+	/*
+	 * Send/receive buffer. For the I2C send operation this buffer should
+	 * be filled with the data to be sent to the slave device. For the I2C
+	 * receive operation this buffer is filled with the data received from
+	 * the slave device.
+	 */
+	u8 *buf;
+	int is_10bit_address;
+};
+
+struct i2c_control {
+	u32 tx_fifo;
+	u32 rx_fifo;
+	u32 packet_status;
+	u32 fifo_control;
+	u32 fifo_status;
+	u32 int_mask;
+	u32 int_status;
+};
+
+struct dvc_ctlr {
+	u32 ctrl1;			/* 00: DVC_CTRL_REG1 */
+	u32 ctrl2;			/* 04: DVC_CTRL_REG2 */
+	u32 ctrl3;			/* 08: DVC_CTRL_REG3 */
+	u32 status;			/* 0C: DVC_STATUS_REG */
+	u32 ctrl;			/* 10: DVC_I2C_CTRL_REG */
+	u32 addr_data;			/* 14: DVC_I2C_ADDR_DATA_REG */
+	u32 reserved_0[2];		/* 18: */
+	u32 req;			/* 20: DVC_REQ_REGISTER */
+	u32 addr_data3;			/* 24: DVC_I2C_ADDR_DATA_REG_3 */
+	u32 reserved_1[6];		/* 28: */
+	u32 cnfg;			/* 40: DVC_I2C_CNFG */
+	u32 cmd_addr0;			/* 44: DVC_I2C_CMD_ADDR0 */
+	u32 cmd_addr1;			/* 48: DVC_I2C_CMD_ADDR1 */
+	u32 cmd_data1;			/* 4C: DVC_I2C_CMD_DATA1 */
+	u32 cmd_data2;			/* 50: DVC_I2C_CMD_DATA2 */
+	u32 reserved_2[2];		/* 54: */
+	u32 i2c_status;			/* 5C: DVC_I2C_STATUS */
+	struct i2c_control control;	/* 60 ~ 78 */
+};
+
+struct i2c_ctlr {
+	u32 cnfg;			/* 00: I2C_I2C_CNFG */
+	u32 cmd_addr0;			/* 04: I2C_I2C_CMD_ADDR0 */
+	u32 cmd_addr1;			/* 08: I2C_I2C_CMD_DATA1 */
+	u32 cmd_data1;			/* 0C: I2C_I2C_CMD_DATA2 */
+	u32 cmd_data2;			/* 10: DVC_I2C_CMD_DATA2 */
+	u32 reserved_0[2];		/* 14: */
+	u32 status;			/* 1C: I2C_I2C_STATUS */
+	u32 sl_cnfg;			/* 20: I2C_I2C_SL_CNFG */
+	u32 sl_rcvd;			/* 24: I2C_I2C_SL_RCVD */
+	u32 sl_status;			/* 28: I2C_I2C_SL_STATUS */
+	u32 sl_addr1;			/* 2C: I2C_I2C_SL_ADDR1 */
+	u32 sl_addr2;			/* 30: I2C_I2C_SL_ADDR2 */
+	u32 reserved_1[2];		/* 34: */
+	u32 sl_delay_count;		/* 3C: I2C_I2C_SL_DELAY_COUNT */
+	u32 reserved_2[4];		/* 40: */
+	struct i2c_control control;	/* 50 ~ 68 */
+};
+
+/* bit fields definitions for IO Packet Header 1 format */
+#define PKT_HDR1_PROTOCOL_SHIFT		4
+#define PKT_HDR1_PROTOCOL_MASK		(0xf << PKT_HDR1_PROTOCOL_SHIFT)
+#define PKT_HDR1_CTLR_ID_SHIFT		12
+#define PKT_HDR1_CTLR_ID_MASK		(0xf << PKT_HDR1_CTLR_ID_SHIFT)
+#define PKT_HDR1_PKT_ID_SHIFT		16
+#define PKT_HDR1_PKT_ID_MASK		(0xff << PKT_HDR1_PKT_ID_SHIFT)
+#define PROTOCOL_TYPE_I2C		1
+
+/* bit fields definitions for IO Packet Header 2 format */
+#define PKT_HDR2_PAYLOAD_SIZE_SHIFT	0
+#define PKT_HDR2_PAYLOAD_SIZE_MASK	(0xfff << PKT_HDR2_PAYLOAD_SIZE_SHIFT)
+
+/* bit fields definitions for IO Packet Header 3 format */
+#define PKT_HDR3_READ_MODE_SHIFT	19
+#define PKT_HDR3_READ_MODE_MASK		(1 << PKT_HDR3_READ_MODE_SHIFT)
+#define PKT_HDR3_SLAVE_ADDR_SHIFT	0
+#define PKT_HDR3_SLAVE_ADDR_MASK	(0x3ff << PKT_HDR3_SLAVE_ADDR_SHIFT)
+
+#define DVC_CTRL_REG3_I2C_HW_SW_PROG_SHIFT	26
+#define DVC_CTRL_REG3_I2C_HW_SW_PROG_MASK	\
+				(1 << DVC_CTRL_REG3_I2C_HW_SW_PROG_SHIFT)
+
+/* I2C_CNFG */
+#define I2C_CNFG_NEW_MASTER_FSM_SHIFT	11
+#define I2C_CNFG_NEW_MASTER_FSM_MASK	(1 << I2C_CNFG_NEW_MASTER_FSM_SHIFT)
+#define I2C_CNFG_PACKET_MODE_SHIFT	10
+#define I2C_CNFG_PACKET_MODE_MASK	(1 << I2C_CNFG_PACKET_MODE_SHIFT)
+
+/* I2C_SL_CNFG */
+#define I2C_SL_CNFG_NEWSL_SHIFT		2
+#define I2C_SL_CNFG_NEWSL_MASK		(1 << I2C_SL_CNFG_NEWSL_SHIFT)
+
+/* I2C_FIFO_STATUS */
+#define TX_FIFO_FULL_CNT_SHIFT		0
+#define TX_FIFO_FULL_CNT_MASK		(0xf << TX_FIFO_FULL_CNT_SHIFT)
+#define TX_FIFO_EMPTY_CNT_SHIFT		4
+#define TX_FIFO_EMPTY_CNT_MASK		(0xf << TX_FIFO_EMPTY_CNT_SHIFT)
+
+/* I2C_INTERRUPT_STATUS */
+#define I2C_INT_XFER_COMPLETE_SHIFT	7
+#define I2C_INT_XFER_COMPLETE_MASK	(1 << I2C_INT_XFER_COMPLETE_SHIFT)
+#define I2C_INT_NO_ACK_SHIFT		3
+#define I2C_INT_NO_ACK_MASK		(1 << I2C_INT_NO_ACK_SHIFT)
+#define I2C_INT_ARBITRATION_LOST_SHIFT	2
+#define I2C_INT_ARBITRATION_LOST_MASK	(1 << I2C_INT_ARBITRATION_LOST_SHIFT)
+
+#endif
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 504db03..f86e46c 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -41,6 +41,7 @@ COBJS-$(CONFIG_DRIVER_S3C24X0_I2C) += s3c24x0_i2c.o
 COBJS-$(CONFIG_S3C44B0_I2C) += s3c44b0_i2c.o
 COBJS-$(CONFIG_SOFT_I2C) += soft_i2c.o
 COBJS-$(CONFIG_SPEAR_I2C) += spr_i2c.o
+COBJS-$(CONFIG_TEGRA_I2C) += tegra_i2c.o
 COBJS-$(CONFIG_TSI108_I2C) += tsi108_i2c.o
 COBJS-$(CONFIG_U8500_I2C) += u8500_i2c.o
 COBJS-$(CONFIG_SH_I2C) += sh_i2c.o
diff --git a/drivers/i2c/tegra_i2c.c b/drivers/i2c/tegra_i2c.c
new file mode 100644
index 0000000..21f6897
--- /dev/null
+++ b/drivers/i2c/tegra_i2c.c
@@ -0,0 +1,569 @@
+/*
+ * Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
+ * Copyright (c) 2010-2011 NVIDIA Corporation
+ *  NVIDIA Corporation <www.nvidia.com>
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#include <common.h>
+#include <fdtdec.h>
+#include <i2c.h>
+#include <asm/io.h>
+#include <asm/arch/clk_rst.h>
+#include <asm/arch/clock.h>
+#include <asm/arch/funcmux.h>
+#include <asm/arch/gpio.h>
+#include <asm/arch/pinmux.h>
+#include <asm/arch/tegra_i2c.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+static unsigned int i2c_bus_num;
+
+/* Information about i2c controller */
+struct i2c_bus {
+	int			id;
+	enum periph_id		periph_id;
+	int			speed;
+	int			pinmux_config;
+	struct i2c_control	*control;
+	struct i2c_ctlr		*regs;
+	int			is_dvc;	/* DVC type, rather than I2C */
+	int			inited;	/* bus is inited */
+};
+
+static struct i2c_bus i2c_controllers[TEGRA_I2C_NUM_CONTROLLERS];
+
+static void set_packet_mode(struct i2c_bus *i2c_bus)
+{
+	u32 config;
+
+	config = I2C_CNFG_NEW_MASTER_FSM_MASK | I2C_CNFG_PACKET_MODE_MASK;
+
+	if (i2c_bus->is_dvc) {
+		struct dvc_ctlr *dvc = (struct dvc_ctlr *)i2c_bus->regs;
+
+		writel(config, &dvc->cnfg);
+	} else {
+		writel(config, &i2c_bus->regs->cnfg);
+		/*
+		 * program I2C_SL_CNFG.NEWSL to ENABLE. This fixes probe
+		 * issues, i.e., some slaves may be wrongly detected.
+		 */
+		setbits_le32(&i2c_bus->regs->sl_cnfg, I2C_SL_CNFG_NEWSL_MASK);
+	}
+}
+
+static void i2c_reset_controller(struct i2c_bus *i2c_bus)
+{
+	/* Reset I2C controller. */
+	reset_periph(i2c_bus->periph_id, 1);
+
+	/* re-program config register to packet mode */
+	set_packet_mode(i2c_bus);
+}
+
+static void i2c_init_controller(struct i2c_bus *i2c_bus)
+{
+	/*
+	 * Use PLLP - DP-04508-001_v06 datasheet indicates a divisor of 8
+	 * here, in section 23.3.1, but in fact we seem to need a factor of
+	 * 16 to get the right frequency.
+	 */
+	clock_start_periph_pll(i2c_bus->periph_id, CLOCK_ID_PERIPH,
+			       i2c_bus->speed * 2 * 8);
+
+	/* Reset I2C controller. */
+	i2c_reset_controller(i2c_bus);
+
+	/* Configure I2C controller. */
+	if (i2c_bus->is_dvc) {	/* only for DVC I2C */
+		struct dvc_ctlr *dvc = (struct dvc_ctlr *)i2c_bus->regs;
+
+		setbits_le32(&dvc->ctrl3, DVC_CTRL_REG3_I2C_HW_SW_PROG_MASK);
+	}
+
+	funcmux_select(i2c_bus->periph_id, i2c_bus->pinmux_config);
+}
+
+static void send_packet_headers(
+	struct i2c_bus *i2c_bus,
+	struct i2c_trans_info *trans,
+	u32 packet_id)
+{
+	u32 data;
+
+	/* prepare header1: Header size = 0 Protocol = I2C, pktType = 0 */
+	data = PROTOCOL_TYPE_I2C << PKT_HDR1_PROTOCOL_SHIFT;
+	data |= packet_id << PKT_HDR1_PKT_ID_SHIFT;
+	data |= i2c_bus->id << PKT_HDR1_CTLR_ID_SHIFT;
+	writel(data, &i2c_bus->control->tx_fifo);
+	debug("pkt header 1 sent (0x%x)\n", data);
+
+	/* prepare header2 */
+	data = (trans->num_bytes - 1) << PKT_HDR2_PAYLOAD_SIZE_SHIFT;
+	writel(data, &i2c_bus->control->tx_fifo);
+	debug("pkt header 2 sent (0x%x)\n", data);
+
+	/* prepare IO specific header: configure the slave address */
+	data = trans->address << PKT_HDR3_SLAVE_ADDR_SHIFT;
+
+	/* Enable Read if it is not a write transaction */
+	if (!(trans->flags & I2C_IS_WRITE))
+		data |= PKT_HDR3_READ_MODE_MASK;
+
+	/* Write I2C specific header */
+	writel(data, &i2c_bus->control->tx_fifo);
+	debug("pkt header 3 sent (0x%x)\n", data);
+}
+
+static int wait_for_tx_fifo_empty(struct i2c_control *control)
+{
+	u32 count;
+	int timeout_us = I2C_TIMEOUT_USEC;
+
+	while (timeout_us >= 0) {
+		count = (readl(&control->fifo_status) & TX_FIFO_EMPTY_CNT_MASK)
+				>> TX_FIFO_EMPTY_CNT_SHIFT;
+		if (count == I2C_FIFO_DEPTH)
+			return 1;
+		udelay(10);
+		timeout_us -= 10;
+	}
+
+	return 0;
+}
+
+static int wait_for_rx_fifo_notempty(struct i2c_control *control)
+{
+	u32 count;
+	int timeout_us = I2C_TIMEOUT_USEC;
+
+	while (timeout_us >= 0) {
+		count = (readl(&control->fifo_status) & TX_FIFO_FULL_CNT_MASK)
+				>> TX_FIFO_FULL_CNT_SHIFT;
+		if (count)
+			return 1;
+		udelay(10);
+		timeout_us -= 10;
+	}
+
+	return 0;
+}
+
+static int wait_for_transfer_complete(struct i2c_control *control)
+{
+	int int_status;
+	int timeout_us = I2C_TIMEOUT_USEC;
+
+	while (timeout_us >= 0) {
+		int_status = readl(&control->int_status);
+		if (int_status & I2C_INT_NO_ACK_MASK)
+			return -int_status;
+		if (int_status & I2C_INT_ARBITRATION_LOST_MASK)
+			return -int_status;
+		if (int_status & I2C_INT_XFER_COMPLETE_MASK)
+			return 0;
+
+		udelay(10);
+		timeout_us -= 10;
+	}
+
+	return -1;
+}
+
+static int send_recv_packets(struct i2c_bus *i2c_bus,
+			     struct i2c_trans_info *trans)
+{
+	struct i2c_control *control = i2c_bus->control;
+	u32 int_status;
+	u32 words;
+	u8 *dptr;
+	u32 local;
+	uchar last_bytes;
+	int error = 0;
+	int is_write = trans->flags & I2C_IS_WRITE;
+
+	/* clear status from previous transaction, XFER_COMPLETE, NOACK, etc. */
+	int_status = readl(&control->int_status);
+	writel(int_status, &control->int_status);
+
+	send_packet_headers(i2c_bus, trans, 1);
+
+	words = DIV_ROUND_UP(trans->num_bytes, 4);
+	last_bytes = trans->num_bytes & 3;
+	dptr = trans->buf;
+
+	while (words) {
+		u32 *wptr = (u32 *)dptr;
+
+		if (is_write) {
+			/* deal with word alignment */
+			if ((unsigned)dptr & 3) {
+				memcpy(&local, dptr, sizeof(u32));
+				writel(local, &control->tx_fifo);
+				debug("pkt data sent (0x%x)\n", local);
+			} else {
+				writel(*wptr, &control->tx_fifo);
+				debug("pkt data sent (0x%x)\n", *wptr);
+			}
+			if (!wait_for_tx_fifo_empty(control)) {
+				error = -1;
+				goto exit;
+			}
+		} else {
+			if (!wait_for_rx_fifo_notempty(control)) {
+				error = -1;
+				goto exit;
+			}
+			/*
+			 * for the last word, we read into our local buffer,
+			 * in case that caller did not provide enough buffer.
+			 */
+			local = readl(&control->rx_fifo);
+			if ((words == 1) && last_bytes)
+				memcpy(dptr, (char *)&local, last_bytes);
+			else if ((unsigned)dptr & 3)
+				memcpy(dptr, &local, sizeof(u32));
+			else
+				*wptr = local;
+			debug("pkt data received (0x%x)\n", local);
+		}
+		words--;
+		dptr += sizeof(u32);
+	}
+
+	if (wait_for_transfer_complete(control)) {
+		error = -1;
+		goto exit;
+	}
+	return 0;
+exit:
+	/* error, reset the controller. */
+	i2c_reset_controller(i2c_bus);
+
+	return error;
+}
+
+static int tegra2_i2c_write_data(u32 addr, u8 *data, u32 len)
+{
+	int error;
+	struct i2c_trans_info trans_info;
+
+	trans_info.address = addr;
+	trans_info.buf = data;
+	trans_info.flags = I2C_IS_WRITE;
+	trans_info.num_bytes = len;
+	trans_info.is_10bit_address = 0;
+
+	error = send_recv_packets(&i2c_controllers[i2c_bus_num], &trans_info);
+	if (error)
+		debug("tegra2_i2c_write_data: Error (%d) !!!\n", error);
+
+	return error;
+}
+
+static int tegra2_i2c_read_data(u32 addr, u8 *data, u32 len)
+{
+	int error;
+	struct i2c_trans_info trans_info;
+
+	trans_info.address = addr | 1;
+	trans_info.buf = data;
+	trans_info.flags = 0;
+	trans_info.num_bytes = len;
+	trans_info.is_10bit_address = 0;
+
+	error = send_recv_packets(&i2c_controllers[i2c_bus_num], &trans_info);
+	if (error)
+		debug("tegra2_i2c_read_data: Error (%d) !!!\n", error);
+
+	return error;
+}
+
+#ifndef CONFIG_OF_CONTROL
+#error "Please enable device tree support to use this driver"
+#endif
+
+unsigned int i2c_get_bus_speed(void)
+{
+	return i2c_controllers[i2c_bus_num].speed;
+}
+
+int i2c_set_bus_speed(unsigned int speed)
+{
+	struct i2c_bus *i2c_bus;
+
+	i2c_bus = &i2c_controllers[i2c_bus_num];
+	i2c_bus->speed = speed;
+	i2c_init_controller(i2c_bus);
+
+	return 0;
+}
+
+static int i2c_get_config(const void *blob, int node, struct i2c_bus *i2c_bus)
+{
+	i2c_bus->regs = (struct i2c_ctlr *)fdtdec_get_addr(blob, node, "reg");
+
+	/*
+	 * We don't have a binding for pinmux yet. Leave it out for now. So
+	 * far no one needs anything other than the default.
+	 */
+	i2c_bus->pinmux_config = FUNCMUX_DEFAULT;
+	i2c_bus->speed = fdtdec_get_int(blob, node, "clock-frequency", 0);
+	i2c_bus->periph_id = clock_decode_periph_id(blob, node);
+
+	/*
+	 * We can't specify the pinmux config in the fdt, so I2C2 will not
+	 * work on Seaboard. It normally has no devices on it anyway.
+	 * You could add in this little hack if you need to use it.
+	 * The correct solution is a pinmux binding in the fdt.
+	 *
+	 *	if (i2c_bus->periph_id == PERIPH_ID_I2C2)
+	 *		i2c_bus->pinmux_config = FUNCMUX_I2C2_PTA;
+	 */
+	if (i2c_bus->periph_id == -1)
+		return -FDT_ERR_NOTFOUND;
+
+	return 0;
+}
+
+/*
+ * Process a list of nodes, adding them to our list of I2C ports.
+ *
+ * @param blob		fdt blob
+ * @param node_list	list of nodes to process (any <=0 are ignored)
+ * @param count		number of nodes to process
+ * @param is_dvc	1 if these are DVC ports, 0 if standard I2C
+ * @return 0 if ok, -1 on error
+ */
+static int process_nodes(const void *blob, int node_list[], int count,
+			 int is_dvc)
+{
+	struct i2c_bus *i2c_bus;
+	int i;
+
+	/* build the i2c_controllers[] for each controller */
+	for (i = 0; i < count; i++) {
+		int node = node_list[i];
+
+		if (node <= 0)
+			continue;
+
+		i2c_bus = &i2c_controllers[i];
+		i2c_bus->id = i;
+
+		if (i2c_get_config(blob, node, i2c_bus)) {
+			printf("i2c_init_board: failed to decode bus %d\n", i);
+			return -1;
+		}
+
+		i2c_bus->is_dvc = is_dvc;
+		if (is_dvc) {
+			i2c_bus->control =
+				&((struct dvc_ctlr *)i2c_bus->regs)->control;
+		} else {
+			i2c_bus->control = &i2c_bus->regs->control;
+		}
+		debug("%s: controller bus %d at %p, periph_id %d, speed %d: ",
+		      is_dvc ? "dvc" : "i2c", i, i2c_bus->regs,
+		      i2c_bus->periph_id, i2c_bus->speed);
+		i2c_init_controller(i2c_bus);
+		debug("ok\n");
+		i2c_bus->inited = 1;
+
+		/* Mark position as used */
+		node_list[i] = -1;
+	}
+
+	return 0;
+}
+
+/* Sadly there is no error return from this function */
+void i2c_init_board(void)
+{
+	int node_list[TEGRA_I2C_NUM_CONTROLLERS];
+	const void *blob = gd->fdt_blob;
+	int count;
+
+	/* First get the normal i2c ports */
+	count = fdtdec_find_aliases_for_id(blob, "i2c",
+			COMPAT_NVIDIA_TEGRA20_I2C, node_list,
+			TEGRA_I2C_NUM_CONTROLLERS);
+	if (process_nodes(blob, node_list, count, 0))
+		return;
+
+	/* Now look for dvc ports */
+	count = fdtdec_add_aliases_for_id(blob, "i2c",
+			COMPAT_NVIDIA_TEGRA20_DVC, node_list,
+			TEGRA_I2C_NUM_CONTROLLERS);
+	if (process_nodes(blob, node_list, count, 1))
+		return;
+}
+
+void i2c_init(int speed, int slaveaddr)
+{
+	/* This will override the speed selected in the fdt for that port */
+	debug("i2c_init(speed=%u, slaveaddr=0x%x)\n", speed, slaveaddr);
+	i2c_set_bus_speed(speed);
+}
+
+/* i2c write version without the register address */
+int i2c_write_data(uchar chip, uchar *buffer, int len)
+{
+	int rc;
+
+	debug("i2c_write_data: chip=0x%x, len=0x%x\n", chip, len);
+	debug("write_data: ");
+	/* use rc for counter */
+	for (rc = 0; rc < len; ++rc)
+		debug(" 0x%02x", buffer[rc]);
+	debug("\n");
+
+	/* Shift 7-bit address over for lower-level i2c functions */
+	rc = tegra2_i2c_write_data(chip << 1, buffer, len);
+	if (rc)
+		debug("i2c_write_data(): rc=%d\n", rc);
+
+	return rc;
+}
+
+/* i2c read version without the register address */
+int i2c_read_data(uchar chip, uchar *buffer, int len)
+{
+	int rc;
+
+	debug("inside i2c_read_data():\n");
+	/* Shift 7-bit address over for lower-level i2c functions */
+	rc = tegra2_i2c_read_data(chip << 1, buffer, len);
+	if (rc) {
+		debug("i2c_read_data(): rc=%d\n", rc);
+		return rc;
+	}
+
+	debug("i2c_read_data: ");
+	/* reuse rc for counter*/
+	for (rc = 0; rc < len; ++rc)
+		debug(" 0x%02x", buffer[rc]);
+	debug("\n");
+
+	return 0;
+}
+
+/* Probe to see if a chip is present. */
+int i2c_probe(uchar chip)
+{
+	int rc;
+	uchar reg;
+
+	debug("i2c_probe: addr=0x%x\n", chip);
+	reg = 0;
+	rc = i2c_write_data(chip, &reg, 1);
+	if (rc) {
+		debug("Error probing 0x%x.\n", chip);
+		return 1;
+	}
+	return 0;
+}
+
+static int i2c_addr_ok(const uint addr, const int alen)
+{
+	/* We support 7 or 10 bit addresses, so one or two bytes each */
+	return alen == 1 || alen == 2;
+}
+
+/* Read bytes */
+int i2c_read(uchar chip, uint addr, int alen, uchar *buffer, int len)
+{
+	uint offset;
+	int i;
+
+	debug("i2c_read: chip=0x%x, addr=0x%x, len=0x%x\n",
+				chip, addr, len);
+	if (!i2c_addr_ok(addr, alen)) {
+		debug("i2c_read: Bad address %x.%d.\n", addr, alen);
+		return 1;
+	}
+	for (offset = 0; offset < len; offset++) {
+		if (alen) {
+			uchar data[alen];
+			for (i = 0; i < alen; i++) {
+				data[alen - i - 1] =
+					(addr + offset) >> (8 * i);
+			}
+			if (i2c_write_data(chip, data, alen)) {
+				debug("i2c_read: error sending (0x%x)\n",
+					addr);
+				return 1;
+			}
+		}
+		if (i2c_read_data(chip, buffer + offset, 1)) {
+			debug("i2c_read: error reading (0x%x)\n", addr);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+/* Write bytes */
+int i2c_write(uchar chip, uint addr, int alen, uchar *buffer, int len)
+{
+	uint offset;
+	int i;
+
+	debug("i2c_write: chip=0x%x, addr=0x%x, len=0x%x\n",
+				chip, addr, len);
+	if (!i2c_addr_ok(addr, alen)) {
+		debug("i2c_write: Bad address %x.%d.\n", addr, alen);
+		return 1;
+	}
+	for (offset = 0; offset < len; offset++) {
+		uchar data[alen + 1];
+		for (i = 0; i < alen; i++)
+			data[alen - i - 1] = (addr + offset) >> (8 * i);
+		data[alen] = buffer[offset];
+		if (i2c_write_data(chip, data, alen + 1)) {
+			debug("i2c_write: error sending (0x%x)\n", addr);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+#if defined(CONFIG_I2C_MULTI_BUS)
+/*
+ * Functions for multiple I2C bus handling
+ */
+unsigned int i2c_get_bus_num(void)
+{
+	return i2c_bus_num;
+}
+
+int i2c_set_bus_num(unsigned int bus)
+{
+	if (bus >= TEGRA_I2C_NUM_CONTROLLERS || !i2c_controllers[bus].inited)
+		return -1;
+	i2c_bus_num = bus;
+
+	return 0;
+}
+#endif
diff --git a/include/fdtdec.h b/include/fdtdec.h
index 2fbfd40..766e0bd 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -58,6 +58,8 @@ struct fdt_memory {
 enum fdt_compat_id {
 	COMPAT_UNKNOWN,
 	COMPAT_NVIDIA_TEGRA20_USB,	/* Tegra2 USB port */
+	COMPAT_NVIDIA_TEGRA20_I2C,	/* Tegra2 i2c */
+	COMPAT_NVIDIA_TEGRA20_DVC,	/* Tegra2 dvc (really just i2c) */
 
 	COMPAT_COUNT,
 };
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index f21e09f..9241d13 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -38,6 +38,8 @@ DECLARE_GLOBAL_DATA_PTR;
 static const char * const compat_names[COMPAT_COUNT] = {
 	COMPAT(UNKNOWN, "<none>"),
 	COMPAT(NVIDIA_TEGRA20_USB, "nvidia,tegra20-ehci"),
+	COMPAT(NVIDIA_TEGRA20_I2C, "nvidia,tegra20-i2c"),
+	COMPAT(NVIDIA_TEGRA20_DVC, "nvidia,tegra20-i2c-dvc"),
 };
 
 const char *fdtdec_get_compatible(enum fdt_compat_id id)
-- 
1.7.7.3
