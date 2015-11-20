From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] mfd: as3722: Handle interrupts on suspend
Date: Fri, 20 Nov 2015 10:51:00 +0000
Message-ID: <1448016660-18819-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The as3722 device is registered as an irqchip and the as3722-rtc interrupt
is one of it's interrupt sources. When using the as3722-rtc as a wake-up
device from suspend, the following is seen:

  PM: Syncing filesystems ... done.
  Freezing user space processes ... (elapsed 0.001 seconds) done.
  Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
  Suspending console(s) (use no_console_suspend to debug)
  PM: suspend of devices complete after 161.119 msecs
  PM: late suspend of devices complete after 1.048 msecs
  PM: noirq suspend of devices complete after 0.756 msecs
  Disabling non-boot CPUs ...
  CPU1: shutdown
  CPU2: shutdown
  CPU3: shutdown
  Entering suspend state LP1
  Enabling non-boot CPUs ...
  CPU1 is up
  CPU2 is up
  CPU3 is up
  PM: noirq resume of devices complete after 0.487 msecs
  as3722 4-0040: Failed to read IRQ status: -16
  as3722 4-0040: Failed to read IRQ status: -16
  as3722 4-0040: Failed to read IRQ status: -16
  as3722 4-0040: Failed to read IRQ status: -16
  ...

The reason why the as3722 interrupt status cannot be read is because the
as3722 interrupt is not masked during suspend and when the as3722-rtc
interrupt occurs, to wake-up the device, the interrupt is seen before the
i2c controller has been resumed in order to read the as3722 interrupt
status.

The as3722-rtc driver sets it's interrupt as a wake-up source during
suspend, which gets propagated to the parent as3722 interrupt. However,
the as3722-rtc driver cannot disable it's interrupt during suspend
otherwise we would never be woken up and so the as3722 must disable it's
interrupt instead.

Fix this by disabling the as3722 interrupt during suspend. To ensure that
a wake-up event from the as3722 is not missing, enable the as3722 interrupt
as a wake-up source before disabling the interrupt on entering suspend.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

v2 changes:
- Re-enabled the interrupt in resume before disabling the wake-up.

 drivers/mfd/as3722.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
index 924ea90494ae..3b21eb4bc480 100644
--- a/drivers/mfd/as3722.c
+++ b/drivers/mfd/as3722.c
@@ -405,6 +405,8 @@ static int as3722_i2c_probe(struct i2c_client *i2c,
 		goto scrub;
 	}
 
+	device_init_wakeup(as3722->dev, true);
+
 	dev_dbg(as3722->dev, "AS3722 core driver initialized successfully\n");
 	return 0;
 
@@ -422,6 +424,29 @@ static int as3722_i2c_remove(struct i2c_client *i2c)
 	return 0;
 }
 
+static int as3722_i2c_suspend(struct device *dev)
+{
+	struct as3722 *as3722 = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(as3722->chip_irq);
+	disable_irq(as3722->chip_irq);
+
+	return 0;
+}
+
+static int as3722_i2c_resume(struct device *dev)
+{
+	struct as3722 *as3722 = dev_get_drvdata(dev);
+
+	enable_irq(as3722->chip_irq);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(as3722->chip_irq);
+
+	return 0;
+}
+
 static const struct of_device_id as3722_of_match[] = {
 	{ .compatible = "ams,as3722", },
 	{},
@@ -434,10 +459,15 @@ static const struct i2c_device_id as3722_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, as3722_i2c_id);
 
+static const struct dev_pm_ops as3722_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(as3722_i2c_suspend, as3722_i2c_resume)
+};
+
 static struct i2c_driver as3722_i2c_driver = {
 	.driver = {
 		.name = "as3722",
 		.of_match_table = as3722_of_match,
+		.pm = &as3722_pm_ops,
 	},
 	.probe = as3722_i2c_probe,
 	.remove = as3722_i2c_remove,
-- 
2.1.4
