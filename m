From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2 3/4] i2c: tegra: Add DMA Support
Date: Fri, 25 Jan 2019 23:40:02 +0300
Message-ID: <ad177c2e-3801-ddad-b359-ac83530ee1d6@gmail.com>
References: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
 <1548363113-25969-3-git-send-email-skomatineni@nvidia.com>
 <dcc1e094-638e-5b04-7a61-bdbc24ee068f@gmail.com>
 <BYAPR12MB339829FC6F2F95F833FE45A1C29B0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB339829FC6F2F95F833FE45A1C29B0@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

25.01.2019 23:31, Sowjanya Komatineni пишет:
> 
>>> +	if (i2c_dev->has_dma) {
>>> +		ret = tegra_i2c_init_dma_param(i2c_dev, true);
>>> +		if (ret == -EPROBE_DEFER)
>>> +			goto disable_div_clk;
>>> +		ret = tegra_i2c_init_dma_param(i2c_dev, false);
>>> +		if (ret == -EPROBE_DEFER)
>>> +			goto disable_div_clk;
>>
>> So tegra_i2c_init_dma_param() could fail, printing a error message, and probe will succeed? If allocation fails during the driver's probe, then just fail the probe. Please give the rationale.
> 
> If APB DMA probe doesn’t happen prior to tegra i2c, DMA is not available by the time tegra_init_dma_param tries to request slave channel and in those cases dma_request_slave_channel_reason will return EPROBE_DEFER for tegra I2C probe to retry
> 
> In case if DMA is available but DMA buffer allocation fails, then tegra_i2c_init_dma_param returns ENOMEM and probe also fails returning same ENOMEM

Is that what you're going to change in the next version? Your current variant of the code doesn't fail the probe on ENOMEM and there is duplicated attempt to invoke tegra_i2c_init_dma_param() during the transfer.
