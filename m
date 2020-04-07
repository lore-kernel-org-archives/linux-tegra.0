From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch v2 2/3] cpufreq: Add Tegra194 cpufreq
 driver
Date: Tue, 7 Apr 2020 22:12:00 +0300
Message-ID: <3009a636-0c85-c867-6dcb-2deb1a610a00@gmail.com>
References: <1586028547-14993-1-git-send-email-sumitg@nvidia.com>
 <1586028547-14993-3-git-send-email-sumitg@nvidia.com>
 <67f9feb1-ba51-f1ac-b6eb-4587924d0748@gmail.com>
 <538ddcf4-b760-a342-eab6-5a61c9bd860a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538ddcf4-b760-a342-eab6-5a61c9bd860a-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sumitg <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

07.04.2020 21:55, sumitg пишет:
...
>>> + * Returns freq in KHz on success, 0 if cpu is offline
>>
>> I don't see any checks in the code about whether CPU is offline.
>>
>> Googling for "queue_work_on offline cpu" suggests that this function
>> should hang.
>>
> Tried this and didn't get crash or hang.
> show_cpuinfo_cur_freq() returns "<unknown>" value on reading frequency
> from a cluster having both it's cores offline.
> If only one cpu is offline, then frequency of other online cpu which is
> managing the policy of that cluster is returned.
> Have still added below check as guard in get|set() freq calls.
>     if (!cpu_online(cpu))
>         return -EINVAL;
> Thankyou for the input.

If CPUFreq core takes care of taking into account the offline CPU, then
the check isn't needed. It also wouldn't be enough if there was a
problem here.
