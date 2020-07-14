From: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ PATCH v5 1/4] dt-bindings: arm: Add t194 ccplex
 compatible and bpmp property
Date: Tue, 14 Jul 2020 21:44:22 +0530
Message-ID: <ebc98e4b-1f94-e9a5-cad4-0677f4e440f7@nvidia.com>
References: <1594649209-29394-1-git-send-email-sumitg@nvidia.com>
 <1594649209-29394-2-git-send-email-sumitg@nvidia.com>
 <20200713164214.GA341271@bogus>
 <70a0a8ee-b79a-2a05-5150-2ee0faaf2730@nvidia.com>
 <CAL_JsqL1CuumdT1CZiofEZw9j+3gsir8JwSrZVfcxFxEB=bavQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL1CuumdT1CZiofEZw9j+3gsir8JwSrZVfcxFxEB=bavQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:THERMAL" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


>>>
>>> The cpus.yaml binding documents what's in 'cpu' nodes, not 'cpus'
>>> node. AIUI, the latter is what you want. You should do your own schema
>>> file here.
>>>
>> Do you mean to change existing file name from 'cpus.yaml' to 'cpu.yaml'
>> and create new 'cpus.yaml' file?
>> I think it's better to incorporate the change in existing 'cpus.yaml'
>> file to keep both cpu@X and cpus node details together. Please suggest.
> 
> No, I'm suggesting you create nvidia,tegra194-ccplex.yaml.
> 
Have posted new version of only this patch with new schema file.
Please review.

Thanks,
Sumit
