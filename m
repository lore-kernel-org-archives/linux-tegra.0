From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Date: Tue, 14 Apr 2020 19:25:13 +0300
Message-ID: <05b10433-f18f-dc38-bdd5-16c91f222051@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
 <7f23f140-4c56-3d9a-946e-f29bc569f40c@gmail.com>
 <20200414154753.GQ3593749@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200414154753.GQ3593749@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

14.04.2020 18:47, Thierry Reding пишет:
> On Fri, Apr 10, 2020 at 02:44:16AM +0300, Dmitry Osipenko wrote:
>> 09.04.2020 20:52, Thierry Reding пишет:
>> ...
>>>  	tegra210_emc_debugfs_init(emc);
>>>  
>>> +	cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
>>> +						     &tegra210_emc_cd_ops);
>>> +	if (IS_ERR(cd)) {
>>> +		err = PTR_ERR(cd);
>>> +		dev_err(emc->dev, "failed to register cooling device: %d\n",
>>> +			err);
>>
>>> +		goto detach;
>>
>> I think it's not really worthwhile to fail whole EMC driver because of
>> the failed CDEV.
> 
> Well, we do kind of need this cooling device mechanism in order for the
> memory to continue to operate properly at high temperatures. It's also
> very unlikely that this will ever fail, so I don't see any harm in
> making this mandatory.

Fair enough.
