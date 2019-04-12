From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] ARM: dts: tegra30: Add External Memory Controller
 node
Date: Fri, 12 Apr 2019 13:11:31 +0300
Message-ID: <17f2a6b4-8017-0581-d7a2-6ff1cd914df1@gmail.com>
References: <20190411230221.31362-1-digetx@gmail.com>
 <20190411230221.31362-4-digetx@gmail.com>
 <20190412080606.GH12975@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412080606.GH12975@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.04.2019 11:06, Peter De Schrijver пишет:
> On Fri, Apr 12, 2019 at 02:02:21AM +0300, Dmitry Osipenko wrote:
>> Add Add External Memory Controller node to the device-tree.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
> ..
>> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
>> index 38ebdb076ccd..defdb38bde54 100644
>> --- a/drivers/memory/tegra/tegra30-emc.c
>> +++ b/drivers/memory/tegra/tegra30-emc.c
>> @@ -980,7 +980,8 @@ static long emc_round_rate(unsigned long rate,
>>  	}
>>  
>>  	if (!timing) {
>> -		dev_err(emc->dev, "no timing for rate %lu\n", rate);
>> +		dev_err(emc->dev, "no timing for rate %lu min %lu max %lu\n",
>> +			rate, min_rate, max_rate);
>>  		return -EINVAL;
>>  	}
> 
> This doesn't seem to belong to this patch?

Yes, I accidentally edited a wrong patch on rebase. Fixed it up for v2 already, thank you.
