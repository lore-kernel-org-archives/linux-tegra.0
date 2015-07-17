From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: [RFC 1/9] i2c: tegra: implement slave mode
Date: Fri, 17 Jul 2015 16:08:21 +0200
Message-ID: <1437142109-31975-2-git-send-email-wsa@the-dreams.de>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437142109-31975-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>

Initialization code is based on NVEC driver.

There is a HW bug in AP20 that was also mentioned in kernel sources
for Toshiba AC100.

Signed-off-by: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
---
 drivers/i2c/busses/Kconfig     |   1 +
 drivers/i2c/busses/i2c-tegra.c | 119 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 577d58d1f1a198..6026271f6d1af5 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -881,6 +881,7 @@ config I2C_SUN6I_P2WI
 config I2C_TEGRA
 	tristate "NVIDIA Tegra internal I2C controller"
 	depends on ARCH_TEGRA
+	select I2C_SLAVE
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C controller embedded in NVIDIA Tegra SOCs
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 78a36681469674..dc080ca952960c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -42,8 +42,17 @@
 #define I2C_SL_CNFG				0x020
 #define I2C_SL_CNFG_NACK			(1<<1)
 #define I2C_SL_CNFG_NEWSL			(1<<2)
+#define I2C_SL_RCVD				0x024
+#define I2C_SL_STATUS				0x028
+#define I2C_SL_ST_IRQ				(1<<3)
+#define I2C_SL_ST_END_TRANS			(1<<4)
+#define I2C_SL_ST_RCVD				(1<<2)
+#define I2C_SL_ST_RNW				(1<<1)
 #define I2C_SL_ADDR1				0x02c
 #define I2C_SL_ADDR2				0x030
+#define I2C_SL_ADDR2_TEN_BIT_MODE		1
+#define I2C_SL_DELAY_COUNT			0x03c
+#define I2C_SL_DELAY_COUNT_DEFAULT		0x1E
 #define I2C_TX_FIFO				0x050
 #define I2C_RX_FIFO				0x054
 #define I2C_PACKET_TRANSFER_STATUS		0x058
@@ -125,6 +134,8 @@ enum msg_end_type {
  * @clk_divisor_std_fast_mode: Clock divisor in standard/fast mode. It is
  *		applicable if there is no fast clock source i.e. single clock
  *		source.
+ * @slave_read_start_delay: Workaround for AP20 I2C Slave Controller bug. Delay
+ *              before writing data byte into register I2C_SL_RCVD.
  */
 
 struct tegra_i2c_hw_feature {
@@ -133,6 +144,7 @@ struct tegra_i2c_hw_feature {
 	bool has_single_clk_source;
 	int clk_divisor_hs_mode;
 	int clk_divisor_std_fast_mode;
+	int slave_read_start_delay;
 };
 
 /**
@@ -173,6 +185,7 @@ struct tegra_i2c_dev {
 	int msg_read;
 	u32 bus_clk_rate;
 	bool is_suspended;
+	struct i2c_client *slave;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned long reg)
@@ -461,12 +474,78 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	return err;
 }
 
+static void tegra_i2c_slave_write(struct tegra_i2c_dev *i2c_dev, u32 val)
+{
+	i2c_writel(i2c_dev, val, I2C_SL_RCVD);
+
+	/*
+	 * TODO: A correct fix needs to be found for this.
+	 *
+	 * We experience less incomplete messages with this delay than without
+	 * it, but we don't know why. Help is appreciated.
+	 */
+	udelay(100);
+}
+
+static int tegra_i2c_slave_isr(int irq, struct tegra_i2c_dev *i2c_dev)
+{
+	u32 status;
+	u8 value;
+	u8 dummy;
+	u32 is_slave_irq, is_read, is_trans_start, is_trans_end;
+
+	if (!i2c_dev->slave || !i2c_dev->slave->slave_cb)
+		return -EINVAL;
+
+	status = i2c_readl(i2c_dev, I2C_SL_STATUS);
+
+	is_slave_irq = (status & I2C_SL_ST_IRQ);
+	is_read = (status & I2C_SL_ST_RNW);
+	is_trans_start = (status & I2C_SL_ST_RCVD);
+	is_trans_end = (status & I2C_SL_ST_END_TRANS);
+
+	if (!is_slave_irq)
+		return -EINVAL;
+
+	/* master sent stop */
+	if (is_trans_end) {
+		i2c_slave_event(i2c_dev->slave, I2C_SLAVE_STOP, &dummy);
+		if (!is_trans_start)
+			return 0;
+	}
+
+	if (is_read) {
+		/* i2c master reads data from us */
+		i2c_slave_event(i2c_dev->slave,
+				is_trans_start ? I2C_SLAVE_READ_REQUESTED
+					       : I2C_SLAVE_READ_PROCESSED,
+				&value);
+		if (is_trans_start && i2c_dev->hw->slave_read_start_delay)
+			udelay(i2c_dev->hw->slave_read_start_delay);
+		tegra_i2c_slave_write(i2c_dev, value);
+	} else {
+		/* i2c master sends data to us */
+		value = i2c_readl(i2c_dev, I2C_SL_RCVD);
+		if (is_trans_start)
+			tegra_i2c_slave_write(i2c_dev, 0);
+		i2c_slave_event(i2c_dev->slave,
+				is_trans_start ? I2C_SLAVE_WRITE_REQUESTED
+					       : I2C_SLAVE_WRITE_RECEIVED,
+				&value);
+	}
+
+	return 0;
+}
+
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
 	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
 
+	if (!tegra_i2c_slave_isr(irq, i2c_dev))
+		return IRQ_HANDLED;
+
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
 	if (status == 0) {
@@ -664,9 +743,48 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 	return ret;
 }
 
+static int tegra_reg_slave(struct i2c_client *slave)
+{
+	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(slave->adapter);
+	int addr2 = 0;
+
+	if (i2c_dev->slave)
+		return -EBUSY;
+
+	i2c_dev->slave = slave;
+
+	tegra_i2c_clock_enable(i2c_dev);
+
+	i2c_writel(i2c_dev, I2C_SL_CNFG_NEWSL, I2C_SL_CNFG);
+	i2c_writel(i2c_dev, I2C_SL_DELAY_COUNT_DEFAULT, I2C_SL_DELAY_COUNT);
+
+	if (slave->addr > 0x7F)
+		addr2 = (slave->addr >> 7) | I2C_SL_ADDR2_TEN_BIT_MODE;
+
+	i2c_writel(i2c_dev, slave->addr, I2C_SL_ADDR1);
+	i2c_writel(i2c_dev, addr2, I2C_SL_ADDR2);
+
+	return 0;
+}
+
+static int tegra_unreg_slave(struct i2c_client *slave)
+{
+	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(slave->adapter);
+
+	WARN_ON(!i2c_dev->slave);
+
+	i2c_writel(i2c_dev, 0, I2C_SL_CNFG);
+
+	i2c_dev->slave = NULL;
+
+	return 0;
+}
+
 static const struct i2c_algorithm tegra_i2c_algo = {
 	.master_xfer	= tegra_i2c_xfer,
 	.functionality	= tegra_i2c_func,
+	.reg_slave	= tegra_reg_slave,
+	.unreg_slave	= tegra_unreg_slave,
 };
 
 /* payload size is only 12 bit */
@@ -681,6 +799,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
 	.clk_divisor_std_fast_mode = 0,
+	.slave_read_start_delay = 8,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
-- 
2.1.4
