From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/3] drm/tegra: dc: Silence RGB output deferred-probe
 error
Date: Thu, 12 Mar 2020 17:03:56 +0300
Message-ID: <d2f72b22-59d1-ed0e-c22c-756091723415@gmail.com>
References: <20200308223809.23549-1-digetx@gmail.com>
 <20200308223809.23549-3-digetx@gmail.com> <20200312093353.GB1199023@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200312093353.GB1199023@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

12.03.2020 12:33, Thierry Reding пишет:
> On Mon, Mar 09, 2020 at 01:38:09AM +0300, Dmitry Osipenko wrote:
>> Driver fails to probe with -EPROBE_DEFER if display output isn't ready
>> yet. This produces a bit noisy error message in KMSG during kernel's boot
>> up on Tegra20 and Tegra30 because RGB output tends to be probed earlier
>> than a corresponding voltage regulator driver.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>> index 56d933e81797..d7f2c4654b6b 100644
>> --- a/drivers/gpu/drm/tegra/dc.c
>> +++ b/drivers/gpu/drm/tegra/dc.c
>> @@ -2571,7 +2571,11 @@ static int tegra_dc_probe(struct platform_device *pdev)
>>  
>>  	err = tegra_dc_rgb_probe(dc);
>>  	if (err < 0 && err != -ENODEV) {
>> -		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
>> +		if (err == -EPROBE_DEFER)
>> +			dev_dbg(&pdev->dev, "RGB output probe deferred\n");
>> +		else
>> +			dev_err(&pdev->dev, "failed to probe RGB output: %d\n",
>> +				err);
>>  		return err;
>>  	}
> 
> I'd prefer if we had just a single message and only differentiate on the
> kernel message level, something more along these lines:
> 
> 	if (err < 0 && err != -ENODEV) {
> 		const char *level = KERN_ERR;
> 
> 		if (err == -EPROBE_DEFER)
> 			level = KERN_DEBUG;
> 
> 		dev_printk(level, dc->dev, "failed to probe RGB output: %d\n",
> 			   err);
> 		return err;
> 	}
> 
> Do you mind if I squash that into your patch?

I don't mind, thanks :)
