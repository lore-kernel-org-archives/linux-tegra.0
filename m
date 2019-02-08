From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V15 4/6] i2c: tegra: Add DMA support
Date: Fri, 8 Feb 2019 15:47:36 +0300
Message-ID: <7806f2cd-72b4-6ae3-b75f-0fc74fb62b95@gmail.com>
References: <1549576040-15907-1-git-send-email-skomatineni@nvidia.com>
 <1549576040-15907-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549576040-15907-4-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.02.2019 0:47, Sowjanya Komatineni пишет:
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
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---


[snip]

>  	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
>  						TEGRA_I2C_TIMEOUT);
>  	tegra_i2c_mask_irq(i2c_dev, int_mask);
> -

Let's keep this newline in place.

[snip]

> +	ret = tegra_i2c_init_dma(i2c_dev);
> +	if (ret < 0)
> +		goto disable_div_clk;
> +
>  	ret = tegra_i2c_init(i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
> @@ -1160,6 +1500,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  disable_div_clk:
>  	if (i2c_dev->is_multimaster_mode)
>  		clk_disable(i2c_dev->div_clk);
> +	tegra_i2c_release_dma(i2c_dev);

Please use "release_dma:" variant that I suggested in the comment to v14 because:

1) It's just a good (and common-style in kernel) tone to unwind errors handling in the opposite order, it makes code more straight forward and helps to avoid silly mistakes.

2) It keeps the current code consistent in regards to probe error-handling.

>  
>  disable_rpm:
>  	pm_runtime_disable(&pdev->dev);


[snip]

Please also address my comment to the "fix maximum transfer size" patch. And please add Wolfram Sang to the CC list.

Looks like v16 should be the final, so with everything being addressed:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
