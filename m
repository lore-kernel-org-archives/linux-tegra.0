From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 22:03:05 +0300
Message-ID: <da8138fe-ea4b-42be-1065-c7098ac59691@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <e09062b7-9c74-6aee-477a-72fb72bbd5d3@gmail.com>
 <BYAPR12MB33980D6751904EBEFC38BBAAC2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33980D6751904EBEFC38BBAAC2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

07.02.2019 21:56, Sowjanya Komatineni пишет:
>  
>>>  static const struct tegra_i2c_hw_feature tegra210_i2c_hw = { @@ 
>>> -980,6 +1302,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>>>  	.has_mst_fifo = false,
>>>  	.quirks = &tegra_i2c_quirks,
>>>  	.supports_bus_clear = true,
>>> +	.has_apb_dma = true,
>>>  };
>>
>> T186 is missed here.
> 
> Currently t186 hw feature is not present in existing linux next and device trees use both t186 and t114 compatibles, so t114 is being applies.
> But dmas are not used for t186 yet.
> 
> T186 hw feature is added for first time as part of interface timing and its in patch next to this patch in same series.
> This is the same from beginning of all these series.
> 
>>
>>>  
>>>  static const struct tegra_i2c_hw_feature tegra194_i2c_hw = { @@ 
>>> -995,6 +1318,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>>>  	.has_mst_fifo = true,
>>>  	.quirks = &tegra194_i2c_quirks,
>>>  	.supports_bus_clear = true,
>>> +	.has_apb_dma = false,
>>>  };
> 

You added "has_apb_dma" for T194 and not T186 in this patch, I happened to notice it only right now. Please, let's be consistent and set the new field for all of the platforms in this patch.
