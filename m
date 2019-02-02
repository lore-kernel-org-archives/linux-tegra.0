From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Sat, 2 Feb 2019 17:13:56 +0300
Message-ID: <f667ab55-c7c7-4ac1-100a-7f7ade87708d@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
 <951cf1f5-ba3a-94ef-0399-2259effebc99@gmail.com>
 <BYAPR12MB33984FB81B8BB1EC8C0C4908C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
 <6150de70-6ca8-944a-780a-4574ff2b21c7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6150de70-6ca8-944a-780a-4574ff2b21c7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

01.02.2019 22:22, Dmitry Osipenko пишет:
> 01.02.2019 22:20, Sowjanya Komatineni пишет:
>>
>>>> +static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev) {
>>>> +	struct dma_chan *dma_chan;
>>>> +	u32 *dma_buf;
>>>> +	dma_addr_t dma_phys;
>>>> +	int err = 0;
>>>> +
>>>> +	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
>>>> +		return -ENODEV;
>>>
>>> Driver shall not fail to probe if DMA driver is disabled, but to continue with the PIO-only mode available.
>>>
>>> Should be:
>>>
>>> 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
>>> 		return 0;
>>>
>> Except EPROBE_DEFER, anything else returned from tegra_i2c_init_dma (ENODEV/ENOMEM) is ignored in i2c_probe
>> DMA mode decision is based on xfer size and availability of dma channel or can be changed based on valid dma buf to shorten the line.
>>
> 
> Ah, sorry. I missed that, seems good then.
> 

BTW, it may be worthwhile to move out the error code handling into tegra_i2c_init_dma() for clarity. It also won't hurt to not ignore errors other than -ENODEV.

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 32d5744bce45..684a0689ac8d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -397,7 +397,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	int err = 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
-		return -ENODEV;
+		return 0;
 
 	dma_chan = dma_request_slave_channel_reason(i2c_dev->dev, "rx");
 	if (IS_ERR(dma_chan))
@@ -434,6 +434,13 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->rx_dma_chan)
 		dma_release_channel(i2c_dev->rx_dma_chan);
 
+	/*
+	 * -ENODEV is likely due to a missing "dmas" property, driver falls
+	 * back to PIO in this case.
+	 */
+	if (err == -ENODEV)
+		return 0;
+
 	return err;
 }
 
@@ -1553,7 +1560,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	}
 
 	ret = tegra_i2c_init_dma(i2c_dev);
-	if (ret == -EPROBE_DEFER)
+	if (ret)
 		goto disable_div_clk;
 
 	ret = tegra_i2c_init(i2c_dev, false);
