From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Fri, 1 Feb 2019 22:22:25 +0300
Message-ID: <6150de70-6ca8-944a-780a-4574ff2b21c7@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
 <951cf1f5-ba3a-94ef-0399-2259effebc99@gmail.com>
 <BYAPR12MB33984FB81B8BB1EC8C0C4908C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33984FB81B8BB1EC8C0C4908C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

01.02.2019 22:20, Sowjanya Komatineni пишет:
> 
>>> +static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev) {
>>> +	struct dma_chan *dma_chan;
>>> +	u32 *dma_buf;
>>> +	dma_addr_t dma_phys;
>>> +	int err = 0;
>>> +
>>> +	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
>>> +		return -ENODEV;
>>
>> Driver shall not fail to probe if DMA driver is disabled, but to continue with the PIO-only mode available.
>>
>> Should be:
>>
>> 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
>> 		return 0;
>>
> Except EPROBE_DEFER, anything else returned from tegra_i2c_init_dma (ENODEV/ENOMEM) is ignored in i2c_probe
> DMA mode decision is based on xfer size and availability of dma channel or can be changed based on valid dma buf to shorten the line.
> 

Ah, sorry. I missed that, seems good then.
