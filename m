From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 11/37] PM / devfreq: tegra30: Silence deferred probe
 error
Date: Thu, 2 Jul 2020 10:34:59 +0900
Message-ID: <8e941321-5da6-e9e7-6a4e-8c0477911ebd@samsung.com>
References: <20200609131404.17523-1-digetx@gmail.com>
        <CGME20200609131843epcas1p3a5b06308559ff03ef1b27521f412b656@epcas1p3.samsung.com>
        <20200609131404.17523-12-digetx@gmail.com>
        <136b430d-2097-7b2b-d7dd-b438deee8f5d@samsung.com>
        <fda8aa80-04f1-af00-7a0d-f9b589cdb37e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fda8aa80-04f1-af00-7a0d-f9b589cdb37e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 7/2/20 10:20 AM, Dmitry Osipenko wrote:
> 02.07.2020 03:59, Chanwoo Choi пишет:
>> Hi,
>>
>> On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
>>> Tegra EMC driver was turned into a regular kernel driver, it also could
>>> be compiled as a loadable kernel module now. Hence EMC clock isn't
>>> guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
>>> there is no good reason to spam KMSG with a error about missing EMC clock
>>> in this case, so let's silence the deferred probe error.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/devfreq/tegra30-devfreq.c | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>>> index e94a27804c20..423dd35c95b3 100644
>>> --- a/drivers/devfreq/tegra30-devfreq.c
>>> +++ b/drivers/devfreq/tegra30-devfreq.c
>>> @@ -801,9 +801,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>  	}
>>>  
>>>  	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
>>> -	if (IS_ERR(tegra->emc_clock)) {
>>> -		dev_err(&pdev->dev, "Failed to get emc clock\n");
>>> -		return PTR_ERR(tegra->emc_clock);
>>> +	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
>>> +	if (err) {
>>> +		if (err != -EPROBE_DEFER)
>>> +			dev_err(&pdev->dev, "Failed to get emc clock: %d\n",
>>> +				err);
>>> +		return err;
>>>  	}
>>>  
>>>  	err = platform_get_irq(pdev, 0);
>>>
>>
>> As I commented on patch10, I recommend that you add the Tegra EMC driver
>> commit information into patch description and Looks good to me.
>>
> 
> Hello, Chanwoo!
> 
> This patch11 and patch10 are depending on the patches 4/5 (the Tegra EMC
> driver patches) of *this* series, hence there is no commit information.
> I'm expecting that this whole series will go via tegra tree once all the
> patches will be reviewed and collect all the necessary acks from you,
> ICC and CLK subsystem maintainers.
> 
> Please feel free to give yours ack to the patches 10/11 if they are good
> to you :)
> 
> 

OK. Looks good to me
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
