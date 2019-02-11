From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V18 4/6] i2c: tegra: Add DMA support
Date: Mon, 11 Feb 2019 16:22:01 +0300
Message-ID: <ed92df42-459e-26fd-ce4e-f4530bf30783@gmail.com>
References: <1549652382-5476-1-git-send-email-skomatineni@nvidia.com>
 <1549652382-5476-4-git-send-email-skomatineni@nvidia.com>
 <20190211125509.tnsgfl3yoobdpnmj@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211125509.tnsgfl3yoobdpnmj@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, peda@axentia.se, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

11.02.2019 15:55, Wolfram Sang пишет:
> On Fri, Feb 08, 2019 at 10:59:40AM -0800, Sowjanya Komatineni wrote:
>> This patch adds DMA support for Tegra I2C.
>>
>> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for
>> transfer size of the max FIFO depth and DMA mode is used for
>> transfer size higher than max FIFO depth to save CPU overhead.
>>
>> PIO mode needs full intervention of CPU to fill or empty FIFO's
>> and also need to service multiple data requests interrupt for the
>> same transaction. This adds delay between data bytes of the same
>> transfer when CPU is fully loaded and some slave devices has
>> internal timeout for no bus activity and stops transaction to
>> avoid bus hang. DMA mode is helpful in such cases.
>>
>> DMA mode is also helpful for Large transfers during downloading or
>> uploading FW over I2C to some external devices.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> 
> I am not sure if you are aware of this document, so I mention it:
> 
> Documentation/i2c/DMA-considerations
> 
> I am not pushing you to use the i2c_get_dma_safe_msg_buf() helpers, just
> wanted to make sure you know about them. I am also fine with an
> incremental patch on top of this if you want to add usage of those
> helpers somewhen later.

At least I was not aware of those helpers. It looks to me that the approach of having a statically allocated buffer is more optimal than having to allocate and map the buffer on each transfer. 

> That all being said, I'd accept the patch as is, except for:
> 
>> +static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
>> +	.has_continue_xfer_support = true,
>> +	.has_per_pkt_xfer_complete_irq = true,
>> +	.has_single_clk_source = true,
>> +	.clk_divisor_hs_mode = 1,
>> +	.clk_divisor_std_fast_mode = 0x19,
>> +	.clk_divisor_fast_plus_mode = 0x10,
>> +	.has_config_load_reg = true,
>> +	.has_multi_master_mode = true,
>> +	.has_slcg_override_reg = true,
>> +	.has_mst_fifo = true,
>> +	.quirks = &tegra_i2c_quirks,
>> +	.supports_bus_clear = true,
>> +	.has_apb_dma = false,
>>  };
>>  
>>  /* Match table for of_platform binding */
>>  static const struct of_device_id tegra_i2c_of_match[] = {
>>  	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
>> +	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
>>  	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
>>  	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
>>  	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
> 
> Shouldn't this be a seperate patch?

I asked for this change and no, it shouldn't be a separate patch as it adds "has_apb_dma = false" property for T186 that older Tegra's have as "true". Without this change T186 uses tegra_i2c_hw_feature of T210, see [0]. Hence this change is absolutely correct and appropriate for this patch.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/nvidia/tegra186.dtsi?#n138

>> -static int __init tegra_i2c_init_driver(void)
>> -{
>> -	return platform_driver_register(&tegra_i2c_driver);
>> -}
>> -
>> -static void __exit tegra_i2c_exit_driver(void)
>> -{
>> -	platform_driver_unregister(&tegra_i2c_driver);
>> -}
>> -
>> -subsys_initcall(tegra_i2c_init_driver);
>> -module_exit(tegra_i2c_exit_driver);
>> +module_platform_driver(tegra_i2c_driver);
> 
> This should definately be a seperate patch. While I am all for taking
> it, are you sure it does not regress on older Tegra platforms?
> 

All the patches are tested on older Tegra's (T20/T30 specifically by me) and we fixed several bugs that were regressing them over the few versions of the patchset. I specifically asked for this change for older Tegra's because the APBDMA driver (T20-T210) is getting registered from the module-init level and hence I2C driver probe is always getting deferred. I'm not sure that it's worth to factor out this hunk into a separate patch as it's directly related to the DMA support addition, maybe worth to mention why this is needed in the commit message.
