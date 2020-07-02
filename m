From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 11/37] PM / devfreq: tegra30: Silence deferred probe
 error
Date: Thu, 2 Jul 2020 04:20:55 +0300
Message-ID: <fda8aa80-04f1-af00-7a0d-f9b589cdb37e@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131843epcas1p3a5b06308559ff03ef1b27521f412b656@epcas1p3.samsung.com>
 <20200609131404.17523-12-digetx@gmail.com>
 <136b430d-2097-7b2b-d7dd-b438deee8f5d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <136b430d-2097-7b2b-d7dd-b438deee8f5d-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

02.07.2020 03:59, Chanwoo Choi пишет:
> Hi,
> 
> On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
>> Tegra EMC driver was turned into a regular kernel driver, it also could
>> be compiled as a loadable kernel module now. Hence EMC clock isn't
>> guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
>> there is no good reason to spam KMSG with a error about missing EMC clock
>> in this case, so let's silence the deferred probe error.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index e94a27804c20..423dd35c95b3 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -801,9 +801,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
>> -	if (IS_ERR(tegra->emc_clock)) {
>> -		dev_err(&pdev->dev, "Failed to get emc clock\n");
>> -		return PTR_ERR(tegra->emc_clock);
>> +	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
>> +	if (err) {
>> +		if (err != -EPROBE_DEFER)
>> +			dev_err(&pdev->dev, "Failed to get emc clock: %d\n",
>> +				err);
>> +		return err;
>>  	}
>>  
>>  	err = platform_get_irq(pdev, 0);
>>
> 
> As I commented on patch10, I recommend that you add the Tegra EMC driver
> commit information into patch description and Looks good to me.
> 

Hello, Chanwoo!

This patch11 and patch10 are depending on the patches 4/5 (the Tegra EMC
driver patches) of *this* series, hence there is no commit information.
I'm expecting that this whole series will go via tegra tree once all the
patches will be reviewed and collect all the necessary acks from you,
ICC and CLK subsystem maintainers.

Please feel free to give yours ack to the patches 10/11 if they are good
to you :)
