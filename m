From: Sakshi Bansal <sakshi.april5@gmail.com>
Subject: [PATCH] staging: nvec: fixed few coding style warnings
Date: Wed, 14 Oct 2015 19:38:22 +0530
Message-ID: <20151014140822.GA23114@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jak@jak-linux.org, marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fixed allignmnet issues and block comments usage

Signed-off-by: Sakshi Bansal <sakshi.april5@gmail.com>
---
 drivers/staging/nvec/README       |  2 +-
 drivers/staging/nvec/nvec.c       | 41 ++++++++++++++++++++-------------------
 drivers/staging/nvec/nvec_paz00.c |  1 -
 drivers/staging/nvec/nvec_power.c |  6 ++++--
 4 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/nvec/README b/drivers/staging/nvec/README
index 9a320b7..0e2d5c4 100644
--- a/drivers/staging/nvec/README
+++ b/drivers/staging/nvec/README
@@ -1,4 +1,4 @@
-NVEC: An NVidia compliant Embedded Controller Protocol Implemenation
+NVEC: An NVidia compliant Embedded Controller Protocol Implementation
 
 This is an implementation of the NVEC protocol used to communicate with an
 embedded controller (EC) via I2C bus. The EC is an I2C master while the host
diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 164634d..2a9bdce 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -150,7 +150,7 @@ static int nvec_status_notifier(struct notifier_block *nb,
 
 	dev_warn(nvec->dev, "unhandled msg type %ld\n", event_type);
 	print_hex_dump(KERN_WARNING, "payload: ", DUMP_PREFIX_NONE, 16, 1,
-		msg, msg[1] + 2, true);
+		       msg, msg[1] + 2, true);
 
 	return NOTIFY_OK;
 }
@@ -259,14 +259,14 @@ static void nvec_gpio_set_value(struct nvec_chip *nvec, int value)
  * occurred, the nvec driver may print an error.
  */
 int nvec_write_async(struct nvec_chip *nvec, const unsigned char *data,
-			short size)
+		     short size)
 {
 	struct nvec_msg *msg;
 	unsigned long flags;
 
 	msg = nvec_msg_alloc(nvec, NVEC_MSG_TX);
 
-	if (msg == NULL)
+	if (!msg)
 		return -ENOMEM;
 
 	msg->data[0] = size;
@@ -299,7 +299,7 @@ EXPORT_SYMBOL(nvec_write_async);
  * used.
  */
 struct nvec_msg *nvec_write_sync(struct nvec_chip *nvec,
-		const unsigned char *data, short size)
+				 const unsigned char *data, short size)
 {
 	struct nvec_msg *msg;
 
@@ -313,9 +313,9 @@ struct nvec_msg *nvec_write_sync(struct nvec_chip *nvec,
 	}
 
 	dev_dbg(nvec->dev, "nvec_sync_write: 0x%04x\n",
-					nvec->sync_write_pending);
+		nvec->sync_write_pending);
 	if (!(wait_for_completion_timeout(&nvec->sync_write,
-				msecs_to_jiffies(2000)))) {
+					  msecs_to_jiffies(2000)))) {
 		dev_warn(nvec->dev, "timeout waiting for sync write to complete\n");
 		mutex_unlock(&nvec->sync_write_mutex);
 		return NULL;
@@ -422,8 +422,8 @@ static int parse_msg(struct nvec_chip *nvec, struct nvec_msg *msg)
 
 	if ((msg->data[0] >> 7) == 1 && (msg->data[0] & 0x0f) == 5)
 		print_hex_dump(KERN_WARNING, "ec system event ",
-				DUMP_PREFIX_NONE, 16, 1, msg->data,
-				msg->data[1] + 2, true);
+			       DUMP_PREFIX_NONE, 16, 1, msg->data,
+			       msg->data[1] + 2, true);
 
 	atomic_notifier_call_chain(&nvec->notifier_list, msg->data[0] & 0x8f,
 				   msg->data);
@@ -493,8 +493,8 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 {
 	if (nvec->rx->pos != nvec_msg_size(nvec->rx)) {
 		dev_err(nvec->dev, "RX incomplete: Expected %u bytes, got %u\n",
-			   (uint) nvec_msg_size(nvec->rx),
-			   (uint) nvec->rx->pos);
+			(uint) nvec_msg_size(nvec->rx),
+			(uint) nvec->rx->pos);
 
 		nvec_msg_free(nvec, nvec->rx);
 		nvec->state = 0;
@@ -509,7 +509,8 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
 	spin_lock(&nvec->rx_lock);
 
 	/* add the received data to the work list
-	   and move the ring buffer pointer to the next entry */
+	 * and move the ring buffer pointer to the next entry
+	 */
 	list_add_tail(&nvec->rx->node, &nvec->rx_data);
 
 	spin_unlock(&nvec->rx_lock);
@@ -617,7 +618,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		} else {
 			nvec->rx = nvec_msg_alloc(nvec, NVEC_MSG_RX);
 			/* Should not happen in a normal world */
-			if (unlikely(nvec->rx == NULL)) {
+			if (!unlikely(nvec->rx)) {
 				nvec->state = 0;
 				break;
 			}
@@ -686,8 +687,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	if ((status & (RCVD | RNW)) == RCVD) {
 		if (received != nvec->i2c_addr)
 			dev_err(nvec->dev,
-			"received address 0x%02x, expected 0x%02x\n",
-			received, nvec->i2c_addr);
+				"received address 0x%02x, expected 0x%02x\n",
+				received, nvec->i2c_addr);
 		nvec->state = 1;
 	}
 
@@ -710,7 +711,6 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		status & RCVD ? " RCVD" : "",
 		status & RNW ? " RNW" : "");
 
-
 	/*
 	 * TODO: A correct fix needs to be found for this.
 	 *
@@ -741,7 +741,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
 	writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
 	writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);
 
-	writel(nvec->i2c_addr>>1, nvec->base + I2C_SL_ADDR1);
+	writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
 	writel(0, nvec->base + I2C_SL_ADDR2);
 
 	enable_irq(nvec->irq);
@@ -777,7 +777,7 @@ static int nvec_i2c_parse_dt_pdata(struct nvec_chip *nvec)
 	}
 
 	if (of_property_read_u32(nvec->dev->of_node, "slave-addr",
-				&nvec->i2c_addr)) {
+				 &nvec->i2c_addr)) {
 		dev_err(nvec->dev, "no i2c address specified");
 		return -ENODEV;
 	}
@@ -853,14 +853,14 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	INIT_WORK(&nvec->tx_work, nvec_request_master);
 
 	err = devm_gpio_request_one(&pdev->dev, nvec->gpio, GPIOF_OUT_INIT_HIGH,
-					"nvec gpio");
+				    "nvec gpio");
 	if (err < 0) {
 		dev_err(nvec->dev, "couldn't request gpio\n");
 		return -ENODEV;
 	}
 
 	err = devm_request_irq(&pdev->dev, nvec->irq, nvec_interrupt, 0,
-				"nvec", nvec);
+			       "nvec", nvec);
 	if (err) {
 		dev_err(nvec->dev, "couldn't request irq\n");
 		return -ENODEV;
@@ -883,7 +883,8 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 
 	if (msg) {
 		dev_warn(nvec->dev, "ec firmware version %02x.%02x.%02x / %02x\n",
-			msg->data[4], msg->data[5], msg->data[6], msg->data[7]);
+			 msg->data[4], msg->data[5], msg->data[6],
+			 msg->data[7]);
 
 		nvec_msg_free(nvec, msg);
 	}
diff --git a/drivers/staging/nvec/nvec_paz00.c b/drivers/staging/nvec/nvec_paz00.c
index 68146bf..f998193 100644
--- a/drivers/staging/nvec/nvec_paz00.c
+++ b/drivers/staging/nvec/nvec_paz00.c
@@ -41,7 +41,6 @@ static void nvec_led_brightness_set(struct led_classdev *led_cdev,
 	nvec_write_async(led->nvec, buf, sizeof(buf));
 
 	led->cdev.brightness = value;
-
 }
 
 static int nvec_paz00_probe(struct platform_device *pdev)
diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 04a7402..3702bac 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -208,7 +208,8 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		memcpy(power->bat_type, &res->plc, res->length - 2);
 		power->bat_type[res->length - 2] = '\0';
 		/* this differs a little from the spec
-		   fill in more if you find some */
+		 * fill in more if you find some
+		 */
 		if (!strncmp(power->bat_type, "Li", 30))
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_LION;
 		else
@@ -361,7 +362,8 @@ static void nvec_power_poll(struct work_struct *work)
 	msleep(100);
 
 /* select a battery request function via round robin
-   doing it all at once seems to overload the power supply */
+ * doing it all at once seems to overload the power supply
+ */
 	buf[0] = NVEC_BAT;
 	buf[1] = bat_iter[counter++];
 	nvec_write_async(power->nvec, buf, 2);
-- 
2.1.0
