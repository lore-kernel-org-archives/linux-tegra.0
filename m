From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 18:17:41 +0300
Message-ID: <ec44c61b-6186-83da-6224-ff8db91a293c@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <a6b1acbd-9be0-62b7-29bb-081d93ee92fb@gmail.com>
 <BYAPR12MB3398712D185CCCB345EB2B5BC2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398712D185CCCB345EB2B5BC2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

07.02.2019 18:11, Sowjanya Komatineni пишет:
>>
>>
>>> @@ -1124,6 +1453,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>>>  		}
>>>  	}
>>>  
>>> +	ret = tegra_i2c_init_dma(i2c_dev);
>>> +	if (ret < 0)
>>> +		goto disable_div_clk;
>>> +
>>>  	ret = tegra_i2c_init(i2c_dev);
>>>  	if (ret) {
>>>  		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
>>
>>
>> Missing DMA resourcing release on probe failure.
> 
> If probe fails due to other reasons, then I2C interface will not be available and boot will not even happen.
> Do we need DMA resourcing release?
> 

Absolutely! Every allocated resource must be released.
