From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Sun, 3 Feb 2019 17:19:52 +0300
Message-ID: <41d1a992-5772-b0b0-af97-c995701ee1f3@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.02.2019 20:07, Sowjanya Komatineni пишет:
> This patch adds DMA support for Tegra I2C.
> 
> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for
> transfer size of the max FIFO depth and DMA mode is used for
> transfer size higher than max FIFO depth to save CPU overhead.
> 
> PIO mode needs full intervention of CPU to fill or empty FIFO's
> and also need to service multiple data requests interrupt for the
> same transaction. This adds delay between data bytes of the same
> transfer when CPU is fully loaded and some slave devices has
> internal timeout for no bus activity and stops transaction to
> avoid bus hang. DMA mode is helpful in such cases.
> 
> DMA mode is also helpful for Large transfers during downloading or
> uploading FW over I2C to some external devices.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---

Good news! I tested patches on T20 and T30, everything works perfect this time. Please address the review comments and prepare the new version.

BTW, I noticed that there are more deferred probes in the KMSG log with this patch. That is unsurprising because Tegra I2C driver is registered from the subsys level and APB DMA driver from the module level, hence I2C device can probe successfully only after the APB DMA.

The small change helps to reduce the amount of deferring during boot, please consider including it into this patch:

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 32d5744bce45..e2049d5b0c00 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1651,19 +1651,7 @@ static struct platform_driver tegra_i2c_driver = {
                .pm    = TEGRA_I2C_PM,
        },
 };
-
-static int __init tegra_i2c_init_driver(void)
-{
-       return platform_driver_register(&tegra_i2c_driver);
-}
-
-static void __exit tegra_i2c_exit_driver(void)
-{
-       platform_driver_unregister(&tegra_i2c_driver);
-}
-
-subsys_initcall(tegra_i2c_init_driver);
-module_exit(tegra_i2c_exit_driver);
+module_platform_driver(tegra_i2c_driver);
 
 MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
 MODULE_AUTHOR("Colin Cross");
