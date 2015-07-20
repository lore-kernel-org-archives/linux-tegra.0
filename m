From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/4] drm/tegra: Add VIC support
Date: Mon, 20 Jul 2015 11:51:46 +0300
Message-ID: <55ACB6A2.9030906@nvidia.com>
References: <1437378869-10451-1-git-send-email-mperttunen@nvidia.com> <1437378869-10451-3-git-send-email-mperttunen@nvidia.com> <55ACB134.8010401@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55ACB134.8010401-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/20/2015 11:28 AM, Jon Hunter wrote:
> Hi Mikko,

Hi!

> ...
>> +static int vic_runtime_resume(struct device *dev)
>> +{
>> +	struct vic *vic = dev_get_drvdata(dev);
>> +	int err;
>> +
>> +	err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VIC,
>> +						vic->clk, vic->rst);
> 
> I would like to deprecate use of the above function [1]. I have been
> trying to migrate driver to use a new API instead of the above.

Yes, we will need to coordinate the API change here. I kept the old way
here to not depend on your series for now.

> 
>> +	if (err < 0)
>> +		dev_err(dev, "failed to power up device\n");
>> +
>> +	return err;
>> +}
>> +
>> ...
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +	if (!pm_runtime_enabled(&pdev->dev)) {
>> +		err = vic_runtime_resume(&pdev->dev);
>> +		if (err < 0)
>> +			goto unregister_client;
>> +	}
> 
> I don't see why pm_runtime_enable() should ever fail to enable
> pm_runtime here. Hence, the if-statement appears to be redundant. If you
> are trying to determine whether rpm is supported for the power-domains
> then you should simply check to see if the DT node for the device has
> the "power-domains" property. See my series [1].

The intention is that if runtime PM is not enabled, the power domain is
still brought up. On a cursory look, it seems like with your patch, this
should indeed work fine without this check if CONFIG_PM is enabled. Now,
that might always be enabled? If so, then everything would be fine; if
this lands after your series, we could even just make the power-domains
prop mandatory and not implement the legacy mode at all. If not, then
AFAIU we must still keep this path.

> 
> Cheers
> Jon
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg431051.html
> 

Cheers,
Mikko.
