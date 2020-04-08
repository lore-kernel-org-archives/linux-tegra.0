From: sumitg <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Wed, 8 Apr 2020 16:54:07 +0530
Message-ID: <08307e54-0e14-14a3-7d6a-d59e1e04a683@nvidia.com>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
 <20200326115023.xy3n5bl7uetuw7mx@vireshk-i7>
 <d233b26b-6b50-7d41-9f33-a5dc151e0e7d@nvidia.com>
 <20200406025549.qfwzlk3745y3r274@vireshk-i7>
 <3ab4136c-8cca-c2f9-d286-b82dac23e720@nvidia.com>
 <20200408055301.jhvu5bc2luu3b5qr@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200408055301.jhvu5bc2luu3b5qr@vireshk-i7>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 08/04/20 11:23 AM, Viresh Kumar wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 07-04-20, 23:48, sumitg wrote:
>> On 06/04/20 8:25 AM, Viresh Kumar wrote:
>>> On 05-04-20, 00:08, sumitg wrote:
>>>> On 26/03/20 5:20 PM, Viresh Kumar wrote:
>>>>> On 03-12-19, 23:02, Sumit Gupta wrote:
>>>>>> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
>>>>>> +static unsigned int tegra194_get_speed_common(u32 cpu, u32 delay)
>>>>>> +{
>>>>>> +     struct read_counters_work read_counters_work;
>>>>>> +     struct tegra_cpu_ctr c;
>>>>>> +     u32 delta_refcnt;
>>>>>> +     u32 delta_ccnt;
>>>>>> +     u32 rate_mhz;
>>>>>> +
>>>>>> +     read_counters_work.c.cpu = cpu;
>>>>>> +     read_counters_work.c.delay = delay;
>>>>>> +     INIT_WORK_ONSTACK(&read_counters_work.work, tegra_read_counters);
>>>>>> +     queue_work_on(cpu, read_counters_wq, &read_counters_work.work);
>>>>>> +     flush_work(&read_counters_work.work);
>>>>>
>>>>> Why can't this be done in current context ?
>>>>>
>>>> We used work queue instead of smp_call_function_single() to have long delay.
>>>
>>> Please explain completely, you have raised more questions than you
>>> answered :)
>>>
>>> Why do you want to have long delays ?
>>>
>> Long delay value is used to have the observation window long enough for
>> correctly reconstructing the CPU frequency considering noise.
>> In next patch version, changed delay value to 500us which in our tests is
>> considered reliable.
> 
> I understand that you need to put a udelay() while reading the freq from
> hardware, that is fine, but why do you need a workqueue for that? Why can't you
> just read the values directly from the same context ?
> 
The register to read frequency is per core and not accessible to other 
cores. So, we have to execute the function remotely as the target core 
to read frequency might be different from current.
The functions for that are smp_call_function_single or queue_work_on.
We used queue_work_on() to avoid long delay inside ipi interrupt context 
with interrupts disabled.

> --
> viresh
> 
