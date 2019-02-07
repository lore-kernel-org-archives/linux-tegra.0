From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 17:52:16 +0300
Message-ID: <a6b1acbd-9be0-62b7-29bb-081d93ee92fb@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.02.2019 22:16, Sowjanya Komatineni пишет:
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


[snip]

> @@ -1124,6 +1453,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	ret = tegra_i2c_init_dma(i2c_dev);
> +	if (ret < 0)
> +		goto disable_div_clk;
> +
>  	ret = tegra_i2c_init(i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");


Missing DMA resourcing release on probe failure.


diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7921d3e6237d..11f25357b843 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1612,14 +1612,14 @@ static int tegra_i2c_probe(struct platform_device *pdev)
        ret = tegra_i2c_init(i2c_dev, false);
        if (ret) {
                dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
-               goto disable_div_clk;
+               goto release_dma;
        }
 
        ret = devm_request_irq(&pdev->dev, i2c_dev->irq,
                        tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
        if (ret) {
                dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-               goto disable_div_clk;
+               goto release_dma;
        }
 
        i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
@@ -1633,10 +1633,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
        ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
        if (ret)
-               goto disable_div_clk;
+               goto release_dma;
 
        return 0;
 
+release_dma:
+       tegra_i2c_release_dma(i2c_dev);
+
 disable_div_clk:
        if (i2c_dev->is_multimaster_mode)
                clk_disable(i2c_dev->div_clk);
