From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1] i2c: tegra: Remove suspend-resume
Date: Wed, 17 Oct 2018 14:59:12 +0100
Message-ID: <c1b73435-48f0-b445-568f-3c8942878123@nvidia.com>
References: <20180513211347.7187-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180513211347.7187-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/05/2018 22:13, Dmitry Osipenko wrote:
> Nothing prevents I2C clients to access I2C while Tegra's driver is being
> suspended, this results in -EBUSY error returned to the clients and that
> may have unfortunate consequences. In particular this causes problems
> for the TPS6586x MFD driver which emits hundreds of "failed to read
> interrupt status" error messages on resume from suspend. This happens if
> TPS6586X is used to wake system from suspend by the expired RTC alarm
> timer because TPS6586X is an I2C device driver and its IRQ handler reads
> the status register while Tegra's I2C driver is suspended, i.e. just after
> kernel enabled IRQ's during of resume-from-suspend process.

I have been looking at the above issue with the tps6586x because I am
seeing delays on resume caused by this driver on the stable branches. I
understand that this patch was dropped for stable, but looking at the
specific issue with the tps6586x I am curious why the tps6586x driver
was not fixed because it appears to me that the issue largely resides
with that driver and any other device that uses the tps6586x is
susceptible to it. I was able to fix the tps6586x driver by doing the
following and I am interested in your thoughts ...

Subject: [PATCH] mfd: tps6586x: Handle interrupts on suspend

The tps6586x device is registered as an irqchip and the tps6586x-rtc
interrupt is one of it's interrupt sources. When using the tps6586x-rtc
as a wake-up device from suspend, the following is seen:

 PM: Syncing filesystems ... done.
 Freezing user space processes ... (elapsed 0.001 seconds) done.
 OOM killer disabled.
 Freezing remaining freezable tasks ... (elapsed 0.000 seconds) done.
 Disabling non-boot CPUs ...
 Entering suspend state LP1
 Enabling non-boot CPUs ...
 CPU1 is up
 tps6586x 3-0034: failed to read interrupt status
 tps6586x 3-0034: failed to read interrupt status

The reason why the tps6586x interrupt status cannot be read is because
the tps6586x interrupt is not masked during suspend and when the
tps6586x-rtc interrupt occurs, to wake-up the device, the interrupt is
seen before the i2c controller has been resumed in order to read the
tps6586x interrupt status.

The tps6586x-rtc driver sets it's interrupt as a wake-up source during
suspend, which gets propagated to the parent tps6586x interrupt.
However, the tps6586x-rtc driver cannot disable it's interrupt during
suspend otherwise we would never be woken up and so the tps6586x must
disable it's interrupt instead.

Fix this by disabling the tps6586x interrupt on entering suspend and
re-enabling it on resuming from suspend.
---
 drivers/mfd/tps6586x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 5628a6b5b19b..165ac8a3d22c 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -594,6 +594,27 @@ static int tps6586x_i2c_remove(struct i2c_client
*client)
 	return 0;
 }

+static int __maybe_unused tps6586x_i2c_suspend(struct device *dev)
+{
+	struct tps6586x *tps6586x = dev_get_drvdata(dev);
+
+	disable_irq(tps6586x->client->irq);
+
+	return 0;
+}
+
+static int __maybe_unused tps6586x_i2c_resume(struct device *dev)
+{
+	struct tps6586x *tps6586x = dev_get_drvdata(dev);
+
+	enable_irq(tps6586x->client->irq);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(tps6586x_pm_ops, tps6586x_i2c_suspend,
+			 tps6586x_i2c_resume);
+
 static const struct i2c_device_id tps6586x_id_table[] = {
 	{ "tps6586x", 0 },
 	{ },
@@ -604,6 +625,7 @@ static int tps6586x_i2c_remove(struct i2c_client
*client)
 	.driver	= {
 		.name	= "tps6586x",
 		.of_match_table = of_match_ptr(tps6586x_of_match),
+		.pm	= &tps6586x_pm_ops,
 	},
 	.probe		= tps6586x_i2c_probe,
 	.remove		= tps6586x_i2c_remove,
-- 
1.9.1

-- 
nvpublic
