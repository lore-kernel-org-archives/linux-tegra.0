From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 17/22] memory: tegra30-emc: Register as interconnect
 provider
Date: Mon, 13 Apr 2020 18:18:01 +0300
Message-ID: <8d072775-aec8-5a55-8fd7-7166e2a34c95@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-18-digetx@gmail.com>
 <d8e39d8b-b3f3-4a30-cb5a-67fcbe18a957@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d8e39d8b-b3f3-4a30-cb5a-67fcbe18a957-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

13.04.2020 15:44, Georgi Djakov пишет:
...
> All the above seems like a duplicate of what we already have in the previous
> patch for tegra20-emc. Can we have a single driver for both? Maybe extract the
> above as a separate interconnect provider driver.

Perhaps we could do it later on, once the work on the drivers will
settle down. I think it should be okay to have some minor duplication
for now, we already have some other small things duplicated in these
drivers.

>>  static int tegra_emc_probe(struct platform_device *pdev)
>>  {
>>  	struct platform_device *mc;
>> @@ -1344,6 +1452,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
>>  	platform_set_drvdata(pdev, emc);
>>  	tegra_emc_debugfs_init(emc);
>>  
>> +	if (IS_ENABLED(CONFIG_INTERCONNECT)) {
>> +		err = tegra_emc_interconnect_init(emc);
> 
> How about registering a platform device that will use the same driver to handle
> the interconnect functionality for both tegra20 and tegra30?

It should be possible. But it also should be possible to make all these
drivers modular, which I'm going to try out.
