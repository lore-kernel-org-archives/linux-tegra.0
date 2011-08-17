From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [RFC PATCH] add slave mode support to tegra's i2c controller
Date: Wed, 17 Aug 2011 21:01:26 +0200
Message-ID: <201108172101.27170.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

the patch below adds slave mode to tegra's i2c controller. I tried to make it as 
small as possible. It is needed to allow the nvec driver to deligate the 
initialization to the i2c-tegra driver as part of its cleanup. Patch is tested 
with our version of nvec. Patch is against arm-soc + boards-3.2. Please review 
and consider it for merge. 

Thanks

Marc

===

    ARM: tegra: add slave mode support to tegra's i2c controller
    
    This adds support for tegra's i2c-controller slave mode operation.
    It programs the slave address provided by the platform data and skips
    the interrupt registration which is deligated to the master device
    driver. Additionaly, the i2c device structure definition is moved to
    the header file, so it can be used by the master device driver.

	Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2440b74..b4c23d5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -99,45 +99,6 @@
 #define I2C_HEADER_MASTER_ADDR_SHIFT		12
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
-/**
- * struct tegra_i2c_dev	- per device i2c context
- * @dev: device reference for power management
- * @adapter: core i2c layer adapter information
- * @clk: clock reference for i2c controller
- * @i2c_clk: clock reference for i2c bus
- * @iomem: memory resource for registers
- * @base: ioremapped registers cookie
- * @cont_id: i2c controller id, used for for packet header
- * @irq: irq number of transfer complete interrupt
- * @is_dvc: identifies the DVC i2c controller, has a different register layout
- * @msg_complete: transfer completion notifier
- * @msg_err: error code for completed message
- * @msg_buf: pointer to current message data
- * @msg_buf_remaining: size of unsent data in the message buffer
- * @msg_read: identifies read transfers
- * @bus_clk_rate: current i2c bus clock rate
- * @is_suspended: prevents i2c controller accesses after suspend is called
- */
-struct tegra_i2c_dev {
-	struct device *dev;
-	struct i2c_adapter adapter;
-	struct clk *clk;
-	struct clk *i2c_clk;
-	struct resource *iomem;
-	void __iomem *base;
-	int cont_id;
-	int irq;
-	bool irq_disabled;
-	int is_dvc;
-	struct completion msg_complete;
-	int msg_err;
-	u8 *msg_buf;
-	size_t msg_buf_remaining;
-	int msg_read;
-	unsigned long bus_clk_rate;
-	bool is_suspended;
-};
-
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned long 
reg)
 {
 	writel(val, i2c_dev->base + reg);
@@ -322,6 +283,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
 	int err = 0;
+	int slave_addr = i2c_dev->is_slave ? 0xfc : i2c_dev->slave_addr;
 
 	clk_enable(i2c_dev->clk);
 
@@ -342,8 +304,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
 		i2c_writel(i2c_dev, sl_cfg, I2C_SL_CNFG);
-		i2c_writel(i2c_dev, 0xfc, I2C_SL_ADDR1);
-		i2c_writel(i2c_dev, 0x00, I2C_SL_ADDR2);
+		i2c_writel(i2c_dev, slave_addr & 0xff, I2C_SL_ADDR1);
+		i2c_writel(i2c_dev, slave_addr >> 8, I2C_SL_ADDR2);
 
 	}
 
@@ -609,6 +571,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->bus_clk_rate = 100000; /* default clock rate */
 	if (pdata) {
 		i2c_dev->bus_clk_rate = pdata->bus_clk_rate;
+		i2c_dev->is_slave = pdata->is_slave;
+		i2c_dev->slave_addr = pdata->slave_addr;
 
 	} else if (i2c_dev->dev->of_node) {    /* if there is a device tree node ... 
*/
 		prop = of_get_property(i2c_dev->dev->of_node,
@@ -629,10 +593,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto err_free;
 	}
 
-	ret = request_irq(i2c_dev->irq, tegra_i2c_isr, 0, pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-		goto err_free;
+	if (!i2c_dev->is_slave) {
+		ret = request_irq(i2c_dev->irq, tegra_i2c_isr, 0, pdev->name, i2c_dev);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
+			goto err_free;
+		}
 	}
 
 	clk_enable(i2c_dev->i2c_clk);
diff --git a/include/linux/i2c-tegra.h b/include/linux/i2c-tegra.h
index 9c85da4..2729863 100644
--- a/include/linux/i2c-tegra.h
+++ b/include/linux/i2c-tegra.h
@@ -18,8 +18,55 @@
 #ifndef _LINUX_I2C_TEGRA_H
 #define _LINUX_I2C_TEGRA_H
 
+#include <linux/i2c.h>
+
 struct tegra_i2c_platform_data {
 	unsigned long bus_clk_rate;
+	bool is_slave;
+	u16 slave_addr;
+};
+
+/**
+ * struct tegra_i2c_dev	- per device i2c context
+ * @dev: device reference for power management
+ * @adapter: core i2c layer adapter information
+ * @clk: clock reference for i2c controller
+ * @i2c_clk: clock reference for i2c bus
+ * @iomem: memory resource for registers
+ * @base: ioremapped registers cookie
+ * @cont_id: i2c controller id, used for for packet header
+ * @irq: irq number of transfer complete interrupt
+ * @is_dvc: identifies the DVC i2c controller, has a different register layout
+ * @is_slave: identifies a controller in slave mode operation
+ * @slave_addr: the slave address if in slave mode
+ * @msg_complete: transfer completion notifier
+ * @msg_err: error code for completed message
+ * @msg_buf: pointer to current message data
+ * @msg_buf_remaining: size of unsent data in the message buffer
+ * @msg_read: identifies read transfers
+ * @bus_clk_rate: current i2c bus clock rate
+ * @is_suspended: prevents i2c controller accesses after suspend is called
+ */
+struct tegra_i2c_dev {
+	struct device *dev;
+	struct i2c_adapter adapter;
+	struct clk *clk;
+	struct clk *i2c_clk;
+	struct resource *iomem;
+	void __iomem *base;
+	int cont_id;
+	int irq;
+	u16 slave_addr;
+	bool irq_disabled;
+	bool is_dvc;
+	bool is_slave;
+	struct completion msg_complete;
+	int msg_err;
+	u8 *msg_buf;
+	size_t msg_buf_remaining;
+	int msg_read;
+	unsigned long bus_clk_rate;
+	bool is_suspended;
 };
 
 #endif /* _LINUX_I2C_TEGRA_H */
